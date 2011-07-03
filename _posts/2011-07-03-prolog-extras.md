---
layout: supo_post
title: Prolog Extras and Experiments
author: Susan Potter
author_url: http://susanpotter.net
date: 2011-07-03
---

## Prolog week recap

So Day Three of Prolog in the #7languages7weeks challenge did not do Prolog 
justice IMO. This week was kind of a dud in terms of the book getting us to 
write real programs in a way we can rerun the full program again, building 
Prolog run-time environments with our predicates already loaded, etc. 

I feel as if the Prolog week section of the book could have explained logical 
programming and Prolog a little better than it did. It mentioned facts and rules, 
but stopped short of connecting them as parts of a definition of a predicate, not 
to mention how predicates are commonly structured (and why).

### Predicates

In Prolog a *predicate* is an ordered collection of clauses with same name and arity.

### Clauses

As far as I can see a *clause* in Prolog is either a *fact* or a *rule*; one or more 
*clauses* compose a *predicate*.

### Facts

A *fact* is a simple/base/unit statement or *clause*.

For example, it told us in Day One that +facts+ are simple statement clauses for 
building a *knowledge base*. Though +facts+ are more than just that. They can be 
part of predicate that also contains +rules+ too. You would probably want to define
the base +facts+ of a predicate above the more general rule elaborations of a 
predicate. So consider the following:

<pre>
<code lang="prolog">
  length([], 0).
  length([\_], 1).
</code>
</pre>

Clearly this is a fact (it does not have a body), but it needs to be grouped with 
the other parts of the same predicate (+length/2+ in this case), which can be 
composed of multiple clauses (+facts+, +rules+ or any combination thereof).

### Rules

A rule is a predicate head that also attaches a body of logic. e.g. 
<code>length(\[H|T\], Length) :- length(T, 1, Length).</code> (where <code>length/3</code> is defined 
elsewhere).

### Arity

Arities are important too. +length/2+ is not the same predicate as +length/3+. So 
grouping should be by predicate name and arity together (not just predicate name).

In Ruby and Javascript the arity does not determine method or function uniqueness 
(only the name does), whereas in Erlang the name and the arity determines a distinct 
function similar to Prolog's predicates (Erlang's functions even have one or more 
*clauses* as well;)).

## Prolog Extras

So here are some things I found out along the way (not from the 
book) on my travels through Prolog so far:

* **Typing operators:** Sometimes we want to verify input is of a specific type. 
The following are a list of builtin predicates (for GNU Prolog, at least) that 
check the type of the input:
   * number/1 - checks input is a number (float, integer, etc.)
   * float/1 - checks input is a float
   * integer/1 - checks input is an integer
   * var/1 - checks input is an unbound variable. e.g. <code>var(3) => no</code>, <code>var(MyVar) => yes</code>, <code>var(my\_atom) => no</code>
   * nonvar/1 - opposite of <code>var/1</code> above.
   * atomic/1 - checks input is an atom
   * I am sure there are more (there appear to be more available in SWI Prolog), but these were most applicable to me.
* **Including files:** You can include other files using the <code>:- include(atom\_of\_file\_basename\_without\_extension).</code>
This only appears to work if they are in your <code>CWD</code> (I didn't find any options for <code>gprolog</code> or <code>gplc</code> to add other 
directories to its load paths. *(If you know, please comment below. Thanks!)*
* **Changing the rules/facts on the fly:** What if a rule or fact needs to change for a predicate based on current 
operating conditions? How can we rewrite those parts of the predicate without reloading the full environment with 
brand new code added? Enter asserta/1, assertz/1, retract/1:
   * asserta/1 - will prepend to the predicate a clause (rule or fact)
   * assertz/1 - will append to the predicate a clause (rule or fact)
   * retract/1 - will remove a clause from a predicate
   * WARNING: these appear to be very powerful!:) My question is how can you persist the current predicate defintions 
back to disk once the run-time has been running a while? It should be possible, I would think.
* **Distributing Prolog:** I stumbled across an open source project on Sourceforge (called 
[Tabard](http://tabard.sourceforge.net/) that creates a distributed GNU Prolog environment. It appears as if you 
need to compile your Prolog code linking the PM2 and gprolog libraries linked and include the Tabard library file. 
Then you can spawn off distributed GNU Prolog nodes (run-times).

I think there are another few things, but that wraps up what I feel like writing up right now. Enjoy Prolog.
