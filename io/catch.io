Pitcher := Object clone

Pitcher pitch := method(
            "...scramble... roll...pitch..." println
            yield 
            "...scramble...scramble...pitch..." println
             yield)

Catcher := Object clone
Catcher catch := method(
			yield
            "...dive...catch." println
            yield 
            "...bobble...catch." println)


mccoy := Pitcher clone
shipley := Catcher clone

mccoy @pitch; shipley @catch

Coroutine currentCoroutine pause