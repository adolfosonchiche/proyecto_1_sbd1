1. Identificar los 3 planes de vuelos con mayor porcentaje de boletos comprados por boletos disponibles en un lapso de tiempo. 


SELECT  P.codigo_vuelo,count(B.codigo_vuelo_Plan_Vuelo), P.capacidad,  
ROUND((
    ROUND( (select count(PP.capacidad) from aerolinea.plan_vuelo PP WHERE PP.codigo_vuelo=P.codigo_vuelo) , 2) /
    ROUND((SELECT count(BOL.codigo_boleto) FROM aerolinea.boleto BOL WHERE BOL.codigo_vuelo_Plan_Vuelo=P.codigo_vuelo),2))*100 , 2) As Porcentaje
FROM aerolinea.plan_vuelo P
INNER JOIN aerolinea.boleto B
ON P.codigo_vuelo = B.codigo_vuelo_Plan_Vuelo Group By P.codigo_vuelo




2. Identificar los 3 pilotos de vuelos con mayor número de millas y las comisiones ganadas por el piloto en un lapso de tiempo. Se debe adjuntar el número de vuelos. 

SELECT  E.nombre as Nombre_Piloto, sum(V.distancia) as Distancia_Recorrida, count(P.codigo_vuelo_Vuelo) As Cantidad_Vuelos
FROM aerolinea.vuelo V
INNER JOIN aerolinea.plan_vuelo Plan
ON Plan.codigo_vuelo= V.codigo_vuelo_Plan_Vuelo
INNER JOIN aerolinea.personal_abordo P
ON V.codigo_vuelo=P.codigo_vuelo_Vuelo
INNER JOIN aerolinea.empleado E
ON E.id_empleado= P.id_empleado_Empleado AND  E.cargo='PILOTO'
WHERE Plan.fecha_vuelo BETWEEN '2019-05-05' AND '2023-05-29'
GROUP BY E.id_empleado ORDER BY Distancia_Recorrida Desc limit 3










3. Obtener los ingresos monetarios de todos los planes de vuelos vigentes en un lapso de tiempo. Se debe adjuntar el número de vuelos. 


SELECT  P.codigo_vuelo, sum(D.precio), count (V.codigo_vuelo_Plan_Vuelo) as TotalVuelos
FROM aerolinea.detalle_boleto D
INNER JOIN aerolinea.boleto B
ON D.codigo_boleto_Boleto=B.codigo_boleto
INNER JOIN aerolinea.plan_vuelo P
ON P.codigo_vuelo = B.codigo_vuelo_Plan_Vuelo
INNER JOIN aerolinea.vuelo V
ON P.codigo_vuelo=V.codigo_vuelo_Plan_Vuelo WHERE P.fecha_vuelo BETWEEN '2018-05-05' AND '2022-05-29' GROUP BY P.codigo_vuelo
 





4. Obtener el tipo de avión que genera más ingresos en compras a bordo. 

Se debe obtener un promedio por vuelo de las ganancias de wifi, películas y comida en un intervalo de vuelo.Se debe adjuntar el número de vuelos. 

SELECT A.codigo,A.tipo,A.modelo, sum(DC.precio) As Venta_Abordo,
(SELECT count(V.codigo_vuelo) from aerolinea.vuelo V WHERE V.codigo_Avion=A.codigo) As CantidadVuelos
FROM aerolinea.avion A
INNER JOIN aerolinea.compra_abordo CA
ON A.codigo=CA.codigo_Avion
INNER JOIN aerolinea.detalle_compra DC
ON DC.id_Compra_Abordo=CA.id Group By A.codigo Order By Venta_Abordo Desc











5. Obtener el total de gastos en un intervalo de tiempo que incluya gastos en empleados, comisiones y productos a bordo. 












6. Obtener una lista de planes de vuelo y mostrar el numero de veces que los vuelos de cada plan de vuelo han sido registrados como retrasado y el numero de veces cancelados en un intervalo de tiempo. 

SELECT V.codigo_vuelo,
(SELECT count(*) FROM aerolinea.historial_vuelo H WHERE H.status='RETRASADO' AND H.codigo_vuelo_Vuelo=V.codigo_vuelo ) As Cantidad_Retrasado,
(SELECT count(*) FROM aerolinea.historial_vuelo H WHERE H.status='CANCELADO' AND H.codigo_vuelo_Vuelo=V.codigo_vuelo ) As Cantidad_Cancelado
FROM aerolinea.vuelo V
INNER JOIN aerolinea.plan_vuelo P
ON P.codigo_vuelo=V.codigo_vuelo_Plan_Vuelo
INNER JOIN aerolinea.historial_vuelo H
ON V.codigo_vuelo=H.codigo_vuelo_Vuelo WHERE P.fecha_vuelo BETWEEN '2020-04-01' AND '2022-09-09' Group By V.codigo_vuelo Order By V.codigo_vuelo Asc
 
 







7. Sumatoria de equipaje para un vuelo en específico, total de pagos para el equipaje, total de maletas gratis gracias a un beneficio y el número de pasajeros. 


















8. Reporte de empleados que indique el nombre del empleado, puesto, horas trabajadas, horas de vacaciones, horas de ausentes, comisiones ganadas y sueldo ganado en un mes. 




















9. Top 5 de modelos de avión que más vuelos completados tienen, la consulta debe incluir el modelo, número de vuelos, fecha de primer y último vuelo. 


SELECT A.modelo, A.tipo , count(A.codigo) As Cantidad_Vuelos, A.fecha_primer_vuelo
FROM aerolinea.vuelo V
INNER JOIN aerolinea.plan_vuelo P
ON V.codigo_vuelo_Plan_Vuelo= P.codigo_vuelo
INNER JOIN aerolinea.avion A
ON A.codigo= V.codigo_Avion Group By A.codigo Order By Cantidad_Vuelos Desc limit 5







10. Reporte de empleados que han tenido niños a cargo, indicando el nombre del empleado, número de niños, fecha de inicio de labores en la aerolínea, número de vuelos realizados y promedio de niños por vuelo.

SELECT E.id_empleado,E.nombre, E.fecha_inicio,
(SELECT count(Per.id_empleado_Empleado) FROM aerolinea.personal_abordo Per WHERE Per.id_empleado_Empleado=E.id_empleado limit 1) As Cant_Vuelos,
(SELECT count(*) FROM aerolinea.acompanante_tripulacion Tri WHERE Tri.id_Personal_Abordo=(SELECT getId.id FROM aerolinea.personal_abordo getId WHERE getId.id_empleado_Empleado=E.id_empleado limit 1)) As Numero_Ninos
 
FROM aerolinea.empleado E
INNER JOIN aerolinea.personal_abordo P
ON P.id_empleado_Empleado = E.id_empleado
INNER JOIN aerolinea.acompanante_tripulacion AT
ON AT.id_Personal_Abordo= P.id Group By E.id_empleado









UPDATE VUELO SET estado_vuelo = 'retrasado' WHERE codigo_vuelo = 6;