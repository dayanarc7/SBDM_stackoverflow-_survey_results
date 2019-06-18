-- PREGUNTA 11: ¿Cuál ha sido el comportamiento histórico por ocupación en Colombia ?

SELECT u.pais, t.año, d.[Database Administrator], d.[Desktop Developer], d.[Embedded Developer], d.[System Developer], d.[Web Developer]
FROM
(
	SELECT d.FK_tiempo, d.FK_ubicacion, SUM(ocupacion_Database) [Database Administrator], SUM(ocupacion_Desktop) [Desktop Developer], SUM(ocupacion_Embedded) [Embedded Developer], SUM(ocupacion_Staff) [System Developer],
			SUM(ocupacion_Web) [Web Developer]
	FROM dw_stackoverflow d
	GROUP BY d.FK_tiempo, d.FK_ubicacion
) d
INNER JOIN tiempo t ON t.id_tiempo = d.FK_tiempo
INNER JOIN ubicacion u ON u.id_ubicacion = d.FK_ubicacion
WHERE pais = 'Colombia'
ORDER BY u.pais, t.año