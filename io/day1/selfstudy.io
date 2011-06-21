#!/usr/bin/env io
/**
 * metadoc copyright Susan Potter <me@susanpotter.net>, 2011
 * metadoc license Creative Commons Attribution-NonCommercial-ShareAlike
 * metadoc category 7languages7weeks
 * metadoc description This script shows my research for Day One of the
 *                     Io section of #7languages7weeks book
**/

/** FIND SECTION **/

// Io example problems - print to stdout when running this Io script
problems := list(
  "Scripting",
  "Actors",
  "Embedding"
)

"Sample problems that would be easy to solve with Io are:" println
problems foreach(i, problem,
  ("  " .. (i+1) .. ". " .. problem) println
)
"" println

// Io Community information
// With hindsight I would do define the prototypes differently
// @see community.io for revised version
CommunityType := Object clone
CommunityType println := method(
  // TODO
  self kind println
  self host println
  self url println
)

MailingList := CommunityType clone
MailingList kind := "Mailing List"
MailingList host := "yahoogroups.com"
MailingList url := "http://tech.groups.yahoo.com/group/iolanguage/"

MicroBlog := CommunityType clone
MicroBlog kind := "Micro Blog"
MicroBlog host := "twitter.com"
MicroBlog url := "http://twitter.com/iolanguage"

IRCChannel := CommunityType clone
IRCChannel kind := "IRC Channel"
IRCChannel host := "irc.freenode.net"
IRCChannel url := "irc://irc.freenode.net/io"

ioCommunities := list(MailingList, MicroBlog, IRCChannel)
ioCommunities foreach(community,
  community println
  "" println
)

// Style Guide - copied the guidelines I understood *and* agreed with
ioStyle := Object clone
ioStyle source := "http://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide"
ioStyle guideLines := Map clone
ioStyle guideLines atPut("Assignments", list(
  "Use setters whenever possible, not direct assignment. " ..
  "This makes sense not just from a readability perspective, but also for those like me that prefer building more immutable objects.",
  "Consider direct assignment on external objects harmful. " ..
  "Let the object handle its internal state itself to preserve encapsulation."
))
ioStyle guideLines atPut("Initialization", list(
  "The init method should:" ..
  " * be used to initialize object state to known good defaults *only*, nothing more!\n" ..
  " * not be used to initialize literal or immutable values (do this in its prototype)\n" ..
  " * always be used to initialize dynamically created values (e.g. list()). Otherwise, these values will be shared by all instances of the object\n",
  "Facilitate isolation and testability by employing dependency injection, a very common technique.",
  "Keep object state as simple as possible."
))
ioStyle guideLines atPut("Methods", list(
  "Method names should begin with lowercase letter and camel cased. Like Java method names.",
  "Passing more than three arguments to a method creates a bad code smell and strongly suggests related data needs to be packaged together.",
  "Allow chaining by returning self when it doesn't make sense to return any other object."
))
ioStyle println := method(
  "Style Guidelines" println
  "" println
  self guideLines keys foreach(category,
    gl := self guideLines at(category)
    gl foreach(line,
      line println
    )
    "" println
  )
)
ioStyle println

/** ANSWER **/

test := method(description, expression,
  if(expression, 
    (description .. " [PASSED]") println, 
    (description .. " [FAILED]") println)
)

test("Io is 'strongly' typed (very loosely speaking)",
  (1 + 1 == 2) and (try(1+'one') proto == Exception))

test("0 is considered true", 
  ((0 and true) == true) and ((0 or false) == true))

test("\"\" is considered true", 
  (("" and true) == true) and (("" or false) == true))

test("nil is considered false", 
  ((nil and true) == false) and ((nil or false) == false))

// How to tell what a prototype supports
Object protoSlots := method(self proto slotNames)
Person := Object clone
Person age ::= 0
Person name ::= nil

susan := Person clone setName("Susan") setAge(24) // yeah, right, but I don't feel a day older (except when I exercise) ;)
test("susan's prototype slots are \"age\", \"name\", \"setAge\", \"setName\", \"type\"",
  list("age", "name", "setAge", "setName", "type") containsAll(susan protoSlots sort))

Beverage := Object clone do(
  name ::= nil
  ingredients := List clone /* overridden in init method below on each clone since dynamic value */
  init := method(self ingredients = list())
  addIngredient := method(ingredient, self ingredients append(ingredient))
)

cosmo := Beverage clone setName("Cosmopolitan")
cosmo addIngredient("Vodka")
cosmo addIngredient("Triple Sec")
cosmo addIngredient("Lime Juice")
cosmo addIngredient("Cranberry Juice")

mojito := Beverage clone setName("Mojito") 
mojito addIngredient("Rum")
mojito addIngredient("Mint leaves")
mojito addIngredient("Sugar")
mojito addIngredient("Lime Juice")
mojito addIngredient("Soda")

test("::= will create a setter for name on Beverage",
  Beverage slotNames containsAll(list("name", "setName")))
test(":= will create the getter for ingredients on Beverage",
  Beverage slotNames contains("ingredients"))
test(":= will not create the setter for ingredients on Beverage",
  Beverage slotNames contains("setIngredients") == false)
test("= will raise an Exception when assigning a value to a slotName not already defined",
  try(Beverage description = "bla bla bla") isKindOf(Exception))

/** DO **/
"" println

"To run Io code from a file type at shell prompt: io <iofilename>" println

"To execute the code in a slot given its name you can do:" println
"  getSlot(slotName) call" println
"OR" println
"  perform(slotName, arg1, arg2, etc.)" println
