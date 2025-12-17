<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Admin - Películas</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-10">
    <div class="max-w-6xl mx-auto bg-white p-8 rounded shadow">
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-2xl font-bold">Gestión de Películas</h1>
            <a href="AdminPeliculas?action=new" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">+ Nueva Película</a>
        </div>

        <table class="w-full text-left border-collapse">
            <thead>
                <tr class="bg-gray-200">
                    <th class="p-3 border">ID</th>
                    <th class="p-3 border">Título</th>
                    <th class="p-3 border">Género</th>
                    <th class="p-3 border">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${lista}" var="p">
                    <tr class="border-b hover:bg-gray-50">
                        <td class="p-3">${p.idPelicula}</td>
                        <td class="p-3 font-bold">${p.titulo}</td>
                        <td class="p-3">${p.genero}</td>
                        <td class="p-3 flex gap-2">
                            <a href="AdminPeliculas?action=edit&id=${p.idPelicula}" class="text-blue-600 hover:underline">Editar</a>
                            <a href="AdminPeliculas?action=delete&id=${p.idPelicula}" class="text-red-600 hover:underline" onclick="return confirm('¿Seguro?')">Borrar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <div class="mt-4">
            <a href="${pageContext.request.contextPath}/AdminHome" class="text-gray-500 hover:underline">← Volver al sitio</a>
        </div>
    </div>
</body>
</html>