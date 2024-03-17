package com.wlopezob.appdatabase.service.impl;

import com.wlopezob.appdatabase.mapper.ComisariaMapper;
import com.wlopezob.appdatabase.models.ComisariaResponse;
import com.wlopezob.appdatabase.repository.ComisariaRepository;
import com.wlopezob.appdatabase.service.ComisariaService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;

@Service
@RequiredArgsConstructor
public class ComisariaServiceImpl implements ComisariaService {


    private final ComisariaRepository repository;
    private final ComisariaMapper mapper;

    @Override
    public Flux<ComisariaResponse> getAllComisarias() {
        return repository.findAll()
                .map(mapper::toResponse);
    }
}
