<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Formulario Función</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="bg-white p-8 rounded shadow w-full max-w-lg">
        <h2 class="text-xl font-bold mb-4">Gestión de Función</h2>
        
        <form action="AdminFunciones" method="POST" class="flex flex-col gap-4">
            <input type="hidden" name="id" value="${funcion.idFuncion}">
            
            <div>
                <label class="block text-sm font-bold mb-1">Película</label>
                <select name="idPelicula" class="w-full border p-2 rounded">
                    <c:forEach items="${listaPeliculas}" var="p">
                        <option value="${p.idPelicula}" ${p.idPelicula == funcion.idPelicula.idPelicula ? 'selected' : ''}>
                            ${p.titulo}
                        </option>
                    </c:forEach>
                </select>
            </div>
            
            <div>
                <label class="block text-sm font-bold mb-1">Fecha y Hora</label>
                <c:set var="now" value="${funcion.fechaHora}" />
                <fmt:formatDate value="${now}" pattern="yyyy-MM-dd'T'HH:mm" var="fechaFormat" />
                
                <input type="datetime-local" name="fechaHora" value="${fechaFormat}" required class="w-full border p-2 rounded">
            </div>
            
            <div>
                <label class="block text-sm font-bold mb-1">Precio</label>
                <input type="number" step="0.01" name="precio" value="${funcion.precio}" required class="w-full border p-2 rounded">
            </div>
            
            <button type="submit" class="bg-blue-600 text-white p-2 rounded hover:bg-blue-700">Guardar</button>
        </form>
    </div>
</body>
</html>