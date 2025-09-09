<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Danh Mục</title>
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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header-section {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 30px;
            backdrop-filter: blur(10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .page-title {
            color: #333;
            font-weight: 700;
            font-size: 32px;
            margin-bottom: 10px;
            text-align: center;
        }

        .page-subtitle {
            color: #666;
            text-align: center;
            margin-bottom: 30px;
        }

        .add-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 15px 30px;
            border-radius: 50px;
            color: white;
            font-weight: 600;
            font-size: 16px;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
            display: inline-block;
        }

        .add-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.6);
            color: white;
            text-decoration: none;
        }

        .content-section {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            backdrop-filter: blur(10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            margin-bottom: 30px;
        }

        .category-table {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .category-table thead th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 20px;
            font-weight: 600;
            font-size: 16px;
        }

        .category-table tbody td {
            padding: 20px;
            vertical-align: middle;
            border-bottom: 1px solid #eee;
            background: white;
        }

        .category-table tbody tr:hover {
            background: #f8f9fa;
            transform: scale(1.02);
            transition: all 0.3s ease;
        }

        .action-btn {
            padding: 8px 15px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            margin-right: 8px;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .btn-edit {
            background: #ffc107;
            color: #212529;
        }

        .btn-edit:hover {
            background: #e0a800;
            color: #212529;
            text-decoration: none;
            transform: translateY(-2px);
        }

        .btn-delete {
            background: #dc3545;
            color: white;
        }

        .btn-delete:hover {
            background: #c82333;
            color: white;
            text-decoration: none;
            transform: translateY(-2px);
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #666;
        }

        .empty-icon {
            font-size: 80px;
            color: #ddd;
            margin-bottom: 20px;
        }

        .empty-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .empty-subtitle {
            font-size: 16px;
            margin-bottom: 30px;
        }

        .footer-section {
            text-align: center;
        }

        .back-btn {
            background: rgba(255, 255, 255, 0.2);
            border: 2px solid rgba(255, 255, 255, 0.5);
            padding: 12px 25px;
            border-radius: 50px;
            color: white;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .back-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            color: white;
            text-decoration: none;
            transform: translateY(-2px);
        }

        .logout-btn {
            background: #dc3545;
            border: none;
            padding: 12px 25px;
            border-radius: 50px;
            color: white;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-block;
            margin-left: 15px;
        }

        .logout-btn:hover {
            background: #c82333;
            color: white;
            text-decoration: none;
            transform: translateY(-2px);
        }

        .stats-section {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.2);
            padding: 20px;
            border-radius: 15px;
            text-align: center;
            color: white;
            min-width: 150px;
        }

        .stat-number {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 14px;
            opacity: 0.9;
        }

        /* Animation */
        .content-section {
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

        /* Responsive */
        @media (max-width: 768px) {
            .main-container {
                padding: 10px;
            }
            
            .header-section, .content-section {
                padding: 20px;
                margin-bottom: 20px;
            }
            
            .page-title {
                font-size: 24px;
            }
            
            .category-table {
                font-size: 14px;
            }
            
            .category-table thead th,
            .category-table tbody td {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <!-- Header Section -->
        <div class="header-section">
            <h1 class="page-title">
                <i class="fas fa-th-large"></i> Quản Lý Danh Mục
            </h1>
            <p class="page-subtitle">Quản lý các danh mục sản phẩm trong hệ thống</p>
            
            <div class="stats-section">
                <div class="stat-card">
                    <div class="stat-number">${categories.size()}</div>
                    <div class="stat-label">Tổng danh mục</div>
                </div>
            </div>
            
            <div class="text-center">
                <a href="${pageContext.request.contextPath}/admin/category/add" class="add-btn">
                    <i class="fas fa-plus"></i> Thêm Danh Mục Mới
                </a>
            </div>
        </div>

        <!-- Content Section -->
        <div class="content-section">
            <c:choose>
                <c:when test="${not empty categories}">
                    <table class="table category-table">
                        <thead>
                            <tr>
                                <th style="width: 10%;">STT</th>
                                <th style="width: 40%;">Tên Danh Mục</th>
                                <th style="width: 25%;">Icon</th>
                                <th style="width: 25%;">Thao Tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${categories}" var="category" varStatus="status">
                                <tr>
                                    <td>
                                        <span class="badge badge-primary" style="font-size: 14px; padding: 8px 12px;">
                                            ${status.index + 1}
                                        </span>
                                    </td>
                                    <td>
                                        <strong style="color: #333; font-size: 16px;">
                                            ${category.catename}
                                        </strong>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty category.icons}">
                                                <i class="${category.icons}" style="font-size: 24px; color: #667eea;"></i>
                                                <small class="d-block text-muted mt-1">${category.icons}</small>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted">
                                                    <i class="fas fa-ban"></i> Không có icon
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/category/edit?id=${category.cateid}" 
                                           class="action-btn btn-edit">
                                            <i class="fas fa-edit"></i> Sửa
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/category/delete?id=${category.cateid}" 
                                           class="action-btn btn-delete"
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục \"${category.catename}\"?')">
                                            <i class="fas fa-trash"></i> Xóa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <div class="empty-icon">
                            <i class="fas fa-inbox"></i>
                        </div>
                        <div class="empty-title">Chưa có danh mục nào</div>
                        <div class="empty-subtitle">Hãy tạo danh mục đầu tiên để bắt đầu quản lý</div>
                        <a href="${pageContext.request.contextPath}/admin/category/add" class="add-btn">
                            <i class="fas fa-plus"></i> Tạo Danh Mục Đầu Tiên
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Footer Section -->
        <div class="footer-section">
            <a href="${pageContext.request.contextPath}/home" class="back-btn">
                <i class="fas fa-home"></i> Trang Chủ
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="logout-btn">
                <i class="fas fa-sign-out-alt"></i> Đăng Xuất
            </a>
        </div>
    </div>
</body>
</html>