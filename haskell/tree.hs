-- START:types
module Main where
    data Tree a = Children [Tree a] | Leaf a deriving (Show)
-- END:types
    
-- START:functions
    depth (Leaf _) = 1
    depth (Children c) = 1 + maximum (map depth c)
-- END:functions
