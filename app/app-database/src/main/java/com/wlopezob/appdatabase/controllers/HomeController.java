package com.wlopezob.appdatabase.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("/home")
public class HomeController {


    @GetMapping
    public String home() {
        log.info("Executing home controller");
        return "Hello from Spring Boot";
    }
}
