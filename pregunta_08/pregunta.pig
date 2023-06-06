/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data= LOAD 'data.tsv' AS (letter:chararray, bag1:bag{b1:tuple(t1:chararray)}, map1:map[]);
data_generate = FOREACH data GENERATE FLATTEN(bag1) AS letra, FLATTEN (map1) AS word1;
joined_data = FOREACH data_generate GENERATE (letra,word1) AS data_tuple;
grouped_data= group joined_data BY data_tuple;
result= FOREACH grouped_data GENERATE group, COUNT(joined_data);
STORE result INTO 'output' USING PigStorage(',');