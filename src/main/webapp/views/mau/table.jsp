<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh Sách Sản Phẩm</title>
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
      max-width: 1200px;
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
    }

    .products-table tbody tr {
      transition: all 0.3s ease;
    }

    .products-table tbody tr:hover {
      background-color: #f8f9fa;
      transform: scale(1.01);
    }

    .products-table tbody tr:nth-child(even) {
      background-color: #fafbfc;
    }

    .products-table tbody tr:nth-child(even):hover {
      background-color: #f0f2f5;
    }

    .price-cell {
      color: #27ae60;
      font-weight: 600;
    }

    .quantity-cell {
      color: #3498db;
      font-weight: 600;
    }

    .action-buttons {
      display: flex;
      gap: 8px;
      justify-content: center;
      align-items: center;
    }

    .btn {
      padding: 8px 16px;
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

    /* Responsive */
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

      .products-table th,
      .products-table td {
        padding: 10px;
        font-size: 14px;
      }

      .action-buttons {
        flex-direction: column;
        gap: 5px;
      }

      .stats {
        flex-direction: column;
        gap: 15px;
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
  </style>
</head>

<body>
<div class="container">
  <div class="header">
    <h1>Quản Lý Sản Phẩm</h1>
<%--    <a href="/product/add" class="add-btn">+ Thêm Sản Phẩm Mới</a>--%>
    <form action="/home" method="get">
      <button type="submit" class="add-btn">+ Thêm sản pham mới</button>
    </form>
  </div>


  <div class="table-container">
<%--    <c:if test="${not empty products}">--%>
      <div class="stats">
        <div class="stat-item">
          <div class="stat-number">${products.size()}</div>
          <div class="stat-label">Tổng sản phẩm</div>
        </div>
        <div class="stat-item">
          <div class="stat-number">
            <c:set var="totalQuantity" value="0"/>
            <c:forEach var="product" items="${products}">
              <c:set var="totalQuantity" value="${totalQuantity + product.quantity}"/>
            </c:forEach>
              ${totalQuantity}
          </div>
          <div class="stat-label">Tổng số lượng</div>
        </div>
        <div class="stat-item">
          <div class="stat-number">
            <c:set var="totalValue" value="0"/>
            <c:forEach var="product" items="${products}">
              <c:set var="totalValue" value="${totalValue + (product.price * product.quantity)}"/>
            </c:forEach>
            <fmt:formatNumber value="${totalValue}" type="number" maxFractionDigits="0"/>
          </div>
          <div class="stat-label">Tổng giá trị</div>
        </div>
      </div>

      <table class="products-table">
        <thead>
        <tr>
          <th>ID</th>
          <th>Tên Sản Phẩm</th>
          <th>Giá</th>
          <th>Số Lượng</th>
          <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>bánh kẹo</td>
            <td class="price-cell">
             10000
            </td>
            <td class="quantity-cell">23</td>
            <td>
              <div class="action-buttons">
                <a href="/product/edit/${product.id}" class="btn btn-edit">
                  ✏️ Sửa
                </a>
                <a href="/product/delete/${product.id}"
                   class="btn btn-delete"
                   onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?')">
                  🗑️ Xóa
                </a>
              </div>
            </td>
          </tr>

        </tbody>
      </table>
<%--    </c:if>--%>

<%--    <c:if test="${empty products}">--%>
<%--      <div class="empty-state">--%>
<%--        <h3>📦 Chưa có sản phẩm nào</h3>--%>
<%--        <p>Hãy thêm sản phẩm đầu tiên của bạn!</p>--%>
<%--        <a href="/product/add" class="add-btn">Thêm Sản Phẩm Đầu Tiên</a>--%>
<%--      </div>--%>
<%--    </c:if>--%>
  </div>
</div>

<script>
  document.querySelectorAll('.products-table tbody tr').forEach(row => {
    row.addEventListener('mouseenter', function() {
      this.style.boxShadow = '0 4px 15px rgba(0,0,0,0.1)';
    });

    row.addEventListener('mouseleave', function() {
      this.style.boxShadow = 'none';
    });
  });
</script>
</body>
</html>