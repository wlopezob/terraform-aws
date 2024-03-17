package com.wlopezob.uxcomisaria.controllers;

import com.wlopezob.uxcomisaria.models.ComisariaResponse;
import com.wlopezob.uxcomisaria.service.ComisariaService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

@RestController
@RequestMapping("/comisaria")
@RequiredArgsConstructor
public class ComisariaController {

    private final ComisariaService comisariaService;
    @GetMapping
    public Flux<ComisariaResponse> getComisarias() {
        return comisariaService.getComisarias();
    }
}
