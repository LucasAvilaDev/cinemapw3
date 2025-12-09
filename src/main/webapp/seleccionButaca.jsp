<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Selección de Asientos</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-white min-h-screen flex flex-col items-center justify-center">

    <div class="bg-gray-800 p-8 rounded-xl shadow-2xl max-w-4xl w-full border border-gray-700">
        
        <div class="flex justify-between items-center mb-8 border-b border-gray-600 pb-4">
            <div>
                <h2 class="text-2xl font-bold text-yellow-400">${funcionDatos.idPelicula.titulo}</h2>
                <p class="text-gray-400 text-sm mt-1">Sala 1 • General</p>
            </div>
            <div class="text-right">
                <p class="text-sm text-gray-400">Precio unitario</p>
                <p class="text-2xl font-bold text-green-400">$ ${funcionDatos.precio}</p>
            </div>
        </div>

        <div class="mb-10 text-center">
            <div class="w-3/4 h-4 bg-white shadow-[0_10px_30px_rgba(255,255,255,0.3)] mx-auto transform -skew-x-12 rounded opacity-50 mb-2"></div>
            <p class="text-xs text-gray-500">PANTALLA</p>
        </div>

        <form action="ConfirmarCompra" method="POST">
            <input type="hidden" name="idFuncion" value="${funcionDatos.idFuncion}">

               <div class="flex flex-col gap-3 items-center">
                <c:forEach var="letraFila" items="A,B,C,D,E">
                    <div class="flex gap-3">
                        <div class="w-8 h-10 flex items-center justify-center text-gray-500 font-bold">${letraFila}</div>
                        
                        <c:forEach var="num" begin="1" end="5">
                            
                            <div class="relative">
                            
                                <c:set var="estaOcupado" value="false"/>
                                <c:forEach items="${ocupadas}" var="reserva">
                                    <c:if test="${reserva.fila == letraFila && reserva.numero == num}">
                                        <c:set var="estaOcupado" value="true"/>
                                    </c:if>
                                </c:forEach>
    
                                <c:choose>
                                    <c:when test="${estaOcupado}">
                                        <div class="w-10 h-10 rounded-t-lg bg-red-600 opacity-50 flex items-center justify-center text-xs font-bold cursor-not-allowed text-white">
                                            ${num}
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" 
                                               id="seat-${letraFila}-${num}" 
                                               name="asientos" 
                                               value="${letraFila}-${num}" 
                                               class="hidden peer">
                                        
                                        <label for="seat-${letraFila}-${num}" 
                                               class="w-10 h-10 rounded-t-lg bg-gray-600 peer-checked:bg-green-500 peer-checked:shadow-[0_0_10px_#22c55e] flex items-center justify-center text-xs font-bold cursor-pointer transition-all hover:bg-gray-500 select-none text-white">
                                            ${num}
                                        </label>
                                    </c:otherwise>
                                </c:choose>
                                
                            </div> </c:forEach>
                    </div>
                </c:forEach>
            </div>
            
            <div class="mt-10 flex justify-between items-center border-t border-gray-700 pt-6">
                <div class="text-sm text-gray-400 flex gap-4">
                    <span class="flex items-center gap-2"><div class="w-4 h-4 bg-gray-600 rounded"></div> Libre</span>
                    <span class="flex items-center gap-2"><div class="w-4 h-4 bg-green-500 rounded"></div> Seleccionado</span>
                    <span class="flex items-center gap-2"><div class="w-4 h-4 bg-red-600 rounded"></div> Ocupado</span>
                </div>
                
                <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-8 rounded-lg shadow-lg transition transform hover:-translate-y-1">
                    Confirmar Selección
                </button>
            </div>
        </form>

    </div>
</body>
</html>