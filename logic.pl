l-not(0,1) :- !.
l-not(1,0).

l-and(_,_,0) :- !.
l-and(1,1,1).

l-or(_,1,1) :- !.
l-or(1,_,1) :- !. 
l-or(_,_,0).
 
l_xor(A,B,Y) :- 
    l_not(A,T), l_not(B,T1),
    l_and(A,T1,T2), l_and(T,B,T3),
    l_or(T2,T3,Y).

fulladdr(A,B,Cin,Sum,Cout) :-
	l-xor(A,B,T), l-xor(T,Cin,Sum),
	l-or(A,B,T1), l-and(T1,Cin,T2), l-and(A,B,T3), l-or(T2,T3,Cout).
 
n-bit-addr(LA,LB,Cin,Sum,Cout) :-
 	n-

fulladdrtest :-
	write('A  B  Cin  Cout  Sum'), nl,
	fulladdr(A,B,Cin,Sum,Cout),
	write(A), write('  '),
	write(B), write('  '), 
	write(Cin), write('  '), 
	write(Cout), write('  '),
	write(Sum), nl,
	fail. 