/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data= LOAD 'data.csv' USING PigStorage(',') AS (num1:int, name:chararray,lastname:chararray,date:chararray,color:chararray,num2:int); 
apellido = FOREACH data GENERATE lastname, SIZE(lastname);
apellido_group = ORDER apellido BY $1 DESC, $0;
result = LIMIT apellido_group 5;
STORE result INTO 'output' USING PigStorage(',');