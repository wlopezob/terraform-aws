package com.wlopezob.appdatabase.mapper;

import com.wlopezob.appdatabase.models.ComisariaResponse;
import com.wlopezob.appdatabase.models.entities.ComisariaEntity;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ComisariaMapper {

    ComisariaResponse toResponse(ComisariaEntity entity);
}