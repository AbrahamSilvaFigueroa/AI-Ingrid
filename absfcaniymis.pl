
%consulta inicial
inicio :-
    /*fases del curso del problema
     *    inicial               final          exploraco, lista de movimentos no importante */
    estado([3,3,izquierda,0,0],[0,0,derecha,3,3],[],_).

%estado incial todos a la izquierda
estado_inicial([3,3,izquierda,0,0]).

%final todos a la derecha 
meta([0,0,derecha,3,3]).

% reglas: condiciones; es decir, siempre el numero tiene que ser igual o mayor de Mis al de Cani
reglas(Cani_Iz, Mis_Iz, Cani_de, Mis_de):-
    % Checar que no sea nulo o negativo el número
    Mis_Iz >= 0, Cani_Iz >= 0, Cani_de >= 0, Mis_de >= 0,
    % El número de Mis tiene que ser mayor o igual al de Cani en la izquierda
    (Mis_Iz >= Cani_Iz ; Mis_Iz = 0),
    % El número de Mis tiene que ser mayor o igual al de Cani en la derecha
    (Mis_de >= Cani_de ; Mis_de = 0).

% Jugadas: es decir, movimientos posibles

% Dos misioneros a la derecha
jugada([Cani_Iz, Mis_Iz, izquierda, Cani_de, Mis_de], [Cani_Iz, Mis_Iz2, derecha, Cani_de, Mis_de2]):-
    % Se suma dos a la derecha, es decir, el numero de Mis
    Mis_de2 is Mis_de + 2,
    % Se resta dos ya que son los que se fueron
    Mis_Iz2 is Mis_Iz - 2,
    % Se checan las reglas si los movimientos son legales
    reglas(Cani_Iz, Mis_Iz2, Cani_de, Mis_de2).

% Dos canibales a la derecha
jugada([Cani_Iz, Mis_Iz, izquierda, Cani_de, Mis_de], [Cani_Iz2, Mis_Iz, derecha, Cani_de2, Mis_de]):-
    % Dos canibales a la derecha
    % Se suma dos a la derecha, es decir, el numero de Cani
    Cani_de2 is Cani_de + 2,
    % Se resta dos ya que son los que se fueron
    Cani_Iz2 is Cani_Iz - 2,
    % Se checan las reglas si los movimientos son legales
    reglas(Cani_Iz2, Mis_Iz, Cani_de2, Mis_de).

% Un canibal y un misionero a la derecha
jugada([Cani_Iz, Mis_Iz, izquierda, Cani_de, Mis_de], [Cani_Iz2, Mis_Iz2, derecha, Cani_de2, Mis_de2]):-
    % se suma un cani a la dercha
    Cani_de2 is Cani_de + 1,
    %se resta un cani de la izquiera
    Cani_Iz2 is Cani_Iz - 1,
    %se suma un mis de la derecha
    Mis_de2 is Mis_de + 1,
    % se resta un mis de la izquierda
    Mis_Iz2 is Mis_Iz - 1,
    %se checa las reglas si los movimentos legales
    reglas(Cani_Iz2, Mis_Iz2, Cani_de2, Mis_de2).

% Un misionero cruza de izquierda a derecha
jugada([Cani_Iz, Mis_Iz, izquierda, Cani_de, Mis_de], [Cani_Iz, Mis_Iz2, derecha, Cani_de, Mis_de2]):-
    %se suma un mis a la dereccha
    Mis_de2 is Mis_de + 1,
    %se resta un mis de la izqueirda
    Mis_Iz2 is Mis_Iz - 1,
    %se cehaca legal
    reglas(Cani_Iz, Mis_Iz2, Cani_de, Mis_de2).

% Un caníbal cruza de izquierda a derecha
jugada([Cani_Iz, Mis_Iz, izquierda, Cani_de, Mis_de], [Cani_Iz2, Mis_Iz, derecha, Cani_de2, Mis_de]):-
    %se suma una cani a la dercha
    Cani_de2 is Cani_de + 1,
    %se resta un cani de la izquieda
    Cani_Iz2 is Cani_Iz - 1,
    %legal?
    reglas(Cani_Iz2, Mis_Iz, Cani_de2, Mis_de).

