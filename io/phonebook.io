# START:range
OperatorTable addAssignOperator(":", "atPutNumber")
# END:range
# START:curlyBrackets
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
       r doMessage(arg)
       )
  r
)
# END:curlyBrackets
# START:atPutNumber
Map atPutNumber := method(
  self atPut(
       call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
       call evalArgAt(1))
)
# END:atPutNumber
# START:use
s := File with("phonebook.txt") openForReading contents
phoneNumbers := doString(s)
phoneNumbers keys   println
phoneNumbers values println
# END:use
