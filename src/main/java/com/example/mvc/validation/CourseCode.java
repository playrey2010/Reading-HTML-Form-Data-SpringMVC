package com.example.mvc.validation;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = CourseCodeConstraintValidator.class)
// Specify where you can apply the custom annotation
@Target( {ElementType.METHOD, ElementType.FIELD})
// how long will it be used (here: retain this annotation in the byte code and use it at runtime by the jvm)
@Retention(RetentionPolicy.RUNTIME)
public @interface CourseCode {

    // Define default course code
    public String value() default "LUV";
    // Define default error message
    public String message() default "must start with LUV";
    // Define default groups
    public Class<?>[] groups() default {};
    // Define default payloads
    public Class<? extends Payload>[] payload() default  {};
}
