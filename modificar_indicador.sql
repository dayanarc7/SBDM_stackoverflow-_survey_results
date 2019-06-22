DECLARE @promedio_nuevo FLOAT = 0.4;
DECLARE @promedio_actual FLOAT;
DECLARE @promedio_diferencia FLOAT;
DECLARE @total INT;
DECLARE @ajuste INT;

WITH t AS (
	SELECT u.pais, t.año, d.Java, d.Python, d.C#, d.[C++], d.Javascript, d.Php, d.Ruby, d.Sql, s.total_pais_tiempo
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
		SELECT fk_ubicacion, fk_tiempo, COUNT(*) total_pais_tiempo
		FROM dw_stackoverflow
		GROUP BY fk_ubicacion, fk_tiempo
	) s ON d.FK_ubicacion = s.fk_ubicacion AND s.fk_tiempo = d.fk_tiempo
	WHERE pais IN ('Colombia') AND t.año = 2016
)

SELECT @promedio_actual = (Javascript * 1.0 / total_pais_tiempo), @total = total_pais_tiempo
FROM t

SET @promedio_diferencia = @promedio_nuevo - @promedio_actual
SET @ajuste = ROUND(@promedio_diferencia * @total,0)

PRINT ('Promedio actual: ' + CONVERT(VARCHAR, @promedio_actual))
PRINT ('Promedio nuevo: ' + CONVERT(VARCHAR, @promedio_nuevo))
PRINT ('Promedio diferencia: ' + CONVERT(VARCHAR, @promedio_diferencia))
PRINT ('Total: ' + CONVERT(VARCHAR, @total))
PRINT ('Ajuste: ' + CONVERT(VARCHAR, @ajuste))

DECLARE @lenguaje_javascript INT
DECLARE @cant_ajuste INT = 0

DECLARE update_cursor CURSOR FOR
SELECT lenguaje_javascript
FROM dw_stackoverflow d
INNER JOIN ubicacion u ON u.id_ubicacion = d.fk_ubicacion
INNER JOIN tiempo t ON t.id_tiempo = d.fk_tiempo
WHERE pais IN ('Colombia') AND t.año = 2016

OPEN update_cursor
FETCH NEXT FROM update_cursor INTO @lenguaje_javascript

WHILE @@FETCH_STATUS = 0 AND (@cant_ajuste < ABS(@ajuste))
BEGIN
	IF (@ajuste > 0)
	BEGIN
		IF (@lenguaje_javascript = 0)
		BEGIN
			UPDATE dw_stackoverflow
			SET lenguaje_javascript = 1
			WHERE CURRENT OF update_cursor

			SET @cant_ajuste = @cant_ajuste + 1
		END
	END
	ELSE IF (@ajuste < 0)
	BEGIN
		IF (@lenguaje_javascript = 1)
		BEGIN
			UPDATE dw_stackoverflow
			SET lenguaje_javascript = 0
			WHERE CURRENT OF update_cursor

			SET @cant_ajuste = @cant_ajuste + 1
		END
	END

	FETCH NEXT FROM update_cursor INTO @lenguaje_javascript
END

CLOSE update_cursor
DEALLOCATE update_cursor