<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form action="/upload" method="post" enctype="multipart/form-data">
  <input type="file" name="file">
  <button TYPE="submit">upload to cloudinary</button>
</form:form>
</body>
</html>
