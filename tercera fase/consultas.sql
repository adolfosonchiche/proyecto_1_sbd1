--1-Identificar los 3 planes de vuelos con mayor porcentaje de boletos comprados por
---boletos disponibles en un lapso de tiempo.

SELECT * FROM PLAN_VUELO;
SELECT * FROM BOLETO;
SELECT * FROM VUELO;

SELECT p.id_plan_vuelo, p.codigo_avion, p.distancia_milla,
    v.boletos_vendido AS boleto_disponible, b.codigo_vuelo,
    COUNT(b.codigo_vuelo) AS boletoss
FROM PLAN_VUELO AS p 
JOIN VUELO AS v ON  p.id_plan_vuelo = v.id_plan_vuelo 
    AND v.fecha > '29-03-2022' AND v.fecha < '21-04-2022'
JOIN BOLETO AS b 
ON v.codigo_vuelo = b.codigo_vuelo 
GROUP BY p.id_plan_vuelo,
    v.boletos_vendido, b.codigo_vuelo 
ORDER BY boleto_disponible ASC  
LIMIT 3;



--2--Identificar los 3 pilotos de vuelos con mayor número de millas y las comisiones
--ganadas por el piloto en un lapso de tiempo. Se debe adjuntar el número de vuelos.
SELECT * FROM EMPLEADO;
SELECT * FROM PERSONAL_ABORDO;
SELECT * FROM VUELO;
SELECT * FROM PLAN_VUELO;

SELECT p.codigo_empleado, COUNT(p.codigo_empleado) AS piloto, SUM(p.comision) AS comision_total, 
    p.codigo_vuelo, e.nombre AS nombre_piloto,  v.id_plan_vuelo, pp.distancia_milla
FROM PERSONAL_ABORDO AS p 
JOIN EMPLEADO e 
    ON e.codigo_empleado = p.codigo_empleado AND p.puesto = 'piloto'
JOIN VUELO v 
    ON v.codigo_vuelo = p.codigo_vuelo AND v.fecha BETWEEN '29-03-2022' AND '21-04-2022'
JOIN PLAN_VUELO pp 
    ON pp.id_plan_vuelo = v.id_plan_vuelo
GROUP BY p.codigo_empleado, p.comision, p.codigo_vuelo,
    e.nombre,  v.id_plan_vuelo, pp.distancia_milla
ORDER BY pp.distancia_milla DESC
LIMIT 3;



--3--Obtener los ingresos monetarios de todos los planes de vuelos vigentes en un lapso
--de tiempo. Se debe adjuntar el número de vuelos.
SELECT * FROM PLAN_VUELO;
SELECT * FROM VUELO;
SELECT * FROM BOLETO;



CREATE VIEW VIEW_INGREO_VUELO AS
SELECT v.id_plan_vuelo, v.codigo_vuelo, COUNT(b.codigo_vuelo) AS boletos,  SUM(b.total_pago) AS total_ingreso
FROM VUELO AS v JOIN BOLETO AS b 
ON v.codigo_vuelo = b.codigo_vuelo
GROUP BY v.id_plan_vuelo, v.codigo_vuelo, b.codigo_vuelo;


SELECT iv.id_plan_vuelo, COUNT(iv.id_plan_vuelo) AS numero_vuelo, SUM(iv.total_ingreso) AS total_ingreso
FROM VIEW_INGREO_VUELO AS iv
GROUP BY iv.id_plan_vuelo
ORDER BY total_ingreso DESC;


--4--Obtener el tipo de avión que genera más ingresos en compras a bordo. Se debe
--obtener un promedio por vuelo de las ganancias de wifi, películas y comida en un
--intervalo de vuelo. Se debe adjuntar el número de vuelos.
SELECT * FROM AVION;






--5--Obtener el total de gastos en un intervalo de tiempo que incluya gastos en
--empleados, comisiones y productos a bordo.


