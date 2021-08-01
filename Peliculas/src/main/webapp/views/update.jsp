<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<html>

<head>
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>

<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow-sm">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="d-inline m-0">Modificar película</h5>
            </div>
            <div class="card-body">
                <form action="${context}/ServletMovie" method="post" class="d-inline">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="idUpdate" value="${movie.id}">
                    <div class="row">
                        <div class="col col-md-4">
                            <label>Nombre:</label>
                            <input type="text" class="form-control mb-3" name="nameInput" value="${movie.name}">
                        </div>
                        <div class="col col-md-4">
                            <label>Descripción:</label>
                            <input type="text" class="form-control mb-3" name="descriptionInput"
                                value="${movie.description}">
                        </div>
                        <div class="col col-md-4">
                            <label>Fecha de estreno:</label>
                            <input type="date" class="form-control mb-3" name="releaseDateInput"
                                value="${movie.releaseDate}">
                        </div>
                        <div class="col col-md-4">
                            <label>Ganancia:</label>
                            <div class="input-group mb-3">
                                <div class="input-group-text">$</div>
                                <input type="number" class="form-control" name="boxOfficeInput"
                                    value="${movie.boxOffice}">
                            </div>
                        </div>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-success w-auto">
                        <i class="fas fa-check"></i> Actualizar
                    </button>
                </form>
                <form action="${context}/ServletMovie" method="get" id="form" class="d-inline">
                    <button class="btn btn-secondary">
                        <i class="fas fa-times"></i> Cancelar
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

</html>