
--insert beneficios segun tipo de cuenta
INSERT INTO BENEFICIO (
    tipo_cuenta, milla_por_dolar, tiempo_cuenta, porcentaje_costo, pelicula, maleta_documentada, peso_documentada, maleta_mano, dimension
) VALUES (
    'Cuenta Normal', '1', '0 año', '25%', 0, 0, 0, '0 ', 0 
),(
    'Cuenta Oro', '1.5', '2 año', '50%', '1', 0, 0, '0 ', 0 
), (
    'Cuenta Platino', '2', '2 año', '100%', '1', '1', 50, '0 ', 0 
);

--insert metodo de pago
INSERT INTO METODO_PAGO (
    metodo_pago
) VALUES (
    'efectivo'
), (
    'tarjeta de credito'
), (
    'tarjeta de debito'
), (
    'bytconins'
);

-- inserts usuarios
INSERT INTO USUARIO (
    usuario, nombre, contrasena, birthday, correo, genero, telefono, fecha_creacion, millas, tipo_cuenta
) VALUES (
    'Kamila12', 'Kamila Lopez', '123456k', '12-05-2000', 'kamila12@gmail.com', 'Femenino',
     '502-1234-5678', '12-05-2020', 4, 'Cuenta Normal' 
), (
    'Dani3', 'Daniel Juarez', '123456d', '01-04-1998', 'j-dani2@gmail.com', 'Masculino',
     '502-5673-2345', '12-05-2021', 0, 'Cuenta Normal' 
), (
    'Lesly', 'Lesly Cupil', '123456ls', '12-01-1999', 'cs-lesly@gmail.com', 'Femenino',
     '502-1234-5678', '12-05-2022', 0, 'Cuenta Normal' 
), (
    'carlo-12', 'Carlos Juarez', '123456d', '01-04-1998', 'j-car2@gmail.com', 'Masculino',
     '502-5673-2345', '12-05-2021', 0, 'Cuenta Normal' 
), (
    'ana39', 'Ana Molina', '123456a', '12-05-2010', 'ana12@gmail.com', 'Femenino',
     '502-1234-5678', '12-03-2022', 0, 'Cuenta Normal' 
), (
    'diego9', 'Diego Catañeda', '123456d', '01-04-1993', 'diego@gmail.com', 'Masculino',
     '502-5673-2345', '20-05-2015', 0, 'Cuenta Normal' 
), (
    'laly', 'Citlaly Morales', '123456ls', '12-01-2005', 'cs-laly@gmail.com', 'Femenino',
     '502-1234-5678', '12-05-2021', 0, 'Cuenta Normal' 
), (
    'lucas-4', 'Lucas Ordoñez', '123456d', '01-04-1999', 'j-luca@gmail.com', 'Masculino',
     '502-5673-2345', '12-05-2021', 0, 'Cuenta Normal' 
), (
    'cesy', 'Cesilia Hernandez', '123456ls', '12-01-1999', 'cs-cesy@gmail.com', 'Femenino',
     '502-1234-5678', '01-05-2022', 4, 'Cuenta Oro' 
), (
    'marco1', 'Marcos Sanchez', '123456d', '01-04-1999', 'j-marco@gmail.com', 'Masculino',
     '502-5673-2345', '12-05-2021', 0, 'Cuenta Normal' 
);

--inserts identificaciones
INSERT INTO IDENTIFICACION (
    identificacion, tipo, usuario
) VALUES (
    '111111111111', 'codigo unico de identificacion (CUI)', 'Kamila12'
), (
    '222222111111', 'pasaporte', 'Kamila12'
), (
    '111111222222', 'codigo unico de identificacion (CUI)', 'Dani3'
), (
    '222222332321', 'pasaporte', 'Kamila12'
), (
    '111113443335', 'codigo unico de identificacion (CUI)', 'Lesly'
), (
    '222222223451', 'pasaporte', 'Lesly'
), (
    '111111333333', 'codigo unico de identificacion (CUI)', 'carlo-12'
), (
    '222222344344', 'pasaporte', 'carlo-12'
), (
    '111115555555', 'codigo unico de identificacion (CUI)', 'ana39'
), (
    '222222533555', 'pasaporte', 'ana39'
), (
    '111111666646', 'codigo unico de identificacion (CUI)', 'diego9'
), (
    '222222346666', 'pasaporte', 'diego9'
), (
    '111113475777', 'codigo unico de identificacion (CUI)', 'laly'
), (
    '222222223775', 'pasaporte', 'laly'
), (
    '111111388887', 'codigo unico de identificacion (CUI)', 'lucas-4'
), (
    '222222346888', 'pasaporte', 'lucas-4'
), (
    '111113479999', 'codigo unico de identificacion (CUI)', 'cesy'
), (
    '222222223999', 'pasaporte', 'cesy'
), (
    '111111388110', 'codigo unico de identificacion (CUI)', 'marco1'
), (
    '222222346110', 'pasaporte', 'marco1'
);


-- insertes 
INSERT INTO MILLA_HISTORICO (
    numero_vuelos, milla_recorrido, usuario
) VALUES (
    2, 4, 'Kamila12'
), (
    0, 0, 'Dani3'
), (
    0, 0, 'Lesly'
), (
    0, 0, 'carlo-12'
), (
    0, 0, 'ana39'
), (
    0, 0, 'diego9'
), (
    0, 0, 'laly'
), (
    0, 0, 'lucas-4'
), (
    2, 4, 'cesy'
), (
    0, 0, 'marco1'
);

--insert metodo pago de usuario
INSERT INTO PAGO_USUARIO (
    usuario, id_pago, descripcion
) VALUES (
    'Kamila12', 1, 'pago con dinero en efectivo'
), (
    'Kamila12', 2, 'tarjeta de credito de Bantrab'
), (
    'ana39', 2, 'tarjeta de credito Industrial'
), (
    'diego9', 2, 'tarjeta de credito Industrial'
);

