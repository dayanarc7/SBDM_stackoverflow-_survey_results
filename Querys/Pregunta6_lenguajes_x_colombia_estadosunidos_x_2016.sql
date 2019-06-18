-- PREGUNTA 6: ¿Cuál ha sido el comportamiento entre Colombia y Estados Unidos según cada lenguaje para el año 2016 ?


SELECT u.pais, t.año, d.Java * 100.0 /d.total [Java] , d.Python *100.1 /d.total [Python], d.C# *100.1/ d.total [C#], d.[C++] *100.1 /d.total [C++], d.Javascript*100.0/ d.total [Javascript], d.Php *100.0 /d.total [PHP], d.Ruby *100.0/d.total [Ruby], d.Sql *100.0 /d.total [Sql]
FROM
(
	SELECT d.FK_tiempo, d.FK_ubicacion, SUM(lenguaje_java) [Java], SUM(lenguaje_python) [Python], SUM(lenguaje_c#) [C#], SUM([lenguaje_c++]) [C++],
			SUM(lenguaje_javascript) [Javascript], SUM(lenguaje_php) [Php], SUM(lenguaje_ruby) [Ruby], SUM(lenguaje_sql) [Sql],
			 SUM(lenguaje_java) + SUM(lenguaje_python) + SUM(lenguaje_c#) + SUM([lenguaje_c++]) + SUM(lenguaje_javascript) + SUM(lenguaje_php) + SUM(lenguaje_ruby) + SUM(lenguaje_sql) total
	FROM dw_stackoverflow d
	GROUP BY d.FK_tiempo, d.FK_ubicacion
) d
INNER JOIN tiempo t ON t.id_tiempo = d.FK_tiempo
INNER JOIN ubicacion u ON u.id_ubicacion = d.FK_ubicacion
WHERE pais = 'United States' AND t.año = 2016 OR pais = 'Colombia' AND t.año = 2016
ORDER BY u.pais, t.año