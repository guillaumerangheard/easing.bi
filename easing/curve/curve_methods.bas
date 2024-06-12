namespace easing
    
' methods ======================================================================
    
' easing.curve.compute ---------------------------------------------------------
    
    ' Cf. https://greweb.me/2012/02/bezier-curve-based-easing-functions-from-concept-to-implementation
    function curve.compute (byref x as const double) as double
        if (this._x1 = this._y1) and (this._x2 = this._y2) then return x
        return this._calcBezier(this._getTForX(x), this._y1, this._y2)
    end function
    
' easing.curve.toCSS -----------------------------------------------------------
    
    function curve.toCSS () as string
        return "cubic-bezier(" & curve._toCSSFloat(this._x1) & "," & curve._toCSSFloat(this._y1) & _
                           "," & curve._toCSSFloat(this._x2) & "," & curve._toCSSFloat(this._y2) & ")"
    end function
    
' easing.curve.toJSON ----------------------------------------------------------
    
    function curve.toJSON (byref a as const boolean) as string
        return iif(a, "["        & this._x1 &  ","        & this._y1 &  ","        & this._x2 &  ","        & this._y2 & "]", _
                     !"{\"x1\":" & this._x1 & !",\"y1\":" & this._y1 & !",\"x2\":" & this._x2 & !",\"y2\":" & this._y2 & "}")
    end function
    
' easing.curve._calcBezier -----------------------------------------------------
    
    #define _a(aA1,aA2) (1d - 3d * aA2 + 3d * aA1)
    #define _b(aA1,aA2) (3d * aA2 - 6d * aA1)
    #define _c(aA1)     (3d * aA1)
    
    function curve._calcBezier (byref aT as const double, byref aA1 as const double, byref aA2 as const double) as double
        return ((_a(aA1,aA2) * aT + _b(aA1,aA2)) * aT + _c(aA1)) * aT
    end function

' easing.curve._getSlope -------------------------------------------------------

    function curve._getSlope (byref aT as const double, byref aA1 as const double, byref aA2 as const double) as double
        return 3d * _a(aA1,aA2) * aT * aT + 2d * _b(aA1,aA2) * aT + _c(aA1)
    end function
    
' easing.curve._getTForX -------------------------------------------------------
    
    function curve._getTForX (byref aX as const double) as double
        dim as double aGuessT => aX, _
                     currentSlope, _
                     currentX
        for i as integer => 1% to 3%
            currentSlope => this._getSlope(aGuessT, this._x1, this._x2)
            if currentSlope = 0.0 then return aGuessT
            currentX => this._calcBezier(aGuessT, this._x1, this._x2) - aX
            aGuessT -= currentX / currentSlope
        next i
        return aGuessT
    end function
    
' easing.curve._toCSSFloat -----------------------------------------------------
    
    function curve._toCSSFloat (byref n as const double) as string
        dim as integer i => cint(fix(n)), _
                       f => cint(fix(frac(n) * 1000d))
        return iif(f, i & "." & abs(f), str(i))
    end function
    
    #undef _a
    #undef _b
    #undef _c
    
end namespace
