# easing.bi v0.5

_easing.bi_ is an easing library for FreeBASIC I wrote while working on my generative art toolkit. To use it, just download and copy the _easing_ folder into your project, #include `"easing/easing.bi"`, and _voilà_. It contains (almost) all of [Penner's equations](http://robertpenner.com/easing/), as well as [smooth(er)step](https://en.wikipedia.org/wiki/Smoothstep), and a port of greweb's [Bezier easing](https://github.com/gre/bezier-easing). It implements two objects : **easing.equation** and **easing.curve**.

## easing.equation

All `easing.equation`'s are basically shared functions, whose prototype is `function (byref t as const double) as double`, where `t` is a number between 0 and 1 (representing the amount of transformation between whatever you want to interpolate). One way to use it is:
```freebasic
#include "easing/easing.bi"

dim as vec2 n1 => 10d, _
            n2 => 20d, _
            t

for i as real => 0d to 10d
    t => easing.smoothStep(i / 10d)
    print n1 * (1d - t) + n2 * t
next i
```
Extending the library is really easy:
```freebasic
namespace easing
    
    function yourAwesomeFunction_f (byref t as const double) as double
        ' Your awesome code goes here.
    end function

    dim shared as easing.equation yourAwesomeFunction => @yourAwesomeFunction_f
    
end namespace
```
(Note that the “_f” at the end of the function name is arbitrary. You can use whatever naming convention you want. It just so happens that I found this one to be simple and effective.)

## easing.curve

`easing.curve`'s are cubic Bezier curves, whose constructor takes four numbers: x1, y1, x2, y2, corresponding to their second and third keypoints (as the first and fourth one are implicit). Note that x1 and x2 are clamped between 0 and 1, as one cannot go back in time.) To create and use an `easing.curve`, just type something along the lines of:
```freebasic
#include "easing/easing.bi"

dim as easing.curve c => easing.curve(0.42d, 0d, 0.58d, 1d)
dim as double n1 => 10d, _
              n2 => 20d, _
              t

for i as double => 0d to 10d
    t => c.compute(i / 10d)
    print n1 * (1d - t) + n2 * t
next i
```

### Methods

#### easing.curve.compute (byref t as const double) as double [0.1+]

Takes a number between 0 and 1, which represents time and is technically an x coordinate, and returns the corresponding y coordinate on the curve. (For the underlying math, see greweb's [original post](https://greweb.me/2012/02/bezier-curve-based-easing-functions-from-concept-to-implementation).)

#### easing.curve.toCSS () as string [0.5+]

Returns the curve's keypoints as a CSS string, adjusting their decimals.

```freebasic
#include "easing/easing.bi"

dim as easing.curve c => easing.curve(0.7796228188090026, _
                                      0.7796228188090026, _
                                      0.5971406325697899, _
                                      0.9559938737656921)

print c.toCSS()
' -> "cubic-bezier(0.779,0.779,0.597,0.955)"
```

#### easing.curve.toJSON (byref asArray as boolean => false) [0.5+]

Returns the curve's keypoints either as a JSON object or a JSON array (if `asArray` is set to `true`).

```freebasic
#include "easing/easing.bi"

dim as easing.curve c => easing.curve(0.7796228188090026, _
                                      0.7796228188090026, _
                                      0.5971406325697899, _
                                      0.9559938737656921)

print c.toJSON()
' -> "{"xy":0.7796228188090026,"y1":0.7796228188090026,"x2":0.5971406325697899,"y2":0.9559938737656921}

print c.toJSON(true)
' -> "[0.7796228188090026,0.7796228188090026,0.5971406325697899,0.9559938737656921]
```

## What's next?

In (one of) the next version(s), I'll implement the option to switch to single precision.