--inserts aviones
INSERT INTO AVION (
    codigo_avion, tipo_avion, fecha_adquisicion, fecha_mantenimiento, estado, numero_tripulante, numero_asiento, fecha_primer_vuelo
) VALUES (
    'AV-001', 'Airbus 330', '01-12-2010', '10-04-2022', 'vuelos', 6, 80, '02-02-2010'
), (
    'AV-002', 'Boeing 737', '01-12-2010', '10-04-2022', 'vuelos', 6, 80, '02-02-2010'
), (
    'AV-003', 'Airbus 340', '01-12-2015', '10-05-2022', 'vuelos', 6, 90, '02-02-2015'
), (
    'AV-004', 'Boeing 747 F Freighter', '01-12-2015', '10-03-2022', 'vuelos', 8, 105, '02-02-2010'
), (
    'AV-005', 'Airbus Generic', '01-12-2018', '15-05-2022', 'vuelos', 8, 110, '02-02-2018'
), (
    'AV-006', 'Boeing 750', '01-12-2019', '20-03-2022', 'vuelos', 9, 115, '02-02-2019'
);

--inserts distribucion de asientos de cada avion
INSERT INTO DISTRIBUCION_ASIENTO (
    total_asiento, clase, fila, asiento_fila, codigo_avion
) VALUES (
    10, 'primera clase', '2', '5', 'AV-001'
), (
    20, 'clase business', '6', '5', 'AV-001'
), (
    25, 'clase economy', '5', '5', 'AV-001'
), (
    32, 'clase basica', '4', '8', 'AV-001'
), (
    10, 'primera clase', '2', '5', 'AV-002'
), (
    20, 'clase business', '6', '5', 'AV-002'
), (
    25, 'clase economy', '5', '5', 'AV-002'
), (
    32, 'clase basica', '4', '8', 'AV-002'
), (
    10, 'primera clase', '2', '5', 'AV-003'
), (
    20, 'clase business', '6', '5', 'AV-003'
), (
    25, 'clase economy', '5', '5', 'AV-003'
), (
    32, 'clase basica', '4', '8', 'AV-003'
),(
    10, 'primera clase', '2', '5', 'AV-004'
), (
    20, 'clase business', '6', '5', 'AV-004'
), (
    35, 'clase economy', '7', '5', 'AV-004'
), (
    32, 'clase basica', '4', '8', 'AV-004'
), (
    10, 'primera clase', '2', '5', 'AV-005'
), (
    20, 'clase business', '6', '5', 'AV-005'
), (
    25, 'clase economy', '5', '5', 'AV-005'
), (
    32, 'clase basica', '4', '8', 'AV-005'
), (
    10, 'primera clase', '2', '5', 'AV-006'
), (
    20, 'clase business', '6', '5', 'AV-006'
), (
    40, 'clase economy', '8', '5', 'AV-006'
), (
    32, 'clase basica', '4', '8', 'AV-006'
);

--inserts empleados
INSERT INTO EMPLEADO (
    codigo_empleado, nombre, birthday, telefono, correo, anio_experiencia, fecha_inicio, estado
) VALUES (
    'EE-001', 'Vanesa Lopez', '12-05-2000', '502-1234-5678', 'kamila12@gmail.com', '12', '12-05-2010', '0' 
), (
    'EE-002', 'Marimar Lopez', '12-05-2000', '502-1234-5678', 'kamila12@gmail.com', '12', '12-05-2010', '0'
), (
    'EE-003', 'Roberto Lopez', '12-05-2000', '502-1234-5678', 'kamila12@gmail.com', '8', '12-05-2014', '0'
), (
    'EE-004', 'Joaquin Lopez', '12-05-2000', '502-1234-5678', 'kamila12@gmail.com', '8', '12-05-2014', '0'
), (
    'EE-005', 'Lupita Lopez', '12-05-2000', '502-1234-5678', 'kamila12@gmail.com', '8', '12-05-2014', '0'
), (
    'EE-006', 'Emiliano Lopez', '12-05-2000', '502-1234-5678', 'kamila12@gmail.com', '6', '12-05-2017', '0' 
), (
    'EE-007', 'Estrella Lopez', '12-05-2000', '502-1234-5678', 'kamila12@gmail.com', '6', '12-05-2017', '0'
), (
    'EE-008', 'Luna Lopez', '12-05-2000', '502-1234-5678', 'kamila12@gmail.com', '5', '12-05-2018', '0'
), (
    'EE-009', 'Damian Lopez', '12-05-2000', '502-1234-5678', 'kamila12@gmail.com', '5', '12-05-2018', '0' 
), (
    'EE-010', 'Wendy Lopez', '12-05-2000', '502-1234-5678', 'kamila12@gmail.com', '3', '12-05-2020', '0'
), (
    'EE-011', 'Brisa Lopez', '12-05-2000', '502-1234-5678', 'kamila12@gmail.com', '3', '12-05-2020', '0'
);


INSERT INTO HORARIO_EMPLEADO (
    jornada, fecha, hora_inicio, hora_termino, saldo, comision, codigo_empleado
) VALUES (
    'completa', '01-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '03-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '05-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '07-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '09-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '11-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '13-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '15-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '17-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '19-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '21-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '23-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '25-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '27-04-2022', '8:00', '20:00', 200, 0, 'EE-001'
), (
    'completa', '29-04-2022', '8:00', '20:00', 200, 300, 'EE-001'
), (
    'nocturna', '01-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '03-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '05-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '07-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '09-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '11-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '13-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '15-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '17-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '19-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '21-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '23-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '25-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '27-04-2022', '20:00', '11:59', 100, 0, 'EE-002'
), (
    'nocturna', '29-04-2022', '20:00', '11:59', 100, 200, 'EE-002'
), (
    'nocturna', '01-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '03-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '05-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '07-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '09-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '11-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '13-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '15-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '17-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '19-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '21-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '23-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '25-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '27-04-2022', '20:00', '11:59', 100, 0, 'EE-003'
), (
    'nocturna', '29-04-2022', '20:00', '11:59', 100, 200, 'EE-003'
);

