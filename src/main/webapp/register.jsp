<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang Đăng Ký</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body {
            background-color: #f5f5f5;
        }
        .login-container {
            width: 500px;
            margin: 100px auto;
            padding: 25px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group .fa {
            color: #999;
        }
        .form-control {
            border-left: none;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h3 class="text-center mb-2">Tạo Tài Khoản Mới</h3>

        <c:if test="${not empty alert}">
            <div class="alert alert-danger">
                ${alert}
            </div>
        </c:if>

        <form action="register" method="post">
            <!-- Username -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                </div>
                <input type="text" name="username" class="form-control" placeholder="Tài khoản" required>
            </div>

            <!-- Email -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                </div>
                <input type="email" name="email" class="form-control" placeholder="Email" required>
            </div>

            <!-- Password -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-lock"></i></span>
                </div>
                <input type="password" name="password" class="form-control" placeholder="Mật khẩu" required>
            </div>

            <!-- Confirm Password -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-lock"></i></span>
                </div>
                <input type="password" name="confirmPassword" class="form-control" placeholder="Xác nhận mật khẩu" required>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Đăng ký</button>
        </form>

        <p class="text-center mt-3">
            Đã có tài khoản? <a href="login">Đăng nhập</a>
        </p>
    </div>
</body>
</html>
