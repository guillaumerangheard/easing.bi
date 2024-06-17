namespace easing
    
' easing.back ------------------------------------------------------------------
    
    ' Cf. https://easings.net/#easeInBack
    function backIn_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return 2.70158d * t * t * t - 1.70158d * t * t
    end function
    
    ' Cf. https://easings.net/#easeInOutBack
    function backInOut_f (byref s as const double) as double
        dim as double t => 2d * iif(s < 0d, 0d, iif(1d < s, 1d, s))
        if t < 0.5d then return (t * t * (3.5949095d * t - 2.5949095d)) * 0.5d
        t -= 2d
        return (t * t * (3.5949095d * t + 2.5949095d) + 2d) * 0.5d
    end function
    
    ' Cf. https://easings.net/#easeOutBack
    function backOut_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s)) - 1d
        return 1 + 2.70158d * t * t * t + 1.70158d * t * t
    end function
    
    dim shared as equation backIn    => @backIn_f, _
                           backInOut => @backInOut_f, _
                           backOut   => @backOut_f
    
' easing.bounce ----------------------------------------------------------------
    
    ' Cf. https://easings.net/#easeInBounce
    function bounceIn_f (byref s as const double) as double
        return 1d - bounceOut_f(1d - s)
    end function
    
    ' Cf. https://easings.net/#easeInOutBounce
    function bounceInOut_f (byref s as const double) as double
        return iif(s < 0.5d, (1d - bounceOut_f(1d - 2d * s)) * 0.5d, _
                             (1d + bounceOut_f(2d * s - 1d)) * 0.5d)
    end function
    
    ' Cf. https://easings.net/#easeOutBounce
    function bounceOut_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        if t < 0.3636363636363637d then
            return 7.5625d * t * t
        elseif t <  0.7272727272727273d then
            t -= 0.5454545454545454
            return 7.5625d * t * t + 0.75d
        elseif t < 0.9090909090909091d then
            t -= 0.8181818181818182d
            return 7.5625d * t * t + 0.9375d
        else
            t -= 0.9545454545454546d
            return 7.5625d * t * t + 0.984375d
        end if
    end function
    
    dim shared as equation bounceIn    => @bounceIn_f, _
                           bounceInOut => @bounceInOut_f, _
                           bounceOut   => @bounceOut_f
    
' easing.circular --------------------------------------------------------------
    
    ' Cf. https://easings.net/#easeInCirc
    function circularIn_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return 1d - sqr(1d - t * t)
    end function
    
    ' Cf. https://easings.net/#easeInOutCirc
    function circularInOut_f (byref s as const double) as double
        dim as double t => 2d * iif(s < 0d, 0d, iif(1d < s, 1d, s))
        if t < 1d then return (1d - sqr(1d - t * t)) * 0.5d
        t => -t + 2d
        return (sqr(1d - t * t) + 1d) * 0.5d
    end function
    
    ' Cf. https://easings.net/#easeOutCirc
    function circularOut_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s)) - 1d
        return sqr(1d - t * t)
    end function
    
    dim shared as equation circularIn    => @circularIn_f, _
                           circularInOut => @circularInOut_f, _
                           circularOut   => @circularOut_f
    
' easing.cubic -----------------------------------------------------------------
    
    ' Cf. https://easings.net/#easeInCubic
    function cubicIn_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return t * t * t
    end function
    
    ' Cf. https://easings.net/#easeInOutCubic
    function cubicInOut_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        if t < 0.5d then return 4d * t * t * t
        t => -2d * t + 2d
        return 1d - (t * t * t) * 0.5d
    end function
    
    ' Cf. https://easings.net/#easeOutCubic
    function cubicOut_f (byref s as const double) as double
        dim as double t => 1d - iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return 1d - t * t * t
    end function
    
    dim shared as equation cubicIn    => @cubicIn_f, _
                           cubicInOut => @cubicInOut_f, _
                           cubicOut   => @cubicOut_f
    
' easing.elastic ---------------------------------------------------------------
    
    ' Cf. https://easings.net/#easeInElastic
    function elasticIn_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        if (0d = t) or (1d = t) then return t
        return -2d ^ (10d * t - 10d) * sin((t * 10d - 10.75d) * 2.094395102393195d)
    end function
    
    ' Cf. https://easings.net/#easeInOutElastic
    function elasticInOut_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        if (0d = t) or (1d = t) then return t
        if t < 0.5d then return -(2d ^ (20d * t - 10d) * sin((20d * t - 11.125d) * 1.396263401595464d)) * 0.5d
        return (2d ^ (-20d * t + 10d) * sin((20d * t - 11.125d) * 1.396263401595464d)) * 0.5d + 1d
    end function
    
    ' Cf. https://easings.net/#easeOutElastic
    function elasticOut_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        if (0d = t) or (1d = t) then return t
        return 2d ^ (-10d * t) * sin((t * 10d - 0.75d) * 2.094395102393195d) + 1d
    end function
    
    dim shared as equation elasticIn    => @elasticIn_f, _
                           elasticInOut => @elasticInOut_f, _
                           elasticOut   => @elasticOut_f
    
