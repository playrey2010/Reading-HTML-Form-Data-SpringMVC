<%--
  Created by IntelliJ IDEA.
  User: Rey
  Date: 3/1/2023
  Time: 11:42 AM
  To change this template use File | Settings | File Templates.
--%>

<%--Add support for Spring Form tags--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Registration Form</title>
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <form:form action="processForm" modelAttribute="customer">
        First Name: <form:input path="firstName"/><br>
        Last Name (*): <form:input path="lastName"/>
        <form:errors path="lastName" cssClass="error"/><br>
        Free passes: <form:input path="freePasses"/>
        <form:errors path="freePasses" cssClass="error"/><br>
        Postal Code: <form:input path="postalCode"/>
        <form:errors path="postalCode" cssClass="error"/>
        <br><br>
        <input type="submit" value="Register">
    </form:form>


</body>
</html>
