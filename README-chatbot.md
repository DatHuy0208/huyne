# Chatbot Tư Vấn Tour Du Lịch - TRAVELA

## Tổng quan
Hệ thống chatbot AI sử dụng Google Gemini để tư vấn tour du lịch cho khách hàng. Chatbot có khả năng:
- Tư vấn các tour du lịch phù hợp
- Trả lời câu hỏi về giá cả, lịch trình
- Gợi ý tour dựa trên nhu cầu khách hàng
- Hỗ trợ 24/7 với AI thông minh

## Cấu trúc Files

### Backend
- `app/Http/Controllers/clients/ChatbotController.php` - Controller xử lý chatbot
- `app/Services/GeminiService.php` - Service kết nối Gemini API

### Frontend
- `resources/views/clients/chatbot/index.blade.php` - Trang chatbot đầy đủ
- `resources/views/clients/partials/chatbot_widget.blade.php` - Widget nhỏ góc trang
- `public/clients/assets/css/chatbot-widget.css` - CSS cho widget
- `public/clients/assets/js/chatbot-widget.js` - JavaScript cho widget

### Routes
```php
Route::get('/chatbot', [ChatbotController::class, 'index'])->name('chatbot');
Route::post('/chatbot/message', [ChatbotController::class, 'message'])->middleware('throttle:20,1')->name('chatbot.message');
```

## Cài đặt

### 1. Cấu hình API Key
Thêm vào file `.env`:
```env
GEMINI_API_KEY=your_api_key_here
GEMINI_MODEL=gemini-1.5-pro
```

### 2. Thêm Widget vào Layout
Trong file layout chính (ví dụ: `resources/views/clients/layouts/master.blade.php`), thêm trước thẻ `</body>`:

```blade
@include('clients.partials.chatbot_widget')
```

### 3. Test Chatbot
- Truy cập trang đầy đủ: `http://your-domain/chatbot`
- Widget sẽ tự động hiện ở góc phải màn hình

## Tính năng

### 1. Context-Aware Responses
Chatbot tự động lấy thông tin các tour từ database và cung cấp câu trả lời chính xác dựa trên:
- Tên tour
- Địa điểm
- Giá cả
- Thời gian
- Mô tả

### 2. Quick Questions
Các câu hỏi gợi ý giúp người dùng bắt đầu nhanh:
- Tour du lịch nổi bật
- Tour giá rẻ
- Tour miền Bắc
- Tour cuối tuần

### 3. Responsive Design
- Giao diện đẹp, hiện đại
- Tương thích mobile
- Animation mượt mà

### 4. Rate Limiting
- Giới hạn 20 requests/phút để tránh spam
- Có thể điều chỉnh trong routes

## Tùy chỉnh

### Thay đổi Prompt
Trong `ChatbotController.php`, method `message()`:
```php
$tourContext = "Bạn là trợ lý tư vấn tour du lịch...";
// Tùy chỉnh prompt theo nhu cầu
```

### Thay đổi Temperature
Điều chỉnh tính sáng tạo của AI (0.0 - 1.0):
```php
'temperature' => 0.7, // Cao = sáng tạo hơn, thấp = chính xác hơn
```

### Thay đổi Max Tokens
Giới hạn độ dài câu trả lời:
```php
'max_output_tokens' => 500
```

### Thay đổi Màu sắc
Trong `chatbot-widget.css`, tìm và thay đổi:
```css
background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
```

## Logging
Hệ thống tự động log:
- Tin nhắn người dùng
- Câu trả lời AI
- IP address
- Lỗi (nếu có)

Xem log tại: `storage/logs/laravel.log`

## Bảo mật
- ✅ CSRF protection
- ✅ Rate limiting
- ✅ Input validation (max 500 ký tự)
- ✅ SQL injection protection (dùng Query Builder)

## Troubleshooting

### Lỗi 404 Model
Kiểm tra model name trong `.env` phải đúng:
- `gemini-1.5-pro` (khuyến nghị)
- `gemini-1.5-flash`

### Lỗi API Key
- Kiểm tra API key có đúng không
- Kiểm tra project Google Cloud có enable Gemini API

### Widget không hiện
- Kiểm tra đã include partial widget chưa
- Kiểm tra CSS/JS files có load được không
- Mở Console để xem lỗi

## Performance

### Caching (Tùy chọn)
Có thể cache danh sách tours để giảm query database:
```php
$tours = Cache::remember('tours_for_chatbot', 3600, function() {
    return DB::table('tours')->where('status', 1)->get();
});
```

### Database Index
Đảm bảo có index trên cột `status` của bảng `tours` để query nhanh hơn.

## Support
Nếu gặp vấn đề, kiểm tra:
1. Log file: `storage/logs/laravel.log`
2. Browser console (F12)
3. Network tab để xem API response

## Cập nhật
- Version: 1.0
- Last Updated: {{ date('Y-m-d') }}
- AI Model: Google Gemini 1.5 Pro
