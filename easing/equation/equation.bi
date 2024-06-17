#ifdef _EASING_BI_
    #ifndef _EASING_EQUATION_BI_
        #define _EASING_EQUATION_BI_
        namespace easing
            type equation as function (byref as const double) as double
            
            declare function backIn_f           (byref as const double) as double
            declare function backInOut_f        (byref as const double) as double
            declare function backOut_f          (byref as const double) as double
            declare function bounceIn_f         (byref as const double) as double
            declare function bounceInOut_f      (byref as const double) as double
            declare function bounceOut_f        (byref as const double) as double
            declare function circularIn_f       (byref as const double) as double
            declare function circularInOut_f    (byref as const double) as double
            declare function circularOut_f      (byref as const double) as double
            declare function cubicIn_f          (byref as const double) as double
            declare function cubicInOut_f       (byref as const double) as double
            declare function cubicOut_f         (byref as const double) as double
            declare function elasticIn_f        (byref as const double) as double
            declare function elasticInOut_f     (byref as const double) as double
            declare function elasticOut_f       (byref as const double) as double
            declare function exponentialIn_f    (byref as const double) as double
            declare function exponentialInOut_f (byref as const double) as double
            declare function exponentialOut_f   (byref as const double) as double
            declare function linear_f           (byref as const double) as double
            declare function quadraticIn_f      (byref as const double) as double
            declare function quadraticInOut_f   (byref as const double) as double
            declare function quadraticOut_f     (byref as const double) as double
            declare function quarticIn_f        (byref as const double) as double
            declare function quarticInOut_f     (byref as const double) as double
            declare function quarticOut_f       (byref as const double) as double
            declare function quinticIn_f        (byref as const double) as double
            declare function quinticInOut_f     (byref as const double) as double
            declare function quinticOut_f       (byref as const double) as double
            declare function sineIn_f           (byref as const double) as double
            declare function sineInOut_f        (byref as const double) as double
            declare function sineOut_f          (byref as const double) as double
            declare function smoothStep_f       (byref as const double) as double
            declare function smootherStep_f     (byref as const double) as double
        end namespace
        #include "equation.bas"
    #endif
#endif