% Dos misioneros cruzan de derecha a izquierda
jugada([Cani_Iz, Mis_Iz, derecha, Cani_de, Mis_de], [Cani_Iz, Mis_Iz2, izquierda, Cani_de, Mis_de2]):-
    %se resta dos mis de la derecha
    Mis_de2 is Mis_de - 2,
    %se suma dos mis a la izquierda
    Mis_Iz2 is Mis_Iz + 2,
    %ok?
    reglas(Cani_Iz, Mis_Iz2, Cani_de, Mis_de2).

% Dos caníbales cruzan de derecha a izquierda
jugada([Cani_Iz, Mis_Iz, derecha, Cani_de, Mis_de], [Cani_Iz2, Mis_Iz, izquierda, Cani_de2, Mis_de]):-
    %se resta dos cani de la derecha
    Cani_de2 is Cani_de - 2,
    %se suma dos cani a la izquierda
    Cani_Iz2 is Cani_Iz + 2,
    %legal?
    reglas(Cani_Iz2, Mis_Iz, Cani_de2, Mis_de).

% Un misionero y un caníbal cruzan de derecha a izquierda
jugada([Cani_Iz, Mis_Iz, derecha, Cani_de, Mis_de], [Cani_Iz2, Mis_Iz2, izquierda, Cani_de2, Mis_de2]):-
    %se resta un cani de la derecha
    Cani_de2 is Cani_de - 1,
    %se suma un cani izquierda
    Cani_Iz2 is Cani_Iz + 1,
    %se resta mis derecha
    Mis_de2 is Mis_de - 1,
    %se suma mis izqueida
    Mis_Iz2 is Mis_Iz + 1,
    %pasable?
    reglas(Cani_Iz2, Mis_Iz2, Cani_de2, Mis_de2).

% Un misionero cruza de derecha a izquierda
jugada([Cani_Iz, Mis_Iz, derecha, Cani_de, Mis_de], [Cani_Iz, Mis_Iz2, izquierda, Cani_de, Mis_de2]):-
    %mis derecha -
    Mis_de2 is Mis_de - 1,
    %mis izquierda mas
    Mis_Iz2 is Mis_Iz + 1,
    %checar
    reglas(Cani_Iz, Mis_Iz2, Cani_de, Mis_de2).

% Un caníbal cruza de derecha a izquierda
jugada([Cani_Iz, Mis_Iz, derecha, Cani_de, Mis_de], [Cani_Iz2, Mis_Iz, izquierda, Cani_de2, Mis_de]):-
    %cani derecha menos
    Cani_de2 is Cani_de - 1,
    %cani izquierda mas
    Cani_Iz2 is Cani_Iz + 1,
    %checar legal
    reglas(Cani_Iz2, Mis_Iz, Cani_de2, Mis_de).


% Recursive call para resolver el problema
estado([Cani_Iz1, Mis_Iz1, B1, Cani_de1, Mis_de1],
       [Cani_Iz2, Mis_Iz2, B2, Cani_de2, Mis_de2],
       
       Explored,
       MovesList) :- 
    jugada([Cani_Iz1, Mis_Iz1, B1, Cani_de1, Mis_de1],
           [Cani_Iz3, Mis_Iz3, B3, Cani_de3, Mis_de3]), 
    % Verificar que el nuevo estado no haya sido explorado anteriormente
    not(member([Cani_Iz3, Mis_Iz3, B3, Cani_de3, Mis_de3], Explored)),
    % Llamada recursiva con el nuevo estado explorado
    estado([Cani_Iz3, Mis_Iz3, B3, Cani_de3, Mis_de3],
           [Cani_Iz2, Mis_Iz2, B2, Cani_de2, Mis_de2],
           [[Cani_Iz3, Mis_Iz3, B3, Cani_de3, Mis_de3] | Explored],
           [[[Cani_Iz3, Mis_Iz3, B3, Cani_de3, Mis_de3], [Cani_Iz1, Mis_Iz1, B1, Cani_de1, Mis_de1]] | MovesList]).

% Solucion encontrada
estado([Cani_Iz, Mis_Iz, B, Cani_de, Mis_de], [Cani_Iz, Mis_Iz, B, Cani_de, Mis_de], _, MovesList):- 
    output(MovesList).

% Impresion de la solucion
output([]) :- nl. 
output([[A, B] | MovesList]) :- 
    output(MovesList), 
    write(B), write(' >>> '), write(A), nl.
