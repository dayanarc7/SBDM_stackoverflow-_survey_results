-- PREGUNTA 14: ¿Ocupaciones en Suramerica en 2016?

SELECT u.pais, t.año, ocupacion_database*100.0 / total_database [Database Administrator], ocupacion_desktop *100.0 / total_desktop [Desktop Developer], ocupacion_Embedded *100.0 / total_Embedded [Embedded Developer], ocupacion_staff *100.0 / total_Staff [System Developer], ocupacion_web *100.0 / total_web [Web Developer]
FROM
(
	SELECT d.FK_tiempo, d.FK_ubicacion, SUM(ocupacion_Database) [ocupacion_database], SUM(ocupacion_Desktop) [ocupacion_desktop], SUM(ocupacion_Embedded) [ocupacion_Embedded], SUM(ocupacion_Staff) [ocupacion_staff],
			SUM(ocupacion_Web) [ocupacion_web]
	FROM dw_stackoverflow d
	GROUP BY d.FK_tiempo, d.FK_ubicacion
) d
INNER JOIN tiempo t ON t.id_tiempo = d.FK_tiempo
INNER JOIN ubicacion u ON u.id_ubicacion = d.FK_ubicacion
INNER JOIN (
	SELECT SUM(ocupacion_Database) total_database, SUM(ocupacion_Desktop) total_desktop , SUM(ocupacion_Embedded) total_Embedded, SUM(ocupacion_Staff) total_Staff, SUM(ocupacion_Web) total_Web
	FROM dw_stackoverflow
) s ON d.FK_ubicacion = u.id_ubicacion
WHERE pais IN ('Colombia', 'Chile','Brasil' ,'Argentina' , 'Venezuela'  ,'Uruguay' , 'Bolivia', 'Paraguay' , 'Ecuador') AND t.año =2016
ORDER BY u.pais