<?php

namespace App\Services;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;
use Illuminate\Support\Facades\Log;

class GeminiService
{
    protected Client $http;
    protected string $apiKey;

    public function __construct()
    {
        $this->http = new Client([
            'base_uri' => 'https://generativelanguage.googleapis.com/v1beta/',
            'timeout' => 20,
        ]);
        $this->apiKey = env('GEMINI_API_KEY', '');
    }

    public function chat(string $prompt, array $options = []): string
    {
        if (empty($this->apiKey)) {
            return 'Lỗi cấu hình: Chưa thiết lập GEMINI_API_KEY trong .env';
        }

        $model = $options['model'] ?? env('GEMINI_MODEL', 'gemini-1.5-flash');
        $temperature = $options['temperature'] ?? 0.6;
        $maxOutputTokens = $options['max_output_tokens'] ?? 1024;

        // Remove 'models/' prefix if it exists to avoid duplication
        $modelName = str_starts_with($model, 'models/') ? substr($model, 7) : $model;

        $payload = [
            'contents' => [[
                'role' => 'user',
                'parts' => [[ 'text' => $prompt ]],
            ]],
            'generationConfig' => [
                'temperature' => $temperature,
                'maxOutputTokens' => $maxOutputTokens,
            ],
        ];

        try {
            $res = $this->http->post(sprintf('models/%s:generateContent', $modelName), [
                'query' => ['key' => $this->apiKey],
                'json' => $payload,
                'headers' => [
                    'Content-Type' => 'application/json',
                ],
            ]);

            $data = json_decode((string) $res->getBody(), true);
            $text = $data['candidates'][0]['content']['parts'][0]['text'] ?? '';
            if (!$text) {
                return 'Xin lỗi, hiện mình chưa thể trả lời. Vui lòng thử lại sau.';
            }
            return $text;
        } catch (GuzzleException $e) {
            $responseBody = null;
            if ($e instanceof \GuzzleHttp\Exception\RequestException && $e->getResponse()) {
                try {
                    $responseBody = (string) $e->getResponse()->getBody();
                } catch (\Throwable $inner) {
                    $responseBody = 'unable to read response body';
                }
            }
            Log::warning('Gemini API error', [
                'message' => $e->getMessage(),
                'response' => $responseBody,
            ]);

            // For debug, return some details to front-end so developer can fix config
            if (env('APP_DEBUG', false)) {
                $msg = 'Gemini error: ' . ($responseBody ?: $e->getMessage());
                return mb_substr($msg, 0, 1000);
            }

            return 'Xin lỗi, dịch vụ AI đang bận. Vui lòng thử lại sau.';
        } catch (\Throwable $e) {
            Log::error('Gemini unexpected error', [ 'error' => $e->getMessage() ]);
            return 'Xin lỗi, đã xảy ra lỗi không mong muốn.';
        }
    }
}
