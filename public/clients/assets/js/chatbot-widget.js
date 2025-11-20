// Chatbot Widget JavaScript
(function() {
    'use strict';

    const CHATBOT_API = '/chatbot/message';
    
    // Lấy CSRF token
    function getCsrfToken() {
        const meta = document.querySelector('meta[name="csrf-token"]');
        return meta ? meta.getAttribute('content') : '';
    }

    // Tạo HTML cho widget
    function createWidget() {
        const widgetHTML = `
            <div id="chatbot-widget">
                <button id="chatbot-button" aria-label="Mở chatbot">
                    <i class="fas fa-comments"></i>
                </button>
                
                <div id="chatbot-window">
                    <div class="widget-header">
                        <i class="fas fa-robot"></i>
                        <div class="widget-header-text">
                            <h3>Trợ Lý AI</h3>
                            <p>Tư vấn tour du lịch</p>
                        </div>
                    </div>
                    
                    <div class="widget-messages" id="widgetMessages">
                        <div class="widget-welcome">
                            <i class="fas fa-comments"></i>
                            <h4>Xin chào!</h4>
                            <p>Tôi có thể giúp bạn tìm tour du lịch phù hợp</p>
                            <div class="widget-quick-questions">
                                <div class="widget-quick-question" data-question="Các tour du lịch nổi bật">
                                    🌟 Các tour du lịch nổi bật
                                </div>
                                <div class="widget-quick-question" data-question="Tour du lịch giá rẻ">
                                    💰 Tour du lịch giá rẻ
                                </div>
                                <div class="widget-quick-question" data-question="Tour du lịch miền Bắc">
                                    🏔️ Tour du lịch miền Bắc
                                </div>
                                <div class="widget-quick-question" data-question="Tư vấn lịch trình tour">
                                    📅 Tư vấn lịch trình tour
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="widget-input-area">
                        <div class="widget-input-group">
                            <input 
                                type="text" 
                                class="widget-input" 
                                id="widgetInput" 
                                placeholder="Nhập câu hỏi..."
                                autocomplete="off"
                            >
                            <button class="widget-send-button" id="widgetSendButton">
                                <i class="fas fa-paper-plane"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        `;

        document.body.insertAdjacentHTML('beforeend', widgetHTML);
    }

    // Khởi tạo widget
    function initWidget() {
        createWidget();

        const button = document.getElementById('chatbot-button');
        const window = document.getElementById('chatbot-window');
        const input = document.getElementById('widgetInput');
        const sendButton = document.getElementById('widgetSendButton');
        const messagesContainer = document.getElementById('widgetMessages');

        // Toggle chatbot window
        button.addEventListener('click', function() {
            window.classList.toggle('show');
            button.classList.toggle('active');
            
            if (window.classList.contains('show')) {
                input.focus();
            }
        });

        // Gửi tin nhắn
        sendButton.addEventListener('click', sendMessage);
        
        input.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                sendMessage();
            }
        });

        // Quick questions
        document.addEventListener('click', function(e) {
            if (e.target.classList.contains('widget-quick-question')) {
                const question = e.target.getAttribute('data-question');
                input.value = question;
                sendMessage();
            }
        });

        async function sendMessage() {
            const message = input.value.trim();
            if (!message) return;

            // Disable input
            input.disabled = true;
            sendButton.disabled = true;

            // Xóa welcome message
            const welcome = messagesContainer.querySelector('.widget-welcome');
            if (welcome) welcome.remove();

            // Hiển thị tin nhắn user
            addMessage(message, 'user');
            input.value = '';

            // Typing indicator
            const typing = createTypingIndicator();
            messagesContainer.appendChild(typing);
            scrollToBottom();

            try {
                const response = await fetch(CHATBOT_API, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': getCsrfToken(),
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify({ message: message })
                });

                const data = await response.json();
                typing.remove();

                if (data.success) {
                    addMessage(data.reply, 'bot');
                } else {
                    addMessage(data.reply || 'Xin lỗi, có lỗi xảy ra. Vui lòng thử lại.', 'bot');
                }
            } catch (error) {
                console.error('Chatbot error:', error);
                typing.remove();
                addMessage('Không thể kết nối. Vui lòng thử lại sau.', 'bot');
            }

            // Enable input
            input.disabled = false;
            sendButton.disabled = false;
            input.focus();
        }

        function addMessage(text, type) {
            const messageDiv = document.createElement('div');
            messageDiv.className = `widget-message ${type}`;

            const content = document.createElement('div');
            content.className = 'widget-message-content';
            content.textContent = text;

            messageDiv.appendChild(content);
            messagesContainer.appendChild(messageDiv);
            scrollToBottom();
        }

        function createTypingIndicator() {
            const messageDiv = document.createElement('div');
            messageDiv.className = 'widget-message bot';

            const typing = document.createElement('div');
            typing.className = 'widget-typing show';
            typing.innerHTML = '<span></span><span></span><span></span>';

            messageDiv.appendChild(typing);
            return messageDiv;
        }

        function scrollToBottom() {
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
        }
    }

    // Khởi động khi DOM ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initWidget);
    } else {
        initWidget();
    }
})();
