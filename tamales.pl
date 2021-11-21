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


tamal(dulce):-    verdadero('Tiene un sabor dulce'),  verdadero('La gente rara le pone pasas'), verdadero('Es color rosa').
tamal(nutella):-  verdadero('Tiene un sabor dulce'),  verdadero('Se consideraria gourmet'),     verdadero('Su relleno va bien con pan tostado').
tamal(verde):-    verdadero('Tiene un sabor salado'), verdadero('Su relleno contiene chile'),   verdadero('Su relleno contiene carne de puerco').
tamal(mole):-     verdadero('Tiene un sabor salado'), verdadero('Su relleno contiene chile'),   verdadero('Su relleno contiene carne de pollo').

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