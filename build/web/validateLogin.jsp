<%-- 
    Document   : validateLogin
    Created on : 29 oct. 2024, 19:13:04
    Author     : Samuel
--%>

<%@page import="movies.database.module.databaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String txtemail = request.getParameter("txtemail");
    String txtpwd = request.getParameter("txtpwd");
    String path;
    databaseHelper dt = new databaseHelper();

    if (dt.validateLogin(txtemail, txtpwd)) {        
        session.setAttribute("email", txtemail);
        path = "/index.jsp";
    } else {
        path = "/login.jsp?error=Incorrect credentials";
    }

    dt.Close();
    RequestDispatcher dispatcher = request.getRequestDispatcher(path);
    dispatcher.forward(request, response);
%>
