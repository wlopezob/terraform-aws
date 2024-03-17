package com.wlopezob.appdatabase.service;

import com.wlopezob.appdatabase.models.ComisariaResponse;
import reactor.core.publisher.Flux;

public interface ComisariaService {

    public Flux<ComisariaResponse> getAllComisarias();
}
