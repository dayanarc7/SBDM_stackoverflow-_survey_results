-- PREGUNTA 10: Rangos de experiencia por pais  - Colombia Vs Estados Unidos

SELECT e.rango [Rango], u.pais, d.total *100.0 / r.total_ubicacion [Porcentaje]
FROM (
	SELECT d.fk_experiencia, d.fk_ubicacion, COUNT(*) total
	FROM dw_stackoverflow d
	GROUP BY d.fk_experiencia, d.fk_ubicacion
) d
INNER JOIN experiencia e ON e.id_experiencia = d.fk_experiencia
INNER JOIN ubicacion u ON u.id_ubicacion = d.fk_ubicacion
INNER JOIN (
	SELECT FK_ubicacion, COUNT(*) total_ubicacion
	FROM dw_stackoverflow d
	WHERE FK_experiencia IS NOT NULL
	GROUP BY FK_ubicacion
) r ON r.FK_ubicacion = d.FK_ubicacion
WHERE u.pais= 'Colombia' OR  u.pais= 'United States'
ORDER BY u.pais
