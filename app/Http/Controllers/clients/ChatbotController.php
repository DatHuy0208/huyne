<?php

namespace App\Http\Controllers\clients;

use App\Http\Controllers\Controller;
use App\Services\GeminiService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

class ChatbotController extends Controller
{
    protected GeminiService $gemini;

    public function __construct(GeminiService $gemini)
    {
        $this->gemini = $gemini;
    }

    public function index()
    {
        return view('clients.chatbot.index');
    }

    public function message(Request $request)
    {
        $data = $request->validate([
            'message' => 'required|string|max:500',
        ]);

        $userMessage = $data['message'];
        
        try {
            // Lấy thông tin tours từ database để cung cấp context cho AI
            $tours = DB::table('tbl_tours')
                ->select('tourId', 'title', 'destination', 'priceAdult', 'priceChild', 'time')
                ->where('availability', 1)
                ->limit(10)
                ->get();

            // Tạo context về các tour du lịch
            $tourContext = "Bạn là trợ lý tư vấn tour du lịch thông minh của TRAVELA. ";
            $tourContext .= "Dưới đây là một số tour du lịch hiện có:\n\n";
            
            /** @var object $tour */
            foreach ($tours as $tour) {
                $tourContext .= "- Tour #{$tour->tourId}: {$tour->title}\n";
                $tourContext .= "  Điểm đến: {$tour->destination}\n";
                $tourContext .= "  Giá người lớn: " . number_format($tour->priceAdult) . " VNĐ\n";
                $tourContext .= "  Giá trẻ em: " . number_format($tour->priceChild) . " VNĐ\n";
                $tourContext .= "  Thời gian: {$tour->time}\n\n";
            }
            
            $tourContext .= "\nHãy trả lời câu hỏi của khách hàng một cách thân thiện, chuyên nghiệp. ";
            $tourContext .= "Nếu họ hỏi về tour, hãy giới thiệu các tour phù hợp. ";
            $tourContext .= "Nếu cần thêm thông tin, khuyến khích họ liên hệ hotline hoặc xem chi tiết trên website.\n\n";
            $tourContext .= "Câu hỏi của khách: {$userMessage}";

            // Gọi Gemini API
            $reply = $this->gemini->chat($tourContext, [
                'temperature' => 0.7,
                'max_output_tokens' => 500
            ]);

            Log::info('Chatbot conversation', [
                'user_message' => $userMessage,
                'ai_reply' => $reply,
                'ip' => $request->ip()
            ]);

            return response()->json([
                'success' => true,
                'reply' => $reply
            ]);

        } catch (\Exception $e) {
            Log::error('Chatbot error', [
                'message' => $userMessage,
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'success' => false,
                'reply' => 'Xin lỗi, hiện tại hệ thống đang bận. Vui lòng thử lại sau hoặc liên hệ hotline để được hỗ trợ.'
            ], 500);
        }
    }
}
