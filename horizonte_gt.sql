-- proyecto 1 fase 2 de laboratoria sistema de base de datos
-- adolfosonchiche
-- postgresql 
--   at:        2022-04-30 20:04:17 CST

--creando base de datos
CREATE DATABASE horizontesgt;

\c horizontesgt;

--creando entidades (tablas)
CREATE TABLE ALQUILA_PELICULA 
    (
        id_compra SERIAL NOT NULL , 
        precio DECIMAL (10,2) NOT NULL , 
        id_pelicula INTEGER NOT NULL , 
        id_boleto VARCHAR (40) NOT NULL,
        PRIMARY KEY (id_compra),
	    CHECK(precio >= 0) 
    )
;



CREATE TABLE AVION 
    (
        codigo_avion VARCHAR (40) NOT NULL , 
        tipo_avion VARCHAR (80) NOT NULL , 
        fecha_adquisicion DATE NOT NULL , 
        fecha_mantenimiento DATE NOT NULL , 
        estado VARCHAR (50) NOT NULL , 
        numero_tripulante INTEGER NOT NULL , 
        numero_asiento INTEGER NOT NULL , 
        fecha_primer_vuelo DATE NOT NULL ,
        PRIMARY KEY (codigo_avion) 
    )
;


CREATE TABLE BENEFICIO 
    (
        tipo_cuenta VARCHAR (35) NOT NULL , 
        milla_por_dolar DECIMAL (10,2) NOT NULL , 
        tiempo_cuenta VARCHAR (5) NOT NULL , 
        porcentaje_costo VARCHAR (5) , 
        pelicula VARCHAR (4) , 
        maleta_documentada VARCHAR (4) , 
        peso_documentada VARCHAR (6) , 
        maleta_mano VARCHAR (4) , 
        dimension VARCHAR (6),
        PRIMARY KEY (tipo_cuenta),
        CHECK(milla_por_dolar >= 0) 
    )
;

CREATE TABLE BOLETO 
    (
     id_boleto VARCHAR (40) NOT NULL , 
     asiento_asignado VARCHAR (12) NOT NULL , 
     aseguranza BOOLEAN , 
     es_ida_vuelta BOOLEAN , 
     total_pago DECIMAL (10,2) , 
     descuento DECIMAL (10,2) , 
     aumento DECIMAL (10,2) , 
     codigo_vuelo INTEGER NOT NULL,
     PRIMARY KEY (id_boleto),
     CHECK(total_pago >= 0), CHECK(descuento >= 0), CHECK(aumento >= 0) 
    )
;



CREATE TABLE BOLETO_PASAJERO 
    (
     id_boleto VARCHAR (40) NOT NULL , 
     identificacion VARCHAR (40) NOT NULL , 
     id_encuesta INTEGER , 
     codigo_compra VARCHAR (40) NOT NULL,
     PRIMARY KEY (id_boleto) 
    )
;


CREATE TABLE CLASE 
    (
     clase VARCHAR (50) NOT NULL , 
     tarifa_cambio VARCHAR (10) NOT NULL , 
     maleta_documentada VARCHAR (10) NOT NULL , 
     peso_md VARCHAR (10) NOT NULL , 
     maleta_mano VARCHAR (10) NOT NULL , 
     eleccion_asiento BOOLEAN NOT NULL , 
     aseguranza BOOLEAN , 
     porcentaje DECIMAL (10,2) ,
     id_precio INTEGER NOT NULL,
     PRIMARY KEY (clase, id_precio),
     CHECK(porcentaje >= 0) 
    )
;


CREATE TABLE CLASE_BOLETO 
    (
     es_nino BOOLEAN NOT NULL , 
     clase VARCHAR (50) NOT NULL , 
     id_boleto VARCHAR (40) NOT NULL , 
     id_precio INTEGER NOT NULL,
     PRIMARY KEY (clase, id_precio, id_boleto)
    )
;


CREATE TABLE COMPRA 
    (
     codigo_compra VARCHAR (40) NOT NULL , 
     identificacion VARCHAR (40) NOT NULL,
     fecha_compra DATE NOT NULL , 
     fecha_cancelacion DATE , 
     fecha_modificacion DATE ,
     PRIMARY KEY (codigo_compra) 
    )
