<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lấy Lại Mật Khẩu</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .forgot-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .forgot-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .forgot-header h3 {
            color: #333;
            font-weight: 700;
            margin-bottom: 10px;
            font-size: 28px;
        }

        .forgot-header p {
            color: #666;
            font-size: 14px;
            line-height: 1.5;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .input-group {
            position: relative;
            overflow: hidden;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .input-group-text {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            color: white;
            padding: 15px;
            border-radius: 0;
        }

        .form-control {
            border: none;
            padding: 15px 20px;
            font-size: 16px;
            background: #f8f9fa;
            border-radius: 0;
        }

        .form-control:focus {
            background: #fff;
            box-shadow: none;
            border: none;
        }

        .form-control::placeholder {
            color: #999;
            font-weight: 400;
        }

        .btn-submit {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 15px;
            border-radius: 12px;
            color: white;
            font-weight: 600;
            font-size: 16px;
            width: 100%;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
            margin-bottom: 20px;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
            color: white;
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        .btn-login-link {
            background: transparent;
            border: 2px solid #667eea;
            padding: 12px 25px;
            border-radius: 12px;
            color: #667eea;
            font-weight: 600;
            font-size: 16px;
            width: 100%;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-login-link:hover {
            background: #667eea;
            color: white;
            text-decoration: none;
            transform: translateY(-2px);
        }

        .back-link {
            text-align: center;
            margin-top: 25px;
            padding-top: 25px;
            border-top: 1px solid #eee;
        }

        .back-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
            font-size: 14px;
        }

        .back-link a:hover {
            color: #764ba2;
            text-decoration: none;
        }

        .alert {
            border-radius: 12px;
            border: none;
            padding: 15px 20px;
            margin-bottom: 25px;
            font-weight: 500;
        }

        .alert-success {
            background: linear-gradient(135deg, #56ab2f 0%, #a8e6cf 100%);
            color: white;
        }

        .alert-danger {
            background: linear-gradient(135deg, #ff416c 0%, #ff4b2b 100%);
            color: white;
        }

        .alert i {
            margin-right: 8px;
        }

        .password-display {
            background: linear-gradient(135deg, #56ab2f 0%, #a8e6cf 100%);
            border: none;
            color: white;
            padding: 20px;
            border-radius: 12px;
            margin: 20px 0;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            box-shadow: 0 4px 15px rgba(86, 171, 47, 0.3);
        }

        .password-value {
            background: rgba(255, 255, 255, 0.2);
            padding: 10px 15px;
            border-radius: 8px;
            margin-top: 10px;
            font-family: 'Courier New', monospace;
            font-size: 20px;
            letter-spacing: 2px;
        }

        .success-section {
            text-align: center;
        }

        .success-icon {
            font-size: 60px;
            color: #56ab2f;
            margin-bottom: 20px;
            animation: bounceIn 0.8s ease-out;
        }

        /* Animation */
        .forgot-container {
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes bounceIn {
            0% {
                transform: scale(0);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }

        /* Responsive */
        @media (max-width: 576px) {
            .forgot-container {
                margin: 20px;
                padding: 30px 25px;
            }
            
            .forgot-header h3 {
                font-size: 24px;
            }
        }

        /* Icon styling */
        .fa {
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="forgot-container">
        <c:if test="${not empty success}">
            <!-- Hiển thị kết quả thành công -->
            <div class="success-section">
                <div class="success-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h3 style="color: #56ab2f; margin-bottom: 20px;">Tìm Thấy Mật Khẩu!</h3>
                
                <div class="password-display">
                    <i class="fas fa-key"></i> Mật khẩu của bạn là:
                    <div class="password-value">${foundPassword}</div>
                </div>
                
                <a href="${pageContext.request.contextPath}/login" class="btn-login-link">
                    <i class="fas fa-sign-in-alt"></i> Đăng Nhập Ngay
                </a>
            </div>
        </c:if>
        
        <c:if test="${empty success}">
            <!-- Form nhập email -->
            <div class="forgot-header">
                <h3><i class="fas fa-key"></i> Lấy Lại Mật Khẩu</h3>
                <p>Nhập địa chỉ email của bạn để tìm lại mật khẩu</p>
            </div>

            <c:if test="${not empty alert}">
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-triangle"></i> ${alert}
                </div>
            </c:if>
            
            <form action="forgot-password" method="post">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-envelope"></i>
                            </span>
                        </div>
                        <input type="email" name="email" class="form-control" placeholder="Nhập địa chỉ email của bạn" required>
                    </div>
                </div>

                <button type="submit" class="btn-submit">
                    <i class="fas fa-search"></i> Tìm Mật Khẩu
                </button>
            </form>
        </c:if>

        <div class="back-link">
            <a href="${pageContext.request.contextPath}/login">
                <i class="fas fa-arrow-left"></i> Quay lại đăng nhập
            </a>
        </div>
    </div>
</body>
</html>