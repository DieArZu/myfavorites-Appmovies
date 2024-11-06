<%-- 
    Document   : index
    Created on : 29 oct. 2024, 18:16:13
    Author     : Samuel
--%>

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
            session = request.getSession(false);

            if (session != null) {
                session.invalidate();
            }

            String error = request.getParameter("error");
            String msg = request.getParameter("msg");
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
                            <a class="nav-link active" aria-current="page" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">Register</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Login</a>
                        </li>                        
                        <li class="nav-item">
                            <a class="nav-link" href="#">Settings</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Register</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="registerUser.jsp">
                            <div class="mb-3">
                                <label for="txtname" class="form-label">Name</label>
                                <input type="text" class="form-control" id="txtname" name="txtname">                            
                            </div>
                            <div class="mb-3">
                                <label for="txtlastname" class="form-label">Last Name</label>
                                <input type="text" class="form-control" id="txtlastname" name="txtlastname">                            
                            </div>
                            <div class="mb-3">
                                <label for="txtemail" class="form-label">Email</label>
                                <input type="email" class="form-control" id="txtemail" name="txtemail">                            
                            </div>
                            <div class="mb-3">
                                <label for="txtpwd" class="form-label">Password</label>
                                <input type="password" class="form-control" id="txtpwd" name="txtpwd">
                            </div>
                            <div class="mb-3">
                                <label for="txtpwd2" class="form-label">Confirm Password</label>
                                <input type="password" class="form-control" id="txtpwd2" name="txtpwd2">
                            </div>       
                            <button type="submit" class="btn btn-primary">Register</button>
                        </form>        
                    </div>                    
                </div>
            </div>
        </div> 

        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="card" style="width: 18rem;">
                <div class="card-header navbar navbar-expand-lg navbar-dark bg-primary">
                    <a class="navbar-brand">Login</a>
                </div>
                <div class="card-body">
                    <form action="validateLogin.jsp">
                        <div class="mb-3">
                            <label for="txtemail" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="txtemail" name="txtemail" value="brav88@hotmail.com">                            
                        </div>
                        <div class="mb-3">
                            <label for="txtpwd" class="form-label">Password</label>
                            <input type="password" class="form-control" id="txtpwd" name="txtpwd" value="Admin$1234">
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>                         
                </div>
                <% if (error != null) {%>
                <div class="footer">
                    <div class="alert alert-danger">
                        <label class><%=error%></label>
                    </div>   
                </div>                    
                <% }%>
                <% if (msg != null) {%>
                <div class="footer">
                    <div class="alert alert-info">
                        <label class><%=msg%></label>
                    </div>   
                </div>                    
                <% }%>
            </div>
        </div>

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
