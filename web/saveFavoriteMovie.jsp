<%-- 
    Document   : saveFavoriteMovie
    Created on : 29 oct. 2024, 20:14:09
    Author     : Samuel
--%>

<%@page import="movies.database.module.databaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String email = request.getParameter("email");
    int idMovie = Integer.parseInt(request.getParameter("idMovie"));    
    String path;
    databaseHelper dt = new databaseHelper();

    if (dt.saveFavoriteMovie(email, idMovie)) {        
        path = "/index.jsp?msg=Movie saved";
    } else {
        path = "/index.jsp?msg=Error saving the Movie";
    }

    dt.Close();
    RequestDispatcher dispatcher = request.getRequestDispatcher(path);
    dispatcher.forward(request, response);
%>
