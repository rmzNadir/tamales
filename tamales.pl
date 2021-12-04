% Definimos dos predicados dinamicos para despues crear/eliminar nuevos en base a las definiciones que dimos (verdad/falso) y la pregunta en cuestión
:- dynamic verdad/1, falso/1.


% Regla para modificar los predicados verdad/falso (usando assert o retract)  en base a la pregunta y si fue respondida con s o n
verdadero(Pregunta):-(
  % Si existe un predicado verdad para la pregunta se regresa true,
  % si no, se revisa si existeun predicado falso para la pregunta,
  verdad(Pregunta) -> true;
  falso(Pregunta) -> fail;
  % si no, imprimimos al usuario la pregunta en cuestión usando format donde ~w será el primer argumento que pasamos, 
  % en este caso, Pregunta (como solo es un argumento, no hace falta usar una lista) y ~n será el equivalente a 'nl'
  format('~w?~n', Pregunta),
  % Leemos el input del usuario, si este equivale a "s" (sí) creamos un predicado verdad para indicar que la pregunta
  % en cuestión tiene como respuesta "si"
  Answer = read(s),
  Answer -> assert(verdad(Pregunta));
  % En caso contrario creamos un predicado falso para indicar que la pregunta en cuestión tiene como respuesta "no"
  assert(falso(Pregunta)), fail
).


tamal(dulce):-              verdadero('Tiene un sabor dulce'),     verdadero('La gente rara le pone pasas'),                                  verdadero('Es color rosa').
tamal(nutella):-            verdadero('Tiene un sabor dulce'),     verdadero('Se consideraria gourmet'),                                      verdadero('Su relleno va bien con pan tostado').
tamal(verde):-              verdadero('Tiene un sabor salado'),    verdadero('Su relleno contiene chile'),                                    verdadero('Su relleno contiene carne de puerco').
tamal(mole):-               verdadero('Tiene un sabor salado'),    verdadero('Su relleno contiene chile'),                                    verdadero('Su relleno contiene carne de pollo').
tamal(tamarindo):-          verdadero('Tiene un sabor agridulce'), verdadero('Su relleno proviene de un fruto color cafe'),                   verdadero('Su relleno suele ser utilizado para hacer aguas de sabor').
tamal(fresa):-              verdadero('Tiene un sabor dulce'),     verdadero('Su relleno proviene de un fruto color rojo/rosado'),            verdadero('Existe un personaje infantil en honor al fruto').
tamal(elote):-              verdadero('Tiene un sabor dulce'),     verdadero('Es elaborado con una de las cosechas mas populares en Mexico'), verdadero('Es color amarillo').
tamal(rajas):-              verdadero('Tiene un sabor salado'),    verdadero('Su relleno contiene chile'),                                    verdadero('Su relleno contiene queso'),                                     verdadero('Su relleno contiene salsa de jitomate').
tamal(piedra):-             verdadero('Tiene un sabor salado'),    verdadero('Son envueltos en hojas de aguacate'),                           verdadero('No llevan manteca').
tamal('cochinita pibil'):-  verdadero('Tiene un sabor salado'),    verdadero('Su relleno contiene carne de puerco'),                          verdadero('Su relleno es adobado en achiote'),                              verdadero('Su relleno es cocido en un horno de tierra').
tamal(ranchero):-           verdadero('Tiene un sabor salado'),    verdadero('Su relleno contiene carne de puerco'),                          verdadero('Su relleno contiene chile'),                                     verdadero('Su relleno es sazonado con chile morita').
tamal(canario):-            verdadero('Tiene un sabor dulce'),     verdadero('La gente rara el pone pasas'),                                  verdadero('Es color amarillo'),                                             verdadero('Su relleno contiene almendra').
tamal(oaxaquenio):-         verdadero('Tiene un sabor salado'),    verdadero('Son envueltos en hojas de platano'),                            verdadero('Su relleno contiene carne de puerco'),                           verdadero('Su relleno contiene mole negro').
tamal(pinia):-              verdadero('Tiene un sabor dulce'),     verdadero('Su relleno proviene de un fruto color amarillo'),               verdadero('Es la vivienda de cierto personaje con su mismo color').
tamal(cajeta):-             verdadero('Tiene un sabor dulce'),     verdadero('Su relleno contiene leche'),                                    verdadero('Su relleno va bien con un pan tostado'),                         verdadero('Su relleno es color cafe').
tamal(lechera):-            verdadero('Tiene un sabor dulce'),     verdadero('Su relleno contiene leche'),                                    verdadero('Su relleno va bien con un pan tostado'),                         verdadero('Su relleno es color blanco').
tamal(gansito):-            verdadero('Tiene un sabor dulce'),     verdadero('Su relleno contiene fresa y chocolate'),                        verdadero('Su relleno proviene de un producto cuya mascota es un ganso').
tamal(queso):-              verdadero('Tiene un sabor salado'),    verdadero('Su relleno es un subproducto de la leche'),                     verdadero('Su relleno es causa de debate entre CDMX y el resto de Mexico').
tamal(frijoles):-           verdadero('Tiene un sabor salado'),    verdadero('Su relleno es un tipo de semilla'),                             verdadero('Su relleno es color cafe'),                                      verdadero('Su relleno es usado como acompañante en gran cantidad de comidas').
tamal(atun):-               verdadero('Tiene un sabor salado'),    verdadero('Su relleno proviene del mar'),                                  verdadero('Su relleno suele ser vendido enlatado'),                         verdadero('Estas bien mentalmente').            
tamal(milanesa):-           verdadero('Tiene un sabor salado'),    verdadero('Su relleno esta empanizado'),                                   verdadero('Su relleno contiene carne de vaca').
tamal(pastor):-             verdadero('Tiene un sabor salado'),    verdadero('Su relleno suele ir acompañado de tortillas y salsa'),          verdadero('Su relleno contiene carne de puerco'),                           verdadero('Su relleno es considerado el corte mas popular para la comida Mexicana mas iconica').
tamal(suadero):-            verdadero('Tiene un sabor salado'),    verdadero('Su relleno suele ir acompañado de tortillas y salsa'),          verdadero('Su relleno contiene carne de vaca'),                             verdadero('Su relleno es frito como parte de su preparacion').
tamal(caviar):-             verdadero('Tiene un sabor salado'),    verdadero('Se consideraria gourmet'),                                      verdadero('Su relleno proviene del mar'),                                   verdadero('Su relleno proviene de un animal cuyo nombre rima con orion').
tamal('arroz con leche'):-  verdadero('Tiene un sabor dulce'),     verdadero('Su relleno contiene leche'),                                    verdadero('Su relleno contiene la semilla mas popular en asia'),            verdadero('Su relleno suele llevar trozos de canela').


