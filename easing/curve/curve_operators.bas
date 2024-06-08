namespace easing
    
' operators ====================================================================
    
' easing.curve.cast ------------------------------------------------------------
    
    operator curve.cast () as string
        return !"<easing.curve>{\n    x1 : " & this._x1 & _
                             !",\n    y1 : " & this._y1 & _
                             !",\n    x2 : " & this._x2 & _
                             !",\n    y2 : " & this._y2 & !"\n}"
    end operator
    
' easing.curve.let -------------------------------------------------------------
    
    operator curve.let (byref c as const curve)
        if @this <> @c then
            this._x1 => c._x1
            this._y1 => c._y1
            this._x2 => c._x2
            this._y2 => c._y2
        end if
    end operator
    
end namespace
