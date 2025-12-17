<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Admin - Funciones</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-10">
    <div class="max-w-6xl mx-auto bg-white p-8 rounded shadow">
        
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-2xl font-bold text-gray-800">Gestión de Funciones</h1>
            <div class="flex gap-2">
                <a href="AdminHome" class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Volver al Panel</a>
                <a href="AdminFunciones?action=new" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">+ Nueva Función</a>
            </div>
        </div>

        <table class="w-full text-left border-collapse">
            <thead>
                <tr class="bg-gray-200 text-gray-700">
                    <th class="p-3 border">ID</th>
                    <th class="p-3 border">Película</th>
                    <th class="p-3 border">Fecha y Hora</th>
                    <th class="p-3 border">Precio</th>
                    <th class="p-3 border">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${lista}" var="f">
                    <tr class="border-b hover:bg-gray-50">
                        <td class="p-3">${f.idFuncion}</td>
                        <td class="p-3 font-bold text-blue-900">${f.idPelicula.titulo}</td>
                        
                        <td class="p-3">
                            <fmt:formatDate value="${f.fechaHora}" pattern="dd/MM/yyyy HH:mm"/>
                        </td>
                        
                        <td class="p-3 text-green-600 font-bold">$ ${f.precio}</td>
                        
                        <td class="p-3 flex gap-3">
                            <a href="AdminFunciones?action=edit&id=${f.idFuncion}" class="text-blue-600 hover:text-blue-800 font-medium">Editar</a>
                            <a href="AdminFunciones?action=delete&id=${f.idFuncion}" class="text-red-600 hover:text-red-800 font-medium" onclick="return confirm('¿Eliminar esta función?')">Borrar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <c:if test="${empty lista}">
            <p class="text-center text-gray-500 mt-4">No hay funciones cargadas.</p>
        </c:if>
    </div>
</body>
</html>