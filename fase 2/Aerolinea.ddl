-- Generated by Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   at:        2022-04-30 19:33:35 CST
--   site:      DB2/UDB 9
--   type:      DB2/UDB 9



CREATE TABLE ALQUILA_PELICULA 
    (
     id_compra INTEGER NOT NULL , 
     precio DECIMAL (10,2) NOT NULL , 
     PELICULA_id_pelicula INTEGER NOT NULL , 
     BOLETO_PASAJERO_BOLETO_id_boleto VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE ALQUILA_PELICULA ADD CONSTRAINT ALQUILA_PELICULA_PK PRIMARY KEY (id_compra)
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
     DISTRIBUCION_ASIENTO_id_distribucion INTEGER NOT NULL 
    )
;

ALTER TABLE AVION ADD CONSTRAINT AVION_PK PRIMARY KEY (codigo_avion)
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
     dimension VARCHAR (6) 
    )
;

ALTER TABLE BENEFICIO ADD CONSTRAINT BENEFICIO_PK PRIMARY KEY (tipo_cuenta)
;

CREATE TABLE BOLETO 
    (
     id_boleto VARCHAR (40) NOT NULL , 
     asiento_asignado VARCHAR (12) NOT NULL , 
     aseguranza CHAR (254) , 
     es_ida_vuelta CHAR (254) , 
     total_pago DECIMAL (10,2) , 
     descuento DECIMAL (10,2) , 
     aumento DECIMAL (10,2) , 
     VUELO_codigo_vuelo VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE BOLETO ADD CONSTRAINT BOLETO_PK PRIMARY KEY (id_boleto)
;

CREATE TABLE BOLETO_PASAJERO 
    (
     BOLETO_id_boleto VARCHAR (40) NOT NULL , 
     PASAJERO_identificacion VARCHAR (40) NOT NULL , 
     ENCUESTA_SERVICIO_id_encuesta VARCHAR (40) NOT NULL , 
     COMPRA_codigo_compra VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE BOLETO_PASAJERO ADD CONSTRAINT BOLETO_PASAJERO_PK PRIMARY KEY (BOLETO_id_boleto)
;

CREATE TABLE CLASE 
    (
     clase VARCHAR (50) NOT NULL , 
     tarifa_cambio VARCHAR (10) NOT NULL , 
     maleta_documentada VARCHAR (10) NOT NULL , 
     peso_md VARCHAR (10) NOT NULL , 
     maleta_mano VARCHAR (10) NOT NULL , 
     eleccion_asiento CHAR (254) NOT NULL , 
     aseguranza CHAR (254) , 
     porcentaje DECIMAL (10,2) , 
     precio DECIMAL (2,10) NOT NULL , 
     PRECIO_id_precio VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE CLASE ADD CONSTRAINT CLASE_PK PRIMARY KEY (clase, 
    PRECIO_id_precio)
;

CREATE TABLE CLASE_BOLETO 
    (
     es_nino CHAR (254) NOT NULL , 
     CLASE_clase VARCHAR (50) NOT NULL , 
     BOLETO_id_boleto VARCHAR (40) NOT NULL , 
     CLASE_PRECIO_id_precio VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE CLASE_BOLETO ADD CONSTRAINT CLASE_BOLETO_PK PRIMARY KEY (CLASE_clase, 
    CLASE_PRECIO_id_precio, 
    BOLETO_id_boleto)
;

CREATE TABLE COMPRA 
    (
     codigo_compra VARCHAR (40) NOT NULL , 
     COMPRADOR_identificacion VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE COMPRA ADD CONSTRAINT COMPRA_PK PRIMARY KEY (codigo_compra)
;

CREATE TABLE COMPRA_MENU 
    (
     id_compra INTEGER NOT NULL , 
     precio DECIMAL (10,2) NOT NULL , 
     BOLETO_PASAJERO_BOLETO_id_boleto VARCHAR (40) NOT NULL , 
     MENU_id_menu INTEGER NOT NULL 
    )
;

ALTER TABLE COMPRA_MENU ADD CONSTRAINT COMPRA_MENU_PK PRIMARY KEY (id_compra)
;

CREATE TABLE COMPRA_WFI 
    (
     id_compra INTEGER NOT NULL , 
     producto VARCHAR (100) NOT NULL , 
     precio DECIMAL (10,2) NOT NULL , 
     BOLETO_PASAJERO_BOLETO_id_boleto VARCHAR (40) NOT NULL , 
     WIFI_id_wifi INTEGER NOT NULL 
    )
;

ALTER TABLE COMPRA_WFI ADD CONSTRAINT COMPRA_WFI_PK PRIMARY KEY (id_compra)
;

CREATE TABLE COMPRADOR 
    (
     identificacion VARCHAR (40) NOT NULL , 
     nombre VARCHAR (50) NOT NULL , 
     telefono VARCHAR (15) NOT NULL , 
     correo VARCHAR (100) NOT NULL , 
     fecha_compra DATE NOT NULL , 
     fecha_cancelacion DATE , 
     fecha_modificacion DATE , 
     estado_compra VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE COMPRADOR ADD CONSTRAINT COMPRADOR_PK PRIMARY KEY (identificacion)
;

CREATE TABLE CONTROL_VUELO 
    (
     id INTEGER NOT NULL , 
     estado VARCHAR (40) NOT NULL , 
     hora TIME NOT NULL , 
     VUELO_codigo_vuelo VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE CONTROL_VUELO ADD CONSTRAINT CONTROL_VUELO_PK PRIMARY KEY (id, 
    VUELO_codigo_vuelo)
;

CREATE TABLE DIA 
    (
     id INTEGER NOT NULL , 
     dia VARCHAR (15) NOT NULL 
    )
;

ALTER TABLE DIA ADD CONSTRAINT DIA_PK PRIMARY KEY (id)
;

CREATE TABLE DIA_VUELO 
    (
     PLAN_VUELO_id_plan_vuelo VARCHAR (40) NOT NULL , 
     DIA_id INTEGER NOT NULL 
    )
;

ALTER TABLE DIA_VUELO ADD CONSTRAINT DIA_VUELO_PK PRIMARY KEY (PLAN_VUELO_id_plan_vuelo, 
    DIA_id)
;

CREATE TABLE DISTRIBUCION_ASIENTO 
    (
     id_distribucion INTEGER NOT NULL , 
     total_asiento INTEGER NOT NULL , 
     clase VARCHAR (50) NOT NULL , 
     fila VARCHAR (10) NOT NULL , 
     asiento_fila VARCHAR (10) NOT NULL 
    )
;

ALTER TABLE DISTRIBUCION_ASIENTO ADD CONSTRAINT DISTRIBUCION_ASIENTO_PK PRIMARY KEY (id_distribucion)
;

CREATE TABLE EMPLEADO 
    (
     codigo_empleado VARCHAR (40) NOT NULL , 
     nombre VARCHAR (60) NOT NULL , 
     birthday DATE NOT NULL , 
     telefono VARCHAR (15) NOT NULL , 
     correo VARCHAR (100) NOT NULL , 
     anio_experiencia VARCHAR (10) NOT NULL , 
     fecha_inicio DATE NOT NULL 
    )
;

ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_PK PRIMARY KEY (codigo_empleado)
;

CREATE TABLE ENCUESTA_SERVICIO 
    (
     id_encuesta VARCHAR (40) NOT NULL , 
     vuelo_general INTEGER NOT NULL , 
     servicio_tripulante INTEGER NOT NULL , 
     comida INTEGER NOT NULL , 
     nota_adicional VARCHAR 
    )
;

ALTER TABLE ENCUESTA_SERVICIO ADD CONSTRAINT ENCUESTA_SERVICIO_PK PRIMARY KEY (id_encuesta)
;

CREATE TABLE HORARIO_EMPLEADO 
    (
     id INTEGER NOT NULL , 
     jornada VARCHAR (20) NOT NULL , 
     fecha DATE NOT NULL , 
     hora_inicio DATE NOT NULL , 
     hora_termino DATE NOT NULL , 
     saldo DECIMAL (10,2) NOT NULL , 
     comision DECIMAL (10,2) , 
     EMPLEADO_codigo_empleado VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE HORARIO_EMPLEADO ADD CONSTRAINT HORARIO_EMPLEADO_PK PRIMARY KEY (id)
;

CREATE TABLE IDENTIFICACION 
    (
     identificacion VARCHAR (40) NOT NULL , 
     tipo VARCHAR (50) , 
     USUARIO_usuario VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE IDENTIFICACION ADD CONSTRAINT IDENTIFICACION_PK PRIMARY KEY (identificacion)
;

CREATE TABLE LISTA_INGREDIENTE 
    (
     ingrediente VARCHAR (100) NOT NULL , 
     descripcion VARCHAR NOT NULL , 
     MENU_id_menu INTEGER NOT NULL 
    )
;

ALTER TABLE LISTA_INGREDIENTE ADD CONSTRAINT LISTA_INGREDIENTE_PK PRIMARY KEY (ingrediente, 
    MENU_id_menu)
;

CREATE TABLE LISTA_VACUNA 
    (
     vacuna VARCHAR (100) NOT NULL , 
     MASCOTA_certificado_veterinario VARCHAR (50) NOT NULL , 
     MASCOTA_nombre VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE LISTA_VACUNA ADD CONSTRAINT LISTA_VACUNA_PK PRIMARY KEY (MASCOTA_nombre, 
    MASCOTA_certificado_veterinario)
;

CREATE TABLE MALETA 
    (
     id INTEGER NOT NULL , 
     dimension VARCHAR (15) NOT NULL , 
     peso VARCHAR (15) NOT NULL , 
     tipo VARCHAR (30) NOT NULL , 
     precio DECIMAL (10,2) NOT NULL , 
     categoria VARCHAR (50) NOT NULL 
    )
;

ALTER TABLE MALETA ADD CONSTRAINT MALETA_PK PRIMARY KEY (id)
;

CREATE TABLE MALETA_HISTORIAL 
    (
     id INTEGER NOT NULL , 
     peso VARCHAR (10) NOT NULL , 
     tipo VARCHAR (25) NOT NULL , 
     precio DECIMAL (10,2) NOT NULL , 
     BOLETO_PASAJERO_BOLETO_id_boleto VARCHAR (40) NOT NULL , 
     dimension VARCHAR (15) , 
     categoria_numero VARCHAR (50) , 
     MALETA_id INTEGER NOT NULL 
    )
;

ALTER TABLE MALETA_HISTORIAL ADD CONSTRAINT MALETA_HISTORIAL_PK PRIMARY KEY (id)
;

CREATE TABLE MASCOTA 
    (
     nombre VARCHAR (40) NOT NULL , 
     certificado_veterinario VARCHAR (50) NOT NULL , 
     especie VARCHAR (70) NOT NULL , 
     descripcion VARCHAR , 
     peso VARCHAR (25) NOT NULL , 
     tipo VARCHAR (20) , 
     jaula VARCHAR (25) , 
     BOLETO_PASAJERO_BOLETO_id_boleto VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE MASCOTA ADD CONSTRAINT MASCOTA_PK PRIMARY KEY (certificado_veterinario, 
    nombre)
;

CREATE TABLE MENU 
    (
     id_menu INTEGER NOT NULL , 
     nombre VARCHAR (100) NOT NULL , 
     tipo VARCHAR (25) NOT NULL , 
     descripcion VARCHAR , 
     precio DECIMAL (10,2) NOT NULL , 
     existencia INTEGER NOT NULL , 
     costo DECIMAL (10,2) NOT NULL , 
     categoria VARCHAR (20) , 
     tiempo_ofrece TIME 
    )
;

ALTER TABLE MENU ADD CONSTRAINT MENU_PK PRIMARY KEY (id_menu)
;

CREATE TABLE METODO_PAGO 
    (
     id_pago INTEGER NOT NULL , 
     metodo_pago VARCHAR (50) NOT NULL 
    )
;

ALTER TABLE METODO_PAGO ADD CONSTRAINT METODO_PAGO_PK PRIMARY KEY (id_pago)
;

CREATE TABLE MILLA_HISTORICO 
    (
     id INTEGER NOT NULL , 
     numero_vuelos INTEGER NOT NULL , 
     milla_recorrido DECIMAL (10,2) NOT NULL , 
     milla_por_dolar DECIMAL (10,2) NOT NULL , 
     USUARIO_usuario VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE MILLA_HISTORICO ADD CONSTRAINT MILLA_HISTORICO_PK PRIMARY KEY (id, 
    USUARIO_usuario)
;

CREATE TABLE PAGO_COMPRADOR 
    (
     descripcion VARCHAR (100) , 
     METODO_PAGO_id_pago INTEGER NOT NULL , 
     COMPRA_codigo_compra VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE PAGO_COMPRADOR ADD CONSTRAINT PAGO_COMPRADOR_PK PRIMARY KEY (METODO_PAGO_id_pago, 
    COMPRA_codigo_compra)
;

CREATE TABLE PAGO_MENU 
    (
     descripcion VARCHAR (100) , 
     METODO_PAGO_id_pago INTEGER NOT NULL , 
     COMPRA_MENU_id_compra INTEGER NOT NULL 
    )
;

ALTER TABLE PAGO_MENU ADD CONSTRAINT PAGO_MENU_PK PRIMARY KEY (METODO_PAGO_id_pago, 
    COMPRA_MENU_id_compra)
;

CREATE TABLE PAGO_PELICULA 
    (
     descripcion VARCHAR (100) , 
     METODO_PAGO_id_pago INTEGER NOT NULL , 
     ALQUILA_PELICULA_id_compra INTEGER NOT NULL 
    )
;

ALTER TABLE PAGO_PELICULA ADD CONSTRAINT PAGO_PELICULA_PK PRIMARY KEY (METODO_PAGO_id_pago, 
    ALQUILA_PELICULA_id_compra)
;

CREATE TABLE PAGO_USUARIO 
    (
     USUARIO_usuario VARCHAR (40) NOT NULL , 
     METODO_PAGO_id_pago INTEGER NOT NULL , 
     descripcion VARCHAR (100) 
    )
;

ALTER TABLE PAGO_USUARIO ADD CONSTRAINT PAGO_USUARIO_PK PRIMARY KEY (USUARIO_usuario, 
    METODO_PAGO_id_pago)
;

CREATE TABLE PAGO_WIFI 
    (
     descripcion VARCHAR (100) , 
     METODO_PAGO_id_pago INTEGER NOT NULL , 
     COMPRA_WFI_id_compra INTEGER NOT NULL 
    )
;

ALTER TABLE PAGO_WIFI ADD CONSTRAINT PAGO_WIFI_PK PRIMARY KEY (METODO_PAGO_id_pago, 
    COMPRA_WFI_id_compra)
;

CREATE TABLE PASAJERO 
    (
     identificacion VARCHAR (40) NOT NULL , 
     nombre VARCHAR (50) NOT NULL , 
     birthday DATE NOT NULL , 
     nacionalidad VARCHAR (50) NOT NULL , 
     genero VARCHAR (30) NOT NULL , 
     telefono VARCHAR (15) NOT NULL , 
     correo VARCHAR (100) 
    )
;

ALTER TABLE PASAJERO ADD CONSTRAINT PASAJERO_PK PRIMARY KEY (identificacion)
;

CREATE TABLE PELICULA 
    (
     id_pelicula INTEGER NOT NULL , 
     nombre VARCHAR (90) NOT NULL , 
     descripcion VARCHAR , 
     categoria VARCHAR (80) NOT NULL , 
     clasificacion VARCHAR (50) NOT NULL , 
     actores VARCHAR NOT NULL , 
     precio DECIMAL (10,2) NOT NULL , 
     duracion TIME NOT NULL , 
     costo DECIMAL (10,2) 
    )
;

COMMENT ON COLUMN PELICULA.actores IS 'este debe ser un arrays' 
;

ALTER TABLE PELICULA ADD CONSTRAINT PELICULA_PK PRIMARY KEY (id_pelicula)
;

CREATE TABLE PERSONAL_ABORDO 
    (
     id INTEGER NOT NULL , 
     puesto VARCHAR (20) NOT NULL , 
     comision DECIMAL (10,2) NOT NULL , 
     VUELO_codigo_vuelo VARCHAR (40) NOT NULL , 
     EMPLEADO_codigo_empleado VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE PERSONAL_ABORDO ADD CONSTRAINT PERSONAL_ABORDO_PK PRIMARY KEY (id)
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
     AVION_codigo_avion VARCHAR (40) NOT NULL , 
     es_temporal CHAR (254) 
    )
;

ALTER TABLE PLAN_VUELO ADD CONSTRAINT PLAN_VUELO_PK PRIMARY KEY (id_plan_vuelo)
;

CREATE TABLE PRECIO 
    (
     id_precio VARCHAR (40) NOT NULL , 
     descuento DECIMAL (10,2) , 
     aumento DECIMAL (10,2) , 
     descripcion VARCHAR 
    )
;

ALTER TABLE PRECIO ADD CONSTRAINT PRECIO_PK PRIMARY KEY (id_precio)
;

CREATE TABLE SUPERVISOR 
    (
     BOLETO_PASAJERO_BOLETO_id_boleto VARCHAR (40) NOT NULL , 
     PERSONAL_ABORDO_id INTEGER NOT NULL 
    )
;

ALTER TABLE SUPERVISOR ADD CONSTRAINT SUPERVISOR_PK PRIMARY KEY (PERSONAL_ABORDO_id, 
    BOLETO_PASAJERO_BOLETO_id_boleto)
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
     BENEFICIO_tipo_cuenta VARCHAR (35) NOT NULL 
    )
;

ALTER TABLE USUARIO ADD CONSTRAINT USUARIO_PK PRIMARY KEY (usuario)
;

CREATE TABLE VUELO 
    (
     codigo_vuelo VARCHAR (40) NOT NULL , 
     boletos_vendido INTEGER , 
     estado_vuelo VARCHAR (30) NOT NULL , 
     id_dia INTEGER NOT NULL , 
     fecha DATE NOT NULL , 
     PLAN_VUELO_id_plan_vuelo VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE VUELO ADD CONSTRAINT VUELO_PK PRIMARY KEY (codigo_vuelo)
;

CREATE TABLE VUELO_TEMPORAL 
    (
     id_temporal VARCHAR (40) NOT NULL , 
     fecha_inicio DATE NOT NULL , 
     fecha_final DATE NOT NULL , 
     estado CHAR (254) NOT NULL , 
     PLAN_VUELO_id_plan_vuelo VARCHAR (40) NOT NULL 
    )
;

ALTER TABLE VUELO_TEMPORAL ADD CONSTRAINT VUELO_TEMPORAL_PK PRIMARY KEY (id_temporal)
;

CREATE TABLE WIFI 
    (
     id_wifi INTEGER NOT NULL , 
     nombre VARCHAR (20) NOT NULL , 
     contrasena VARCHAR (25) NOT NULL , 
     precio DECIMAL (10,2) NOT NULL 
    )
;

ALTER TABLE WIFI ADD CONSTRAINT WIFI_PK PRIMARY KEY (id_wifi)
;

ALTER TABLE ALQUILA_PELICULA 
    ADD CONSTRAINT ALQUILA_PELICULA_BOLETO_PASAJERO_FK FOREIGN KEY
    ( 
     BOLETO_PASAJERO_BOLETO_id_boleto
    ) 
    REFERENCES BOLETO_PASAJERO 
    ( 
     BOLETO_id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE ALQUILA_PELICULA 
    ADD CONSTRAINT ALQUILA_PELICULA_PELICULA_FK FOREIGN KEY
    ( 
     PELICULA_id_pelicula
    ) 
    REFERENCES PELICULA 
    ( 
     id_pelicula
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE AVION 
    ADD CONSTRAINT AVION_DISTRIBUCION_ASIENTO_FK FOREIGN KEY
    ( 
     DISTRIBUCION_ASIENTO_id_distribucion
    ) 
    REFERENCES DISTRIBUCION_ASIENTO 
    ( 
     id_distribucion
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE BOLETO_PASAJERO 
    ADD CONSTRAINT BOLETO_PASAJERO_BOLETO_FK FOREIGN KEY
    ( 
     BOLETO_id_boleto
    ) 
    REFERENCES BOLETO 
    ( 
     id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE BOLETO_PASAJERO 
    ADD CONSTRAINT BOLETO_PASAJERO_COMPRA_FK FOREIGN KEY
    ( 
     COMPRA_codigo_compra
    ) 
    REFERENCES COMPRA 
    ( 
     codigo_compra
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE BOLETO_PASAJERO 
    ADD CONSTRAINT BOLETO_PASAJERO_ENCUESTA_SERVICIO_FK FOREIGN KEY
    ( 
     ENCUESTA_SERVICIO_id_encuesta
    ) 
    REFERENCES ENCUESTA_SERVICIO 
    ( 
     id_encuesta
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE BOLETO_PASAJERO 
    ADD CONSTRAINT BOLETO_PASAJERO_PASAJERO_FK FOREIGN KEY
    ( 
     PASAJERO_identificacion
    ) 
    REFERENCES PASAJERO 
    ( 
     identificacion
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE BOLETO 
    ADD CONSTRAINT BOLETO_VUELO_FK FOREIGN KEY
    ( 
     VUELO_codigo_vuelo
    ) 
    REFERENCES VUELO 
    ( 
     codigo_vuelo
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE CLASE_BOLETO 
    ADD CONSTRAINT CLASE_BOLETO_BOLETO_FK FOREIGN KEY
    ( 
     BOLETO_id_boleto
    ) 
    REFERENCES BOLETO 
    ( 
     id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE CLASE_BOLETO 
    ADD CONSTRAINT CLASE_BOLETO_CLASE_FK FOREIGN KEY
    ( 
     CLASE_clase,
     CLASE_PRECIO_id_precio
    ) 
    REFERENCES CLASE 
    ( 
     clase,
     PRECIO_id_precio
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE CLASE 
    ADD CONSTRAINT CLASE_PRECIO_FK FOREIGN KEY
    ( 
     PRECIO_id_precio
    ) 
    REFERENCES PRECIO 
    ( 
     id_precio
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE COMPRA 
    ADD CONSTRAINT COMPRA_COMPRADOR_FK FOREIGN KEY
    ( 
     COMPRADOR_identificacion
    ) 
    REFERENCES COMPRADOR 
    ( 
     identificacion
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE COMPRA_MENU 
    ADD CONSTRAINT COMPRA_MENU_BOLETO_PASAJERO_FK FOREIGN KEY
    ( 
     BOLETO_PASAJERO_BOLETO_id_boleto
    ) 
    REFERENCES BOLETO_PASAJERO 
    ( 
     BOLETO_id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE COMPRA_MENU 
    ADD CONSTRAINT COMPRA_MENU_MENU_FK FOREIGN KEY
    ( 
     MENU_id_menu
    ) 
    REFERENCES MENU 
    ( 
     id_menu
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE COMPRA_WFI 
    ADD CONSTRAINT COMPRA_WFI_BOLETO_PASAJERO_FK FOREIGN KEY
    ( 
     BOLETO_PASAJERO_BOLETO_id_boleto
    ) 
    REFERENCES BOLETO_PASAJERO 
    ( 
     BOLETO_id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE COMPRA_WFI 
    ADD CONSTRAINT COMPRA_WFI_WIFI_FK FOREIGN KEY
    ( 
     WIFI_id_wifi
    ) 
    REFERENCES WIFI 
    ( 
     id_wifi
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE CONTROL_VUELO 
    ADD CONSTRAINT CONTROL_VUELO_VUELO_FK FOREIGN KEY
    ( 
     VUELO_codigo_vuelo
    ) 
    REFERENCES VUELO 
    ( 
     codigo_vuelo
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE DIA_VUELO 
    ADD CONSTRAINT DIA_VUELO_DIA_FK FOREIGN KEY
    ( 
     DIA_id
    ) 
    REFERENCES DIA 
    ( 
     id
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE DIA_VUELO 
    ADD CONSTRAINT DIA_VUELO_PLAN_VUELO_FK FOREIGN KEY
    ( 
     PLAN_VUELO_id_plan_vuelo
    ) 
    REFERENCES PLAN_VUELO 
    ( 
     id_plan_vuelo
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE HORARIO_EMPLEADO 
    ADD CONSTRAINT HORARIO_EMPLEADO_EMPLEADO_FK FOREIGN KEY
    ( 
     EMPLEADO_codigo_empleado
    ) 
    REFERENCES EMPLEADO 
    ( 
     codigo_empleado
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE IDENTIFICACION 
    ADD CONSTRAINT IDENTIFICACION_USUARIO_FK FOREIGN KEY
    ( 
     USUARIO_usuario
    ) 
    REFERENCES USUARIO 
    ( 
     usuario
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE LISTA_INGREDIENTE 
    ADD CONSTRAINT LISTA_INGREDIENTE_MENU_FK FOREIGN KEY
    ( 
     MENU_id_menu
    ) 
    REFERENCES MENU 
    ( 
     id_menu
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE LISTA_VACUNA 
    ADD CONSTRAINT LISTA_VACUNA_MASCOTA_FK FOREIGN KEY
    ( 
     MASCOTA_certificado_veterinario,
     MASCOTA_nombre
    ) 
    REFERENCES MASCOTA 
    ( 
     certificado_veterinario,
     nombre
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE MALETA_HISTORIAL 
    ADD CONSTRAINT MALETA_HISTORIAL_BOLETO_PASAJERO_FK FOREIGN KEY
    ( 
     BOLETO_PASAJERO_BOLETO_id_boleto
    ) 
    REFERENCES BOLETO_PASAJERO 
    ( 
     BOLETO_id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE MALETA_HISTORIAL 
    ADD CONSTRAINT MALETA_HISTORIAL_MALETA_FK FOREIGN KEY
    ( 
     MALETA_id
    ) 
    REFERENCES MALETA 
    ( 
     id
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE MASCOTA 
    ADD CONSTRAINT MASCOTA_BOLETO_PASAJERO_FK FOREIGN KEY
    ( 
     BOLETO_PASAJERO_BOLETO_id_boleto
    ) 
    REFERENCES BOLETO_PASAJERO 
    ( 
     BOLETO_id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE MILLA_HISTORICO 
    ADD CONSTRAINT MILLA_HISTORICO_USUARIO_FK FOREIGN KEY
    ( 
     USUARIO_usuario
    ) 
    REFERENCES USUARIO 
    ( 
     usuario
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE PAGO_COMPRADOR 
    ADD CONSTRAINT PAGO_COMPRADOR_COMPRA_FK FOREIGN KEY
    ( 
     COMPRA_codigo_compra
    ) 
    REFERENCES COMPRA 
    ( 
     codigo_compra
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE PAGO_COMPRADOR 
    ADD CONSTRAINT PAGO_COMPRADOR_METODO_PAGO_FK FOREIGN KEY
    ( 
     METODO_PAGO_id_pago
    ) 
    REFERENCES METODO_PAGO 
    ( 
     id_pago
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE PAGO_MENU 
    ADD CONSTRAINT PAGO_MENU_COMPRA_MENU_FK FOREIGN KEY
    ( 
     COMPRA_MENU_id_compra
    ) 
    REFERENCES COMPRA_MENU 
    ( 
     id_compra
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE PAGO_MENU 
    ADD CONSTRAINT PAGO_MENU_METODO_PAGO_FK FOREIGN KEY
    ( 
     METODO_PAGO_id_pago
    ) 
    REFERENCES METODO_PAGO 
    ( 
     id_pago
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE PAGO_PELICULA 
    ADD CONSTRAINT PAGO_PELICULA_ALQUILA_PELICULA_FK FOREIGN KEY
    ( 
     ALQUILA_PELICULA_id_compra
    ) 
    REFERENCES ALQUILA_PELICULA 
    ( 
     id_compra
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE PAGO_PELICULA 
    ADD CONSTRAINT PAGO_PELICULA_METODO_PAGO_FK FOREIGN KEY
    ( 
     METODO_PAGO_id_pago
    ) 
    REFERENCES METODO_PAGO 
    ( 
     id_pago
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE PAGO_USUARIO 
    ADD CONSTRAINT PAGO_USUARIO_METODO_PAGO_FK FOREIGN KEY
    ( 
     METODO_PAGO_id_pago
    ) 
    REFERENCES METODO_PAGO 
    ( 
     id_pago
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE PAGO_USUARIO 
    ADD CONSTRAINT PAGO_USUARIO_USUARIO_FK FOREIGN KEY
    ( 
     USUARIO_usuario
    ) 
    REFERENCES USUARIO 
    ( 
     usuario
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE PAGO_WIFI 
    ADD CONSTRAINT PAGO_WIFI_COMPRA_WFI_FK FOREIGN KEY
    ( 
     COMPRA_WFI_id_compra
    ) 
    REFERENCES COMPRA_WFI 
    ( 
     id_compra
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE PAGO_WIFI 
    ADD CONSTRAINT PAGO_WIFI_METODO_PAGO_FK FOREIGN KEY
    ( 
     METODO_PAGO_id_pago
    ) 
    REFERENCES METODO_PAGO 
    ( 
     id_pago
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE PERSONAL_ABORDO 
    ADD CONSTRAINT PERSONAL_ABORDO_EMPLEADO_FK FOREIGN KEY
    ( 
     EMPLEADO_codigo_empleado
    ) 
    REFERENCES EMPLEADO 
    ( 
     codigo_empleado
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE PERSONAL_ABORDO 
    ADD CONSTRAINT PERSONAL_ABORDO_VUELO_FK FOREIGN KEY
    ( 
     VUELO_codigo_vuelo
    ) 
    REFERENCES VUELO 
    ( 
     codigo_vuelo
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE PLAN_VUELO 
    ADD CONSTRAINT PLAN_VUELO_AVION_FK FOREIGN KEY
    ( 
     AVION_codigo_avion
    ) 
    REFERENCES AVION 
    ( 
     codigo_avion
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE SUPERVISOR 
    ADD CONSTRAINT SUPERVISOR_BOLETO_PASAJERO_FK FOREIGN KEY
    ( 
     BOLETO_PASAJERO_BOLETO_id_boleto
    ) 
    REFERENCES BOLETO_PASAJERO 
    ( 
     BOLETO_id_boleto
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE SUPERVISOR 
    ADD CONSTRAINT SUPERVISOR_PERSONAL_ABORDO_FK FOREIGN KEY
    ( 
     PERSONAL_ABORDO_id
    ) 
    REFERENCES PERSONAL_ABORDO 
    ( 
     id
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE USUARIO 
    ADD CONSTRAINT USUARIO_BENEFICIO_FK FOREIGN KEY
    ( 
     BENEFICIO_tipo_cuenta
    ) 
    REFERENCES BENEFICIO 
    ( 
     tipo_cuenta
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE VUELO 
    ADD CONSTRAINT VUELO_PLAN_VUELO_FK FOREIGN KEY
    ( 
     PLAN_VUELO_id_plan_vuelo
    ) 
    REFERENCES PLAN_VUELO 
    ( 
     id_plan_vuelo
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;

ALTER TABLE VUELO_TEMPORAL 
    ADD CONSTRAINT VUELO_TEMPORAL_PLAN_VUELO_FK FOREIGN KEY
    ( 
     PLAN_VUELO_id_plan_vuelo
    ) 
    REFERENCES PLAN_VUELO 
    ( 
     id_plan_vuelo
    )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ENFORCED ENABLE QUERY OPTIMIZATION 
;



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            42
-- CREATE INDEX                             0
-- ALTER TABLE                             87
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE STRUCTURED TYPE                   0
-- CREATE ALIAS                             0
-- CREATE BUFFERPOOL                        0
-- CREATE DATABASE                          0
-- CREATE DISTINCT TYPE                     0
-- CREATE INSTANCE                          0
-- CREATE DATABASE PARTITION GROUP          0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE TABLESPACE                        0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
