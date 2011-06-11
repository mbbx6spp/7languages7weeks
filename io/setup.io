Language := Object clone
Language describe := method("A programming language" print)

ObjectOrientedLanguage := Language clone
ObjectOrientedLanguage describe := method("An object-oriented programming language" print)

PrototypeLanguage := Language clone
PrototypeLanguage describe := method("A prototype language")

ruby := ObjectOrientedLanguage clone
io := PrototypeLanguage clone





Lobby slotNames foreach(name, name println)