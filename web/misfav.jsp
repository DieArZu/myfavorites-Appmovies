<%-- 
    Document   : index
    Created on : 29 oct. 2024, 18:16:13
    Author     : Samuel
--%>

<%@page import="movies.database.module.databaseHelper"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <style>
            html, body {
                height: 100%;
            }
            body {
                display: flex;
                flex-direction: column;
            }
            main {
                flex-grow: 1;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>        
        <%
            String msg = request.getParameter("msg");
        %>
        <%
            if (session.getAttribute("email") == null) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp?error=You must log in");
                dispatcher.forward(request, response);
            }

            String email = session.getAttribute("email").toString();

            databaseHelper ds = new databaseHelper();
            ResultSet resultset = ds.getMovies(email);
            ResultSet resultsUser = ds.getUser(email);
            resultsUser.next();
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Edita tus peliculas Favoritas</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Las favoritas de <%=resultsUser.getString("firstName")%></a>
                        </li> 

                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Inicio</a>
                        </li> 
                        <li class="nav-item">
                            <a class="nav-link" href="#">Settings</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Logout</a>
                        </li>                        


                    </ul>
                </div>
            </div>
        </nav>
                       <a href="index.jsp" class="btn btn-primary mt-3" style="position: fixed; top: 100px; left: 100px;">Volver a Inicio</a>

        <%-- Este es un comentario JSP --%>                        

        <main class='container mt-5'>
            <div class="row">
 
                <% while (resultset.next()) {%>

                <% if (resultset.getInt("isFavorite") == 0) {%>
               

                <% } else {%>


                <%
                    // Conexión a la base de datos
                    String url = "jdbc:mysql://localhost:3306/moviesdatabase";
                    String username = "root";
                    String password = "Admin$1234";
                    Connection conn = DriverManager.getConnection(url, username, password);

                    // Consulta de los datos
                    String query = "SELECT * FROM favoriteMovies";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);

                    if (rs.next()) {
                        int id = rs.getInt("id");
                        int idMovie = rs.getInt("idMovie");
                %>




                <div class="card" style="width: 20rem; margin-right: 6px; height: 50px; overflow: hidden; margin-bottom: 10px; padding: 10px;">
                    <h5 class="card-title" style="display: inline-block; margin: 0;">
                        <%=resultset.getString("title")%>
                   
                    <!-- Formulario y botón de eliminar, separado del título -->
                    <form action="deletemovie.jsp" method="post" style="display: inline;">
                        <input type="hidden" name="id" value="<%= id%>">
                        <button type="submit" style="background-color: #007bff; color: white; border: none; border-radius: 4px; padding: 5px 10px; cursor: pointer; margin-left: 30px;">
                            Eliminar
                        </button>
                    </form></h5>




                    <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    %>


                </div>

            </div> 
            <% } %> 
        </div> 



        <% }%>                    
    </div>
</main>
<footer class='bg-primary text-white text-center text-lg-start mt-auto'>
    <div class='container p-4'>
        <div class='row'>
            <div class='col-lg-6 col-md-12 mb-4 mb-md-0'>
                <h5 class='text-uppercase'>Movies App</h5>
                <p>Manage your movies efficiently and easily with our app.</p>
            </div>
            <div class='col-lg-6 col-md-12 mb-4 mb-md-0'>
                <h5 class='text-uppercase'>Links</h5>
                <ul class='list-unstyled mb-0'>
                    <li><a href='#' class='text-white'>Home</a></li>                            
                    <li><a href='#' class='text-white'>Report</a></li>
                    <li><a href='#' class='text-white'>Settings</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class='text-center p-3' style='background-color: rgba(0, 0, 0, 0.2);'>
        © 2024 GastosApp | All rights reserved.
    </div>
</footer>
</body>
</html>
