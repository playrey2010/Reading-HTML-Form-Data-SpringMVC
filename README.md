# Basic-Spring-MVC
Spring MVC Demo based on Maven Web application archetype. <br>

Added new home controller to showcase how to retrieve information from an HTML form page.

New controller contains two methods: one displays the form, the other reveals (and processes) the form data.
### HelloWorldController

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
### helloworld-form.jsp
The name attribute in the HTML form tag determines the parameter name used in jsp expression language in the helloworld.jsp file.

```
<form action="processForm" method="get">
  <input type="text" name="studentName" placeholder="What's your name?">
  <input type="submit">
</form>
```

### helloworld.jsp
Access html data via dot notation (param)
```
Student name: ${param.studentName}
```