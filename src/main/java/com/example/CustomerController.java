package com.example;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @RequestMapping("/showForm")
    public String showForm(Model model) {
        model.addAttribute("customer", new Customer());

        return "customer-form";
    }

    @RequestMapping("/processForm")
    public String processForm(@Valid @ModelAttribute("customer") Customer customer, BindingResult result) {
        System.out.println("Last Name: |" + customer.getLastName() + "|");
        if (result.hasErrors()){
            return "customer-form";
        } else {
            return "customer-confirmation";
        }
    }
}