--dia
INSERT INTO DIA(
    dia
) VALUES (
    'LUNES'
), (
    'MARTES'
), (
    'MIERCOLES'
), (
    'JUEVES'
), (
    'VIERNES'
), (
    'SABADO'
), (
    'DOMINGO'
);

--inserts menu
INSERT INTO MENU (
    nombre, tipo, descripcion, precio, existencia, costo, categoria, tiempo_ofrece
) VALUES (
    'bebida alcoholicas', 'asdad', 'primera clase ', 1, 100, 5, 'bebidas', '2:00' 
), (
    'gaseosa', 'asdad', 'primera clase ', 0, 100, 4, 'bebidas', '2:00'
), (
    'jugos', 'asdad', 'primera clase', 0, 100, 4, 'bebidas', '2:00'
), (
    'agua', 'asdad', 'primera clase', 0, 100, 4, 'bebidas', '2:00'
), (
    'bebida alcoholicas', 'asdad', 'clase business', 1, 100, 5, 'bebidas', '2:00' 
), (
    'gaseosa', 'asdad', 'clase business', 0, 100, 4, 'bebidas', '2:00'
), (
    'jugos', 'asdad', 'clase business', 0, 100, 4, 'bebidas', '2:00'
), (
    'agua', 'asdad', 'clase business', 0, 100, 4, 'bebidas', '2:00'
), (
    'bebida alcoholicas', 'asdad', 'clase basica y economica', 1, 100, 5, 'bebidas', '3:00' 
), (
    'gaseosa', 'asdad', 'clase basica y economica', 0, 100, 4, 'bebidas', '3:00'
), (
    'jugos', 'asdad', 'clase basica y economica', 0, 100, 4, 'bebidas', '3:00'
), (
    'agua', 'asdad', 'clase basica y economica', 0, 100, 4, 'bebidas', '3:00'
), (
    'pastelillos', 'asdad', 'primera clase ', 1, 100, 5, 'comida', '2:00' 
), (
    'galletas', 'asdad', 'primera clase ', 0, 100, 4, 'comida', '2:00'
), (
    'palomitas', 'asdad', 'primera clase', 0, 100, 4, 'comida', '2:00'
), (
    'galletas', 'asdad', 'clase business', 4, 100, 3, 'comida', '2:00' 
), (
    'palomitas', 'asdad', 'clase business', 5, 100, 4, 'comida', '2:00'
), (
    'pastelillos', 'asdad', 'clase basica y economica', 6, 100, 5, 'comida', '3:00' 
), (
    'galletas', 'asdad', 'clase basica y economica', 5, 100, 4, 'comida', '3:00'
);

INSERT INTO LISTA_INGREDIENTE (
    ingrediente, descripcion, id_menu
) VALUES (
    'uva', 'adlkfjd f asfdkjalsd f asdfjklsdf ', 1
), (
    'agua', 'adlkfjd f asfdkjalsd f asdfjklsdf ', 1
), (
    'alcohol', 'adlkfjd f asfdkjalsd f asdfjklsdf ', 1
), (
    'gas', 'adlkfjd f asfdkjalsd f asdfjklsdf ', 2
), (
    'saborizante', 'adlkfjd f asfdkjalsd f asdfjklsdf ', 2
), (
    'agua', 'adlkfjd f asfdkjalsd f asdfjklsdf ', 3
), (
    'saborizante', 'adlkfjd f asfdkjalsd f asdfjklsdf ', 3
), (
    'arina', 'adlkfjd f asfdkjalsd f asdfjklsdf ', 13
), (
    'azucar', 'adlkfjd f asfdkjalsd f asdfjklsdf ', 13
), (
    'huevos', 'adlkfjd f asfdkjalsd f asdfjklsdf ', 13
);

--INSERTS maletas
INSERT INTO MALETA (
    dimension, peso, tipo, precio, categoria
) VALUES (
    '200 m3', '0', 'de mano', 50, 'primera_maleta'
), (
    '200 m3', '0', 'de mano', 75, 'segunda_maleta'
), (
    '200 m3', '0', 'de mano', 100, 'tercera_maleta'
), (
    '0', '50 libras', 'documentada', 50, 'primera_maleta'
), (
    '0', '50 libras', 'documentada', 75, 'segunda_maleta'
), (
    '0', '50 libras', 'documentada', 100, 'tercera_maleta'
);

--inserts peliculas
INSERT INTO PELICULA (
    nombre, descripcion, categoria, clasificacion, actores, precio, duracion, costo
) VALUES (
    'star wars', 'peli de ciencia ficcion', 'accion', 'todo publico', ARRAY['any', 'asdas', 'asdad'], 10, '2:00', 50
), (
    'star wars 2', 'peli de ciencia ficcion', 'accion', 'todo publico', ARRAY['any', 'asdas', 'asdad'], 10, '2:00', 50
), (
    'rambo 1', 'peli de guerra', 'accion', 'todo publico', ARRAY['any', 'asdas', 'asdad'], 10, '2:00', 50
), (
    'dragon ball z', 'caricatura de japon asd', 'comico', 'todo publico', ARRAY['any', 'asdas', 'asdad'], 10, '15:00', 50
), (
    'dragon ball gt', 'caricatura de japon asd', 'comico', 'todo publico', ARRAY['any', 'asdas', 'asdad'], 10, '7:00', 50
), (
    'dragon ball', 'caricatura de japon asd', 'comico', 'todo publico', ARRAY['any', 'asdas', 'asdad'], 10, '5:00', 50
), (
    'naruto', 'caricatura de japon asd', 'comico', 'todo publico', ARRAY['any', 'asdas', 'asdad'], 10, '12:00', 50
);

