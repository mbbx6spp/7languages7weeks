---
layout: supo_post
title: "Io: Day One (Week Two)"
author: Susan Potter
author_url: http://susanpotter.net
date: 2011-06-20
---

Day one (week two) code can be found 
[on the master branch under io/day1](https://github.com/mbbx6spp/7languages7weeks/tree/master/io/day1)

I had a lot of fun investigating Io from the shell. My self-study code has some interesting gems I picked 
up will reading the Io documents.

I am liking the chaining style of setting up cloned objects:
<pre>
<code>
obj := MyProto clone setAttr1(val1) setAttr2(val2)
</code>
</pre>
as opposed to
<pre>
<code>
obj := MyProto clone
obj attr1 := val1
obj attr2 := val2
// OR
obj := MyProto clone do(
  attr1 = val1
  attr2 = val2
)
</code>
</pre>

Anyway the self-study code is worth checking out because I can't be bothered to write about it! #lazysleepdeprivedengineer