CREATE FUNCTION total_gastos() 
RETURNS DECIMAL(10,2) 
AS $$
BEGIN
    RETURN (
            (
                SELECT SUM(saldo) FROM HORARIO_EMPLEADO WHERE fecha BETWEEN '01-04-2022'AND '30-04-2022'
            )
            +
            (
                SELECT SUM(comision) FROM HORARIO_EMPLEADO WHERE fecha BETWEEN '01-04-2022'AND '30-04-2022'
            )
            +
            (
                SELECT SUM(costo) FROM MENU
            )
            +
            (
                SELECT SUM(costo) FROM PELICULA
            )
    ) ;
END ;
$$ LANGUAGE plpgsql;

SELECT total_gastos();


--6--Obtener una lista de planes de vuelo y mostrar el numero de veces que los vuelos
--de cada plan de vuelo han sido registrados como retrasado y el numero de veces
--cancelados en un intervalo de tiempo
SELECT * FROM PLAN_VUELO;
SELECT * FROM VUELO;


CREATE FUNCTION vuelos_cancelados(
    plan_vuelo VARCHAR,
    fecha_inicio DATE,
    fecha_final DATE
    ) 
RETURNS INTEGER 
AS $$
BEGIN
RETURN (
SELECT COUNT(*) FROM VUELO v 
        WHERE v.estado_vuelo = 'cancelado' AND v.id_plan_vuelo = plan_vuelo AND v.fecha BETWEEN fecha_inicio AND fecha_final
       ) ;
END ;
$$ LANGUAGE plpgsql;


CREATE FUNCTION vuelos_retrasados(
    plan_vuelo VARCHAR,
    fecha_inicio DATE,
    fecha_final DATE
    ) 
RETURNS INTEGER 
AS $$
BEGIN
RETURN (
SELECT COUNT(*) FROM VUELO v 
        WHERE v.estado_vuelo = 'retrasado' AND v.id_plan_vuelo = plan_vuelo AND v.fecha BETWEEN fecha_inicio AND fecha_final
       ) ;
END ;
$$ LANGUAGE plpgsql;




SELECT p.id_plan_vuelo,
    vuelos_cancelados(p.id_plan_vuelo, '01-04-2022', '30-04-2022') AS numero_cancelado,
    vuelos_retrasados(p.id_plan_vuelo, '01-04-2022', '30-04-2022') AS numero_retrasado
FROM PLAN_VUELO AS p 
ORDER BY p.id_plan_vuelo;


--7--Sumatoria de equipaje para un vuelo en específico, total de pagos para el equipaje,
--total de maletas gratis gracias a un beneficio y el número de pasajeros. cambiar codigo_vuelo
SELECT * FROM MALETA;
SELECT * FROM BOLETO;
SELECT * FROM MALETA_HISTORIAL;


CREATE FUNCTION numero_maletas_gratis(
    vuelo INTEGER
    ) 
RETURNS INTEGER 
AS $$
BEGIN
RETURN (
            SELECT COUNT(h.precio) 
            FROM MALETA_HISTORIAL AS h 
            JOIN BOLETO AS bb ON h.precio = 0 AND h.id_boleto = bb.id_boleto AND bb.codigo_vuelo = vuelo 
            GROUP BY bb.codigo_vuelo
       ) ;
END ;
$$ LANGUAGE plpgsql;

CREATE FUNCTION total_pagos_maletas(
    vuelo INTEGER
    ) 
RETURNS DECIMAL(10,2) 
AS $$
BEGIN
RETURN (
            SELECT SUM(h.precio) 
            FROM MALETA_HISTORIAL AS h 
            JOIN BOLETO AS bb ON h.precio > 0 AND h.id_boleto = bb.id_boleto AND bb.codigo_vuelo = vuelo 
            GROUP BY bb.codigo_vuelo
       ) ;
END ;
$$ LANGUAGE plpgsql;


SELECT COUNT(b.id_boleto) AS numero_pasajeros, 
    numero_maletas_gratis(1) AS maletas_gratis,
    total_pagos_maletas(1) AS total_pago_equipaje
FROM BOLETO AS b 
    WHERE b.codigo_vuelo = 1
;


