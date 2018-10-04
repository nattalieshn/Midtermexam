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
<html>
<script>
    function confirmDelete(id) {
        if (confirm('Are you sure?')) {
            window.location = "product-controller?cmd=d&id="+id;
        }
    }
</script>
<head>
    <title>Employees</title>
</head>
<body>
<h1>Employees</h1>
<a href="employees-create.jsp">ADD</a>

<sql:query dataSource="jdbc/employees" var="result">
    SELECT * FROM employees
</sql:query>


<table border="1">
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.first_name}"/></td>
            <td><c:out value="${row.last_name}"/></td>
            <td>
                <button onclick="window.location='employees-update.jsp?id=<c:out value="${row.id}"/>';">UPDATE</button>
                <button onclick="confirmDelete(<c:out value="${row.id}"/>);">DELETE</button>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
