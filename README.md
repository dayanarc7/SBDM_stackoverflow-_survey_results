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
#### Se realizó la limpieza año a año como aparece en los scripts: 
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

##### A continuación, se presentan 15 preguntas resueltas a través de consultas sobre el Datawarehouse. Estas preguntas fueron planteadas con base en las 6 dimensiones que conforman la bodega y con base en los datos que fueron normalizados. 

######  PREGUNTA 1: ¿Cual es la participación total en las encuestas por país (resultado - 5 primeros países) ? <br/>
[Query](https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Querys/Pregunta1_encuestas_pais.sql) <br/>

[Representación gráfica]: https://github.com/dayanarc7/SBDM_stackoverflow-_survey_results/blob/master/Images/Pregunta1.png "Logo Title Text 2"


