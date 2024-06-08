namespace easing
    
' easing.circular --------------------------------------------------------------
    
    ' v0.3
    ' Cf. https://easings.net/#easeInCirc
    function circularIn_f (byref t as const double) as double
        return 1d - sqr(1d - t * t)
    end function
    
    ' v0.2
    ' Cf. https://easings.net/#easeInOutCirc
    function circularInOut_f (byref t as const double) as double
        dim as double u
        if t < 0.5d then
            u => 2d * t
            return (1d - sqr(1d - u * u)) / 2d
        else
            u => -1d * t + 2d
            return (sqr(1d - u * u) + 1d) / 2d
        end if
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeOutCirc
    function circularOut_f (byref t as const double) as double
        dim as double u => t - 1d
        return sqr(1d - u * u)
    end function
    
    dim shared as equation circularIn    => @circularIn_f, _
                           circularInOut => @circularInOut_f, _
                           circularOut   => @circularOut_f
    
' easing.cubic -----------------------------------------------------------------
    
    ' v0.3
    function cubicIn_f (byref t as const double) as double
        return t * t * t
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeInOutCubic
    function cubicInOut_f (byref t as const double) as double
        if t < 0.5d then return 4d * t * t * t
        dim as double u => -2d * t + 2d
        return 1d - (u * u * u) / 2d
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeOutCubic
    function cubicOut_f (byref t as const double) as double
        dim as double u => 1d - t
        return 1d - u * u * u
    end function
    
    dim shared as equation cubicIn    => @cubicIn_f, _
                           cubicInOut => @cubicInOut_f, _
                           cubicOut   => @cubicOut_f
    
' easing.exponential -----------------------------------------------------------
    
    ' v0.3
    ' Cf. https://easings.net/#easeInExpo
    function exponentialIn_f (byref t as const double) as double
        return iif(0d = t, t, 2d ^ (10d * t - 10d))
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeInOutExpo
    function exponentialInOut_f (byref t as const double) as double
        if 0d = t or 1d = t then return t
        return iif(t < 0d, (2d ^ (20d * t - 10d)) / 2d, _
                            (2d - (2d ^ (-20d * t + 10d))) / 2d)
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeOutExpo
    function exponentialOut_f (byref t as const double) as double
        return iif(1d = t, t, 1d - 2d ^ (-10d * t))
    end function
    
    dim shared as equation exponentialIn    => @exponentialIn_f, _
                           exponentialInOut => @exponentialInOut_f, _
                           exponentialOut   => @exponentialOut_f
    
' easing.linear ----------------------------------------------------------------
    
    function linear_f (byref t as const double) as double
        return t
    end function
    
    dim shared as equation linear => @linear_f
    
' easing.quadratic easing ------------------------------------------------------
    
    ' v0.3
    function quadraticIn_f (byref t as const double) as double
        return t * t
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeInOutQuad
    function quadraticInOut_f (byref t as const double) as double
        if t < 0.5d then return 2d * t * t
        dim as double u => -1d * t + 2d
        return 1d - (u * u) / 2d
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeOutQuad
    function quadraticOut_f (byref t as const double) as double
        dim as double u => 1d - t
        return 1d - u * u
    end function
    
    dim shared as equation quadraticIn    => @quadraticIn_f, _
                           quadraticInOut => @quadraticInOut_f, _
                           quadraticOut   => @quadraticOut_f
    
' easing.quartic ---------------------------------------------------------------
    
    ' v0.3
    function quarticIn_f (byref t as const double) as double
        return t * t * t * t
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeInOutQuart
    function quarticInOut_f (byref t as const double) as double
        if t < 0.5d then return 8d * t * t * t * t
        dim as double u => -2d * t + 2d
        return 1d - (u * u * u * u) / 2d
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeOutQuart
    function quarticOut_f (byref t as const double) as double
        dim as double u => 1d - t
        return 1d - (u * u * u * u)
    end function
    
    dim shared as equation quarticIn    => @quarticIn_f, _
                           quarticInOut => @quarticInOut_f, _
                           quarticOut   => @quarticOut_f
    
' easing.quintic ---------------------------------------------------------------
    
    ' v0.3
    function quinticIn_f (byref t as const double) as double
        return t * t * t * t * t
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeInOutQuint
    function quinticInOut_f (byref t as const double) as double
        if t < 0.5d then return t * t * t * t * t
        dim as double u => -2d * t + 2d
        return 1d - (u * u * u * u * u) / 2d
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeOutQuint
    function quinticOut_f (byref t as const double) as double
        dim as double u => 1d - t
        return 1d - (u * u * u * u * u)
    end function
    
    dim shared as equation quinticIn    => @quinticIn_f, _
                           quinticInOut => @quinticInOut_f, _
                           quinticOut   => @quinticOut_f
    
' easing.sine ------------------------------------------------------------------
    
    ' v0.3
    function sineIn_f (byref t as const double) as double
        return 1d - cos((t * 3.141592653589793d) / 2d)
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeInOutSine
    function sineInOut_f (byref t as const double) as double
        return -(cos(3.141592653589793d * t) - 1d) / 2d
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeOutSine
    function sineOut_f (byref t as const double) as double
        return sin((t * 3.141592653589793d) / 2d)
    end function
    
    dim shared as equation sineIn    => @sineIn_f, _
                           sineInOut => @sineInOut_f, _
                           sineOut   => @sineOut_f
    
' easing.smooth(er)Step --------------------------------------------------------
    
    'smoothStep
    function smoothStep_f (byref t as const double) as double
        dim as double u => iif(t < 0d, 0d, iif(1d < t, 1d, t))
        return u * u * (3d - 2d * u)
    end function
    
    'smootherStep
    function smootherStep_f (byref t as const double) as double
        dim as double u => iif(t < 0d, 0d, iif(1d < t, 1d, t))
        return u * u * u * (u * (u * 6d - 15d) + 10d)
    end function
    
    dim shared as equation smoothStep   => @smoothStep_f, _
                           smootherStep => @smootherStep_f
    
end namespace
