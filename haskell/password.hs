module Main where
    crack = do x <- ['a'..'c'] ; y <- ['a'..'c'] ; z <- ['a'..'c'] ; 
               let { password = [x, y, z] } ;
               if attempt password
                    then return (password, True)
                    else return (password, False)
    
    attempt pw = if pw == "cab" then True else False
