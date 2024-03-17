package com.wlopezob.appdatabase.repository;

import com.wlopezob.appdatabase.model.entities.ComisariaEntity;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;

public interface ComisariaRepository extends ReactiveMongoRepository<ComisariaEntity, String> {
}