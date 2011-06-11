Builder := Object clone

Builder forward := method(
  writeln("<", call message name, ">")
  call message arguments foreach(
	arg, 
	content := self doMessage(arg); 
	if(content type == "Sequence", writeln(content)))
  writeln("</", call message name, ">"))
 
Builder  ul(
	li("Io"), 
	li("Lua"), 
	li("JavaScript"))