test:-
  nl, nl,
  write('Bienvenido!'), nl, nl,
  write('Piensa en tu tamal favorito y tratare de adivinar cual es ;).'), nl, nl,
  write('Para esto te hare una serie de distintas preguntas.'), nl, nl,
  write('Cada pregunta debera ser respondida con "s." o "n."'), nl, nl,
  write('Estas list@ para comenzar?'), nl,
  % Repite la siguiente secuencia indefinidamente hasta que caemos en el caso s o n
  repeat,
  read(Listo), nl,
  ejecuta(Listo), nl,
  limpiar,
  write('Si deseas probar con otro tamal escribe: "test."').


% Si existe en nuestra base de conocimiento un tamal con todas las caracteristicas a las que el usuario respondio "si",
% Mandamos un mensaje diciendo que es su tamal favorito, en caso, contrario mandamos un mensaje de error.
ejecuta(s):- (tamal(Tamal) -> format('~nCreo que tu favorito es el tamal de ~w.~n', Tamal); format('~nWhoops, no conozco un tamal con esas caracteristicas. ~n') ).
% Cierra el programa si el usuario no está listo, si usamos halt se cierra completamente,
% el unico workaround que encontré fue lanzar un error, no es lo ideal.
ejecuta(n):- write('Adios!'), throw('u.u').


% Borramos todos los predicados verdad y falso que creamos
limpiar:- retract(verdad(_)), fail.
limpiar:- retract(falso(_)), fail.
% Cierra la ejecución de limpieza, si no lo hacemos se quedará esperando un input
limpiar.