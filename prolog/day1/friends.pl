likes(me, feta).
likes(me, halloumi).
likes(spouse, cheddar).
likes(spouse, halloumi).
likes(baby, feta).

friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).