--8---Reporte de empleados que indique el nombre del empleado, puesto, horas
--trabajadas, horas de vacaciones, horas de ausentes, comisiones ganadas y sueldo
--ganado en un mes
SELECT * FROM HORARIO_EMPLEADO;
SELECT * FROM EMPLEADO;
SELECT * FROM PERSONAL_ABORDO;

SELECT e.codigo_empleado, e.nombre, 
    (
     ((
       SELECT h.hora_termino FROM HORARIO_EMPLEADO AS h 
       WHERE h.codigo_empleado = e.codigo_empleado AND h.fecha BETWEEN '01-04-2022'AND '30-04-2022' LIMIT 1  
     ) -
     (
         SELECT h.hora_inicio FROM HORARIO_EMPLEADO AS h 
         WHERE h.codigo_empleado = e.codigo_empleado AND h.fecha BETWEEN '01-04-2022'AND '30-04-2022' LIMIT 1
     ))*30
    ) AS horas_trabajo,
    ((
        SELECT SUM(saldo) FROM HORARIO_EMPLEADO AS h 
        WHERE h.codigo_empleado = e.codigo_empleado AND h.fecha BETWEEN '01-04-2022'AND '30-04-2022'
     ) +
     (
        SELECT SUM(comision) FROM HORARIO_EMPLEADO AS h 
        WHERE h.codigo_empleado = e.codigo_empleado AND h.fecha BETWEEN '01-04-2022'AND '30-04-2022'
     )
    ) AS sueldo_mensual,
    (
        SELECT SUM(comision) FROM PERSONAL_ABORDO AS pe 
        WHERE pe.codigo_empleado = e.codigo_empleado
    ) AS comision_mes
FROM EMPLEADO AS e;





--9--Top 5 de modelos de avión que más vuelos completados tienen, la consulta debe
--incluir el modelo, número de vuelos, fecha de primer y último vuelo.
SELECT * FROM PLAN_VUELO;
SELECT * FROM VUELO;
SELECT * FROM AVION;


SELECT a.codigo_avion, a.tipo_avion AS modelo, a.fecha_primer_vuelo,
    (
        SELECT COUNT(v.id_plan_vuelo) 
        FROM VUELO AS v 
        JOIN PLAN_VUELO AS p 
        ON v.id_plan_vuelo = p.id_plan_vuelo AND p.codigo_avion = a.codigo_avion AND v.estado_vuelo = 'completado'
    ) AS numero_vuelos,
    (
        SELECT fecha 
        FROM VUELO AS vv 
        JOIN PLAN_VUELO AS pp 
        ON vv.id_plan_vuelo = pp.id_plan_vuelo AND pp.codigo_avion = a.codigo_avion AND vv.estado_vuelo = 'completado' 
        ORDER BY vv.fecha DESC LIMIT 1
    ) AS fecha_ultimo_vuelo
FROM AVION AS a 
ORDER BY numero_vuelos DESC
LIMIT 5;


--10--Reporte de empleados que han tenido niños a cargo, indicando el nombre del
--empleado, número de niños, fecha de inicio de labores en la aerolínea, número de
--vuelos realizados y promedio de niños por vuelo.
SELECT * FROM EMPLEADO;
SELECT * FROM PERSONAL_ABORDO;
SELECT * FROM SUPERVISOR;


SELECT e.nombre, e.fecha_inicio AS fecha_inicio_labores, pe.codigo_empleado,  
    (
        SELECT COUNT(p.codigo_empleado) 
        FROM PERSONAL_ABORDO AS p 
        WHERE p.codigo_empleado = e.codigo_empleado
    ) AS numero_vuelos,
    (
        SELECT COUNT(ss.id) 
        FROM SUPERVISOR AS ss
        JOIN PERSONAL_ABORDO AS pp 
        ON pp.codigo_empleado = e.codigo_empleado AND ss.id = pp.id
    ) AS numero_ninios
FROM EMPLEADO AS e
JOIN PERSONAL_ABORDO AS pe 
ON pe.codigo_empleado = e.codigo_empleado
JOIN SUPERVISOR AS se 
ON se.id = pe.id 
GROUP BY pe.codigo_empleado, e.nombre, e.fecha_inicio, numero_vuelos, numero_ninios;

