---
layout: supo_post
title: Scala week in review
author: Susan Potter
author_url: http://susanpotter.net
date: 2011-07-09
---

## My Confession

I did the [Day One Scala exercise](https://github.com/mbbx6spp/7languages7weeks/blob/master/scala/src/main/scala/day1/tictactoe.scala) 
I even setup a [Sbt](https://github.com/harrah/xsbt/wiki) build environment, ran it watching for file changes and then running my 
[ScalaTest](http://www.scalatest.org/) tests when a new version of the file was saved to disk, but then I jumped ship. There it is. 
Judge me all you want. It feels so good coming clean. I left the book at Day One.

## High Treason

Fear not though, I didn't jump ship without having another vessel to swim to. I realized I was going to learn a little more by myself
since an opportunity came along during my Day One (Wednesday) to challenge a former coworker (who prefers to stay anonymous) to a duel: 
a duel to the bitter end. Our challenge is to build a web app (with actors in the back-end) in Scala using whatever framework we want 
and the "best" app wins (we have our own judges lined up). Our deadline will be July 15, which is of significance as that is when we 
submit our applications to another competition, which I cannot reveal.

I have already deployed a very simple test web application to Heroku's new Cedar stack. I don't think Scala is official supported, so 
don't tell them I am spreading the word;)

My application isn't terribly exciting to the average web user to be honest, but it is giving me an opportunity to also play with 
[KnockoutJS](http://knockoutjs.com) using the MVVM architectural pattern on the client-side for the first time. I know a trader or two 
who will appreciate what I am doing if they will be able to view their trade blotters on their iPads. Ok, maybe it is just one, but 
at least I can name him.

In short, I am in the midst of Scala Akka's actors, futures, STM and the Play web framework (which is available in Java & Scala flavo[u]rs).

## Other Scala Adventures

My other Scala adventure will turn up in my [scala-git](http://github.com/mbbx6spp/scala-git) repository on Github later in July/August, 
which is providing me an opportunity to fulfill three goals simultaneously:

* Learn Scala better (especially learn more about the woes of Java interop and when/how to take care)
* Experiment with Java 7's NIO.2 (JSR-203) which looks very promising
* Acquaint myself more with the lower-level workings of Git as I am writing the Git chapter in the upcoming second volume to 
[The Architecture of Open Source Applications](http://www.aosa.org/) which will be released in the Autumn of this year (I believe).

## Tasty Scala Tidbits

Ok, some tasty tidbits I found on my limited Scala/Akka travels this week were:

* **Futures are monads:** I think this is the tastiest by far. If you don't know what a monad is, do not fret. I will not explain 
the intricacies for you here, partly because I don't have time, partly because everyone else (read: [@marick](http://twitter.com/marick)) 
has already [created a screencast or four about monads](http://www.exampler.com/blog/2011/03/06/part-1-of-a-tutorial-on-monads/)
and partly because I am not sure I can do it justice! Suffice it to say that making Futures monads allows us to combine the results
of several Futures into a single chained calculation in such a way that a reasonably smart runtime (like the JVM) could turn our 
concurrent semantics of Futures into parallel code. Note: jlouis wrote an excellent blog post on 
[*Erlang's parallelism is not parallelism*](http://jlouisramblings.blogspot.com/2011/07/erlangs-parallelism-is-not-parallelism.html)
which I highly recommend you read. NOW!:)
* **Futures failure method:** When sending a messageto an actorusing !!!that returns a Futureobject 
if an exception is thrown it will be contained by the Futureobject and then when get()is called on the Futureit 
will throw the exception at that time. If instead we want to handle a specific exception to return a particular special value in the 
case of an exception, then we can use the failure method like so:
<pre>
<code>
val future = actor !!! message failure {
  case e: FileNotFoundException => ""
}
</code>
</pre>
* **You can listen for ActorRegistry events:** This way an interested party could actively listen for when another actor registers 
and unregisters. The Scala way of doing the equivalent of process linking found in Erlang, perhaps? If you are a Scala/Akka person, 
please let me know! Either way it looks very promising indeed. Something like:

<pre>
<code>

import akka.actor.\_

class LinkedActorListener extends Actor {
  def receive = {
    case event: ActorRegistered => event.actor.actorClassName match {
      case MySubordinateActor => // do something useful here...
    }
    case event: ActorUnregistered => ...
  }
}

</code>
</pre>
