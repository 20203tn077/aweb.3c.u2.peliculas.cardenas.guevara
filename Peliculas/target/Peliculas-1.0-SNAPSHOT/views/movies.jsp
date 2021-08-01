<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
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
                <h5 class="d-inline m-0">Películas</h5>
                <a href="${context}/views/add.jsp" class="btn btn-success float-end">
                    <i class="fas fa-plus"></i> Agregar película
                </a>
            </div>
            <div class="card-body">
                <table class="table table-striped table-bordered text-center align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>
                                ID
                            </th>
                            <th>
                                Nombre
                            </th>
                            <th>
                                Estado
                            </th>
                            <th>
                                Acciones
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${movieList}" var="movie" varStatus="status">
                            <tr>
                                <td>
                                    ${movie.id}
                                </td>
                                <td>
                                    ${movie.name}
                                </td>
                                <td>
                                    <c:if test="${movie.status==1}">
                                        <span class="badge bg-success">
                                            Activo
                                        </span>
                                    </c:if>
                                    <c:if test="${movie.status==0}">
                                        <span class="badge bg-secondary">
                                            Inactivo
                                        </span>
                                    </c:if>
                                </td>
                                <td>
                                    <button class="btn btn-primary"
                                        onclick="displayDetail('${movie.id}', '${movie.name}', '${movie.description}', '${movie.releaseDate}', '${movie.boxOffice}', '${movie.status}')">
                                        <i class="fas fa-info-circle"></i> Detalle
                                    </button>
                                    <c:if test="${movie.status==1}">
                                        </button>
                                        <form action="${context}/ServletMovie" method="post" class="d-inline">
                                            <input type="hidden" name="action" value="goUpdate">
                                            <input type="hidden" name="updateId" value="${movie.id}">
                                            <button class="btn btn-primary">
                                                <i class="fas fa-edit"></i> Modificar
                                            </button>
                                        </form>
                                        <button class="btn btn-danger"
                                            onclick="displayDelete('${movie.id}', '${movie.name}')">
                                            <i class="far fa-trash-alt"></i> Eliminar
                                        </button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
    <div class="modal" tabindex="-1" id="modalDelete">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Eliminar película</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ¿Estás seguro de eliminar <span id="modalDelete_name"></span>?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="fas fa-times"></i> Cancelar
                    </button>
                    <form action="${context}/ServletMovie" method="post" class="d-inline">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="deleteId" id="deleteId" value="">
                        <button class="btn btn-danger">
                            <i class="far fa-trash-alt"></i> Eliminar
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" tabindex="-1" id="modalDetails">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Detalle de película</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <span class="fw-bold">ID:</span>
                            <p id="modalDetails_id"></p>
                        </div>
                        <div class="col-md-6">
                            <span class="fw-bold">Nombre:</span>
                            <p id="modalDetails_name"></p>
                        </div>
                        <div class="col-md-6">
                            <span class="fw-bold">Fecha de estreno:</span>
                            <p id="modalDetails_releaseDate"></p>
                        </div>
                        <div class="col-md-6">
                            <span class="fw-bold">Ganancia:</span>
                            <p id="modalDetails_boxOffice"></p>
                        </div>
                        <div class="col-md-6">
                            <span class="fw-bold">Status:</span>
                            <p id="modalDetails_status"></p>
                        </div>
                    </div>
                    <span class="fw-bold">Descripción:</span>
                    <p id="modalDetails_description"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="fas fa-times"></i> Cerrar
                    </button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script>
        var modalDelete = new bootstrap.Modal(document.getElementById('modalDelete'), {})
        var modalDetails = new bootstrap.Modal(document.getElementById('modalDetails'), {})

        function displayDelete(id, name) {
            document.getElementById("deleteId").value = id;
            document.getElementById("modalDelete_name").innerHTML = name;
            modalDelete.show();
        }
        function displayDetail(id, name, description, releaseDate, boxOffice, status) {
            document.getElementById("modalDetails_id").innerHTML = id;
            document.getElementById("modalDetails_name").innerHTML = name;
            document.getElementById("modalDetails_description").innerHTML = description;
            document.getElementById("modalDetails_releaseDate").innerHTML = releaseDate;
            document.getElementById("modalDetails_boxOffice").innerHTML = "$"+boxOffice;
            switch (status) {
                case "1":
                    document.getElementById("modalDetails_status").innerHTML = '<span class="badge bg-success">Activo</span>';
                    break;
                case "0":
                    document.getElementById("modalDetails_status").innerHTML = '<span class="badge bg-secondary">Inactivo</span>';
            }
            modalDetails.show();
        }
    </script>
</body>

</html>