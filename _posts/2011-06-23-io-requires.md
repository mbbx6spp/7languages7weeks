---
layout: supo_post
title: Io's "require"
author: Susan Potter
author_url: http://susanpotter.net
date: 2011-06-20
---

[@sermoa](http://twitter.com/sermoa) asked a question today in her #7languages7weeks blog post that I found during my day two meaderings by 
accident: What is Io's equivalent to Ruby's <code>require</code>?

Below is what I found:
A few thoughts on require-ing:
* There is an object (at least in the version I am using, 2008.30.30) called Importer. I can do the following <code>Importer paths()</code> to get a list of all paths in the search path (Io's <code>$LOAD_PATH</code> equivalent).
* You can add to the search path with: <code>Importer addSearchPath("/your/path/here")</code>.
* If the file contains an object by the same name as the file name without .io extension, then you simply need to reference the Object once and the file gets loaded (provided it is in your search path).
* You can define your own "importer" where you should define the following methods: <code>import</code> and <code>importsFrom</code>. By default (at least in my version) there seem to be two importers used by default: <code>FileImporter</code> and <code>AddonImporter</code>. 
* The <code>Object</code> object has a method called <code>doFile</code>, which when passed the absolute path (not sure if it works with relative paths) of an .io file will load and interpret the file. Steve Dekorte emailed the iolanguage mailing list with his version of "require".

References:

1. [Importer path information](http://tech.groups.yahoo.com/group/iolanguage/message/9804)
1. [Steve Dekorte's "require" code](http://tech.groups.yahoo.com/group/iolanguage/message/9808)

