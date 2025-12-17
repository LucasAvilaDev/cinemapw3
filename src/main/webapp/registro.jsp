<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 flex items-center justify-center h-screen">
    <div class="bg-white p-8 rounded-lg shadow-lg max-w-sm w-full">
        <h2 class="text-2xl font-bold text-center text-gray-800 mb-6">Crear Cuenta</h2>
        
        <c:if test="${not empty error}">
            <div class="bg-red-100 text-red-700 p-3 rounded mb-4 text-sm text-center">${error}</div>
        </c:if>

        <form action="Registro" method="POST">
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2">Nombre Completo</label>
                <input type="text" name="nombre" required class="w-full px-3 py-2 border rounded text-gray-700 focus:outline-none focus:border-blue-500">
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2">Email</label>
                <input type="email" name="email" required class="w-full px-3 py-2 border rounded text-gray-700 focus:outline-none focus:border-blue-500">
            </div>
            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-bold mb-2">Contraseña</label>
                <input type="password" name="password" required class="w-full px-3 py-2 border rounded text-gray-700 focus:outline-none focus:border-blue-500">
            </div>
            <button type="submit" class="w-full bg-green-600 text-white font-bold py-2 px-4 rounded hover:bg-green-700 transition">Registrarse</button>
        </form>
        
        <p class="text-center text-gray-500 text-xs mt-4">
            ¿Ya tienes cuenta? <a href="Login" class="text-blue-500 hover:underline">Inicia sesión</a>
        </p>
    </div>
</body>
</html>