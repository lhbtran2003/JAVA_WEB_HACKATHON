<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản Lý Sản Phẩm</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 10px;
        }

        .add-btn {
            display: inline-block;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 25px;
            font-weight: 600;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
            border: none;
            cursor: pointer;
        }

        .add-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }

        .table-container {
            padding: 30px;
            overflow-x: auto;
        }

        .products-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            min-width: 1000px;
        }

        .products-table thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .products-table th,
        .products-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e1e5e9;
            vertical-align: middle;
        }

        .products-table th {
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            white-space: nowrap;
        }

        .products-table tbody tr {
            transition: all 0.3s ease;
        }

        .products-table tbody tr:hover {
            background-color: #f8f9fa;
            transform: scale(1.005);
        }

        .products-table tbody tr:nth-child(even) {
            background-color: #fafbfc;
        }

        .products-table tbody tr:nth-child(even):hover {
            background-color: #f0f2f5;
        }

        .id-cell {
            font-weight: 600;
            color: #666;
            font-family: monospace;
            font-size: 14px;
        }

        .name-cell {
            font-weight: 600;
            color: #2c3e50;
            max-width: 200px;
        }

        .description-cell {
            color: #7f8c8d;
            max-width: 250px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .price-cell {
            color: #27ae60;
            font-weight: 700;
            font-size: 16px;
        }

        .image-cell {
            text-align: center;
            padding: 10px;
        }

        .product-image {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            object-fit: cover;
            border: 2px solid #e1e5e9;
            transition: all 0.3s ease;
        }

        .product-image:hover {
            transform: scale(1.5);
            border-color: #667eea;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            z-index: 10;
            position: relative;
        }

        .status-cell {
            text-align: center;
        }

        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .status-active {
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            color: white;
        }

        .status-inactive {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
        }

        .status-pending {
            background: linear-gradient(135deg, #f39c12, #e67e22);
            color: white;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }

        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            font-size: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            white-space: nowrap;
        }

        .btn-view {
            background: linear-gradient(135deg, #17a2b8, #138496);
            color: white;
        }

        .btn-view:hover {
            background: linear-gradient(135deg, #138496, #0f6674);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(23, 162, 184, 0.3);
        }

        .btn-edit {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
        }

        .btn-edit:hover {
            background: linear-gradient(135deg, #2980b9, #1f618d);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);
        }

        .btn-delete {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
        }

        .btn-delete:hover {
            background: linear-gradient(135deg, #c0392b, #a93226);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(231, 76, 60, 0.3);
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #7f8c8d;
        }

        .empty-state h3 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .empty-state p {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .stats {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            background: #f8f9fa;
            margin: 20px 0;
            border-radius: 10px;
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 24px;
            font-weight: 700;
            color: #667eea;
        }

        .stat-label {
            font-size: 12px;
            color: #7f8c8d;
            margin-top: 5px;
        }

        .no-image {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #e9ecef, #dee2e6);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #6c757d;
            font-size: 20px;
        }

        /* Tooltip cho description */
        .description-cell[title] {
            cursor: help;
        }

        /* Responsive */
        @media (max-width: 1200px) {
            .products-table {
                min-width: 900px;
            }

            .description-cell {
                max-width: 150px;
            }
        }

        @media (max-width: 768px) {
            .container {
                margin: 10px;
                border-radius: 15px;
            }

            .header {
                padding: 20px;
            }

            .header h1 {
                font-size: 24px;
            }

            .table-container {
                padding: 15px;
            }

            .products-table {
                min-width: 800px;
            }

            .products-table th,
            .products-table td {
                padding: 10px 8px;
                font-size: 13px;
            }

            .action-buttons {
                flex-direction: column;
                gap: 5px;
            }

            .stats {
                flex-direction: column;
                gap: 15px;
            }

            .product-image,
            .no-image {
                width: 45px;
                height: 45px;
            }
        }

        /* Animation */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .container {
            animation: fadeInUp 0.6s ease-out;
        }

        /* Loading animation cho hình ảnh */
        .product-image {
            transition: opacity 0.3s ease;
        }

        .product-image[src=""], .product-image:not([src]) {
            opacity: 0;
        }
    </style>

</head>
<body>
<div class="container">
    <div class="header">
        <h1>Quản Lý Sản Phẩm</h1>
        <form action="/products/add" method="get" style="display: inline;">
            <button type="submit" class="add-btn">+ Thêm sản phẩm mới</button>
        </form>
    </div>

    <div class="table-container">
        <c:if test="${not empty products}">
            <div class="stats">
                <div class="stat-item">
                    <div class="stat-number">${products.size()}</div>
                    <div class="stat-label">Tổng sản phẩm</div>
                </div>
                <div class="stat-item">
                    <form action="/products/search" method="get" style="margin-bottom: 20px;">
                        <input type="text" name="keyword" placeholder="Tìm theo tên sản phẩm..." style="padding: 5px 10px; width: 250px;" value="${param.keyword}">
                        <button type="submit" style="padding: 5px 10px;">🔍 Tìm kiếm</button>
                    </form>
                </div>


            <table class="products-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên Sản Phẩm</th>
                    <th>Mô Tả</th>
                    <th>Giá</th>
                    <th>Hình Ảnh</th>
                    <th>Trạng Thái</th>
                    <th>Thao Tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${products}" var="product">
                    <tr>
                        <td class="id-cell">#${product.id}</td>

                        <td class="name-cell">${product.name}</td>

                        <td class="description-cell" title="${product.description}">
                            <c:choose>
                                <c:when test="${not empty product.description}">
                                    ${product.description}
                                </c:when>
                                <c:otherwise>
                                    <em style="color: #bdc3c7;">Chưa có mô tả</em>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td class="price-cell">
                            <fmt:formatNumber value="${product.price}" pattern="#,##0"/>₫
                        </td>

                        <td class="image-cell">
                            <c:choose>
                                <c:when test="${not empty product.img_url}">
                                    <img src="${product.img_url}"
                                         alt="${product.name}"
                                         class="product-image"
                                         onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
                                    <div class="no-image" style="display: none;">📦</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="no-image">📦</div>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td class="status-cell">
                            <c:choose>
                                <c:when test="${product.status == 'ACTIVE' || product.status == 'active' || product.status == 1}">
                                    <span class="status-badge status-active">Hoạt động</span>
                                </c:when>
                                <c:when test="${product.status == 'INACTIVE' || product.status == 'inactive' || product.status == 0}">
                                    <span class="status-badge status-inactive">Không hoạt động</span>
                                </c:when>
                                <c:when test="${product.status == 'PENDING' || product.status == 'pending'}">
                                    <span class="status-badge status-pending">Chờ duyệt</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-badge status-pending">${product.status}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <div class="action-buttons">
                                <a href="/products/view/${product.id}" class="btn btn-view" title="Xem chi tiết">
                                    👁️ Xem
                                </a>
                                <a href="/products/edit/${product.id}" class="btn btn-edit" title="Chỉnh sửa">
                                    ✏️ Sửa
                                </a>
                                <a href="/products/delete/${product.id}"
                                   class="btn btn-delete"
                                   title="Xóa sản phẩm"
                                   onclick="return confirm('Bạn có chắc muốn xóa sản phẩm ?')">
                                🗑️ Xóa
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty products}">
            <div class="empty-state">
                <h3>📦 Chưa có sản phẩm nào</h3>
                <p>Hãy thêm sản phẩm đầu tiên của bạn!</p>
                <a href="/products/add" class="add-btn" style="margin-top: 20px;">+ Thêm sản phẩm mới</a>
            </div>
        </c:if>
    </div>
</div>

<script>
</script>
</div>
</body>
</html>