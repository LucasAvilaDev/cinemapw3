<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Funciones - ${peliculaSeleccionada.titulo}</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 font-sans text-gray-800">
        <nav class="bg-gray-800 p-4 shadow-lg mb-6">
    <div class="container mx-auto flex justify-between items-center">
                <a href="Peliculas" class="text-white text-xl font-bold hover:text-gray-300">🎬 Cine TAW</a>

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

        <div class="bg-white shadow-sm p-4 mb-6">
            <div class="container mx-auto flex justify-between items-center">
                <span class="font-bold text-xl text-gray-700">Funciones - ${peliculaSeleccionada.titulo}</span>
                <a href="Peliculas" class="text-blue-500 hover:text-blue-700 flex items-center gap-1 font-semibold transition">
                    &larr; Volver a la Cartelera
                </a>
            </div>
        </div>

        <div class="container mx-auto px-4 max-w-4xl">
            
            <div class="text-center mb-10">
                <p class="text-sm text-gray-500 uppercase tracking-wide mb-1">Horarios Disponibles para</p>
                <h1 class="text-4xl font-extrabold text-gray-900 mb-2">${peliculaSeleccionada.titulo}</h1>
                <div class="inline-block bg-blue-100 text-blue-800 text-xs px-3 py-1 rounded-full font-semibold uppercase tracking-wide">
                    ${peliculaSeleccionada.genero}
                </div>
                <span class="text-gray-500 text-sm ml-2">⏱ ${peliculaSeleccionada.duracion} min</span>
            </div>

            <c:if test="${empty listaFunciones}">
                <div class="bg-yellow-50 border-l-4 border-yellow-400 p-4 text-center rounded shadow-sm">
                    <p class="text-yellow-700">
                        <span class="font-bold">Lo sentimos.</span> No hay funciones programadas para esta película por el momento.
                    </p>
                </div>
            </c:if>

            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                
                <c:forEach items="${listaFunciones}" var="f">
                    <div class="bg-white rounded-xl shadow-md overflow-hidden hover:shadow-xl transition-shadow duration-300 border border-gray-100 flex flex-col">
                        
                        <div class="p-6 flex-grow text-center">
                            <p class="text-gray-500 text-xs uppercase font-bold mb-2">Fecha y Hora</p>
                            
                            <h3 class="text-2xl font-bold text-gray-800 mb-1">
                                <fmt:formatDate value="${f.fechaHora}" pattern="HH:mm"/>
                            </h3>
                            <p class="text-gray-500 mb-4">
                                <fmt:formatDate value="${f.fechaHora}" pattern="dd/MM/yyyy"/>
                            </p>
                            
                            <div class="w-full border-t border-gray-200 my-4"></div>
                            
                            <p class="text-gray-400 text-xs uppercase font-bold">Precio Entrada</p>
                            <p class="text-3xl font-bold text-green-600 mt-1">$ ${f.precio}</p>
                        </div>

                        <div class="bg-gray-50 p-4 border-t border-gray-100">
                            <a href="Butacas?id=${f.idFuncion}" 
                               class="block w-full bg-blue-600 hover:bg-blue-700 text-white text-center font-bold py-3 px-4 rounded-lg transition duration-200 transform hover:-translate-y-0.5 shadow-lg shadow-blue-500/30">
                                Reservar Asiento
                            </a>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        
        <footer class="text-center text-gray-400 text-sm mt-12 mb-6">
            &copy; 2025 Sistema de Cine Java EE
        </footer>

    </body>
</html>