;


CREATE TABLE COMPRA_MENU 
    (
     id_compra SERIAL NOT NULL , 
     precio DECIMAL (10,2) NOT NULL , 
     id_boleto VARCHAR (40) NOT NULL , 
     id_menu INTEGER NOT NULL,
     PRIMARY KEY (id_compra),
     CHECK(precio >= 0) 
    )
;


CREATE TABLE COMPRA_WFI 
    (
     id_compra SERIAL NOT NULL ,  
     precio DECIMAL (10,2) NOT NULL , 
     id_boleto VARCHAR (40) NOT NULL , 
     id_wifi INTEGER NOT NULL,
     PRIMARY KEY (id_compra),
     CHECK(precio >= 0) 
    )
;


CREATE TABLE COMPRADOR 
    (
     identificacion VARCHAR (40) NOT NULL , 
     nombre VARCHAR (50) NOT NULL , 
     telefono VARCHAR (15) NOT NULL , 
     correo VARCHAR (100) NOT NULL ,
     PRIMARY KEY (identificacion)
    )
;


CREATE TABLE CONTROL_VUELO 
    (
     id SERIAL NOT NULL , 
     estado VARCHAR (40) NOT NULL , 
     hora TIME NOT NULL , 
     codigo_vuelo INTEGER NOT NULL,
     PRIMARY KEY (id, codigo_vuelo) 
    )
;


CREATE TABLE DIA 
    (
     id SERIAL NOT NULL , 
     dia VARCHAR (15) NOT NULL,
     PRIMARY KEY (id) 
    )
;


CREATE TABLE DIA_VUELO 
    (
     id_plan_vuelo VARCHAR (40) NOT NULL , 
     id INTEGER NOT NULL,
     PRIMARY KEY (id_plan_vuelo, id) 
    )
;


CREATE TABLE DISTRIBUCION_ASIENTO 
    (
     id_distribucion SERIAL NOT NULL , 
     total_asiento INTEGER NOT NULL , 
     clase VARCHAR (50) NOT NULL , 
     fila VARCHAR (10) NOT NULL , 
     asiento_fila VARCHAR (10) NOT NULL ,
     codigo_avion VARCHAR (40) NOT NULL ,
     PRIMARY KEY (id_distribucion)
    )
;


CREATE TABLE EMPLEADO 
    (
     codigo_empleado VARCHAR (40) NOT NULL , 
     nombre VARCHAR (60) NOT NULL , 
     birthday DATE NOT NULL , 
     telefono VARCHAR (15) NOT NULL , 
     correo VARCHAR (100) NOT NULL , 
     anio_experiencia VARCHAR (10) NOT NULL , 
     fecha_inicio DATE NOT NULL ,
     estado BOOLEAN,
     PRIMARY KEY (codigo_empleado)
    )
;

CREATE TABLE ENCUESTA_SERVICIO 
    (
     id_encuesta SERIAL NOT NULL , 
     vuelo_general INTEGER NOT NULL , 
     servicio_tripulante INTEGER NOT NULL , 
     comida INTEGER NOT NULL , 
     nota_adicional TEXT ,
     PRIMARY KEY (id_encuesta)
    )
;


CREATE TABLE HORARIO_EMPLEADO 
    (
     id SERIAL NOT NULL , 
     jornada VARCHAR (20) NOT NULL , 
     fecha DATE NOT NULL , 
     hora_inicio TIME NOT NULL , 
     hora_termino TIME NOT NULL , 
     saldo DECIMAL (10,2) NOT NULL , 
     comision DECIMAL (10,2) , 
     codigo_empleado VARCHAR (40) NOT NULL,
     PRIMARY KEY (id),
     CHECK(saldo >= 0), CHECK(comision >= 0) 
    )
;


CREATE TABLE IDENTIFICACION 
    (
     identificacion VARCHAR (40) NOT NULL , 
     tipo VARCHAR (50) , 
     usuario VARCHAR (40) NOT NULL ,
     PRIMARY KEY (identificacion)
    )
