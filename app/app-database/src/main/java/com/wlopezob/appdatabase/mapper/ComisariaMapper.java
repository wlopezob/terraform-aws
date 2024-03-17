package com.wlopezob.appdatabase.mapper;

import com.wlopezob.appdatabase.model.ComisariaResponse;
import com.wlopezob.appdatabase.model.entities.ComisariaEntity;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ComisariaMapper {

    ComisariaResponse toResponse(ComisariaEntity entity);
}