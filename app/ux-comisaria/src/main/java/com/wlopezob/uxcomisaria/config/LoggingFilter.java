package com.wlopezob.uxcomisaria.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.web.reactive.function.client.ClientRequest;
import org.springframework.web.reactive.function.client.ClientResponse;
import org.springframework.web.reactive.function.client.ExchangeFilterFunction;
import org.springframework.web.reactive.function.client.ExchangeFunction;
import reactor.core.publisher.Mono;

@Slf4j
public class LoggingFilter implements ExchangeFilterFunction {

    @Override
    public Mono<ClientResponse> filter(ClientRequest request, ExchangeFunction next) {
        log.info("Request: " + request.method() + " " + request.url());
        log.info("Headers: " + request.headers());

        return next.exchange(request)
                .doOnNext(response -> {
                    HttpHeaders headers = response.headers().asHttpHeaders();
                    log.info("Response: " + response.statusCode());
                    log.info("Headers: " + headers);
                });
    }
}
