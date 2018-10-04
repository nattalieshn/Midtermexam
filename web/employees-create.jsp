<%--
  Created by IntelliJ IDEA.
  User: nattalie
  Date: 4/10/2018 AD
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ page import = "com.mysql.jndi.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sql:query dataSource="jdbc/employees" var="result">
    SELECT * FROM employees
</sql:query>
<!DOCTYPE html>
<!--create-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employees</title>

</head>
<body>
<h1>Employees</h1>
<form action="product-controller">
    <table>
        <tr>
            <td>Firstname</td>
            <td><input type="text" name="first_name"></td>
        </tr>
        <tr>
            <td>Lastname</td>
            <td><input type="text" name="last_name"></td>
        </tr>
        <!--
        <tr>
            <td>Category</td>
            <td>
                <select name="category_id">
                    <c:forEach var="row" items="${result.rows}">
                        <option value='<c:out value="${row.id}"/>'>
                            <c:out value="${row.name}"/>
                        </option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr> -->
        <td colspan="2">
            <input type="submit" value="Create">
        </td>
        </tr>
    </table>
</form>

</body>
</html>

