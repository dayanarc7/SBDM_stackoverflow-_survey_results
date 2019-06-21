# Trabajo Final Sistemas de Bases de Datos Masivos 

#### Para el desarrollo de este trabajo se utilizaron 7 conjuntos de datos masivos completamente libres y accesibles a través de BigQuery, que corresponden a la encuesta anual que Stackoverflow realiza desde el 2011 a sus usuarios para observar y analizar tendencias en la industria de la tecnología y el software.

Fh-bigquery.stackoverflow.survey_results_2011<br/>
Fh-bigquery.stackoverflow.survey_results_2012<br/>
Fh-bigquery.stackoverflow.survey_results_2013<br/>
Fh-bigquery.stackoverflow.survey_results_2014<br/>
Fh-bigquery.stackoverflow.survey_results_2015<br/>
Fh-bigquery.stackoverflow.survey_results_2016<br/>
Fh-bigquery.stackoverflow.survey_results_public_2017<br/>

## I. Limpieza de los datos
#### Se realizó la limpieza año a año como aparece en los scripts y teniendo en cuenta la arquitectra inicial predefinida para la creación posterior de a bodega de datos:<br/>

![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Arquitecturabodega.PNG) <br/>

[Limpieza de datos 2011](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/1-script_clean_2011.sql)<br/>
[Limpieza de datos 2012](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/1-script_clean_2012.sql)<br/>
[Limpieza de datos 2013](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/1-script_clean_2013.sql)<br/>
[Limpieza de datos 2014](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/1-script_clean_2014.sql)<br/>
[Limpieza de datos 2015](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/1-script_clean_2015.sql)<br/>
[Limpieza de datos 2016](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/1-script_clean_2016.sql)<br/>
[Limpieza de datos 2017](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/1-script_clean_2017.sql)<br/>

## II. Creación de la bodega de datos
Antes de realizar la creación de la bodega de datos se realizó la normalización de las dimensiones que quedaron definidas. 

[Normalización - Experiencia](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/3-normalizacion_experiencia.sql)<br/>
[Normalización - Ingresos](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/3-normalizacion_ingresos.sql)<br/>
[Normalización - Ubicación](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/3-normalizacion_ubicacion.sql)<br/>
[Normalización - Tiempo](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/3-normalizacion_tiempo.sql)<br/>
[Creacion de la bodega de datos](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/2-create_datawarehouse.sql)

#### II-a. Consultas realizadas sobre la bodega de datos 

#### A continuación, se presentan 15 preguntas resueltas a través de consultas sobre el Datawarehouse. Estas preguntas fueron planteadas con base en las 6 dimensiones que conforman la bodega y con base en los datos que fueron normalizados. 

#####  PREGUNTA 1: ¿Cual es la participación total en las encuestas por país (resultado - 5 primeros países) ? <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta1_encuestas_pais.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta1.png "Logo Title Text 1")

#####  PREGUNTA 2:  ¿Cúal es el rango salarial según la experiencia de los desarrolladores que programan en Java? <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta2_desarrolladores_experiencia_java.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta2.png "Logo Title Text 1")

#####  PREGUNTA 3:  ¿Cúal es el rango salarial según la experiencia de los desarrolladores que programan en Python? <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta3_desarrolladores_experiencia_python.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta3.png "Logo Title Text 1")

#####  PREGUNTA 4:  ¿Cuál ha sido el comportamiento a través de  los años  del uso de los lenguajes en Colombia? <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta4_lenguajes_x_colombia_x_a%C3%B1o.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta4.png "Logo Title Text 1")

#####  PREGUNTA 5:  ¿Cuál ha sido el comportamiento a través de  los años  del uso de los lenguajes en Estados Unidos? <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta4_lenguajes_x_colombia_x_a%C3%B1o.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta5.png "Logo Title Text 1")

#####  PREGUNTA 6:  Comparación de usos de lenguajes Colombia VS Estados Unidos en 2016 <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta6_lenguajes_x_colombia_estadosunidos_x_2016.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta6.png "Logo Title Text 1")

#####  PREGUNTA 7:  ¿Cuál ha sido el rango salarial más popular por ocupación en el año 2016? <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta7_salarios_x_ocupacion_x_2016.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta7.png "Logo Title Text 1")

#####  PREGUNTA 8:  ¿Cuál es el rango más popular de ingresos Colombia Vs Estados Unidos? <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta8_salarios_x_estadosunidos_x_colombia.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta8.png "Logo Title Text 1")

