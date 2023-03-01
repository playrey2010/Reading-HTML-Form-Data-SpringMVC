<%--
  Created by IntelliJ IDEA.
  User: Rey
  Date: 2/28/2023
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Confirmation Page</title>
</head>
<body>
<p>New student registered: ${student.lastName}, ${student.firstName} from ${student.country}.</p>
<p>Favorite programming language: ${student.favoriteLanguage}</p>
<p>Operating Systems:</p>
<ul>
    <c:forEach var="temp" items="${student.operatingSystems}">
        <li> ${temp}</li>
    </c:forEach>
</ul>
</body>
</html>
