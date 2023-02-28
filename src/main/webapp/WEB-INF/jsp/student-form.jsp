<%--
  Created by IntelliJ IDEA.
  User: Rey
  Date: 2/28/2023
  Time: 10:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%--Add support for Spring Form tags--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Form</title>
</head>
<body>
  Model attribute must match the model attribute name.
  <form:form action="processForm" modelAttribute="student">
    First Name: <form:input path="firstName"/>
    <br>
    <br>
    Last Name: <form:input path="lastName"/>

    <br>
    <br>
    <input type="submit" value="Submit">
  </form:form>

</form>
</body>
</html>