--inserts wifi
INSERT INTO WIFI (
    nombre, contrasena, precio
) VALUES (
    'wifi1', '12345', 10
), (
    'wifi2', '12345', 10
), (
    'wifi3', '12345', 10
), (
    'wifi4', '12345', 10
), (
    'wifi5', '12345', 10
), (
    'wifi6', '12345', 10
);

--inserts precio de vuelos segun clase
INSERT INTO PRECIO (
    precio, descuento, aumento, descripcion
) VALUES (
    500, 0, 0, 'dias normales primera clase niños'    
), (
    400, 0, 0, 'dias normales clase business niños'    
), (
    300, 0, 0, 'dias normales clase economica niños'    
), (
    200, 0, 0, 'dias normales clase economica basica niños'    
), (
    550, 0, 0, 'dias normales primera clase'    
), (
    450, 0, 0, 'dias normales clase business'    
), (
    350, 0, 0, 'dias normales clase economica'    
), (
    300, 0, 0, 'dias normales clase economica basica'    
), (
    500, 0, 25, 'dias agotados primera clase niños'    
), (
    400, 0, 22.50, 'dias agotados clase business niños'    
), (
    300, 0, 30, 'dias agotados clase economica niños'    
), (
    200, 0, 20, 'dias agotados clase economica basica niños'    
), (
    550, 0, 33, 'dias agotados primera clase'    
), (
    450, 0, 27, 'dias agotados clase business'    
), (
    350, 0, 35, 'dias agotados clase economica'    
), (
    300, 0, 30, 'dias agotados clase economica basica'    
); 

--inserts clases de vuelo
INSERT INTO CLASE (
    clase, tarifa_cambio, maleta_documentada, peso_md, maleta_mano, eleccion_asiento, aseguranza, porcentaje, id_precio
) VALUES (
    'primera-clase', '0', '2', '50 lbs', '1', '1', '1', '20', 1
), (
    'clase-business', '0', '2', '50 lbs', '1', '1', '1', '20', 2
), (
    'clase-economica', '0', '2', '50 lbs', '1', '1', '1', '20', 3
), (
    'clase-economica-basica', '0', '2', '50 lbs', '1', '1', '1', '20', 4
), (
    'primera-clase', '0', '2', '50 lbs', '1', '1', '1', '20', 5
), (
    'clase-business', '0', '2', '50 lbs', '1', '1', '1', '20', 6
), (
    'clase-economica', '0', '2', '50 lbs', '1', '1', '1', '20', 7
), (
    'clase-economica-basica', '0', '2', '50 lbs', '1', '1', '1', '20', 8
);


--insert plan de vuelos
INSERT INTO PLAN_VUELO (
    id_plan_vuelo, distancia_milla, hora_llegada, hora_salida, puerta_salida, puerta_llegada, aeropuerto_salida, aeropuerto_llegada, codigo_avion, es_temporal
) VALUES (
    'PV-0001', 10.5, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-001', '0'
), (
    'PV-0002', 10.5, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-001', '0'
), (
    'PV-0003', 3.5, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-001', '0'
), (
    'PV-0004', 20, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-002', '1'
), (
    'PV-0005', 20, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-002', '1'
), (
    'PV-0006', 20, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-003', '1'
), (
    'PV-0007', 20, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-003', '0'
), (
    'PV-0008', 20, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-003', '0'
), (
    'PV-0009', 20, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-004', '0'
), (
    'PV-0010', 20, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-004', '0'
), (
    'PV-0011', 20, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-005', '0'
), (
    'PV-0012', 20, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-005', '0'
), (
    'PV-0013', 20, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-005', '0'
), (
    'PV-0014', 20, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-005', '0'
), (
    'PV-0015', 20, '16:00', '12:00', 'P-001', 'P-004', 'la aurora', 'los altos', 'AV-006', '1'
);

--inserts dia vuelo
INSERT INTO DIA_VUELO (
    id_plan_vuelo, id
) VALUES (
    'PV-0001', 1
), (
    'PV-0001', 3
), (
    'PV-0001', 5
), (
    'PV-0001', 6
), (
    'PV-0002', 1
), (
    'PV-0002', 3
), (
    'PV-0002', 5
), (
    'PV-0003', 6
), (
    'PV-0003', 1
), (
    'PV-0004', 3
), (
    'PV-0004', 4
), (
    'PV-0004', 7
), (
    'PV-0005', 1
), (
    'PV-0005', 2
), (
    'PV-0006', 5
), (
    'PV-0007', 6
), (
    'PV-0008', 1
), (
    'PV-0009', 3
), (
    'PV-0010', 5
), (
    'PV-0011', 6
), (
    'PV-0012', 1
), (
    'PV-0013', 3
), (
    'PV-0014', 5
), (
    'PV-0015', 6
), (
    'PV-0011', 1
), (
    'PV-0010', 4
), (
    'PV-0009', 4
), (
    'PV-0012', 2
);

--inserts vuelo temporal
INSERT INTO VUELO_TEMPORAL (
    id_temporal, fecha_inicio, fecha_final, estado, id_plan_vuelo
) VALUES (
    'VT-0001', '01-04-2022', '29-04-2022', '0', 'PV-0004'
), (
    'VT-0002', '01-04-2022', '29-04-2022', '0', 'PV-0005'
), (
    'VT-0003', '01-05-2022', '29-05-2022', '1', 'PV-0006'
), (
    'VT-0004', '17-05-2022', '18-06-2022', '1', 'PV-0015'
); 

