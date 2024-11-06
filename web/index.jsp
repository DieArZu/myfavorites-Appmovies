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
                <a class="navbar-brand" href="#">MoviesApp</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Welcome <%=resultsUser.getString("firstName")%></a>
                        </li> 
                                             
                        
                        <li class="nav-item">
                            <a class="nav-link" href="misfav.jsp">Mis Favoritos</a>
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
        
        <main class='container mt-5'>
            <div class="row">
                <% while (resultset.next()) {%>
                <div class="card" style="width: 18rem;margin-right: 10px">
                    <img src="<%=resultset.getString("photo")%>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%=resultset.getString("title")%></h5>
                        <p class="card-text"><%=resultset.getString("releaseDate")%></p>                            
                    </div>
                    <% if (resultset.getInt("isFavorite") == 0) {%>
                        <div class='mb-3'>
                            <button type='submit' onclick="window.location.href = 'saveFavoriteMovie.jsp?email=<%=email%>&idMovie=<%=resultset.getInt("id")%>'" class='btn btn-primary'>Save</button>
                        </div> 
                    <% } else {%>
                        <div class='mb-3'>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                            <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
                            </svg>
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
