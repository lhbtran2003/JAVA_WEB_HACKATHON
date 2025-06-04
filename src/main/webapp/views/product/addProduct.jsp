<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }

    .form-container {
      background: white;
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 500px;
      backdrop-filter: blur(10px);
    }

    .form-title {
      text-align: center;
      color: #333;
      margin-bottom: 30px;
      font-size: 28px;
      font-weight: 600;
    }

    .form-group {
      margin-bottom: 25px;
    }

    .form-label {
      display: block;
      margin-bottom: 8px;
      color: #555;
      font-weight: 500;
      font-size: 14px;
    }

    .form-input {
      width: 100%;
      padding: 12px 16px;
      border: 2px solid #e1e5e9;
      border-radius: 10px;
      font-size: 16px;
      transition: all 0.3s ease;
      background-color: #f8f9fa;
    }

    .form-input:focus {
      outline: none;
      border-color: #667eea;
      background-color: white;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }

    .error-message {
      color: #e74c3c;
      font-size: 12px;
      margin-top: 5px;
      display: block;
    }

    .submit-btn {
      width: 100%;
      padding: 14px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
      border-radius: 10px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      margin-top: 10px;
    }

    .submit-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
    }

    .submit-btn:active {
      transform: translateY(0);
    }

    .back-link {
      display: block;
      text-align: center;
      margin-top: 20px;
      color: #667eea;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s ease;
    }

    .back-link:hover {
      color: #764ba2;
    }

    /* Responsive */
    @media (max-width: 480px) {
      .form-container {
        padding: 25px;
        margin: 10px;
      }

      .form-title {
        font-size: 24px;
      }
    }
  </style>

</head>
<body>
<div class="form-container">
  <h1 class="form-title">Thêm sản phẩm mới</h1>

  <form:form action="/categories/add" method="post" modelAttribute="product" enctype="multipart/form-data">
    <div class="form-group">
      <label class="form-label" >Tên sản phẩm:</label>
      <form:input path="name" type="text"/>
      <form:errors path="name" element="p" cssStyle="color: red"/>
    </div>

    <div class="form-group">
      <label class="form-label" >Mô tả:</label>
      <form:input path="description" type="text"/>
      <form:errors path="description" element="p" cssStyle="color: red"/>
    </div>

    <div class="form-group">
      <label class="form-label" >Gía:</label>
      <form:input path="price" type="text"/>
      <form:errors path="price" element="p" cssStyle="color: red"/>
    </div>

    <div class="form-group">
      <label class="form-label" >Ảnh:</label>
      <input type="file" name="file">
    </div>
    <div class="form-group">
      <form:select path="category_id" items="${categories}" itemValue="categoryId" itemLabel="categoryName"/>
    </div>

    <button type="submit" class="submit-btn">Thêm sản phẩm</button>
  </form:form>

  <a href="${pageContext.request.contextPath}/products" class="back-link">← Quay lại danh sách</a>
</div>

</body>
</html>
