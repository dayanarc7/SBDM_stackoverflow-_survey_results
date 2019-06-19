-- PREGUNTA 13: ¿Uso de lenguajes de programación en Suramerica en 2016?

SELECT u.pais, t.año, d.Java *100.0 / total_java [Java], d.Python *100.0 / total_python [Python], d.C# *100.0 / total_c# [C#], d.[C++] *100.0 / [total_c++] [C++], 
d.Javascript *100.0 / total_javascript [Javascript], d.Php *100.0 / total_php [PHP], d.Ruby *100.0 / total_ruby [Ruby], d.Sql *100.0 / total_sql [Sql] 
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
	SELECT SUM(lenguaje_java) total_java, SUM(lenguaje_python) total_python , SUM(lenguaje_c#) total_c#, SUM([lenguaje_c++]) [total_c++], SUM(lenguaje_javascript) total_javascript , 
	SUM(lenguaje_php) total_php, SUM(lenguaje_ruby) total_ruby , SUM(lenguaje_sql) total_sql
	FROM dw_stackoverflow
) s ON d.FK_ubicacion = u.id_ubicacion
WHERE pais IN ('Colombia', 'Chile','Brasil' ,'Argentina' , 'Venezuela'  ,'Uruguay' , 'Bolivia', 'Paraguay' , 'Ecuador') AND t.año =2016
ORDER BY u.pais, t.año
