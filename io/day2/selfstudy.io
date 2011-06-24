#!/usr/bin/env io

test := method(description, expression,
  if(expression, 
    (description .. " [PASSED]") println, 
    (description .. " [FAILED]") println)
)

/** Fibonacci **/
// F(n) = F(n-1) + F(n-2)
Fibonacci := Object clone do(
  iterative := method(i,
    if((i <= 0), Exception raise("Argument must be integer greater than zero"))
    if((i == 1 or i == 2), return 1)
    // guaranteed to be 3+
    n1 := 1
    n2 := 1
    for (x, 3, i,
      n := n1 + n2
      n2 = n1
      n1 = n
    )
    return n1
  )
  recursive := method(i,
    if((i <= 0), Exception raise("Argument must be integer greater than zero"))
    if((i == 1 or i == 2), return 1)
    // use naive implementation for recursive version instead of 
    // Fibonacci Matrix calculations as it assumes too much domain knowledge
    self recursive(i-1) + self recursive(i-2)
  )
)

test("Expect iterative F(1) = 1", Fibonacci iterative(1) == 1)
test("Expect iterative F(2) = 1", Fibonacci iterative(2) == 1)
test("Expect iterative F(3) = 2", Fibonacci iterative(3) == 2)
test("Expect iterative F(4) = 3", Fibonacci iterative(4) == 3)
test("Expect iterative F(5) = 5", Fibonacci iterative(5) == 5)
test("Expect iterative F(6) = 8", Fibonacci iterative(6) == 8)
test("Expect iterative F(7) = 13", Fibonacci iterative(7) == 13)
test("Expect iterative F(8) = 21", Fibonacci iterative(8) == 21)
test("Expect iterative F(9) = 34", Fibonacci iterative(9) == 34)
test("Expect iterative F(10) = 55", Fibonacci iterative(10) == 55)

test("Expect recursive F(1) = 1", Fibonacci recursive(1) == 1)
test("Expect recursive F(2) = 1", Fibonacci recursive(2) == 1)
test("Expect recursive F(3) = 2", Fibonacci recursive(3) == 2)
test("Expect recursive F(4) = 3", Fibonacci recursive(4) == 3)
test("Expect recursive F(5) = 5", Fibonacci recursive(5) == 5)
test("Expect recursive F(6) = 8", Fibonacci recursive(6) == 8)
test("Expect recursive F(7) = 13", Fibonacci recursive(7) == 13)
test("Expect recursive F(8) = 21", Fibonacci recursive(8) == 21)
test("Expect recursive F(9) = 34", Fibonacci recursive(9) == 34)
test("Expect recursive F(10) = 55", Fibonacci recursive(10) == 55)

/** / override **/

// 
