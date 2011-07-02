---
layout: supo_post
title: Io Adventures and Prolog's Wonder Logic
author: Susan Potter
author_url: http://susanpotter.net
date: 2011-07-01
---

So I didn't do the Day 3 exercises of Io (but I did play around myself with 
Io after reading Day 3) and now I am only at Day 2 of Prolog. I am going to 
say this challenge is harder than is sounds, even for someone that has worked 
with five out of the seven languages (although Io and Prolog are the only two 
I have **never** worked with).

My adventures in Io so far consist of trying to embed Io into a work project 
run-time. Not quite there yet, but hopefully will get to the end goal of being 
able to write Io scripts for our engine. Sadly that is all I can really say 
on the matter.

So Day One in Prolog was somewhat boring. It didn't inspire me to continue, 
but I am glad I did. In Day Two I was greeted with syntax that looked *very*
much like Erlang (I already knew this would be the case since I know a little 
about Erlang's history), but fundamentally different thought process was 
necessary.

Reversing a list was probably easier for someone with prior Erlang experience
like me, though it was still necessary to think in logical programming 
constructs, even if the accumulator idiom was used.

Calculating the minimum of a list was a littler harder for me as I had yet to 
fully appreciate that if a rule returned false (or no) then successive rules of 
the same predicate are tried until there are no more predicates or the rule is 
satisfied. From that realization onward things got a lot easier.

I have yet to complete Day Two exercises (I haven't tackled sorting a list yet).

Check out my 
[Day One](https://github.com/mbbx6spp/7languages7weeks/tree/master/prolog/day1) 
and 
[Day Two](https://github.com/mbbx6spp/7languages7weeks/tree/master/prolog/day2)
exercise code in the repository if you like.
