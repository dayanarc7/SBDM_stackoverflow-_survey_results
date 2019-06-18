-- PREGUNTA 14: ¿Ocupaciones en Suramerica en 2016?

SELECT u.pais, t.año, [Database Administrator], [Desktop Developer], [Embedded Developer], [System Developer], [Web Developer]
FROM
(
	SELECT d.FK_tiempo, d.FK_ubicacion, SUM(ocupacion_Database) [Database Administrator], SUM(ocupacion_Desktop) [Desktop Developer], SUM(ocupacion_Embedded) [Embedded Developer], SUM(ocupacion_Staff) [System Developer],
			SUM(ocupacion_Web) [Web Developer]
	FROM dw_stackoverflow d
	GROUP BY d.FK_tiempo, d.FK_ubicacion
) d
INNER JOIN tiempo t ON t.id_tiempo = d.FK_tiempo
INNER JOIN ubicacion u ON u.id_ubicacion = d.FK_ubicacion
WHERE pais IN ('Colombia', 'Chile','Brasil' ,'Argentina' , 'Venezuela'  ,'Uruguay' , 'Bolivia', 'Paraguay' , 'Ecuador') AND t.año =2016
ORDER BY u.pais, t.año