;


CREATE TABLE LISTA_INGREDIENTE 
    (
     ingrediente VARCHAR (100) NOT NULL , 
     descripcion VARCHAR (100) NOT NULL , 
     id_menu INTEGER NOT NULL ,
     PRIMARY KEY (ingrediente, id_menu)
    )
;


CREATE TABLE LISTA_VACUNA 
    (
     vacuna VARCHAR (100) NOT NULL , 
     certificado_veterinario VARCHAR (50) NOT NULL , 
     nombre VARCHAR (40) NOT NULL ,
     PRIMARY KEY (nombre, certificado_veterinario)
    )
;


CREATE TABLE MALETA 
    (
     id_maleta SERIAL NOT NULL , 
     dimension VARCHAR (15) NOT NULL , 
     peso VARCHAR (15) NOT NULL , 
     tipo VARCHAR (30) NOT NULL , 
     precio DECIMAL (10,2) NOT NULL , 
     categoria VARCHAR (50) NOT NULL,
     PRIMARY KEY (id_maleta),
     CHECK(precio >= 0) 
    )
;


CREATE TABLE MALETA_HISTORIAL 
    (
     id SERIAL NOT NULL , 
     peso VARCHAR (10) NOT NULL , 
     tipo VARCHAR (25) NOT NULL , 
     precio DECIMAL (10,2) NOT NULL , 
     id_boleto VARCHAR (40) NOT NULL , 
     dimension VARCHAR (15) , 
     categoria_numero VARCHAR (50) , 
     id_maleta INTEGER NOT NULL,
     PRIMARY KEY (id),
     CHECK(precio >= 0) 
    )
;


CREATE TABLE MASCOTA 
    (
     nombre VARCHAR (40) NOT NULL , 
     certificado_veterinario VARCHAR (50) NOT NULL , 
     especie VARCHAR (70) NOT NULL , 
     descripcion VARCHAR (100), 
     peso VARCHAR (25) NOT NULL , 
     tipo VARCHAR (20) , 
     jaula VARCHAR (25) , 
     id_boleto VARCHAR (40) NOT NULL ,
     PRIMARY KEY (certificado_veterinario, nombre)
    )
;


CREATE TABLE MENU 
    (
     id_menu SERIAL NOT NULL , 
     nombre VARCHAR (100) NOT NULL , 
     tipo VARCHAR (25) NOT NULL , 
     descripcion VARCHAR (100), 
     precio DECIMAL (10,2) NOT NULL , 
     existencia INTEGER NOT NULL , 
     costo DECIMAL (10,2) NOT NULL , 
     categoria VARCHAR (20) , 
     tiempo_ofrece TIME,
     PRIMARY KEY (id_menu),
     CHECK(precio >= 0), CHECK(costo >= 0) 
    )
;

CREATE TABLE METODO_PAGO 
    (
     id_pago SERIAL NOT NULL , 
     metodo_pago VARCHAR (50) NOT NULL,
     PRIMARY KEY (id_pago)
    )
;


CREATE TABLE MILLA_HISTORICO 
    (
     id SERIAL NOT NULL , 
     numero_vuelos INTEGER NOT NULL , 
     milla_recorrido DECIMAL (10,2) NOT NULL , 
     usuario VARCHAR (40) NOT NULL,
     PRIMARY KEY (id, usuario),
     CHECK(milla_recorrido >= 0) 
    )
;


CREATE TABLE PAGO_COMPRADOR 
    (
     descripcion VARCHAR (100) , 
     id_pago INTEGER NOT NULL , 
     codigo_compra VARCHAR (40) NOT NULL ,
     PRIMARY KEY (id_pago, codigo_compra)
    )
;


CREATE TABLE PAGO_MENU 
    (
     descripcion VARCHAR (100) , 
     id_pago INTEGER NOT NULL , 
     id_compra INTEGER NOT NULL ,
     PRIMARY KEY (id_pago, id_compra)
    )
;


