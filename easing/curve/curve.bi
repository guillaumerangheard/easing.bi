#ifdef _EASING_BI_
    #ifndef _EASING_CURVE_BI_
        #define _EASING_CURVE_BI_
        namespace easing
            type curve
                public:
                    declare constructor ()
                    declare constructor (byref as const double, byref as const double, byref as const double, byref as const double)
                    declare constructor (byref as const curve)
                    
                    declare const operator cast () as string
                    declare       operator let  (byref as const curve)
                    
                    declare const property x1 () as double
                    declare       property x1 (byref as const double)
                    declare const property x2 () as double
                    declare       property x2 (byref as const double)
                    declare const property y1 () as double
                    declare       property y1 (byref as const double)
                    declare const property y2 () as double
                    declare       property y2 (byref as const double)
                    
                    declare const function compute (byref as const double) as double
                private:
                    as double _x1, _y1, _ ' Control point 1.
                             _x2, _y2     ' Control point 2.
                    
                    declare const function _calcBezier (byref as const double, byref as const double, byref as const double) as double
                    declare const function _getSlope   (byref as const double, byref as const double, byref as const double) as double
                    declare const function _getTForX   (byref as const double) as double
            end type
        end namespace
        #include "curve_constructors.bas"
        #include "curve_operators.bas"
        #include "curve_methods.bas"
    #endif
#endif