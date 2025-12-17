<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reserva Exitosa</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Mantenemos tu estilo por si acaso, aunque usamos las clases de Tailwind abajo */
        .ticket-border {
            background-image: radial-gradient(circle at 0 50%, transparent 10px, white 11px), 
                              radial-gradient(circle at 100% 50%, transparent 10px, white 11px);
            background-size: 50% 100%;
            background-repeat: no-repeat;
            background-position: left, right;
        }
    </style>
</head>
<body class="bg-blue-600 min-h-screen flex items-center justify-center p-4">

    <div class="bg-white w-full max-w-md rounded-lg shadow-2xl overflow-hidden relative">
        
        <div class="bg-green-500 p-6 text-center">
            <div class="bg-white rounded-full h-16 w-16 flex items-center justify-center mx-auto mb-3 shadow-md">
                <svg class="w-8 h-8 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
            </div>
            <h1 class="text-white text-2xl font-bold tracking-wide">¡Compra Exitosa!</h1>
            <p class="text-green-100 text-sm">Has reservado ${listaReservas.size()} entradas</p>
        </div>

        <div class="p-8">
            <div class="text-center mb-6">
                <p class="text-gray-500 text-xs uppercase font-bold tracking-wider">Película</p>
                <h2 class="text-2xl font-extrabold text-gray-800">${funcion.idPelicula.titulo}</h2>
                <span class="bg-gray-200 text-gray-600 text-xs px-2 py-1 rounded mt-2 inline-block">${funcion.idPelicula.genero}</span>
            </div>

            <div class="flex justify-between border-b-2 border-dashed border-gray-200 pb-6 mb-6 relative">
                <div class="absolute -left-10 bottom-0 w-4 h-4 rounded-full bg-blue-600"></div>
                <div class="absolute -right-10 bottom-0 w-4 h-4 rounded-full bg-blue-600"></div>

                <div class="text-center w-1/2 border-r border-gray-200">
                    <p class="text-gray-400 text-xs uppercase font-bold">Fecha</p>
                    <p class="text-gray-800 font-bold">
                        <fmt:formatDate value="${funcion.fechaHora}" pattern="dd/MM/yyyy"/>
                    </p>
                </div>
                <div class="text-center w-1/2">
                    <p class="text-gray-400 text-xs uppercase font-bold">Hora</p>
                    <p class="text-gray-800 font-bold">
                        <fmt:formatDate value="${funcion.fechaHora}" pattern="HH:mm"/>
                    </p>
                </div>
            </div>

            <div class="mb-6">
                <p class="text-gray-400 text-xs uppercase font-bold mb-2 text-center">Asientos Seleccionados</p>
                
                <div class="grid grid-cols-3 gap-3">
                    <c:forEach items="${listaReservas}" var="r">
                        <div class="bg-gray-50 border border-gray-200 rounded p-2 text-center">
                            <span class="block text-xs text-gray-500 font-bold">FILA ${r.fila}</span>
                            <span class="text-xl font-extrabold text-blue-600">${r.numero}</span>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="flex justify-between items-center mb-6 bg-blue-50 p-4 rounded border border-blue-100">
                <div>
                    <p class="text-gray-500 text-xs uppercase font-bold">Total Pagado</p>
                </div>
                <div class="text-right">
                    <p class="text-2xl font-extrabold text-gray-800">$ ${totalPagado}</p>
                </div>
            </div>

            <div class="bg-gray-50 p-4 rounded text-center border border-gray-100">
                <p class="text-xs text-gray-500">Comprador: ${sessionScope.usuarioLogueado.email}</p>
                <p class="text-xs text-gray-400 mt-1">Presenta este ticket digital en la entrada</p>
            </div>
        </div>

        <a href="Peliculas" class="block w-full bg-gray-800 hover:bg-gray-900 text-white text-center font-bold py-4 transition duration-200">
            Volver a la Cartelera
        </a>
    </div>

</body>
</html>