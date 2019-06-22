-- PREGUNTA 13: ¿Uso de lenguajes de programación en Suramerica en 2016?

SELECT u.pais, t.año, d.Java *100.0 / total_pais_tiempo [Java], d.Python *100.0 / total_pais_tiempo [Python], d.C# *100.0 / total_pais_tiempo [C#], d.[C++] *100.0 / total_pais_tiempo [C++], 
d.Javascript *100.0 / total_pais_tiempo [Javascript], d.Php *100.0 / total_pais_tiempo [PHP], d.Ruby *100.0 / total_pais_tiempo [Ruby], d.Sql *100.0 / total_pais_tiempo [Sql] 
FROM
(
	SELECT d.FK_tiempo, d.FK_ubicacion, SUM(lenguaje_java) [Java], SUM(lenguaje_python) [Python], SUM(lenguaje_c#) [C#], SUM([lenguaje_c++]) [C++],
			SUM(lenguaje_javascript) [Javascript], SUM(lenguaje_php) [Php], SUM(lenguaje_ruby) [Ruby], SUM(lenguaje_sql) [Sql]
	FROM dw_stackoverflow d
	GROUP BY d.FK_tiempo, d.FK_ubicacion
) d
INNER JOIN tiempo t ON t.id_tiempo = d.FK_tiempo
INNER JOIN ubicacion u ON u.id_ubicacion = d.FK_ubicacion
INNER JOIN (
	SELECT fk_ubicacion, fk_tiempo, SUM(lenguaje_java) + SUM(lenguaje_python) + SUM(lenguaje_c#) + SUM([lenguaje_c++]) + SUM(lenguaje_javascript) + SUM(lenguaje_ruby) + SUM(lenguaje_php) + SUM(lenguaje_sql) total_pais_tiempo
	FROM dw_stackoverflow
	GROUP BY fk_ubicacion, fk_tiempo
) s ON d.FK_ubicacion = s.fk_ubicacion AND s.fk_tiempo = d.fk_tiempo
WHERE pais IN ('Colombia', 'Chile','Brasil' ,'Argentina' , 'Venezuela'  ,'Uruguay' , 'Bolivia', 'Paraguay' , 'Ecuador') AND t.año =2016
ORDER BY u.pais, t.año