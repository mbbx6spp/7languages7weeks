% This would be a good use of Prolog...figuring out dependencies

% Some Rails gems
depends(activesupport, rubygems).
depends(activemodel, activesupport).
depends(activerecord, activemodel).
depends(actionpack, activesupport).

% Some Riak dependencies
depends(riak_kv, riak_core).
depends(riak_search, riak_kv).
% do not declare implicit dependencies

% TODO infer parent's parent dependencies and continue up dep tree
% only checks one level deep...need to 
dependency(X, Y) :- \+(X = Y), depends(X, Z), depends(Z, Y).
