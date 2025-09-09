<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Danh Mục</title>
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

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-header h3 {
            color: #333;
            font-weight: 700;
            margin-bottom: 10px;
            font-size: 28px;
        }

        .form-header p {
            color: #666;
            font-size: 14px;
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
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            border: none;
            padding: 15px;
            border-radius: 12px;
            color: white;
            font-weight: 600;
            font-size: 16px;
            width: 100%;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(40, 167, 69, 0.4);
            margin-bottom: 15px;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(40, 167, 69, 0.6);
            color: white;
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        .btn-cancel {
            background: transparent;
            border: 2px solid #6c757d;
            padding: 12px 25px;
            border-radius: 12px;
            color: #6c757d;
            font-weight: 600;
            font-size: 16px;
            width: 100%;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-cancel:hover {
            background: #6c757d;
            color: white;
            text-decoration: none;
            transform: translateY(-2px);
        }

        .alert {
            border-radius: 12px;
            border: none;
            padding: 15px 20px;
            margin-bottom: 25px;
            font-weight: 500;
        }

        .alert-danger {
            background: linear-gradient(135deg, #ff416c 0%, #ff4b2b 100%);
            color: white;
        }

        .alert i {
            margin-right: 8px;
        }

        .current-info {
            background: #e3f2fd;
            border: 1px solid #bbdefb;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 25px;
        }

        .current-info h5 {
            color: #1976d2;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .info-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .info-label {
            font-weight: 600;
            color: #555;
            min-width: 80px;
            margin-right: 15px;
        }

        .info-value {
            color: #333;
        }

        .current-icon {
            font-size: 24px;
            color: #667eea;
            margin-right: 10px;
        }

        .icon-preview {
            background: #f8f9fa;
            border: 2px dashed #dee2e6;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            margin-top: 10px;
            transition: all 0.3s ease;
        }

        .icon-preview.active {
            background: #e3f2fd;
            border-color: #667eea;
        }

        .preview-icon {
            font-size: 48px;
            color: #667eea;
            margin-bottom: 10px;
        }

        .preview-text {
            color: #666;
            font-size: 14px;
        }

        .help-text {
            font-size: 12px;
            color: #999;
            margin-top: 5px;
        }

        /* Animation */
        .form-container {
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
        @media (max-width: 576px) {
            .form-container {
                margin: 20px;
                padding: 30px 25px;
            }
            
            .form-header h3 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="form-header">
            <h3><i class="fas fa-edit"></i> Sửa Danh Mục</h3>
            <p>Cập nhật thông tin danh mục</p>
        </div>

        <div class="current-info">
            <h5><i class="fas fa-info-circle"></i> Thông tin hiện tại</h5>
            <div class="info-item">
                <span class="info-label">Tên:</span>
                <span class="info-value">${category.catename}</span>
            </div>
            <div class="info-item">
                <span class="info-label">Icon:</span>
                <span class="info-value">
                    <c:choose>
                        <c:when test="${not empty category.icons}">
                            <i class="${category.icons} current-icon"></i>
                            ${category.icons}
                        </c:when>
                        <c:otherwise>
                            <span class="text-muted">Chưa có icon</span>
                        </c:otherwise>
                    </c:choose>
                </span>
            </div>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-triangle"></i> ${error}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/admin/category/edit" method="post">
            <input type="hidden" name="cateid" value="${category.cateid}">
            
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <i class="fas fa-tag"></i>
                        </span>
                    </div>
                    <input type="text" name="catename" class="form-control" 
                           placeholder="Nhập tên danh mục" required 
                           value="${category.catename}">
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <i class="fas fa-icons"></i>
                        </span>
                    </div>
                    <input type="text" name="icons" class="form-control" 
                           placeholder="Nhập class icon (VD: fas fa-home)" 
                           value="${category.icons}"
                           id="iconInput">
                </div>
                <div class="help-text">
                    <i class="fas fa-info-circle"></i> 
                    Sử dụng Font Awesome classes. Ví dụ: fas fa-home, fas fa-laptop, fas fa-car
                </div>
            </div>

            <div class="icon-preview" id="iconPreview">
                <div class="preview-icon" id="previewIcon">
                    <c:choose>
                        <c:when test="${not empty category.icons}">
                            <i class="${category.icons}"></i>
                        </c:when>
                        <c:otherwise>
                            <i class="fas fa-eye"></i>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="preview-text">Xem trước icon mới</div>
            </div>

            <button type="submit" class="btn-submit">
                <i class="fas fa-save"></i> Cập Nhật Danh Mục
            </button>
            
            <a href="${pageContext.request.contextPath}/admin/categories" class="btn-cancel">
                <i class="fas fa-times"></i> Hủy Bỏ
            </a>
        </form>
    </div>

    <script>
        // Icon preview functionality
        const iconInput = document.getElementById('iconInput');
        const previewIcon = document.getElementById('previewIcon');
        const iconPreview = document.getElementById('iconPreview');

        iconInput.addEventListener('input', function() {
            const iconClass = this.value.trim();
            if (iconClass) {
                previewIcon.innerHTML = `<i class="${iconClass}"></i>`;
                iconPreview.classList.add('active');
            } else {
                previewIcon.innerHTML = '<i class="fas fa-eye"></i>';
                iconPreview.classList.remove('active');
            }
        });

        // Initialize preview
        if (iconInput.value) {
            iconPreview.classList.add('active');
        }
    </script>
</body>
</html>