CREATE TABLE PAGO_PELICULA 
    (
     descripcion VARCHAR (100) , 
     id_pago INTEGER NOT NULL , 
     id_compra INTEGER NOT NULL ,
     PRIMARY KEY (id_pago, id_compra)
    )
;


CREATE TABLE PAGO_USUARIO 
    (
     usuario VARCHAR (40) NOT NULL , 
     id_pago INTEGER NOT NULL , 
     descripcion VARCHAR (100) ,
     PRIMARY KEY (usuario, id_pago)
    )
;


CREATE TABLE PAGO_WIFI 
    (
     descripcion VARCHAR (100) , 
     id_pago INTEGER NOT NULL , 
     id_compra INTEGER NOT NULL,
     PRIMARY KEY (id_pago, id_compra) 
    )
;


CREATE TABLE PASAJERO 
    (
     identificacion VARCHAR (40) NOT NULL , 
     nombre VARCHAR (50) NOT NULL , 
     birthday DATE NOT NULL , 
     nacionalidad VARCHAR (50) NOT NULL , 
     genero VARCHAR (30) NOT NULL , 
     telefono VARCHAR (15) NOT NULL , 
     correo VARCHAR (100) ,
     PRIMARY KEY (identificacion)
    )
;


CREATE TABLE PELICULA 
    (
     id_pelicula SERIAL NOT NULL , 
     nombre VARCHAR (90) NOT NULL , 
     descripcion VARCHAR (100), 
     categoria VARCHAR (80) NOT NULL , 
     clasificacion VARCHAR (50) NOT NULL , 
     actores TEXT [] , 
     precio DECIMAL (10,2) NOT NULL , 
     duracion TIME NOT NULL , 
     costo DECIMAL (10,2) ,
     PRIMARY KEY (id_pelicula)
    )
;


CREATE TABLE PERSONAL_ABORDO 
    (
     id SERIAL NOT NULL , 
     puesto VARCHAR (20) NOT NULL , 
     comision DECIMAL (10,2) NOT NULL , 
     codigo_vuelo INTEGER NOT NULL , 
     codigo_empleado VARCHAR (40) NOT NULL,
     PRIMARY KEY (id),
     CHECK(comision >= 0) 
    )
;


CREATE TABLE PLAN_VUELO 
    (
     id_plan_vuelo VARCHAR (40) NOT NULL , 
     distancia_milla DECIMAL (10,2) NOT NULL , 
     hora_llegada TIME NOT NULL , 
     hora_salida TIME NOT NULL , 
     puerta_salida VARCHAR (80) NOT NULL , 
     puerta_llegada VARCHAR (80) NOT NULL , 
     aeropuerto_salida VARCHAR (100) NOT NULL , 
     aeropuerto_llegada VARCHAR (100) NOT NULL , 
     codigo_avion VARCHAR (40) NOT NULL , 
     es_temporal BOOLEAN,
     PRIMARY KEY (id_plan_vuelo),
     CHECK(distancia_milla >= 0) 
    )
;

CREATE TABLE PRECIO 
    (  
     id_precio SERIAL NOT NULL ,
     precio   DECIMAL (10, 2) NOT NULL,
     descuento DECIMAL (10,2) , 
     aumento DECIMAL (10,2) , 
     descripcion VARCHAR (100),
     PRIMARY KEY (id_precio),
     CHECK(descuento >= 0), CHECK(aumento >= 0) 
    )
;


CREATE TABLE SUPERVISOR 
    (
     id_boleto VARCHAR (40) NOT NULL , 
     id INTEGER NOT NULL ,
     PRIMARY KEY (id, id_boleto)
    )
;


CREATE TABLE USUARIO 
    (
     usuario VARCHAR (40) NOT NULL , 
     nombre VARCHAR (50) NOT NULL , 
     contrasena VARCHAR (40) NOT NULL , 
     birthday DATE NOT NULL , 
     correo VARCHAR (100) NOT NULL , 
     genero VARCHAR (10) NOT NULL , 
     telefono VARCHAR (15) NOT NULL , 
     fecha_creacion DATE NOT NULL , 
     millas INTEGER , 
     tipo_cuenta VARCHAR (35) NOT NULL ,
     PRIMARY KEY (usuario)
    )
