package com.wlopezob.uxcomisaria.service;

import com.wlopezob.uxcomisaria.models.ComisariaResponse;
import reactor.core.publisher.Flux;

public interface ComisariaService {
    Flux<ComisariaResponse> getComisarias();
}
