package com.example;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/HelloWorldController")
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


    // new method to manipulate data by using the model.
    @RequestMapping("/processFormWithModel")
    public String processWithModel(HttpServletRequest request, Model model) {
        // read the request param from the HTML form
        String name = request.getParameter("studentName");
        // modify data just for testing
        name = name.toUpperCase();
        // create the message
        String message = "Yo! " + name;
        // add message to the model
        model.addAttribute("message", message);

        return "helloworld";
    }

    // Another method: using RequestParam to bind data into method
    @RequestMapping("/processWithRequestParam")
    public String processWithRequestParam(@RequestParam("studentName") String studentName, Model model){
        studentName = studentName.toUpperCase();
        String message = "Yo! " + studentName;
        model.addAttribute("message", message);
        return "helloworld";
    }
}
