<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>Películas</title>
</head>
<body onload="redirect()">
    <form action="${context}/ServletMovie" method="get" id="form"></form>
    <script>
        function redirect() {
            document.getElementById("form").submit();
        }
    </script>
</body>
</html>