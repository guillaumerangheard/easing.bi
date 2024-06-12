#include "easing/easing.bi"

using easing

print "Done compiling " & versionString & "."

randomize()
dim as curve c => curve(rnd(), rnd(), rnd(), rnd())
print c
print c.toCSS
print c.toJSON
print c.toJSON(true)

sleep
