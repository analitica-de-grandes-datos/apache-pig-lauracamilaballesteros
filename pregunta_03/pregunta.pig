/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (letter:chararray, date:chararray, num:int);
columna3 = FOREACH data GENERATE num;
order_data = ORDER columna3 BY num;
result = LIMIT order_data 5;
STORE result INTO 'output' USING PigStorage(',');
