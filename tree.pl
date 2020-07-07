% Farkhad Gapparov 5007128721 Sec 052

% base case for empty trees, then one predicte if there is match so replace would work and another case with no match so recursion may continue
% traversal over two leafs and then when recursion goes back we build the replaced tree
replace(_, _, void, void).
replace(X, Y, T1, T2) :- T1 = tree(Root, Left, Right), Root=X, replace(X,Y,Left,T3),replace(X,Y,Right,T4), T2=tree(Y,T3,T4).
replace(X, Y, T1, T2) :- T1 = tree(Root, Left, Right), not(Root=X), replace(X,Y,Left,T3),replace(X,Y,Right,T4), T2=tree(Root,T3,T4).





% base case for empty trees, one case if Root = X then the trees are identical, then 2 cases that explain situation if after recursive call next tree has no children
% 2 cases with situation when tree in the call got one children and further recursive calls, 2 cases if we reached point when we need to replace void with new value,
% and last 2 cases when after the call next tree got 2 children and further recursive calls. 
% It is very messy and there should be elegant method to solve it, but it should work :)
expand(_, void, void).
expand(X,X1,X2) :- X1 = tree(Root, _, _), Root = X, X2 = X1.
expand(X,X1,X2) :- X1 = tree(Root, void, void), X < Root, X2 = tree(Root, tree(X,void, void), void).
expand(X,X1,X2) :- X1 = tree(Root, void, void), X > Root, X2 = tree(Root, void, tree(X,void, void)).
expand(X,X1,X2) :- X1 = tree(Root, Left, void), Left \= void, X < Root, expand(X,Left, X4), X2 = tree(Root,X4,void).
expand(X,X1,X2) :- X1 = tree(Root, void, Right), Right \= void, X > Root, expand(X,Right,X3), X2 = tree(Root,void,X3).
expand(X,X1,X2) :- X1 = tree(Root, void, Right), Right \= void, X < Root, X2 = tree(Root,tree(X, void, void),Right).
expand(X,X1,X2) :- X1 = tree(Root, Left, void), Left \= void, X > Root, X2 = tree(Root,Left, tree(X, void, void)).
expand(X,X1,X2) :- X1 = tree(Root, Left, Right), Left\= void, Right\=void, X < Root, expand(X,Left, X4), X2 = tree(Root,X4,Right).
expand(X,X1,X2) :- X1 = tree(Root, Left, Right), Left\= void, Right\=void, X > Root, expand(X,Right,X3), X2 = tree(Root,Left,X3).