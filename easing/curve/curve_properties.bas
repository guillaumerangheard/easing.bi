namespace easing
    
' properties ===================================================================
    
' easing.cubicCurve.x1 ---------------------------------------------------------
    
    #macro c_p1(_a_)
    property cubicCurve.##_a_ () as float
        return this._##_a_
    end property
    #endmacro
    
    #macro c_p2(_a_)
    property cubicCurve.##_a_ (byref n as const float)
        this._##_a_ => n
    end property
    #endmacro
    
    #macro c_p3(_a_)
    property cubicCurve.##_a_ (byref n as const float)
        this._##_a_ => iif(n < 0.0, 0.0, iif(1.0 < n, 1.0, n))
    end property
    #endmacro
    
    c_p1(x1)
    c_p3(x1)
    
' easing.cubicCurve.y1 ---------------------------------------------------------
    
    c_p1(y1)
    c_p2(y1)
    
' easing.cubicCurve.x2 ---------------------------------------------------------
    
    c_p1(x2)
    c_p3(x2)
    
' easing.cubicCurve.y2 ---------------------------------------------------------
    
    c_p1(y2)
    c_p2(y2)
    
    #undef c_p1
    #undef c_p2
    #undef c_p3
    
end namespace
