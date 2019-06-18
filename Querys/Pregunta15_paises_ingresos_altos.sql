-- Cuáles son los 20 países con el promedio más alto de rango de ingresos

WITH total_ubicacion AS
(
	SELECT fk_ubicacion, COUNT(*) total_ubicacion
	FROM dw_stackoverflow
	WHERE fk_ubicacion IS NOT NULL AND fk_ingresos IS NOT NULL
	GROUP BY fk_ubicacion
)

SELECT TOP 20 pais, ingresos, total_ubicacion_ingresos * 100.0 / total_ubicacion [Porcentaje]
FROM 
(
	SELECT fk_ubicacion, fk_ingresos, COUNT(*) total_ubicacion_ingresos
	FROM dw_stackoverflow
	WHERE fk_ubicacion IS NOT NULL AND fk_ingresos IS NOT NULL
	GROUP BY fk_ubicacion, fk_ingresos
) d
INNER JOIN ubicacion u ON u.id_ubicacion = d.fk_ubicacion
INNER JOIN ingresos i ON i.id_ingresos = d.fk_ingresos
INNER JOIN total_ubicacion tu ON tu.fk_ubicacion = d.fk_ubicacion
WHERE i.ingresos = '>$140,000' 
ORDER BY Porcentaje DESC 

select * from ingresos
