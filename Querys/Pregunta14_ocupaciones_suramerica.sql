-- PREGUNTA 14: ¿Ocupaciones en Suramerica en 2016?

SELECT u.pais, t.año, ocupacion_database*100.0 / total_pais [Database Administrator], ocupacion_desktop *100.0 / total_pais [Desktop Developer], ocupacion_Embedded *100.0 / total_pais [Embedded Developer], ocupacion_staff *100.0 / total_pais [System Developer], ocupacion_web *100.0 / total_pais [Web Developer]
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
	SELECT fk_ubicacion, fk_tiempo,SUM(ocupacion_Database) + SUM(ocupacion_Desktop) + SUM(ocupacion_Embedded) + SUM(ocupacion_Staff) + SUM(ocupacion_Web) total_pais
	FROM dw_stackoverflow
	GROUP BY fk_ubicacion, fk_tiempo
) s ON d.FK_ubicacion = s.FK_ubicacion AND s.fk_tiempo = d.fk_tiempo
WHERE pais IN ('Colombia', 'Chile','Brasil' ,'Argentina' , 'Venezuela'  ,'Uruguay' , 'Bolivia', 'Paraguay' , 'Ecuador') AND t.año =2016
ORDER BY u.pais, t.año