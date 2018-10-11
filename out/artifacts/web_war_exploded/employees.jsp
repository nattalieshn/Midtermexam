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
    function confirmDelete(emp_no) {
        if (confirm('You are about to delete this employee information. Are you sure?')) {
            window.location = "product-controller?cmd=d&emp_no="+emp_no;
        }
    }
</script>
<head>
    <title>Employees</title>
</head>
<body>
<h1>Employee List</h1>
<a href="employees-create.jsp">Create new employee</a>


<sql:query dataSource="jdbc/employees" var="result">
    SELECT * FROM employees
    WHERE employees.emp_no = employees.emp_no
</sql:query>

<table border="1" style="margin-top: 20px">
    <tr>
        <th>Employee No.</th>
        <th>Birth Date</th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Gender</th>
        <th>Hire Date</th>
        <th>Update-Delete</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.emp_no}"/></td>
            <td><c:out value="${row.birth_date}"/></td>
            <td><c:out value="${row.first_name}"/></td>
            <td><c:out value="${row.last_name}"/></td>
            <td><c:out value="${row.gender}"/></td>
            <td><c:out value="${row.hire_date}"/></td>
            <td>
                <button onclick="window.location='employees-update.jsp?emp_no=<c:out value="${row.emp_no}"/>';">UPDATE</button>
                <button onclick="confirmDelete(<c:out value="${row.emp_no}"/>);">DELETE</button>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
