---
layout: supo_post
title: "Erlang: Where Next?"
author: Susan Potter
author_url: http://susanpotter.net
date: 2011-07-17
---

## Status

Ok, I will admit I was pretty lax this week with Erlang. Partly because I 
didn't expect the chapter to show me anything new (I was a little disheartened 
with the book starting with Week 4 with Scala), but also partly because this
week has been a little crazy for me with various deadlines.

## Documentation & Pointers

Erlang is probably the language (along with Ruby jointly) that I know the best.

So here are a few thoughts for those that might like to learn a little more:

* *[Learn You Some Erlang](http://learnyousomeerlang.com):* Probably the most 
accessible online material for those coming into Erlang for the first time OR
those who are experienced with some parts of Erlang (and OTP), but want to learn
about a new area!
* *[Rebar](http://github.com/basho/rebar):* Rebar is probably the best build/
project lifecycle management tool for Erlang/OTP projects. It does require you 
use OTP conventions, which might be problematic for a handful of people, but 
overall I think this is a good thing. Consistency make switching between 
projects so much easier. Rebar even allows you to define templates (think Rails 
generators) for Erlang OTP applications and releases (see below).
* *[Rebar templates](http://github.com/mbbx6spp/rebar-templates):* I have been 
maintaining a Git repository of Rebar templates for some time, so feel free to 
fork this project and get started making your own Rebar templates.

Of course, when you get yourself off the ground and walking/jogging, then you 
should invest a lot of time on the erlang.org site official documentation. It 
isn't very accessible to beginners, but it will have the answer to specific 
questions you might have about stdlib or OTP library or design questions you 
might have.

## Testing

### Overview

Erlang and OTP have a variety of very interesting testing tools.
Ruby has RSpec, Cucumber and the more bland Test::Unit, and while on the surface 
you might not think Erlang has very interesting testing libraries/frameworks that
can compare to Ruby's rich set you would be very wrong. Erlang might not have the 
syntactic sugar that many developers are used to in Ruby, but it has intelligence 
in the testing libraries and frameworks to make up for it. 

Something I am not aware exists in the Ruby world (or at least not very well put 
together) are property based testing libraries and frameworks. This is something 
Erlang has as well as the more traditional example or case based testing libraries.

### EUnit (Case/Example based, Open Source)

First up is EUnit. It is probably most analogous to the XUnit style of frameworks 
out there (e.g. JUnit, NUnit, Test::Unit, PyUnit, etc.), but it allows you to 
create test generators, which is often a useful thing. I will let you delve 
deeper into that yourself though. Most relevant for testing static library code
rather than servers.

### Meck (Mocking/Stubbing library, Open Source)

This is a great library for mocking and stubbing, it is one that I use often. 
I even managed to contribute something to the project back in March. The 
maintainer, @eproxus, is open to suggestions and contributions.

### Common Test (Case/Example based with concurrent testing in mind, Open Source)

This is a great framework written by the OTP developers to primarily test 
concurrent code in ways to find hard to track down bugs. This is very powerful
and flexible, but it can be confusing as the documentation (like most things 
in Erlang and OTP) is geared towards those looking for reference or answers 
to specific questions.

### QuviQ's QuickCheck (Property based, Commercial)

I believe QuviQ (a company) was the first on the scene in the Erlang world with 
a property based testing library. It differs from case or example based libraries 
in the sense that you define properties or invariants that your code must uphold
rather than providing the specific inputs and calculating the expected outputs to 
to compare instead we define generators for the inputs and properties that our 
APIs must comply with to be valid.

The full version of QiviQ's QuickCheck Erlang edition is commercial (not sure 
how much it costs), but they provide a "mini" version for Erlang free of charge 
and free to distribute with your code (to, say, your clients) in binary format.

### PropEr (Property based, Open Source - GPL)

PropEr is an open source pseudo clone of QuickCheck. It's APIs are actually 
compliant with QuickCheck's (except in a few cases), which means that most 
code that is written to work against QuickCheck should be able to run against 
PropEr after replacing header includes and such.

Now there was some hoopla about its licensing a couple of months ago on the 
erlang-questions mailing list when the 1.0 release was announced. You can 
[read all about it yourself](http://erlang.org/pipermail/erlang-questions/2011-June/thread.html#59310) 
though, because it was quite loooooong!:)

If the licensing can be resolved amicably for your project then I think 
this is the way to go, because I really like the statem callback module approach.
I even created a template for testing gen_servers in my 
[rebar-templates](http://github.com/mbbx6spp/rebar-templates) project already!:)

### Triq (Property based, Open Source)

This is another property based testing library, which also aims to be as closely 
matching the QuickCheck API as possible too. Dr. Krab (creator of Erjang) is the 
maintainer of this project and while he an exceptional developer the project may 
lack momentum compared to PropEr's recent momentum in the open source 
property-based Erlang library space. But you should check it out to make your own 
judgement when choosing a property-based testing library for Erlang!

### Other

There are many other projects for testing different things in Erlang, the above 
are just a small sampling of the major projects with momentum. I have even 
seen clones of Cucumber in Erlang, though I do not know its current status.

## Other Stuff

### Exago (log state monitoring)

Exago can check log files to see whether a run of code (from production logs or 
simulated environment logs) conform to a finite state machine. This is another 
sort of "testing" tool, but not in the same vein as case or property based tests,
which is why I put it in the 'Other Stuff' section.

### Wrangler (Refactoring Tools)

Wrangler is an interesting project out of the University of Kent under Prof. 
Simon Thompson's vision. It provides emacs *and* Eclipse based refactoring 
tools. I have used the emacs mode and found it very useful. I refuse to 
touch Eclipse again after 9 years in the Java world unsatisfactorily hopping 
between IDEs, so I have no idea if it is any good. I do know though that new 
features are added to the emacs version first.

### McErlang (Model checker)

I wouldn't recommend using this unless you need to absolutely guarantee or "prove"
your code does what is advertises it does.  Model checkers aren't exactly testing 
libraries, they are much more intense and there are only a small handful projects
would need to be run through a model checker like McErlang. Feel free to decide 
for your own project. If you don't know what a model checker is though, you 
probably will not find this useful for your project.

## Summary

This should give you something to go on to move forward in your Erlang travels.

Hope this helps and hope you enjoy any adventures you have next with Erlang!:)
