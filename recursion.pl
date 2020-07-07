% Farkhad Gapparov 5007128721 Sec 052

dictionary(one,1).
dictionary(two,2).
dictionary(three,3).
dictionary(four,4).
dictionary(five,5).
dictionary(six,6).
dictionary(seven,7).
dictionary(eight,8).
dictionary(nine,9).

% I am not exactly sure that I am allowed to use decrement/increment  as a helping rule, but I couldn't think of other way to count.
decr(X, D) :- D is X-1.
incr(X, D) :- D is X+1.

% other than that this rule goes through the recursive calls and after hitting base case it goes step by step backwards filling out the list
add(0,_, []).
add(_,[],[]).
add(N, InputList, OutputList) :- InputList = [Head|Tail], decr(N,Decre), add(Decre, Tail, OutputList1), OutputList = [Head|OutputList1].

% base case check for empty list, case that checks KB for values and then converts Head and recursively does same with Tail in the end building new list on the way back.
convert([],[]).
convert([Head|Tail], List2) :- dictionary(Head,X), convert(Tail, Result), List2 = [X|Result].

% check for empty list, then transition to 4 variable predicate, base case for said predicate and then 1 predicate in case we found E
% and another case when it is not found so we can proceed further
grep([],_,_) :- false.
grep(E,L,Occ) :- grep(E,L,Occ,0).
grep(_,[],[],_).
grep(E,[Head|Tail],Occ,Ctr) :- E=Head, incr(Ctr, Ctrplusone), grep(E, Tail, Occ1, Ctrplusone), Occ=[Ctrplusone|Occ1].
grep(E,[Head|Tail],Occ,Ctr) :- not(E=Head), incr(Ctr, Ctrplusone), grep(E, Tail, Occ, Ctrplusone).
