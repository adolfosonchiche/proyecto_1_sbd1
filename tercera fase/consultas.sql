---Identificar los 3 planes de vuelos con mayor porcentaje de boletos comprados por
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



--Identificar los 3 pilotos de vuelos con mayor número de millas y las comisiones
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










