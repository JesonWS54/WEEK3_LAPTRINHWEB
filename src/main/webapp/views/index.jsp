<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fa fa-home"></i> Hệ Thống Web
            </a>
            
            <div class="navbar-nav ml-auto">
                <c:if test="${not empty sessionScope.account}">
                    <span class="navbar-text mr-3">
                        <i class="fa fa-user"></i> Xin chào, ${sessionScope.account.fullName}!
                    </span>
                    <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/logout">
                        <i class="fa fa-sign-out-alt"></i> Đăng xuất
                    </a>
                </c:if>
                
                <c:if test="${empty sessionScope.account}">
                    <a class="btn btn-outline-light mr-2" href="${pageContext.request.contextPath}/login">
                        <i class="fa fa-sign-in-alt"></i> Đăng nhập
                    </a>
                    <a class="btn btn-light" href="${pageContext.request.contextPath}/register">
                        <i class="fa fa-user-plus"></i> Đăng ký
                    </a>
                </c:if>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <c:if test="${not empty sessionScope.account}">
                    <div class="wide-container">
                        <div class="info-card">
                            <h1 class="display-4">
                                <i class="fa fa-check-circle"></i> Chào mừng bạn đến với hệ thống!
                            </h1>
                            <p class="lead">Bạn đã đăng nhập thành công vào hệ thống.</p>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header bg-primary text-white">
                                        <i class="fa fa-user"></i> Thông tin tài khoản
                                    </div>
                                    <div class="card-body">
                                        <p><strong>Tên đăng nhập:</strong> ${sessionScope.account.userName}</p>
                                        <p><strong>Email:</strong> ${sessionScope.account.email}</p>
                                        <p><strong>Họ tên:</strong> ${sessionScope.account.fullName}</p>
                                        <p><strong>Ngày tạo:</strong> ${sessionScope.account.createdDate}</p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header bg-success text-white">
                                        <i class="fa fa-cog"></i> Thao tác
                                    </div>
                                    <div class="card-body">
                                        <a class="btn btn-danger btn-block mb-2" href="${pageContext.request.contextPath}/logout">
                                            <i class="fa fa-sign-out-alt"></i> Đăng xuất
                                        </a>
                                        <a class="btn btn-info btn-block" href="${pageContext.request.contextPath}/forgot-password">
                                            <i class="fa fa-key"></i> Quên mật khẩu
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                
                <c:if test="${empty sessionScope.account}">
                    <div class="main-container">
                        <div class="alert alert-warning text-center">
                            <h4><i class="fa fa-exclamation-triangle"></i> Bạn chưa đăng nhập!</h4>
                            <p>Vui lòng đăng nhập để sử dụng hệ thống.</p>
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">
                                <i class="fa fa-sign-in-alt"></i> Đăng nhập ngay
                            </a>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>