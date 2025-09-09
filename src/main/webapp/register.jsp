<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký Tài Khoản</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="main-container">
        <h3 class="text-center mb-4">Đăng Ký Tài Khoản</h3>

        <c:if test="${not empty alert}">
            <div class="alert alert-danger">
                <i class="fa fa-exclamation-triangle"></i> ${alert}
            </div>
        </c:if>
        
        <form action="register" method="post">
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                </div>
                <input type="text" name="username" class="form-control" placeholder="Tên đăng nhập" required>
            </div>
            
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                </div>
                <input type="email" name="email" class="form-control" placeholder="Địa chỉ email" required>
            </div>
            
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-lock"></i></span>
                </div>
                <input type="password" name="password" class="form-control" placeholder="Mật khẩu" required>
            </div>
            
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-lock"></i></span>
                </div>
                <input type="password" name="confirmPassword" class="form-control" placeholder="Xác nhận mật khẩu" required>
            </div>

            <button type="submit" class="btn btn-primary btn-block">
                <i class="fa fa-user-plus"></i> Đăng ký
            </button>
        </form>

        <p class="text-center mt-3">
            Đã có tài khoản? 
            <a href="${pageContext.request.contextPath}/login">Đăng nhập ngay</a>
        </p>
    </div>
</body>
</html>