% Not exactly what the exercise asked for, but I prefer this:)

plays(mozart, violin).
plays(mozart, clavier).
plays(beethoven, piano),
plays(beethoven, violin),
plays(beethoven, organ),
plays(haydn, violin).
plays(haydn, harpsichord).
plays(brahms, piano).
plays(brahms, horn).
plays(brahms, doublebass).

musical_friends(X, Y) :- \+(X = Y), plays(X, Z), plays(Y, Z).

% plays(Musician, violin).
% plays(beethoven, Instrument).
