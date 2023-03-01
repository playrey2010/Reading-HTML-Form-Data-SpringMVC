# Basic-Spring-MVC
Spring MVC Demo based on Maven Web application archetype. <br>

Added new home controller to showcase how to retrieve information from an HTML form page.

New controller contains two methods: one displays the form, the other reveals (and processes) the form data.
### HelloWorldController (now replaced by StudentController.java)

```
package com.example;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloWorldController {
    // Controller method to show initial form
    @RequestMapping("/showForm")
    public String showForm() {
        return "helloworld-form";
    }
    // Controller method to process the HTML Form
    @RequestMapping("/processForm")
    public String processForm() {
        return "helloworld";
    }
}

```
### helloworld-form.jsp (replaced by student-form.jsp)
The name attribute in the HTML form tag determines the parameter name used in jsp expression language in the helloworld.jsp file.

```
<form action="processForm" method="get">
  <input type="text" name="studentName" placeholder="What's your name?">
  <input type="submit">
</form>
```

### helloworld.jsp (replaced by student-confirmation.jsp)
Access html data via dot notation (param)
```
Student name: ${param.studentName}
```

### student-form.jsp
Using Spring MVC Form Tags to create a form. 
```
  <form:form action="processForm" modelAttribute="student">
    First Name: <form:input path="firstName"/>
    <br>
    <br>
    Last Name: <form:input path="lastName"/>


    <br>
    <br>
    <form:select path="country">
      <form:options items="${countryOptions}"/>

    </form:select>
    <br>
    <br>

    Favorite Language:

    Java <form:radiobutton path="favoriteLanguage" value="Java"/>
    C# <form:radiobutton path="favoriteLanguage" value="C#"/>
    PHP <form:radiobutton path="favoriteLanguage" value="PHP"/>
    Ruby <form:radiobutton path="favoriteLanguage" value="Ruby"/>

    <br>
    <br>
    Operating Systems: <br>
    Linux <form:checkbox path="operatingSystems" value="Linux"/>
    Windows <form:checkbox path="operatingSystems" value="Windows"/>
    MacOS <form:checkbox path="operatingSystems" value="MacOS"/>

    <input type="submit" value="Submit">
  </form:form>
```

### student-confirmation.jsp
Display object properties using jsp expression language. 
```
<p>New student registered: ${student.lastName}, ${student.firstName} from ${student.country}.</p>
<p>Favorite programming language: ${student.favoriteLanguage}</p>
<p>Operating Systems:</p>
```
### Looping through arrays

```
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
...
<ul>
    <c:forEach var="temp" items="${student.operatingSystems}">
        <li> ${temp}</li>
    </c:forEach>
</ul>

```

### countries.properties & StudentController

```
BR=Brazil
FR=France
CO=Colombia
IN=India
---------------------------------------------------
    @Value("#{countryOptions}")
    private Map<String, String> countryOptions;

```

# Spring Validation
This customer class uses Spring validation to prohibit empty entries on the customer form page. 
### Customer.java
```
    @NotNull
    @Size(min = 1, message = "is required")
    private String lastName;
```

### CustomerController.java
Here we check for validation errors and return the message "is required" set in the validation message. 
```
    @RequestMapping("/processForm")
    public String processForm(@Valid @ModelAttribute("customer") Customer customer, BindingResult result) {
        System.out.println("Last Name: |" + customer.getLastName() + "|");
        if (result.hasErrors()){
            return "customer-form";
        } else {
            return "customer-confirmation";
        }
    }
```

Problem to address: Current validation allows for entries with only spaces
Problem addressed: Added @InitBinder method to trim all Strings starting and trailing whitespaces, and also trim down to null if String only contains whitespace. 

### CustomerController.java

```
    // add an initBinder ... to convert trim input strings
    // remove leading and trailing whitespace
    // resolve issue for our validation
    @InitBinder
    public void initBinder(WebDataBinder dataBinder){
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

```