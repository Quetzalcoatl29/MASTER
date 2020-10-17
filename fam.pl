
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
papa_de(tytos,kevan).
papa_de(jeyne,kevan).
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

madre(A, B) :-
    papa_de(A, B),
    mujer(A).
padre(A, B) :-
    papa_de(A, B),
    hombre(A).
hijo(A, B) :-
    papa_de(B, A).

abuelos(A, B) :-
    papa_de(A, C),
    papa_de(C, B).

nietos(A, B) :-
    abuelos(B, A).

abuelo(A, B) :-
    abuelos(A, B),
    hombre(A).
abuela(A, B) :-
    abuelos(A, B),
    mujer(A).
hijo_de(A, B) :-
    hijo(A, B),
    hombre(A).
hija(A, B) :-
    hijo(A, B),
    mujer(A).

hermanos(A, B) :-
    papa_de(C, A),
    papa_de(C, B),
    A \= B. %tiene éxito si A y B no se unifican; es decir, si no (A = B)
hermana(A, B) :-
    hermanos(A, B),
    mujer(A),
    A \= B.
hermano(A, B) :-
    hermanos(A, B),
    hombre(A),
    A \= B.

tio(A, B) :-
    hermano(A, C),
    hijo_de(B, C).
tia(A, B) :-
    hermana(A, C),
    hija(B, C).
primo(A, B) :-
    abuelos(C, A),
    abuelos(C, B),
    \+hermanos(A, B),
    A \= B.

sobrino(A, B) :-
    tio(B, A),
    hombre(A);
    tio(B, A),
    hombre(A).
sobrina(A, B) :-
    tia(B, A),
    mujer(A);
    tio(B, A),
    mujer(A).

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

list_sobrinos(A, L) :-  /*me da la lista*/
    findall(B, sobrino(B, A), L).

list_sobrinas(A, L) :-  /*me da la lista*/
    findall(B, sobrina(B, A), L).

list_tios(A, L) :-  /*me da la lista*/
    findall(B, tio(B, A), L).

list_tias(A, L) :-  /*me da la lista*/
    findall(B, tia(B, A), L).


miembro_casa(A):- lanister(A).

    