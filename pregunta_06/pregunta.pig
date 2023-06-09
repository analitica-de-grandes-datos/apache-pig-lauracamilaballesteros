/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (letter:chararray, bag1:{d:tuple(f:chararray)}, map1:map[]);
desacoplar = FOREACH data GENERATE flatten(map1) AS letter;
order_data = GROUP desacoplar BY letter;
result = FOREACH order_data GENERATE group, COUNT(desacoplar);
STORE result INTO 'output' USING PigStorage(',');