;


CREATE TABLE VUELO 
    (
     codigo_vuelo SERIAL NOT NULL , 
     boletos_vendido INTEGER , 
     estado_vuelo VARCHAR (30) NOT NULL , 
     id_dia INTEGER NOT NULL , 
     fecha DATE NOT NULL , 
     id_plan_vuelo VARCHAR (40) NOT NULL ,
     PRIMARY KEY (codigo_vuelo)
    )
;


CREATE TABLE VUELO_TEMPORAL 
    (
     id_temporal VARCHAR (40) NOT NULL , 
     fecha_inicio DATE NOT NULL , 
     fecha_final DATE NOT NULL , 
     estado BOOLEAN NOT NULL , 
     id_plan_vuelo VARCHAR (40) NOT NULL ,
     PRIMARY KEY (id_temporal)
    )
;


CREATE TABLE WIFI 
    (
     id_wifi SERIAL NOT NULL , 
     nombre VARCHAR (20) NOT NULL , 
     contrasena VARCHAR (25) NOT NULL , 
     precio DECIMAL (10,2) NOT NULL ,
     PRIMARY KEY (id_wifi)
    )
;


--creando containers

ALTER TABLE ALQUILA_PELICULA 
    ADD CONSTRAINT BOLETO_PASAJERO_FK FOREIGN KEY
    ( 
     id_boleto
    ) 
    REFERENCES BOLETO_PASAJERO 
    ( 
     id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE ALQUILA_PELICULA 
    ADD CONSTRAINT PELICULA_FK FOREIGN KEY
    ( 
     id_pelicula
    ) 
    REFERENCES PELICULA 
    ( 
     id_pelicula
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE DISTRIBUCION_ASIENTO 
    ADD CONSTRAINT AVION_DISTRIBUCION_ASIENTO_FK FOREIGN KEY
    ( 
     codigo_avion
    ) 
    REFERENCES AVION 
    ( 
     codigo_avion
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE BOLETO_PASAJERO 
    ADD CONSTRAINT FK FOREIGN KEY
    ( 
     id_boleto
    ) 
    REFERENCES BOLETO 
    ( 
     id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE BOLETO_PASAJERO 
    ADD CONSTRAINT BOLETO_PASAJERO_COMPRA_FK FOREIGN KEY
    ( 
     codigo_compra
    ) 
    REFERENCES COMPRA 
    ( 
     codigo_compra
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE BOLETO_PASAJERO 
    ADD CONSTRAINT BOLETO_PASAJERO_ENCUESTA_SERVICIO_FK FOREIGN KEY
    ( 
     id_encuesta
    ) 
    REFERENCES ENCUESTA_SERVICIO 
    ( 
     id_encuesta
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE BOLETO_PASAJERO 
    ADD CONSTRAINT BOLETO_PASAJERO_PASAJERO_FK FOREIGN KEY
    ( 
     identificacion
    ) 
    REFERENCES PASAJERO 
    ( 
     identificacion
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE BOLETO 
    ADD CONSTRAINT BOLETO_VUELO_FK FOREIGN KEY
    ( 
     codigo_vuelo
    ) 
    REFERENCES VUELO 
    ( 
     codigo_vuelo
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE CLASE_BOLETO 
    ADD CONSTRAINT CLASE_BOLETO_BOLETO_FK FOREIGN KEY
    ( 
     id_boleto
    ) 
    REFERENCES BOLETO 
    ( 
     id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE CLASE_BOLETO 
    ADD CONSTRAINT CLASE_BOLETO_CLASE_FK FOREIGN KEY
    ( 
     clase,
     id_precio
    ) 
    REFERENCES CLASE 
    ( 
     clase,
     id_precio
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE CLASE 
    ADD CONSTRAINT CLASE_PRECIO_FK FOREIGN KEY
    ( 
     id_precio
    ) 
    REFERENCES PRECIO 
    ( 
     id_precio
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE COMPRA 
    ADD CONSTRAINT COMPRA_COMPRADOR_FK FOREIGN KEY
    ( 
     identificacion
    ) 
    REFERENCES COMPRADOR 
    ( 
     identificacion
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE COMPRA_MENU 
    ADD CONSTRAINT COMPRA_MENU_BOLETO_PASAJERO_FK FOREIGN KEY
    ( 
     id_boleto
    ) 
    REFERENCES BOLETO_PASAJERO 
    ( 
     id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE COMPRA_MENU 
    ADD CONSTRAINT COMPRA_MENU_MENU_FK FOREIGN KEY
    ( 
     id_menu
    ) 
    REFERENCES MENU 
    ( 
     id_menu
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE COMPRA_WFI 
    ADD CONSTRAINT BOLETO_PASAJERO_FK FOREIGN KEY
    ( 
     id_boleto
    ) 
    REFERENCES BOLETO_PASAJERO 
    ( 
     id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE COMPRA_WFI 
    ADD CONSTRAINT WIFI_FK FOREIGN KEY
    ( 
     id_wifi
    ) 
    REFERENCES WIFI 
    ( 
     id_wifi
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE CONTROL_VUELO 
    ADD CONSTRAINT CONTROL_VUELO_VUELO_FK FOREIGN KEY
    ( 
     codigo_vuelo
    ) 
    REFERENCES VUELO 
    ( 
     codigo_vuelo
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE DIA_VUELO 
    ADD CONSTRAINT DIA_VUELO_DIA_FK FOREIGN KEY
    ( 
     id
    ) 
    REFERENCES DIA 
    ( 
     id
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE DIA_VUELO 
    ADD CONSTRAINT DIA_VUELO_FK FOREIGN KEY
    ( 
     id_plan_vuelo
    ) 
    REFERENCES PLAN_VUELO 
    ( 
     id_plan_vuelo
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE HORARIO_EMPLEADO 
    ADD CONSTRAINT HORARIO_EMPLEADO_EMPLEADO_FK FOREIGN KEY
    ( 
     codigo_empleado
    ) 
    REFERENCES EMPLEADO 
    ( 
     codigo_empleado
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE IDENTIFICACION 
    ADD CONSTRAINT IDENTIFICACION_FK FOREIGN KEY
    ( 
     usuario
    ) 
    REFERENCES USUARIO 
    ( 
     usuario
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE LISTA_INGREDIENTE 
    ADD CONSTRAINT LISTA_INGREDIENTE_MENU_FK FOREIGN KEY
    ( 
     id_menu
    ) 
    REFERENCES MENU 
    ( 
     id_menu
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE LISTA_VACUNA 
    ADD CONSTRAINT LISTA_VACUNA_MASCOTA_FK FOREIGN KEY
    ( 
     certificado_veterinario,
     nombre
    ) 
    REFERENCES MASCOTA 
    ( 
     certificado_veterinario,
     nombre
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE MALETA_HISTORIAL 
    ADD CONSTRAINT MALETA_HISTORIAL_BOLETO_PASAJERO_FK FOREIGN KEY
    ( 
     id_boleto
    ) 
    REFERENCES BOLETO_PASAJERO 
    ( 
     id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE MALETA_HISTORIAL 
    ADD CONSTRAINT MALETA_HISTORIAL_MALETA_FK FOREIGN KEY
    ( 
     id_maleta
    ) 
    REFERENCES MALETA 
    ( 
     id_maleta
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE MASCOTA 
    ADD CONSTRAINT MASCOTA_BOLETO_PASAJERO_FK FOREIGN KEY
    ( 
     id_boleto
    ) 
    REFERENCES BOLETO_PASAJERO 
    ( 
     id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE MILLA_HISTORICO 
    ADD CONSTRAINT MILLA_HISTORICO_FK FOREIGN KEY
    ( 
     usuario
    ) 
    REFERENCES USUARIO 
    ( 
     usuario
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE PAGO_COMPRADOR 
    ADD CONSTRAINT PAGO_COMPRADOR_COMPRA_FK FOREIGN KEY
    ( 
     codigo_compra
    ) 
    REFERENCES COMPRA 
    ( 
     codigo_compra
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE PAGO_COMPRADOR 
    ADD CONSTRAINT PAGO_COMPRADOR_FK FOREIGN KEY
    ( 
     id_pago
    ) 
    REFERENCES METODO_PAGO 
    ( 
     id_pago
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE PAGO_MENU 
    ADD CONSTRAINT PAGO_MENU_COMPRA_MENU_FK FOREIGN KEY
    ( 
     id_compra
    ) 
    REFERENCES COMPRA_MENU 
    ( 
     id_compra
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE PAGO_MENU 
    ADD CONSTRAINT PAGO_MENU_FK FOREIGN KEY
    ( 
     id_pago
    ) 
    REFERENCES METODO_PAGO 
    ( 
     id_pago
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE PAGO_PELICULA 
    ADD CONSTRAINT PAGO_PELICULA_FK FOREIGN KEY
    ( 
     id_compra
    ) 
    REFERENCES ALQUILA_PELICULA 
    ( 
     id_compra
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE PAGO_PELICULA 
    ADD CONSTRAINT PAGO_PELICULA_METODO_FK FOREIGN KEY
    ( 
     id_pago
    ) 
    REFERENCES METODO_PAGO 
    ( 
     id_pago
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE PAGO_USUARIO 
    ADD CONSTRAINT PAGO_FK FOREIGN KEY
    ( 
     id_pago
    ) 
    REFERENCES METODO_PAGO 
    ( 
     id_pago
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE PAGO_USUARIO 
    ADD CONSTRAINT PAGO_USUARIO_FK FOREIGN KEY
    ( 
     usuario
    ) 
    REFERENCES USUARIO 
    ( 
     usuario
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE PAGO_WIFI 
    ADD CONSTRAINT PAGO_WIFI_FK FOREIGN KEY
    ( 
     id_compra
    ) 
    REFERENCES COMPRA_WFI 
    ( 
     id_compra
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE PAGO_WIFI 
    ADD CONSTRAINT PAGO_WIFI_METODO_FK FOREIGN KEY
    ( 
     id_pago
    ) 
    REFERENCES METODO_PAGO 
    ( 
     id_pago
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE PERSONAL_ABORDO 
    ADD CONSTRAINT EMPLEADO_FK FOREIGN KEY
    ( 
     codigo_empleado
    ) 
    REFERENCES EMPLEADO 
    ( 
     codigo_empleado
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE PERSONAL_ABORDO 
    ADD CONSTRAINT VUELO_FK FOREIGN KEY
    ( 
     codigo_vuelo
    ) 
    REFERENCES VUELO 
    ( 
     codigo_vuelo
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE PLAN_VUELO 
    ADD CONSTRAINT AVION_FK FOREIGN KEY
    ( 
     codigo_avion
    ) 
    REFERENCES AVION 
    ( 
     codigo_avion
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE SUPERVISOR 
    ADD CONSTRAINT SUPERVISOR_BOLETO_PASAJERO_FK FOREIGN KEY
    ( 
     id_boleto
    ) 
    REFERENCES BOLETO_PASAJERO 
    ( 
     id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE SUPERVISOR 
    ADD CONSTRAINT SUPERVISOR_FK FOREIGN KEY
    ( 
     id
    ) 
    REFERENCES PERSONAL_ABORDO 
    ( 
     id
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE USUARIO 
    ADD CONSTRAINT FK FOREIGN KEY
    ( 
     tipo_cuenta
    ) 
    REFERENCES BENEFICIO 
    ( 
     tipo_cuenta
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE VUELO 
    ADD CONSTRAINT VUELO_FK FOREIGN KEY
    ( 
     id_plan_vuelo
    ) 
    REFERENCES PLAN_VUELO 
    ( 
     id_plan_vuelo
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;

ALTER TABLE VUELO_TEMPORAL 
    ADD CONSTRAINT VUELO_TEMPORAL_FK FOREIGN KEY
    ( 
     id_plan_vuelo
    ) 
    REFERENCES PLAN_VUELO 
    ( 
     id_plan_vuelo
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION 
;


-- 
-- CREATE TABLE                            42
-- ALTER TABLE                             87
