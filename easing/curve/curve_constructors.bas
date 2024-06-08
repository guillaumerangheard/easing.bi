namespace easing
    
' constructors =================================================================
    
    ' Defaults to [0, 0, 1, 1], i.e. linear interpolation.
    constructor curve ()
        this._x2 => 1d
        this._y2 => 1d
    end constructor
    
    constructor curve (byref n1 as const double, byref n2 as const double, byref n3 as const double, byref n4 as const double)
        this._x1 => iif(0d <= n1, n1, 0d)
        this._y1 => n1
        this._x2 => iif(0d <= n3, n3, 0d)
        this._y2 => n4
    end constructor
    
    constructor curve (byref c as const curve)
        this._x1 => c._x1
        this._y1 => c._y1
        this._x2 => c._x2
        this._y2 => c._y2
    end constructor
    
end namespace
