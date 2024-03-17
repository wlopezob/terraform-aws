package com.wlopezob.appdatabase.controllers;


import com.wlopezob.appdatabase.models.ComisariaResponse;
import com.wlopezob.appdatabase.service.ComisariaService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

@RestController
@RequestMapping("/comisaria")
@RequiredArgsConstructor
public class ComisariaController {
    private final ComisariaService service;


    @GetMapping
    public Flux<ComisariaResponse> getAllComisarias() {
        return service.getAllComisarias();
    }
}
