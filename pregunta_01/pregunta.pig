/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (letter:chararray, date:chararray, num:int);
grouped_data = GROUP data BY letter;
quantity = FOREACH grouped_data GENERATE group AS letter, COUNT(data) AS count;
STORE quantity INTO 'output' USING PigStorage(',');
