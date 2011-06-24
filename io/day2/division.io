#!/usr/bin/env io

Number div := Number getSlot("/")

Number / := method(denominator,
  if (denominator == 0, 0, self div(denominator))
)

verify := method(description, expression,
  if(expression, 
    (description .. " [PASSED]") println, 
    (description .. " [FAILED]") println)
)

verify("24 / 0 = 0", 0 == 24 / 0)
verify("24 / 1 = 24", 24 == 24 / 1)
verify("24 / 2 = 12", 12 == 24 / 2)
verify("24 / 3 = 8", 8 == 24 / 3)
verify("24 / 4 = 6", 6 == 24 / 4)
