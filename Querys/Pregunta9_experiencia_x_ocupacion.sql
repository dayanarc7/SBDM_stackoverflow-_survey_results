-- PREGUNTA 9: Rangos de experiencia por ocupación

SELECT e.rango [Rango], ocupacion_database*100.0/total_database [Database administrator], ocupacion_Desktop*100.0/total_desktop [Desktop Developer], ocupacion_Embedded *100.0/total_Embedded [Embedded Developer], ocupacion_Staff *100.0/total_Staff [System Developer], ocupacion_Web*100.0/total_Web [Web Developer]
FROM (
	SELECT d.fk_experiencia, SUM(d.ocupacion_Database) ocupacion_database, SUM(d.ocupacion_Desktop) ocupacion_Desktop , SUM(d.ocupacion_Embedded) ocupacion_Embedded,  SUM(d.ocupacion_Staff) ocupacion_Staff , SUM(d.ocupacion_Web) ocupacion_Web 
	FROM dw_stackoverflow d
	WHERE d.FK_experiencia IS NOT NULL
	GROUP BY d.fk_experiencia
) d
INNER JOIN experiencia e ON e.id_experiencia = d.fk_experiencia
INNER JOIN (
	SELECT SUM(ocupacion_Database) total_database, SUM(ocupacion_Desktop) total_desktop , SUM(ocupacion_Embedded) total_Embedded, SUM(ocupacion_Staff) total_Staff, SUM(ocupacion_Web) total_Web
	FROM dw_stackoverflow
	WHERE FK_experiencia IS NOT NULL

) t ON 1 = 1
ORDER BY e.rango



