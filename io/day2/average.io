
// specific exception prototype
NotANumberException := Exception clone

// naive implementation
List averageNaive := method(
  sum := 0
  foreach(self, i, sum = sum + i)
  sum
)

List averageBetter := method(
  sum := 0
  foreach(self, i, 
    // skip non-Numbers
    if(i isKindOf(Number), sum = sum + i)
  )
  sum
)

List averageExceptional := method(
  sum := 0
  foreach(self, i,
    // raise exception when element is non-Number
    if(i isKindOf(Number), 
      sum = sum + i,
      NotANumberException raise)
  )
  sum
)

// Examples of usage
("list(1, 2, 3, 4, 5)  == " ..  list(1, 2, 3, 4, 5) averageNaive) println
("list(1, 2, 3, 4, nil)  == " ..  list(1, 2, 3, 4, nil) averageBetter) println
("list(1, 2, 3, 4, '')  == " ..  list(1, 2, 3, 4, "") averageExceptional) println
