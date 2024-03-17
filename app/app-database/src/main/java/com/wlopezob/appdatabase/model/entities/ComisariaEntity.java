package com.wlopezob.appdatabase.model.entities;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "comisaria")
@Getter
@Setter
public class ComisariaEntity {

    @Id
    @Field("_id")
    private String id;

    @Field("id_dpto")
    private String idDpto;

    @Field("departamento")
    private String departamento;

    @Field("id_prov")
    private String idProv;

    @Field("provincia")
    private String provincia;

    @Field("id_dist")
    private String idDist;

    @Field("distrito")
    private String distrito;

    @Field("comisaria")
    private String comisaria;
}
