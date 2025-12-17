<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Formulario Película</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="bg-white p-8 rounded shadow w-full max-w-lg">
        <h2 class="text-xl font-bold mb-4">${not empty pelicula ? 'Editar' : 'Nueva'} Película</h2>
        
        <form action="AdminPeliculas" method="POST" class="flex flex-col gap-4">
            <input type="hidden" name="id" value="${pelicula.idPelicula}">
            
            <div>
                <label class="block text-sm font-bold mb-1">Título</label>
                <input type="text" name="titulo" value="${pelicula.titulo}" required class="w-full border p-2 rounded">
            </div>
            
            <div>
                <label class="block text-sm font-bold mb-1">Género</label>
                <input type="text" name="genero" value="${pelicula.genero}" class="w-full border p-2 rounded">
            </div>
            
            <div>
                <label class="block text-sm font-bold mb-1">Duración (min)</label>
                <input type="number" name="duracion" value="${pelicula.duracion}" required class="w-full border p-2 rounded">
            </div>
            
            <div>
                <label class="block text-sm font-bold mb-1">Sinopsis</label>
                <textarea name="sinopsis" rows="3" class="w-full border p-2 rounded">${pelicula.sinopsis}</textarea>
            </div>
            
            <button type="submit" class="bg-blue-600 text-white p-2 rounded hover:bg-blue-700">Guardar</button>
            <a href="AdminPeliculas" class="text-center text-gray-500 text-sm">Cancelar</a>
        </form>
    </div>
</body>
</html>