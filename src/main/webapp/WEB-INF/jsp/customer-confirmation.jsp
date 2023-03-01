<%--
  Created by IntelliJ IDEA.
  User: Rey
  Date: 3/1/2023
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Confirmation Page</title>
</head>
<body>
<h2>New customer registered: ${customer.firstName} ${customer.lastName}</h2>
<h3>Number of free passes: ${customer.freePasses}</h3>
<h3>Postal Code: ${customer.postalCode}</h3>

</body>
</html>
