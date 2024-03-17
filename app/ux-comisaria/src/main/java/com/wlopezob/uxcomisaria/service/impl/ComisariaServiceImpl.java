package com.wlopezob.uxcomisaria.service.impl;

import com.wlopezob.uxcomisaria.config.ApplicationProperties;
import com.wlopezob.uxcomisaria.models.ComisariaResponse;
import com.wlopezob.uxcomisaria.service.ComisariaService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Flux;


@Service
@Slf4j
@RequiredArgsConstructor

public class ComisariaServiceImpl implements ComisariaService {
    private final ApplicationProperties applicationProperties;
    private final WebClient webClient;

    @Override
    public Flux<ComisariaResponse> getComisarias() {
        return webClient.get()
                .uri(applicationProperties.getUrl()+ "/comisaria")
                .retrieve()
                .bodyToFlux(ComisariaResponse.class);
    }
}