#####  PREGUNTA 9:  ¿Cuáles son los rangos de experiencia por ocupación? <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta9_experiencia_x_ocupacion.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta9.png "Logo Title Text 1")

#####  PREGUNTA 10:  Rangos de experiencia por pais  - Colombia Vs Estados Unidos <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta10_experiencia_pais_estadosunidos_vs_col.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta10.png "Logo Title Text 1")

#####  PREGUNTA 11:  Comportamiento histórico ocupaciones Colombia <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta11_ocupaciones_colombia.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta11.png "Logo Title Text 1")

#####  PREGUNTA 12:  Comportamiento histórico ocupaciones Estados Unidos <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta12_ocupaciones_estadosunidos.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta12.png "Logo Title Text 1")

#####  PREGUNTA 13:   ¿Uso de lenguajes de programación en Suramerica en 2016? <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta13_lenguajes_suramerica.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta13.png "Logo Title Text 1")

#####  PREGUNTA 14:  ¿Ocupaciones en Suramerica en 2016? <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta14_ocupaciones_suramerica.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta14.png "Logo Title Text 1")

#####  PREGUNTA 15:  Cuáles son los 20 países con el promedio más alto de rango de ingresos <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta15_paises_ingresos_altos.sql) <br/>

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta15.png "Logo Title Text 1")

## III. Diagramas Estrella, Cubo y Malinoski 

Representación gráfica: 
![alt text](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Imagen2.png)


## IV. MapReduce bases de datos NoSQL
Desde la bodega de datos se hizo una query en donde sólo aparecieran los lenguajes de programación en una sola columna, se llevaron los datos de la query a una base de datos NoSQL,  y se aplicó MapReduce para agrupar el número de programadores por lenguaje de programación. Se muestra a continuación la rutina:  <br/>

[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Tabla_leng_map_reduce.sql) <br/>

> var mape = function(){emit(this["Lenguaje"],1)}<br/>
> var reduce = function(key, values){ return Array.sum(values)}<br/>
> db.stackoverflow.mapReduce(mape, reduce, {out: {inline : 1}})<br/>
{<br/>
        "results" : [<br/>
                {
                        "_id" : null,<br/>
                        "value" : 207546<br/>
                },<br/>
                {<br/>
                        "_id" : "NULL",<br/>
                        "value" : 14311<br/>
                },<br/>
                {<br/>
                        "_id" : "c#",<br/>
                        "value" : 31457<br/>
                },<br/>
                {<br/>
                        "_id" : "c++",<br/>
                        "value" : 19498<br/>
                },<br/>
                {<br/>
                        "_id" : "java",<br/>
                        "value" : 34869<br/>
                },<br/>
                {<br/>
                        "_id" : "javascript",<br/>
                        "value" : 52411<br/>
                },<br/>
                {<br/>
                        "_id" : "python",<br/>
                        "value" : 22658
                },<br/>
                {<br/>
                        "_id" : "sql",<br/>
                        "value" : 32343 <br/>
                }<br/>
        ],<br/>
        "timeMillis" : 2356,<br/>
        "counts" : {<br/>
                "input" : 415093,<br/>
                "emit" : 415093,<br/>
                "reduce" : 6700,<br/>
                "output" : 8<br/>
        },<br/>
        "ok" : 1<br/>

## V. Predicción encuesta 2018
Se generó un conjunto de datos nuevos a partir con al menos 50 mil registros y se predijo cuáles serían las respuestas de la nueva encuesta en el 2018. El análisis que se realizó se describe a continuación y se adjunta el algoritmo que se usó generar los registros manteniendo la línea de tendencia con base en las encuestas anteriores. <br/>

[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta15_paises_ingresos_altos.sql) <br/>

## VI. Adicion de 1 registro
Se adicionó un registro a la encuesta de 2014, y se actualizó la bodega de datos y las consultas realizadas sobre la misma en adelante. <br/> 
Se da cuenta además que inicialmente la encuesta de 2014 tenía inicialmente 7.645 registros y que termina con 7.646. <br/>

[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta15_paises_ingresos_altos.sql) <br/>

## VII. Modificación de datos operativos
Se generó una rutina que actualizar el _____________  y modificara los “datos operativos” y la bodega de datos de manera coherente para corresponderse con el _______.   



