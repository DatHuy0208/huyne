<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Chatbot Tư Vấn Tour - TRAVELA</title>
    <link rel="icon" href="{{ asset('clients/assets/images/logos/favicon.png') }}" type="image/png">
    <link rel="stylesheet" href="{{ asset('clients/assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('clients/assets/css/fontawesome-5.14.0.min.css') }}">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .chatbot-container {
            width: 90%;
            max-width: 800px;
            height: 90vh;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        .chatbot-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .chatbot-header i {
            font-size: 32px;
        }

        .chatbot-header-text h1 {
            font-size: 24px;
            margin: 0;
        }

        .chatbot-header-text p {
            font-size: 14px;
            margin: 5px 0 0;
            opacity: 0.9;
        }

        .chatbot-messages {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
            background: #f5f7fa;
        }

        .message {
            display: flex;
            margin-bottom: 20px;
            animation: slideIn 0.3s ease;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .message.user {
            justify-content: flex-end;
        }

        .message-content {
            max-width: 70%;
            padding: 12px 18px;
            border-radius: 18px;
            word-wrap: break-word;
        }

        .message.bot .message-content {
            background: white;
            color: #333;
            border: 1px solid #e1e8ed;
        }

        .message.user .message-content {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .message-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 10px;
            font-size: 20px;
        }

        .message.bot .message-avatar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .message.user .message-avatar {
            background: #e1e8ed;
            color: #667eea;
        }

        .chatbot-input-area {
            padding: 20px;
            background: white;
            border-top: 1px solid #e1e8ed;
        }

        .input-group {
            display: flex;
            gap: 10px;
        }

        .chatbot-input {
            flex: 1;
            padding: 12px 18px;
            border: 2px solid #e1e8ed;
            border-radius: 25px;
            font-size: 15px;
            outline: none;
            transition: border-color 0.3s;
        }

        .chatbot-input:focus {
            border-color: #667eea;
        }

        .send-button {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 50%;
            color: white;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            transition: transform 0.2s;
        }

        .send-button:hover {
            transform: scale(1.1);
        }

        .send-button:disabled {
            opacity: 0.5;
            cursor: not-allowed;
            transform: scale(1);
        }

        .typing-indicator {
            display: none;
            padding: 12px 18px;
            background: white;
            border: 1px solid #e1e8ed;
            border-radius: 18px;
            width: fit-content;
        }

        .typing-indicator.show {
            display: block;
        }

        .typing-indicator span {
            display: inline-block;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #667eea;
            margin: 0 2px;
            animation: typing 1.4s infinite;
        }

        .typing-indicator span:nth-child(2) {
            animation-delay: 0.2s;
        }

        .typing-indicator span:nth-child(3) {
            animation-delay: 0.4s;
        }

        @keyframes typing {
            0%, 60%, 100% {
                transform: translateY(0);
            }
            30% {
                transform: translateY(-10px);
            }
        }

        .welcome-message {
            text-align: center;
            padding: 40px 20px;
            color: #666;
        }

        .welcome-message i {
            font-size: 64px;
            color: #667eea;
            margin-bottom: 20px;
        }

        .welcome-message h2 {
            margin-bottom: 10px;
            color: #333;
        }

        .quick-questions {
            margin-top: 20px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
        }

        .quick-question {
            padding: 8px 16px;
            background: white;
            border: 2px solid #667eea;
            color: #667eea;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s;
            font-size: 14px;
        }

        .quick-question:hover {
            background: #667eea;
            color: white;
        }

        @media (max-width: 768px) {
            .chatbot-container {
                width: 100%;
                height: 100vh;
                border-radius: 0;
            }

            .message-content {
                max-width: 85%;
            }
        }
    </style>
</head>
<body>
    <div class="chatbot-container">
        <div class="chatbot-header">
            <i class="fas fa-robot"></i>
            <div class="chatbot-header-text">
                <h1>Trợ Lý Tư Vấn Tour</h1>
                <p>Chúng tôi luôn sẵn sàng hỗ trợ bạn 24/7</p>
            </div>
        </div>

        <div class="chatbot-messages" id="chatMessages">
            <div class="welcome-message">
                <i class="fas fa-comments"></i>
                <h2>Xin chào! Tôi là trợ lý AI của TRAVELA</h2>
                <p>Tôi có thể giúp bạn tìm tour du lịch phù hợp. Hãy hỏi tôi bất cứ điều gì!</p>
                
                <div class="quick-questions">
                    <div class="quick-question" onclick="sendQuickQuestion(this)">Tour du lịch nổi bật</div>
                    <div class="quick-question" onclick="sendQuickQuestion(this)">Tour giá rẻ</div>
                    <div class="quick-question" onclick="sendQuickQuestion(this)">Tour miền Bắc</div>
                    <div class="quick-question" onclick="sendQuickQuestion(this)">Tour cuối tuần</div>
                </div>
            </div>
        </div>

        <div class="chatbot-input-area">
            <div class="input-group">
                <input 
                    type="text" 
                    class="chatbot-input" 
                    id="userInput" 
                    placeholder="Nhập câu hỏi của bạn..."
                    autocomplete="off"
                >
                <button class="send-button" id="sendButton" onclick="sendMessage()">
                    <i class="fas fa-paper-plane"></i>
                </button>
            </div>
        </div>
    </div>

    <script src="{{ asset('clients/assets/js/jquery-3.6.0.min.js') }}"></script>
    <script>
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        const messagesContainer = document.getElementById('chatMessages');
        const userInput = document.getElementById('userInput');
        const sendButton = document.getElementById('sendButton');

        // Enter để gửi
        userInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault();
                sendMessage();
            }
        });

        function sendQuickQuestion(element) {
            const question = element.textContent;
            userInput.value = question;
            sendMessage();
        }

        async function sendMessage() {
            const message = userInput.value.trim();
            if (!message) return;

            // Disable input
            userInput.disabled = true;
            sendButton.disabled = true;

            // Xóa welcome message nếu có
            const welcomeMsg = messagesContainer.querySelector('.welcome-message');
            if (welcomeMsg) welcomeMsg.remove();

            // Hiển thị tin nhắn user
            addMessage(message, 'user');
            userInput.value = '';

            // Hiển thị typing indicator
            const typingIndicator = createTypingIndicator();
            messagesContainer.appendChild(typingIndicator);
            scrollToBottom();

            try {
                const response = await fetch('/chatbot/message', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken,
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify({ message: message })
                });

                const data = await response.json();

                // Xóa typing indicator
                typingIndicator.remove();

                if (data.success) {
                    addMessage(data.reply, 'bot');
                } else {
                    addMessage(data.reply || 'Xin lỗi, đã có lỗi xảy ra. Vui lòng thử lại.', 'bot');
                }
            } catch (error) {
                console.error('Error:', error);
                typingIndicator.remove();
                addMessage('Không thể kết nối đến server. Vui lòng kiểm tra kết nối và thử lại.', 'bot');
            }

            // Enable input
            userInput.disabled = false;
            sendButton.disabled = false;
            userInput.focus();
        }

        function addMessage(text, type) {
            const messageDiv = document.createElement('div');
            messageDiv.className = `message ${type}`;

            const avatar = document.createElement('div');
            avatar.className = 'message-avatar';
            avatar.innerHTML = type === 'bot' ? '<i class="fas fa-robot"></i>' : '<i class="fas fa-user"></i>';

            const content = document.createElement('div');
            content.className = 'message-content';
            content.textContent = text;

            if (type === 'bot') {
                messageDiv.appendChild(avatar);
                messageDiv.appendChild(content);
            } else {
                messageDiv.appendChild(content);
                messageDiv.appendChild(avatar);
            }

            messagesContainer.appendChild(messageDiv);
            scrollToBottom();
        }

        function createTypingIndicator() {
            const messageDiv = document.createElement('div');
            messageDiv.className = 'message bot';

            const avatar = document.createElement('div');
            avatar.className = 'message-avatar';
            avatar.innerHTML = '<i class="fas fa-robot"></i>';

            const indicator = document.createElement('div');
            indicator.className = 'typing-indicator show';
            indicator.innerHTML = '<span></span><span></span><span></span>';

            messageDiv.appendChild(avatar);
            messageDiv.appendChild(indicator);

            return messageDiv;
        }

        function scrollToBottom() {
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
        }
    </script>
</body>
</html>
