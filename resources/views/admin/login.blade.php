<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="TravelGo Admin - Đăng nhập hệ thống quản trị">
    <meta name="author" content="TravelGo Team">

    <title>Đăng nhập | TravelGo Admin</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <!-- Toastr CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4cc9f0;
            --dark-color: #1a1a2e;
            --light-color: #f8f9fa;
            --danger-color: #ef233c;
            --success-color: #2ecc71;
        }
        
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: flex-end; /* dịch sang phải */
            margin: 0;
            overflow: hidden; /* chặn scroll */
            background-image: url('https://lh7-rt.googleusercontent.com/docsz/AD_4nXdvF451VhTr0-e5heN6IwsnVY3Dk7ZJJmmB5Yvecnme3T8Zpz-aS_kfSy63mgmk_ZZpnmI1p64rQgSY4V3o1nhwA2kOgiP60F0I45yp8gyV6QxuiIJL6pMhdacCMGUqXiRp8VD6?key=QlhhzYIKfwy6s5cAwvsrD5-t');
            background-size: cover;
            background-position: center;
            position: relative;
        }
        
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }
        
        .login-container {
            position: relative;
            z-index: 2;
            width: 100%;
            max-width: 380px; /* nhỏ lại (trước là 480px) */
            padding: 35px 30px; /* giảm padding cho gọn */
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            transform: translateY(0);
            transition: all 0.3s ease;
            margin: 50px 5% 50px auto; /* dịch qua phải (tăng margin-left) */
        }
        
        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 45px;
        }
        
        .login-logo {
            width: 80px;
            height: 80px;
            margin: 0 auto 15px;
            background: var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 36px;
            box-shadow: 0 4px 10px rgba(67, 97, 238, 0.3);
        }
        
        .login-title {
            font-size: 26px;
            font-weight: 600;
            color: var(--dark-color);
            margin: 15px 0 10px;
            letter-spacing: 0.5px;
        }
        
        .login-subtitle {
            font-size: 14px;
            color: #6c757d;
        }
        
        .form-floating > label {
            color: #6c757d;
        }
        
        .form-control {
            height: 52px;
            border-radius: 8px;
            padding: 12px 48px 12px 50px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s;
            font-size: 16px;
            line-height: 1.5;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
        }
        
        .input-group-text {
            background: transparent;
            border-right: none;
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            z-index: 10;
            padding: 0;
            width: 20px;
            height: 20px;
        }
        
        .input-group .form-control {
            padding-left: 45px;
            padding-right: 40px;
        }
        
        .input-group:focus-within .input-group-text {
            border-color: var(--primary-color);
            color: var(--primary-color);
        }
        
        .btn-login {
            background: var(--primary-color);
            border: none;
            color: white;
            padding: 12px 30px;
            font-weight: 500;
            border-radius: 8px;
            width: 100%;
            transition: all 0.3s;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 15px;
            height: 50px;
        }
        
        .btn-login:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.4);
        }
        
        .btn-login:active {
            transform: translateY(0);
        }
        
        .login-footer {
            text-align: center;
            margin-top: 20px;
            font-size: 13px;
            color: #6c757d;
        }
        
        .login-footer a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }
        
        .login-footer a:hover {
            text-decoration: underline;
        }
        
        .form-floating {
            margin-bottom: 1.8rem;
        }
        
        .form-floating:last-child {
            margin-bottom: 2rem;
        }
        
        .form-floating > .form-control {
            padding-top: 1.8rem;
            padding-bottom: 0.5rem;
            height: 56px;
        }
        
        .form-floating > .form-control:not(:placeholder-shown) {
            padding-top: 2.2rem;
            padding-bottom: 0.5rem;
        }
        
        .form-floating > .form-control:focus,
        .form-floating > .form-control:not(:placeholder-shown) {
            padding-top: 2.2rem;
            padding-bottom: 0.5rem;
        }
        
        .form-floating > label {
            padding: 0.5rem 0.75rem;
            transform-origin: 0 0;
            transition: all 0.2s ease-in-out;
            opacity: 0.8;
        }
        
        .form-floating > .form-control:focus ~ label,
        .form-floating > .form-control:not(:placeholder-shown) ~ label {
            transform: scale(0.85) translateY(-0.5rem) translateX(0.15rem);
            opacity: 1;
        }
        
        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #6c757d;
            cursor: pointer;
            z-index: 10;
            width: 22px;
            height: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
            padding: 0;
        }
        
        .password-field {
            position: relative;
        }
        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="login-container animate__animated animate__fadeIn">
            <div class="login-header">
                <div class="login-logo">
                    <img src="{{ asset('clients/assets/images/logos/favicon.png') }}" alt="TravelGo Logo" style="width: 70%; height: auto;">
                </div>
                <h1 class="login-title">Chào mừng trở lại</h1>
                <p class="login-subtitle">Vui lòng đăng nhập để tiếp tục</p>
            </div>
            
            <form action="{{ route('admin.login-account') }}" method="POST" id="formLoginAdmin" class="needs-validation" novalidate>
                @csrf
            
                <!-- Tên đăng nhập -->
                <div class="mb-4">
                    <label for="username" class="form-label">Tên đăng nhập</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
                    </div>
                    <div class="invalid-feedback">
                        Vui lòng nhập tên đăng nhập
                    </div>
                </div>
            
                <!-- Mật khẩu -->
                <div class="mb-4">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <div class="input-group password-field">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
                        <button type="button" class="password-toggle" id="togglePassword">
                            <i class="far fa-eye"></i>
                        </button>
                    </div>
                    <div class="invalid-feedback">
                        Vui lòng nhập mật khẩu
                    </div>
                </div>
            
                <!-- Ghi nhớ + Quên mật khẩu -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="remember" name="remember">
                        <label class="form-check-label" for="remember">
                            Ghi nhớ đăng nhập
                        </label>
                    </div>
                    <a href="#" class="text-decoration-none">Quên mật khẩu?</a>
                </div>
            
                <!-- Nút đăng nhập -->
                <button type="submit" class="btn btn-login mb-3">
                    <span class="spinner-border spinner-border-sm d-none" id="spinner" role="status" aria-hidden="true"></span>
                    <span id="login-text">Đăng nhập</span>
                </button>
            
                <!-- Footer -->
                <div class="login-footer">
                    <p>© {{ date('Y') }} TravelGo. Bản quyền thuộc về <a href="#">TravelGo</a></p>
                </div>
            </form>
        </div>
    </div>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Toastr JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    
    <script>
        // Form validation
        (function () {
            'use strict'
            
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')
            
            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        } else {
                            // Show loading spinner
                            const spinner = document.getElementById('spinner');
                            const loginText = document.getElementById('login-text');
                            const submitBtn = form.querySelector('button[type="submit"]');
                            
                            submitBtn.disabled = true;
                            spinner.classList.remove('d-none');
                            loginText.textContent = 'Đang xử lý...';
                        }
                        
                        form.classList.add('was-validated')
                    }, false)
                })
        })()
        
        // Toggle password visibility
        document.getElementById('togglePassword').addEventListener('click', function() {
            const password = document.getElementById('password');
            const icon = this.querySelector('i');
            
            if (password.type === 'password') {
                password.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                password.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });
        
        // Toastr options
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        
        // Display error messages if any
        @if($errors->any())
            @foreach($errors->all() as $error)
                toastr.error('{{ $error }}', 'Lỗi!');
            @endforeach
        @endif
        
        // Display success message if any
        @if(session('success'))
            toastr.success('{{ session('success') }}', 'Thành công!');
        @endif
        
        // Display status message if any
        @if(session('status'))
            toastr.info('{{ session('status') }}', 'Thông báo');
        @endif
    </script>
    
    @include('admin.blocks.footer')
</body>
</html>
