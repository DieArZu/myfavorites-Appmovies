<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Película</title>
    <!-- Enlace de Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <!-- Título con fondo azul y letras blancas -->
            <h3 class="card-title text-white bg-primary p-2">Editando películas favoritas</h3>
            <hr>
            <%
                String id = request.getParameter("id");

                if (id != null && !id.isEmpty()) {
                    try {
                        // Conexión a la base de datos
                        String url = "jdbc:mysql://localhost:3306/moviesdatabase";
                        String username = "root";
                        String password = "Admin$1234";
                        Connection conn = DriverManager.getConnection(url, username, password);

                        // Comando SQL para eliminar
                        String sql = "DELETE FROM favoriteMovies WHERE id = ?";
                        PreparedStatement pstmt = conn.prepareStatement(sql);
                        pstmt.setInt(1, Integer.parseInt(id));

                        // Ejecutar la eliminación
                        int rowsDeleted = pstmt.executeUpdate();
                        if (rowsDeleted > 0) {
            %>
                            <div class="alert alert-success" role="alert">
                                La película fue eliminada exitosamente.
                            </div>
            <%
                        } else {
            %>
                            <div class="alert alert-warning" role="alert">
                                No se encontró ninguna película con ese ID.
                            </div>
            <%
                        }

                        pstmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
            %>
                        <div class="alert alert-danger" role="alert">
                            Error al eliminar la película. Por favor, inténtelo de nuevo.
                        </div>
            <%
                    }
                } else {
            %>
                    <div class="alert alert-danger" role="alert">
                        ID de película no proporcionado.
                    </div>
            <%
                }
            %>
            <a href="misfav.jsp" class="btn btn-primary mt-3">Volver a Favoritos</a>
        </div>
    </div>
</div>

<!-- Enlace de Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
