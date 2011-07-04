---
layout: supo_post
title: Revisiting Scala
author: Susan Potter
author_url: http://susanpotter.net
date: 2011-07-04
---

## Recap

Last time I seriously looked at Scala (not just "oooh, look Lift (or Akka) seems like an interesting 
web framework (or actor/STM framework) to checkout next time I have downtime" kind of way) I was 
evaluating it against Erlang/OTP for a new commercial project that was a great fit for using the 
actor model. This was 3-4 years ago. My conclusion then was for *our* needs Erlang/OTP was a better fit
for the following reasons:

* **Maturity:** The language, runtime (BEAM) and the OTP libraries were far more mature than Scala's equivalents. 
Of course, Scala's run-time (the JVM) was also quite mature, but couldn't compete on the maturity/stability side 
on the other two fronts (at all). Plus Scala (at the time) didn't have a clear winner of OTP equivalent. There
were a number of projects scattered around without any united API or design principle; they were just seedling 
pet projects trying to implement small portions of OTP.
* **Signal to noise ratio:** At that time Scala was getting a lot of press, partly because Twitter had 
dropped their Erlang pilot projects in favor of Scala, but it appeared to be the community with a lot more 
noise and hype. The team I worked on at the time was a small team of experienced software engineers and hands-on 
architects who didn't mind reading decent documentation, mailing list archives and academic papers to find 
the information they needed to. We appreciated the significantly higher signal to noise ratio in the Erlang 
world at that time. Two of us (myself included) recently came from a Ruby/Rails project where we were seeing 
as lot of *noise* in the general Rails community with little substance behind it (if any). We were tired of that
and didn't want go straight into another community like it. NOTE: I am not saying there aren't
VERY smart people in either Ruby or Scala communities. Just that the *vocal* majority appeared "*noisey*".
* **Tried and tested:** This is very similar to the first point, but focusing on the fact that Erlang and 
OTP had been tried and tested in large scale production settings already (for years); Scala had barely any 
large scale production success stories with any long life.

There were also some significant disadvantages to chosing Erlang/OTP over Scala at that time, namely:

* **JVM Interop:** Erlang has J/interface API to allow Erlang nodes to communicate with a JVM instance as 
if it were an Erlang node, however, the API is old and not as nicely designed as it could be today. Inter
operating with Java classes on the JVM would have been a nice to have. We got around this issue by creating 
language independent service interfaces around the Java servers and codebases already in the wild in the client 
organization and this turned out well for us. But it added some extra grunt work for us at the beginning.
* **Documentation:** Erlang's community might have been low noise, but it didn't have the 'Getting Started' guides 
and screencasts that the Scala world was putting out at a very quick pace. Erlang/OTP documentation is actually 
very, very good and thorough, but it isn't designed for beginners. It is written with people who know what they 
are looking for in a reference capacity. This might go towards explaining why Erlang adoption rates (while increasing 
at this point, ~3-4 years ago) was not taking off like Scala's adoption rate. At that time there was only one recent 
up to date book about Erlang and nothing other than Ericsson's manuals and reference documents on OTP.
* **Maturity:** What? I know I said this was one of the reasons we chose Erlang/OTP, but it is also worth mentioning 
that this is a double edged sword. Since Erlang and OTP are so mature, changing language/standard library and/or OTP 
APIs in any way (even for better) is not easy. It means there are some things in Erlang standard libraries and 
OTP that are there only for backward compatibility or because stripping it out would take far more time and energy
thank the Ericsson OTP team wanted to exert to accomplish it.

In short, it came down to dealing with the problems our team would prefer to deal with over the others. We picked to 
deal with the bottom set of  problems and we chose Erlang/OTP. We had a blast developing Erlang/OTP and we produced 
some very stable and reliable software services, especially considering it's sibling projects of yesteryear 
written in Java/J2EE/JEE before it and at the same time in other departments of the client. It wasn't effortless; we had to 
learn a whole lot more and do much more digging around, but I think Erlang/OTP was a great choice for that project. But 
I will never know if Scala might have been better or worse or even the same (for our project). Nobody can for *that* 
project at *that* time. It is impossible! Ultimately it doesn't much matter: we built a set of well oiled middle office 
services that a small team was able to support and add new features to quickly. By most measures it was a success and 
our team, in comparison to a number of client Java/J2EE projects, was very low cost and offering services doing comparable 
functionality under the same or greater loads than other teams internally.

In retrospect I probably miscommunicated my comparison of Scala and Erlang in blogs, etc at the time. I was partly bitter 
that the "noise" of the Scala vocal majority (and who knows if the vocal majority ended up actually writing Scala for 
a living or not in the end) just wanted to slam the Erlang name and that bitterness definitely came across. It didn't help 
that once our team proposed Erlang/OTP for thoughtful reasons, we got pushback from management because they had read some 
of the Scala hype and press and specifically read that Twitter chose Scala over Erlang/OTP. Management asked us to 
reconsider our technical evaluation of the two languages. We stood our ground and found better ways to present our 
reasons that management could appreciate better.

So the question we should be asking is, "how do Scala and Erlang/OTP compare today?".

## Revisiting

In short, since it is the beginning of Scala week of #7languages7weeks (I haven't even started Day One yet) I can't 
say how I might change my mind about Scala on a language level. However, I have been following Scala's ecosystem 
on the sidelines and I can already say that it has grown up quite a lot since then. And I am very happy to see this 
happen.

Promising areas of Scala today are:

* **Akka:** A framework that includes structured support for transparent, actors, STM...hell it sounds just 
like Distributed Erlang, OTP and Mnesia (ok, not exactly the latter analogy, but close).
* **Language Stability:** There have been a number of language and API changes since the last time I considered 
Scala for use. Hopefully that means changes will be lighter going forward, which would mean less churn and busy 
work when upgrading to newer versions of the language and libraries.
* **Scalang:** A library that attempts to allow Scala nodes talk to Erlang nodes over the Erlang distribution 
protocol for more seamless integration between the two languages and run-times. This is in early days now, but 
I am hopeful about its utility and longevity.

As a side note it is worth mentioning that Erlang is now available on the JVM in the form of Erjang, but we will get 
to Erlang in the following week.

Areas of Scala I originally took a personal dislike to before was it's hybrid paradigm making Scala a fairly "*heavy*" 
language with many different constructs. Contrast this to Lisp (or Clojure as we will visit in a couple of weeks).

## Scala, Bring It

So my hopes for this week are that I can see Scala flex its muscles without any oil glistening like it is a body 
builder's pageant like it felt in previous years.
