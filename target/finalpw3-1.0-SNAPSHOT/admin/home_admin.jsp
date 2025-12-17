<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Administración</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">

    <nav class="bg-gray-900 text-white p-4 shadow-md">
        <div class="container mx-auto flex justify-between items-center">
            <span class="text-xl font-bold text-yellow-500">Admin Panel</span>
            <div class="flex gap-4 items-center">
                <span class="text-sm text-gray-300">Hola, ${sessionScope.usuarioLogueado.nombre}</span>
                <a href="Logout" class="bg-red-600 hover:bg-red-700 px-3 py-1 rounded text-sm transition">Salir</a>
            </div>
        </div>
    </nav>

    <div class="container mx-auto mt-10 p-6">
        <h1 class="text-3xl font-bold text-gray-800 mb-8 border-l-4 border-yellow-500 pl-4">Panel de Control</h1>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            
            <a href="AdminPeliculas" class="block group">
                <div class="bg-white p-8 rounded-xl shadow-md border-l-8 border-blue-500 hover:shadow-2xl transition transform hover:-translate-y-1">
                    <div class="flex items-center justify-between mb-4">
                        <h2 class="text-2xl font-bold text-gray-800 group-hover:text-blue-600">Gestionar Películas</h2>
                        <span class="text-4xl">🎬</span>
                    </div>
                    <p class="text-gray-600">Agregar nuevas películas, editar títulos, géneros y sinopsis.</p>
                </div>
            </a>

            <a href="AdminFunciones" class="block group">
                <div class="bg-white p-8 rounded-xl shadow-md border-l-8 border-green-500 hover:shadow-2xl transition transform hover:-translate-y-1">
                    <div class="flex items-center justify-between mb-4">
                        <h2 class="text-2xl font-bold text-gray-800 group-hover:text-green-600">Gestionar Funciones</h2>
                        <span class="text-4xl">📅</span>
                    </div>
                    <p class="text-gray-600">Programar horarios, asignar salas y establecer precios de entradas.</p>
                </div>
            </a>

        </div>
            </div>

</body>
</html>