--inserts vuelos
INSERT INTO VUELO (
    boletos_vendido, estado_vuelo, id_dia, fecha, id_plan_vuelo
) VALUES (
    20, 'cancelado', 1, '20-04-2022', 'PV-0001'
), (
    50, 'completado', 3, '20-04-2022', 'PV-0001'
), (
    10, 'retrasado', 4, '20-04-2022', 'PV-0004'
), (
    5, 'completado', 3, '20-04-2022', 'PV-0002'
), (
    10, 'completado', 7, '20-04-2022', 'PV-0004'
), (
    5, 'retrasado', 5, '20-04-2022', 'PV-0010'
), (
    20, 'retrasado', 1, '20-03-2022', 'PV-0001'
), (
    50, 'completado', 3, '20-03-2022', 'PV-0001'
), (
    10, 'retrasado', 4, '20-03-2022', 'PV-0004'
), (
    5, 'completado', 3, '20-02-2022', 'PV-0002'
), (
    10, 'retrasado', 7, '20-02-2022', 'PV-0004'
), (
    5, 'pendiente', 5, '20-01-2022', 'PV-0010'
);


--inserts control vuelo
INSERT INTO CONTROL_VUELO (
    estado, hora, codigo_vuelo
) VALUES (
    'despegue', '8:00', 1
), (
    'en ruta CA-2', '9:00', 1
), (
    'en ruta CA-22', '10:00', 1
), (
    'despegue', '8:00', 2
), (
    'en ruta CA-2', '9:00', 2
), (
    'en ruta CA-22', '10:00', 2
), (
    'aterrizo', '12:00', 2
), (
    'despegue', '19:00', 3
), (
    'en ruta CA-22', '20:00', 3
);

--inserts boleto
INSERT INTO BOLETO (
    id_boleto, asiento_asignado, aseguranza, es_ida_vuelta, total_pago, descuento, aumento, codigo_vuelo
) VALUES (
    'CB-000001', 'A-1', '0', '0', 550, 0, 0, 1
), (
    'CB-000002', 'A-2', '0', '0', 550, 0, 0, 1
), (
    'CB-000003', 'A-3', '0', '0', 550, 0, 0, 1
), (
    'CB-000004', 'A-4', '0', '0', 550, 0, 0, 1
), (
    'CB-000005', 'A-5', '0', '0', 550, 0, 0, 1
), (
    'CB-000006', 'K-1', '1', '0', 550, 0, 110, 1
), (
    'CB-000007', 'C-1', '1', '0', 550, 0, 110, 1
), (
    'CB-000008', 'A-1', '0', '0', 550, 0, 0, 2
), (
    'CB-000009', 'A-2', '0', '0', 550, 0, 0, 2
), (
    'CB-000010', 'A-3', '0', '0', 550, 0, 0, 2
), (
    'CB-000011', 'A-4', '0', '0', 500, 0, 0, 2
), (
    'CB-000012', 'M-5', '0', '0', 300, 0, 0, 2
), (
    'CB-000013', 'C-1', '1', '0', 550, 0, 110, 2
), (
    'CB-000014', 'B-1', '0', '0', 450, 0, 0, 2
), (
    'CB-000015', 'A-1', '0', '0', 550, 0, 0, 3
), (
    'CB-000016', 'A-2', '0', '0', 550, 0, 0, 3
), (
    'CB-000017', 'A-3', '0', '0', 550, 0, 0, 3
), (
    'CB-000018', 'A-4', '0', '0', 550, 0, 0, 3
), (
    'CB-000019', 'A-5', '0', '0', 550, 0, 0, 3
), (
    'CB-000020', 'K-1', '1', '0', 550, 0, 110, 3
), (
    'CB-000021', 'C-1', '1', '0', 550, 0, 110, 3
), (
    'CB-000022', 'A-1', '0', '0', 550, 0, 0, 4
), (
    'CB-000023', 'A-2', '0', '0', 550, 0, 0, 4
), (
    'CB-000024', 'A-3', '0', '0', 550, 0, 0, 4
), (
    'CB-000025', 'A-4', '0', '0', 500, 0, 0, 4
), (
    'CB-000026', 'M-5', '0', '0', 450, 0, 0, 4
), (
    'CB-000027', 'L-1', '1', '0', 550, 0, 110, 4
), (
    'CB-000028', 'B-1', '0', '0', 300, 0, 0, 4
);

--inserts clase del boleto
INSERT INTO CLASE_BOLETO (
    es_nino, clase, id_boleto, id_precio
) VALUES (
    '0', 'primera-clase', 'CB-000001', 5
), (
    '0', 'primera-clase', 'CB-000002', 5
), (
    '0', 'primera-clase', 'CB-000003', 5
), (
    '0', 'primera-clase', 'CB-000004', 5
), (
    '0', 'primera-clase', 'CB-000005', 5
), (
    '0', 'primera-clase', 'CB-000006', 5
), (
    '0', 'primera-clase', 'CB-000007', 5
), (
    '0', 'primera-clase', 'CB-000008', 5
), (
    '0', 'primera-clase', 'CB-000009', 5
), (
    '0', 'primera-clase', 'CB-000010', 5
), (
    '1', 'primera-clase', 'CB-000011', 5
), (
    '0', 'clase-economica-basica', 'CB-000012', 8
), (
    '0', 'primera-clase', 'CB-000013', 5
), (
    '0', 'clase-business', 'CB-000014', 6
), (
    '0', 'primera-clase', 'CB-000015', 5
), (
    '0', 'primera-clase', 'CB-000016', 5
), (
    '0', 'primera-clase', 'CB-000017', 5
), (
    '0', 'primera-clase', 'CB-000018', 5
), (
    '0', 'primera-clase', 'CB-000019', 5
), (
    '0', 'primera-clase', 'CB-000020', 5
), (
    '0', 'primera-clase', 'CB-000021', 5
), (
    '0', 'primera-clase', 'CB-000022', 5
), (
    '1', 'primera-clase', 'CB-000023', 5
), (
    '0', 'primera-clase', 'CB-000024', 5
), (
    '0', 'clase-economica-basica', 'CB-000025', 8
), (
    '0', 'clase-business', 'CB-000026', 6
), (
    '0', 'primera-clase', 'CB-000027', 5
), (
    '0', 'clase-economica', 'CB-000028', 7
);

