
/*Prolog v 0.1 family Lanister got*/
/*Hechos */
/*Sexo*/
mujer(joanna).
mujer(cersei).
mujer(dorna).
mujer(myrcela).
mujer(jeyne).
hombre(tytos).
hombre(tywin).
hombre(jaime).
hombre(tyrion).
hombre(robert).
hombre(lancel).
hombre(kevan).
hombre(tommen).
hombre(jofrey).
hombre(martyn).
hombre(willem).
/*Casa Nacidos Lanister*/
lanister(cersei).
lanister(myrcela).
lanister(tytos).
lanister(tywin).
lanister(jaime).
lanister(tyrion).
lanister(lancel).
lanister(kevan).
lanister(tommen).
lanister(jofrey).
lanister(martyn).
lanister(willem).
/*Padres*/
papa_de(tytos,tywin).
papa_de(jeyne,tywin).
papa_de(tywin,jaime).
papa_de(tywin,cersei).
papa_de(tywin, tyrion).
papa_de(joanna, cersei).
papa_de(joanna,jaime).
papa_de(joanna, tyrion).

papa_de(kevan, lancel).
papa_de(dorna, lancel).
papa_de(kivan, martyn).
papa_de(dorna, martyn).
papa_de(kevan, willem).
papa_de(dorna, willem).

papa_de(jaime, jofrey).
papa_de(jaime, tommen).
papa_de(jaime, myrcela).

papa_de(cersei, jofrey).
papa_de(cersei, tommen).
papa_de(cersei, myrcela).

/* Reglas de predicados  Unificaciones*/

abuelos(A, B) :-
    papa_de(A, C),
    papa_de(C, B).

padre_de(A,B):- hombre(A),
    papa_de(A,B).

madre_de(A,B):- mujer(A),
    papa_de(A,B).

abuelo_de(A,B):- hombre(A),
    papa_de(A,C),
    papa_de(C,B).

abuela_de(A,B):- mujer(A),
    papa_de(A,C),
    papa_de(C,B).

nietos(A, B) :-
    abuelos(B, A).

hermana_de(A,B):- 
    mujer(A),
    padre_de(D, B), padre_de(D,A),A \= B.%tiene éxito si A y B no se unifican; es decir, si no (A = B)

hermana_de(A,B):- mujer(A),
    madre_de(E, B), madre_de(E,A),A \= B.

tia_de(A,B):- mujer(A),
    papa_de(C,B), hermana_de(C,A),!.

hermano_de(A,B):- 
    hombre(A),
    padre_de(D, B), padre_de(D,A),A \= B.

hermano_de(A,B):- hombre(A),
    madre_de(E, B), madre_de(E,A),A \= B.

hermanos(A, B) :-
    papa_de(C, A),
    papa_de(C, B),
    A \= B.

primos(A, B) :-
    abuelos(C, A),
    abuelos(C, B),
    \+hermanos(A, B),
    A \= B.


tio_de(A,B):- hombre(A),
    papa_de(C,B), hermano_de(C,A).

list_padres(A, L) :-  /*me da la lista*/
    findall(B, papa_de(B, A), L).

list_nietos(A, L) :-  /*me da la lista*/
    findall(B, nietos(B, A), L).

list_hermanos(A, L) :-  /*me da la lista*/
    findall(B, hermanos(B, A), L).

list_abuelos(A, L) :-  /*me da la lista*/
    findall(B, abuelos(B, A), L).

miembro_casa(A):- lanister(A).