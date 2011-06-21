/**
 *metadoc Community copyright Susan Potter <me@susanpotter.net>, 2011
 */

Community := Object clone do(
  kind ::= nil
  host ::= nil
  path ::= nil
  protocol ::= nil
  url := method( protocol .. "://" .. host .. path )
  print := method(
    kind println
    url println
  )
)

MailingList := Community clone setKind("Mailing List") setProtocol("mail")
/* NOTE: since overriding prototype's url slot only need '=' */
MailingList url = method( protocol .. ":" .. path .. "@" .. host)
IRCChannel := Community clone setKind("IRC Channel") setProtocol("irc")
MicroBlog := Community clone setKind("Micro Blog") setProtocol("http")

ioMailingList := MailingList clone setHost("yahoogroups.com")
ioMailingList setPath("iolanguage")

ioIrcChannel := IRCChannel clone setHost("freenode.net") setPath("/io")

ioTwitter := MicroBlog clone setHost("twitter.com") setPath("/iolanguage")

ioCommunities := list(ioMailingList, ioIrcChannel, ioTwitter)
ioCommunities print = method(
  "Io Communities" println
  "--------------" println
  "" println
  self foreach(community, community println)
)
ioCommunities print