--inserts
INSERT INTO COMPRADOR (
    identificacion, nombre, telefono, correo
) VALUES (
    '111110111111', 'Juan sdfs', '122232344', 'fasdfsa@adslfs.com' 
), (
    '111110222222', 'Pedro sdfs', '122232344', 'fasdfsa@adslfs.com' 
), (
    '111110333333', 'Rosario sdfs', '122232344', 'fasdfsa@adslfs.com' 
), (
    '111110444444', 'Lucia sdfs', '122232344', 'fasdfsa@adslfs.com' 
), (
    '111110555555', 'Faustina sdfs', '122232344', 'fasdfsa@adslfs.com' 
), (
    '111110666666', 'Lola sdfs', '122232344', 'fasdfsa@adslfs.com'
);

--inserts personal abordo
INSERT INTO PERSONAL_ABORDO (
    puesto, comision, codigo_vuelo, codigo_empleado
) VALUES (
    'piloto', '300', 1, 'EE-003'
), (
    'piloto', '200', 2, 'EE-006'
), (
    'asafata', '200', 2, 'EE-001'
), (
    'asafata', '200', 2, 'EE-002'
), (
    'asafata', '200', 2, 'EE-003'
), (
    'asafata', '200', 2, 'EE-011'
), (
    'piloto', '300', 3, 'EE-009'
), (
    'asafata', '200', 3, 'EE-001'
), (
    'asafata', '200', 3, 'EE-011'
), (
    'asafata', '200', 3, 'EE-010'
), (
    'asafata', '200', 3, 'EE-007'
);


--inserts pasajeros
INSERT INTO PASAJERO (
    identificacion, nombre, birthday, nacionalidad, genero, telefono, correo
) VALUES (
    '1111111111', 'Estrella Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111112', 'Esmeralda Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111113', 'Fernando isa', '12-12-2010', 'Guatemala', 'Masculilno', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111114', 'Jorge Luna', '12-12-2010', 'Guatemala', 'Masculino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111115', 'Estiven Luna', '12-12-2010', 'Guatemala', 'Masculino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111116', 'Simoneta Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111117', 'Karonlina Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111118', 'Rodrigo Luna', '12-12-2010', 'Guatemala', 'Masculino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111119', 'Kamila Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111110', 'Paola Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111011', 'Karolina isa', '12-12-2010', 'Guatemala', 'Masculilno', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111012', 'Juan Luna', '12-12-2010', 'Guatemala', 'Masculino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111013', 'Vinicio Luna', '12-12-2010', 'Guatemala', 'Masculino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111014', 'Carlos Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111015', 'Xiomara Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111016', 'Martin Luna', '12-12-2010', 'Guatemala', 'Masculino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111017', 'Jose Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111018', 'Angela Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111019', 'Gabriela isa', '12-12-2010', 'Guatemala', 'Masculilno', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111020', 'Daniel Luna', '12-12-2010', 'Guatemala', 'Masculino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111021', 'Byron Luna', '12-12-2010', 'Guatemala', 'Masculino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111022', 'Damaris Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111023', 'Kevin Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111024', 'Ericka Luna', '12-12-2010', 'Guatemala', 'Masculino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111025', 'Lesly Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111026', 'Claudia Luna', '12-12-2010', 'Guatemala', 'Femenino', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111027', 'Osvaldo isa', '12-12-2010', 'Guatemala', 'Masculilno', '12342123', 'asdlasd12@afdsa.com'
), (
    '1111111028', 'Luis Luna', '12-12-2010', 'Guatemala', 'Masculino', '12342123', 'asdlasd12@afdsa.com'
);


--inserts compra
INSERT INTO COMPRA (
    codigo_compra, identificacion, fecha_compra, fecha_cancelacion, fecha_modificacion
) VALUES (
    'CC-000001', '111110111111', '01-04-2022', null, null
), (
    'CC-000002', '111110222222', '05-04-2022', null, null
), (
    'CC-000003', '111110222222', '07-04-2022', null, null
), (
    'CC-000004', '111110333333', '10-04-2022', null, null
), (
    'CC-000005', '111110444444', '10-04-2022', null, null
), (
    'CC-000006', '111110444444', '15-04-2022', null, null
), (
    'CC-000007', '111110444444', '18-04-2022', null, null
), (
    'CC-000008', '111110555555', '18-04-2022', null, null
), (
    'CC-000009', '111110666666', '20-04-2022', null, null
);

--inserts los metodos de pago del comprador
INSERT INTO PAGO_COMPRADOR (
    descripcion, id_pago, codigo_compra
) VALUES (
    'se pago el 25% del total ', 1, 'CC-000001'
), (
    'se pago el 75% del total ', 2, 'CC-000001'
), (
    'se pago el 50% del total ', 2, 'CC-000002'
), (
    'se pago el 50% del total ', 3, 'CC-000002'
), (
    'se pago el 100% del total ', 4, 'CC-000003'
), (
    'se pago el 95% del total ', 1, 'CC-000004'
), (
    'se pago el 5% del total ', 4, 'CC-000004'
), (
    'se pago el 100% del total ', 3, 'CC-000005'
), (
    'se pago el 100% del total ', 1, 'CC-000006'
), (
    'se pago el 100% del total ', 2, 'CC-000007'
), (
    'se pago el 100% del total ', 1, 'CC-000008'
), (
    'se pago el 10% del total ', 1, 'CC-000009'
), (
    'se pago el 20% del total ', 2, 'CC-000009'
), (
    'se pago el 70% del total ', 4, 'CC-000009'
);