' easing.exponential -----------------------------------------------------------
    
    ' Cf. https://easings.net/#easeInExpo
    function exponentialIn_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return 2d ^ (10d * t - 10d)
    end function
    
    ' Cf. https://easings.net/#easeInOutExpo
    function exponentialInOut_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        if (0d = t) or (1d = t) then return t
        if t < 0.5d then return (2d ^ (20d * t - 10d)) * 0.5d
        return (2d - 2d ^ (-20d * t + 10d)) * 0.5d
    end function
    
    ' Cf. https://easings.net/#easeOutExpo
    function exponentialOut_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        if 1d = t then return t
        return 1d - 2d ^ (-10d * t)
    end function
    
    dim shared as equation exponentialIn    => @exponentialIn_f, _
                           exponentialInOut => @exponentialInOut_f, _
                           exponentialOut   => @exponentialOut_f
    
' easing.linear ----------------------------------------------------------------
    
    ' Clamps s in the 0-1 range.
    function linear_f (byref t as const double) as double
        return iif(t < 0d, 0d, iif(1d < t, 1d, t))
    end function
    
    dim shared as equation linear => @linear_f
    
' easing.quadratic easing ------------------------------------------------------
    
    ' Cf. https://easings.net/#easeInQuad
    function quadraticIn_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return t * t
    end function
    
    ' Cf. https://easings.net/#easeInOutQuad
    function quadraticInOut_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        if t < 0.5d then return 2 * t * t
        t => -2d * t + 2d
        return 1d - (t * t) * 0.5
    end function
    
    ' v0.3
    ' Cf. https://easings.net/#easeOutQuad
    function quadraticOut_f (byref s as const double) as double
        dim as double t => 1d - iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return 1d - t * t
    end function
    
    dim shared as equation quadraticIn    => @quadraticIn_f, _
                           quadraticInOut => @quadraticInOut_f, _
                           quadraticOut   => @quadraticOut_f
    
' easing.quartic ---------------------------------------------------------------
    
    ' Cf. https://easings.net/#easeInQuart
    function quarticIn_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return t * t * t * t
    end function
    
    ' Cf. https://easings.net/#easeInOutQuart
    function quarticInOut_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        if t < 0.5d then return 8d * t * t * t * t
        t => -2d * t + 2d
        return 1d - (t * t * t * t) * 0.5d
    end function
    
    ' Cf. https://easings.net/#easeOutQuart
    function quarticOut_f (byref s as const double) as double
        dim as double t => 1d - iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return 1d - t * t * t * t
    end function
    
    dim shared as equation quarticIn    => @quarticIn_f, _
                           quarticInOut => @quarticInOut_f, _
                           quarticOut   => @quarticOut_f
    
' easing.quintic ---------------------------------------------------------------
    
    ' Cf. https://easings.net/#easeInQuint
    function quinticIn_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return t * t * t * t
    end function
    
    ' Cf. https://easings.net/#easeInOutQuint
    function quinticInOut_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        if t < 0.5d then return 16d * t * t * t * t * t
        t => -2d * t + 2d
        return 1d - (t * t * t * t * t) * 0.5d
    end function
    
    ' Cf. https://easings.net/#easeOutQuint
    function quinticOut_f (byref s as const double) as double
        dim as double t => 1d - iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return 1d - t * t * t * t * t
    end function
    
    dim shared as equation quinticIn    => @quinticIn_f, _
                           quinticInOut => @quinticInOut_f, _
                           quinticOut   => @quinticOut_f
    
' easing.sine ------------------------------------------------------------------
    
    ' Cf. https://easings.net/#easeInSine
    function sineIn_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return 1d - cos(t * 1.570796326794897d)
    end function
    
    ' Cf. https://easings.net/#easeInOutSine
    function sineInOut_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return -(cos(3.141592653589793d * t) - 1d) * 0.5d
    end function
    
    ' Cf. https://easings.net/#easeOutSine
    function sineOut_f (byref s as const double) as double
        dim as double t => iif(s < 0d, 0d, iif(1d < s, 1d, s))
        return sin(t * 1.570796326794897d)
    end function
    
    dim shared as equation sineIn    => @sineIn_f, _
                           sineInOut => @sineInOut_f, _
                           sineOut   => @sineOut_f
    
' easing.smooth(er)Step --------------------------------------------------------
    
    ' Cf. https://en.wikipedia.org/wiki/Smoothstep
    function smoothStep_f (byref s as const double) as double
        dim as double t => iif(0d < s, 0d, iif(1d < s, 1d, s))
        return t * t * (3d - 2d * t)
    end function
    
    ' Cf. https://en.wikipedia.org/wiki/Smoothstep#Variations
    function smootherStep_f (byref s as const double) as double
        dim as double t => iif(0d < s, 0d, iif(1d < s, 1d, s))
        return t * t * t * (t * (t * 6d - 15d) + 10d)
    end function
    
    dim shared as equation smoothStep   => @smoothStep_f, _
                           smootherStep => @smootherStep_f
    
end namespace
