<%-- 
    Document   : registerUser
    Created on : 5 nov. 2024, 18:37:37
    Author     : Samuel
--%>

<%@page import="movies.database.module.databaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String txtname = request.getParameter("txtname");
    String txtlastname = request.getParameter("txtlastname");
    String txtemail = request.getParameter("txtemail");
    String txtpwd = request.getParameter("txtpwd");
    String txtpwd2 = request.getParameter("txtpwd2");
    String path;

    if (txtpwd.equals(txtpwd2)) {
        databaseHelper dt = new databaseHelper();

        if (!dt.validateEmail(txtemail)) {

            if (dt.registerUser(txtname, txtlastname, txtemail, txtpwd)) {
                path = "/login.jsp?msg=User has been registered";
            } else {
                path = "/login.jsp?error=Unhandled error";
            }

        } else {
            path = "/login.jsp?error=Email already exists";
        }

    } else {
        path = "/login.jsp?error=Password must be the same";
    }
    RequestDispatcher dispatcher = request.getRequestDispatcher(path);
    dispatcher.forward(request, response);
%>