--inserts encuestas respondidas sobre el servicio
INSERT INTO ENCUESTA_SERVICIO (
    vuelo_general, servicio_tripulante, comida, nota_adicional
) VALUES (
    5, 4, 3, 'adsas flsadf assf  ad ad a d ad'
), (
    5, 5, 3, 'adsas flsadf assf  ad ad a d ad'
), (
    5, 4, 5, 'adsas flsadf assf  ad ad a d ad'
), (
    5, 5, 5, 'adsas flsadf assf  ad ad a d ad'
), (
    4, 4, 3, 'adsas flsadf assf  ad ad a d ad'
), (
    3, 4, 5, 'adsas flsadf assf  ad ad a d ad'
), (
    5, 4, 5, 'adsas flsadf assf  ad ad a d ad'
), (
    5, 2, 2, 'adsas flsadf assf  ad ad a d ad'
), (
    5, 5, 3, 'adsas flsadf assf  ad ad a d ad'
), (
    5, 5, 4, 'adsas flsadf assf  ad ad a d ad'
), (
    5, 5, 5, 'adsas flsadf assf  ad ad a d ad'
), (
    5, 5, 5, 'adsas flsadf assf  ad ad a d ad'
), (
    5, 5, 5, 'adsas flsadf assf  ad ad a d ad'
), (
    5, 5, 5, 'adsas flsadf assf  ad ad a d ad'
), (
    4, 5, 5, 'adsas flsadf assf  ad ad a d ad'
);

-- iserts el boleto del pasajero 
INSERT INTO BOLETO_PASAJERO (
    id_boleto, identificacion, id_encuesta, codigo_compra
) VALUES (
    'CB-000001', '1111111111', 1, 'CC-000001'
), (
    'CB-000002', '1111111112', null, 'CC-000001'
), (
    'CB-000003', '1111111113', 2, 'CC-000001'
), (
    'CB-000004', '1111111114', 3, 'CC-000002'
), (
    'CB-000005', '1111111115', 4, 'CC-000003'
), (
    'CB-000006', '1111111116', 5, 'CC-000003'
), (
    'CB-000007', '1111111117', 6, 'CC-000003'
), (
    'CB-000008', '1111111118', 7, 'CC-000004'
), (
    'CB-000009', '1111111119', null, 'CC-000004'
), (
    'CB-000010', '1111111110', null, 'CC-000004'
), (
    'CB-000011', '1111111011', null, 'CC-000004'
), (
    'CB-000012', '1111111012', 8, 'CC-000005'
), (
    'CB-000013', '1111111013', 9, 'CC-000005'
), (
    'CB-000014', '1111111014', 10, 'CC-000006'
), (
    'CB-000015', '1111111015', 11, 'CC-000007'
), (
    'CB-000016', '1111111016', null, 'CC-000007'
), (
    'CB-000017', '1111111017', 12, 'CC-000007'
), (
    'CB-000018', '1111111018', null, 'CC-000007'
), (
    'CB-000019', '1111111019', null, 'CC-000007'
), (
    'CB-000020', '1111111020', 13, 'CC-000007'
), (
    'CB-000021', '1111111021', 14, 'CC-000007'
), (
    'CB-000022', '1111111022', null, 'CC-000008'
), (
    'CB-000023', '1111111023', null, 'CC-000008'
), (
    'CB-000024', '1111111024', null, 'CC-000008'
), (
    'CB-000025', '1111111025', null, 'CC-000008'
), (
    'CB-000026', '1111111026', null, 'CC-000008'
), (
    'CB-000027', '1111111027', null, 'CC-000008'
), (
    'CB-000028', '1111111028', 15, 'CC-000009'
);


--inserts supervisores
INSERT INTO SUPERVISOR (
    id_boleto, id
) VALUES (
    'CB-000006', 3
), (
    'CB-000007', 3
), (
    'CB-000013', 5
), (
    'CB-000020', 5
), (
    'CB-000021', 8
), (
    'CB-000027', 8
);

--inserts mascotas y sus vacunas
INSERT INTO MASCOTA (
    nombre, certificado_veterinario, especie, descripcion, peso, tipo, jaula, id_boleto
) VALUES (
    'pinki', '0001', 'mamifero', 'asdfas dfa sf', '5 kg', 'gato', '20cm3', 'CB-000001'
), (
    'lanky', '0002', 'afsdf', 'asdfas dfa sf', '5 kg', 'gato', '20cm3', 'CB-000001'
), (
    'firulais', '0003', 'ofnifero', 'asdfas dfa sf', '5 kg', 'rata', '20cm3', 'CB-000001'
), (
    'kalili', '0004', 'mamifero', 'asdfas dfa sf', '5 kg', 'perrita', '20cm3', 'CB-000001'
), (
    'mily', '0005', 'mamifero', 'asdfas dfa sf', '5 kg', 'gatita', '20cm3', 'CB-000001'
);

INSERT INTO LISTA_VACUNA (
    vacuna, certificado_veterinario, nombre
) VALUES (
    'contra el sarampion', '0001', 'pinki'
), (
    'contra el sarampion', '0002', 'lanky'
), (
    'contra las garapatas', '0003', 'firulais'
), (
    'contra el sarampion', '0004', 'kalili'
), (
    'contra el sarampion', '0005', 'mily'
);

