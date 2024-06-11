# easing.bi v0.4

_easing.bi_ is an easing library for FreeBASIC I wrote while working on my generative art toolkit. To use it, just download and copy the _easing_ folder into your project, #include `"easing/easing.bi"`, and _voilà_. It contains (almost) all of [Penner's equations](http://robertpenner.com/easing/), as well as [smooth(er)step](https://en.wikipedia.org/wiki/Smoothstep), and a port of greweb's [Bézier easing](https://github.com/gre/bezier-easing). It implements two objects : **easing.equation** and **easing.curve**.

## easing.equation

All `easing.equation`'s are basically shared functions, whose prototype is `function (byref t as const double) as double`, where `t` is a number between 0 and 1 (representing the amount of transformation between whatever you want to interpolate). One way to use it (should you for example use some awesome [math library](https://github.com/guillaumerangheard/math.bi)) is:
```freebasic
#include "easing/easing.bi"
#include "math/math.bi"

using math

dim as vec2 v1 => vec2(1d, 2d), _
            v2 => vec2(3d, 4d)

for i as real => 0d to 10d
    print lerp(v1, v2, i / 10d, easing.smoothStep)
next i
```
Extending the library is really easy:
```freebasic
namespace easing
    
    function yourAwesomeFunction_f (byref t as const double) as double
        ' Your awesome code goes here.
    end function

    dim shared as easing.equation yourAwesomeFunction => @yourAwesomeFunction
    
end namespace
```
(Note that the “_f” at the end of the function name is arbitrary. You can use whatever naming convention you want. It just so happens that I found this one to be simple and effective.)

## easing.curve



## Roadmap

In the next version (0.5), I'll implement the option to switch to single precision.
