<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Cartelera de Cine</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 font-sans leading-normal tracking-normal">
        <nav class="bg-gray-800 p-4 shadow-lg mb-6">
    <div class="container mx-auto flex justify-between items-center">
        <a href="Peliculas" class="text-white text-xl font-bold hover:text-gray-300">🎬 Cinema3</a>
        
        <div class="text-sm">
            <c:choose>
                <c:when test="${not empty sessionScope.usuarioLogueado}">
                    <span class="text-gray-300 mr-4">Hola, <b>${sessionScope.usuarioLogueado.nombre}</b></span>
                    <a href="Logout" class="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded transition">Cerrar Sesión</a>
                </c:when>
                <c:otherwise>
                    <a href="Login" class="text-gray-300 hover:text-white mr-4">Iniciar Sesión</a>
                    <a href="Registro" class="bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded transition">Registrarse</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

        
        <div class="container mx-auto mt-10 p-5">
    
    <div class="flex justify-between items-center mb-6">

        <form action="Peliculas" method="GET" class="flex gap-2">
            <input type="text" name="buscar" placeholder="Buscar película..." 
                   class="border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
            
            <button type="submit" 
                    class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition">
                Buscar
            </button>
            
            <a href="Peliculas" class="bg-gray-300 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-400 transition flex items-center">
                Ver Todas
            </a>
        </form>
    </div>

        <div class="container mx-auto mt-10 p-5">
            <h1 class="text-3xl font-bold text-gray-800 mb-6 text-center border-b-2 border-blue-500 pb-2 inline-block">
                Películas en Cartelera
            </h1>

            <div class="bg-white shadow-md rounded my-6 overflow-hidden">
                <table class="min-w-full leading-normal">
                    <thead>
                        <tr class="bg-gray-200 text-gray-600 uppercase text-sm leading-normal">
                            <th class="py-3 px-6 text-left">ID</th>
                            <th class="py-3 px-6 text-left">Título</th>
                            <th class="py-3 px-6 text-left">Género</th>
                            <th class="py-3 px-6 text-center">Duración</th>
                            <th class="py-3 px-6 text-center">Acción</th>
                        </tr>
                    </thead>
                    <tbody class="text-gray-600 text-sm font-light">
                        <c:forEach items="${misPeliculas}" var="p">
                            <tr class="border-b border-gray-200 hover:bg-gray-100 transition duration-200">
                                <td class="py-3 px-6 text-left whitespace-nowrap font-bold">${p.idPelicula}</td>
                                <td class="py-3 px-6 text-left text-lg font-medium text-gray-800">${p.titulo}</td>
                                <td class="py-3 px-6 text-left">
                                    <span class="bg-blue-200 text-blue-600 py-1 px-3 rounded-full text-xs">
                                        ${p.genero}
                                    </span>
                                </td>
                                <td class="py-3 px-6 text-center">${p.duracion} min</td>
                                <td class="py-3 px-6 text-center">
                                    <a href="Funciones?id=${p.idPelicula}" 
                                       class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded shadow transition duration-300 transform hover:scale-105">
                                        Ver Funciones
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <c:if test="${empty misPeliculas}">
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative text-center" role="alert">
                    <strong class="font-bold">¡Lo sentimos!</strong>
                    <span class="block sm:inline">No hay películas cargadas en el sistema.</span>
                </div>
            </c:if>
        </div>
    </body>
</html>