--inserts peliculas alquiladas
INSERT INTO ALQUILA_PELICULA (
    precio, id_pelicula, id_boleto
) VALUES (
    0, 1, 'CB-000001'
), (
    50, 2, 'CB-000001'
), (
    50, 3, 'CB-000001'
), (
    0, 1, 'CB-000002'
), (
    0, 2, 'CB-000003'
), (
    50, 7, 'CB-000012'
), (
    0, 1, 'CB-000015'
), (
    50, 2, 'CB-000015'
), (
    50, 3, 'CB-000026'
), (
    50, 1, 'CB-000026'
), (
    0, 2, 'CB-000027'
), (
    50, 7, 'CB-000028'
);

INSERT INTO PAGO_PELICULA (
    descripcion, id_pago, id_compra
) VALUES (
    'adasdfaasd fasd', 1, 13
), (
    'adasdfaasd fasd', 1, 14
), (
    'adasdfaasd fasd', 2, 15
), (
    'adasdfaasd fasd', 3, 15
), (
    'adasdfaasd fasd', 3, 17
), (
    'adasdfaasd fasd', 1, 18
), (
    'adasdfaasd fasd', 2, 19
), (
    'adasdfaasd fasd', 2, 20
), (
    'adasdfaasd fasd', 4, 21
), (
    'adasdfaasd fasd', 4, 22
), (
    'adasdfaasd fasd', 1, 23
), (
    'adasdfaasd fasd', 3, 24
);

--inserts menus adquiridos
INSERT INTO COMPRA_MENU (
    precio, id_menu, id_boleto
) VALUES (
    0, 1, 'CB-000001'
), (
    5, 2, 'CB-000001'
), (
    5, 3, 'CB-000006'
), (
    0, 13, 'CB-000002'
), (
    0, 2, 'CB-000003'
), (
    5, 7, 'CB-000012'
), (
    0, 14, 'CB-000015'
), (
    4, 6, 'CB-000015'
), (
    5, 9, 'CB-000026'
), (
    3, 10, 'CB-000026'
), (
    0, 14, 'CB-000027'
), (
    5, 18, 'CB-000028'
);

INSERT INTO PAGO_MENU (
    descripcion, id_pago, id_compra
) VALUES (
    'adasdfaasd fasd', 1, 13
), (
    'adasdfaasd fasd', 1, 14
), (
    'adasdfaasd fasd', 2, 15
), (
    'adasdfaasd fasd', 3, 16
), (
    'adasdfaasd fasd', 3, 17
), (
    'adasdfaasd fasd', 1, 18
), (
    'adasdfaasd fasd', 2, 19
), (
    'adasdfaasd fasd', 2, 20
), (
    'adasdfaasd fasd', 4, 21
), (
    'adasdfaasd fasd', 4, 22
), (
    'adasdfaasd fasd', 1, 23
), (
    'adasdfaasd fasd', 3, 24
);

--inserts de wifi
INSERT INTO COMPRA_WFI (
    precio, id_wifi, id_boleto
) VALUES (
    10, 1, 'CB-000001'
), (
    10, 2, 'CB-000004'
), (
    10, 3, 'CB-000006'
), (
    10, 5, 'CB-000002'
), (
    10, 2, 'CB-000003'
), (
    10, 3, 'CB-000012'
), (
    10, 5, 'CB-000015'
), (
    10, 6, 'CB-000020'
), (
    10, 4, 'CB-000026'
), (
    10, 1, 'CB-000022'
), (
    10, 3, 'CB-000027'
), (
    10, 2, 'CB-000028'
);

INSERT INTO PAGO_WIFI (
    descripcion, id_pago, id_compra
) VALUES (
    'adasdfaasd fasd', 1, 37
), (
    'adasdfaasd fasd', 1, 38
), (
    'adasdfaasd fasd', 2, 39
), (
    'adasdfaasd fasd', 3, 40
), (
    'adasdfaasd fasd', 3, 41
), (
    'adasdfaasd fasd', 1, 42
), (
    'adasdfaasd fasd', 2, 43
), (
    'adasdfaasd fasd', 2, 44
), (
    'adasdfaasd fasd', 4, 45
), (
    'adasdfaasd fasd', 4, 46
), (
    'adasdfaasd fasd', 1, 47
), (
    'adasdfaasd fasd', 3, 48
);

--inserts historial de maletas de los vuelos
INSERT INTO MALETA_HISTORIAL (
    peso, tipo, precio, id_boleto, dimension, categoria_numero, id_maleta
) VALUES (
    '0', 'de mano', 0, 'CB-000001', '10', 'primera maleta gratis', 1
), (
    '0', 'de mano', 0, 'CB-000002', '10', 'primera maleta', 1
), (
    '0', 'de mano', 0, 'CB-000003', '10', 'primera maleta', 1
), (
    '0', 'de mano', 50, 'CB-000001', '10', 'primera maleta pagado', 1
), (
    '0', 'de mano', 75, 'CB-000001', '10', 'primera maleta', 2
), (
    '50', 'documentado', 50, 'CB-000004', '0', 'primera maleta', 1
), (
    '50', 'documentado', 75, 'CB-000004', '0', 'segunda maleta', 1
), (
    '0', 'documentado', 0, 'CB-000005', '10', 'primera maleta', 1
), (
    '0', 'de mano', 0, 'CB-000009', '10', 'primera maleta', 1
), (
    '50', 'documentado', 50, 'CB-000010', '0', 'primera maleta ', 1
), (
    '50', 'docuemtado', 50, 'CB-000015', '0', 'primera maleta', 2
), (
    '50', 'documentado', 50, 'CB-000024', '0', 'primera maleta', 1
);


