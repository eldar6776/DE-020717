# 1 "../Src/display.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 370 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../Src/display.c" 2
# 14 "../Src/display.c"
# 1 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 1 3
# 157 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((__pcs__("aapcs"))) unsigned __ARM_dcmp4(double , double );
extern __attribute__((__pcs__("aapcs"))) unsigned __ARM_fcmp4(float , float );







extern __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_fpclassifyf(float );
extern __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_fpclassify(double );



static __inline __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_isfinitef(float __x)
{
    return (((*(unsigned *)&(__x)) >> 23) & 0xff) != 0xff;
}
static __inline __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_isfinite(double __x)
{
    return (((*(1 + (unsigned *)&(__x))) >> 20) & 0x7ff) != 0x7ff;
}



static __inline __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_isinff(float __x)
{
    return ((*(unsigned *)&(__x)) << 1) == 0xff000000;
}
static __inline __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_isinf(double __x)
{
    return (((*(1 + (unsigned *)&(__x))) << 1) == 0xffe00000) && ((*(unsigned *)&(__x)) == 0);
}



static __inline __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_islessgreaterf(float __x, float __y)
{
    unsigned __f = __ARM_fcmp4(__x, __y) >> 28;
    return (__f == 8) || (__f == 2);
}
static __inline __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_islessgreater(double __x, double __y)
{
    unsigned __f = __ARM_dcmp4(__x, __y) >> 28;
    return (__f == 8) || (__f == 2);
}





static __inline __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_isnanf(float __x)
{
    return (0x7f800000 - ((*(unsigned *)&(__x)) & 0x7fffffff)) >> 31;
}
static __inline __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_isnan(double __x)
{
    unsigned __xf = (*(1 + (unsigned *)&(__x))) | (((*(unsigned *)&(__x)) == 0) ? 0 : 1);
    return (0x7ff00000 - (__xf & 0x7fffffff)) >> 31;
}



static __inline __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_isnormalf(float __x)
{
    unsigned __xe = ((*(unsigned *)&(__x)) >> 23) & 0xff;
    return (__xe != 0xff) && (__xe != 0);
}
static __inline __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_isnormal(double __x)
{
    unsigned __xe = ((*(1 + (unsigned *)&(__x))) >> 20) & 0x7ff;
    return (__xe != 0x7ff) && (__xe != 0);
}



static __inline __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_signbitf(float __x)
{
    return (*(unsigned *)&(__x)) >> 31;
}
static __inline __attribute__((nothrow)) __attribute__((__pcs__("aapcs"))) int __ARM_signbit(double __x)
{
    return (*(1 + (unsigned *)&(__x))) >> 31;
}
# 266 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
  typedef float float_t;
  typedef double double_t;
# 282 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern const int math_errhandling;







extern __attribute__((nothrow)) double acos(double );



extern __attribute__((nothrow)) double asin(double );





extern __attribute__((nothrow)) __attribute__((const)) double atan(double );



extern __attribute__((nothrow)) double atan2(double , double );





extern __attribute__((nothrow)) double cos(double );




extern __attribute__((nothrow)) double sin(double );





extern void __use_accurate_range_reduction(void);



extern __attribute__((nothrow)) double tan(double );





extern __attribute__((nothrow)) double cosh(double );




extern __attribute__((nothrow)) double sinh(double );






extern __attribute__((nothrow)) __attribute__((const)) double tanh(double );



extern __attribute__((nothrow)) double exp(double );






extern __attribute__((nothrow)) double frexp(double , int * ) __attribute__((__nonnull__(2)));







extern __attribute__((nothrow)) double ldexp(double , int );




extern __attribute__((nothrow)) double log(double );





extern __attribute__((nothrow)) double log10(double );



extern __attribute__((nothrow)) double modf(double , double * ) __attribute__((__nonnull__(2)));





extern __attribute__((nothrow)) double pow(double , double );






extern __attribute__((nothrow)) double sqrt(double );
# 410 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
    static __inline double _sqrt(double __x) { return sqrt(__x); }



    __attribute__((always_inline)) static float __sqrtf(float f) {
      __asm__ __volatile__(



      "vsqrt.f32 %0, %0"

      : "+w"(f));
      return f;
    }

    static __inline float _sqrtf(float __x) { return __sqrtf(__x); }
# 435 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((nothrow)) __attribute__((const)) double ceil(double );


extern __attribute__((nothrow)) __attribute__((const)) double fabs(double );



extern __attribute__((nothrow)) __attribute__((const)) double floor(double );



extern __attribute__((nothrow)) double fmod(double , double );
# 467 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((nothrow)) double acosh(double );



extern __attribute__((nothrow)) double asinh(double );



extern __attribute__((nothrow)) double atanh(double );



extern __attribute__((nothrow)) double cbrt(double );



static __inline __attribute__((nothrow)) __attribute__((const)) double copysign(double __x, double __y)



{
    (*(1 + (unsigned *)&(__x))) = ((*(1 + (unsigned *)&(__x))) & 0x7fffffff) | ((*(1 + (unsigned *)&(__y))) & 0x80000000);
    return __x;
}
static __inline __attribute__((nothrow)) __attribute__((const)) float copysignf(float __x, float __y)



{
    (*(unsigned *)&(__x)) = ((*(unsigned *)&(__x)) & 0x7fffffff) | ((*(unsigned *)&(__y)) & 0x80000000);
    return __x;
}
extern __attribute__((nothrow)) double erf(double );



extern __attribute__((nothrow)) double erfc(double );



extern __attribute__((nothrow)) double expm1(double );
# 533 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((nothrow)) double hypot(double , double );






extern __attribute__((nothrow)) int ilogb(double );



extern __attribute__((nothrow)) int ilogbf(float );



extern __attribute__((nothrow)) int ilogbl(long double );
# 646 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((nothrow)) double lgamma (double );




extern __attribute__((nothrow)) double log1p(double );



extern __attribute__((nothrow)) double logb(double );



extern __attribute__((nothrow)) float logbf(float );



extern __attribute__((nothrow)) long double logbl(long double );



extern __attribute__((nothrow)) double nextafter(double , double );




extern __attribute__((nothrow)) float nextafterf(float , float );




extern __attribute__((nothrow)) long double nextafterl(long double , long double );




extern __attribute__((nothrow)) double nexttoward(double , long double );




extern __attribute__((nothrow)) float nexttowardf(float , long double );




extern __attribute__((nothrow)) long double nexttowardl(long double , long double );




extern __attribute__((nothrow)) double remainder(double , double );



extern __attribute__((nothrow)) __attribute__((const)) double rint(double );



extern __attribute__((nothrow)) double scalbln(double , long int );



extern __attribute__((nothrow)) float scalblnf(float , long int );



extern __attribute__((nothrow)) long double scalblnl(long double , long int );



extern __attribute__((nothrow)) double scalbn(double , int );



extern __attribute__((nothrow)) float scalbnf(float , int );



extern __attribute__((nothrow)) long double scalbnl(long double , int );
# 740 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((nothrow)) __attribute__((const)) float _fabsf(float);
static __inline __attribute__((nothrow)) __attribute__((const)) float fabsf(float __f) { return _fabsf(__f); }
extern __attribute__((nothrow)) float sinf(float );
extern __attribute__((nothrow)) float cosf(float );
extern __attribute__((nothrow)) float tanf(float );
extern __attribute__((nothrow)) float acosf(float );
extern __attribute__((nothrow)) float asinf(float );
extern __attribute__((nothrow)) float atanf(float );
extern __attribute__((nothrow)) float atan2f(float , float );
extern __attribute__((nothrow)) float sinhf(float );
extern __attribute__((nothrow)) float coshf(float );
extern __attribute__((nothrow)) float tanhf(float );
extern __attribute__((nothrow)) float expf(float );
extern __attribute__((nothrow)) float logf(float );
extern __attribute__((nothrow)) float log10f(float );
extern __attribute__((nothrow)) float powf(float , float );
extern __attribute__((nothrow)) float sqrtf(float );
extern __attribute__((nothrow)) float ldexpf(float , int );
extern __attribute__((nothrow)) float frexpf(float , int * ) __attribute__((__nonnull__(2)));
extern __attribute__((nothrow)) __attribute__((const)) float ceilf(float );
extern __attribute__((nothrow)) __attribute__((const)) float floorf(float );
extern __attribute__((nothrow)) float fmodf(float , float );
extern __attribute__((nothrow)) float modff(float , float * ) __attribute__((__nonnull__(2)));
# 780 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
__attribute__((nothrow)) long double acosl(long double );
__attribute__((nothrow)) long double asinl(long double );
__attribute__((nothrow)) long double atanl(long double );
__attribute__((nothrow)) long double atan2l(long double , long double );
__attribute__((nothrow)) long double ceill(long double );
__attribute__((nothrow)) long double cosl(long double );
__attribute__((nothrow)) long double coshl(long double );
__attribute__((nothrow)) long double expl(long double );
__attribute__((nothrow)) long double fabsl(long double );
__attribute__((nothrow)) long double floorl(long double );
__attribute__((nothrow)) long double fmodl(long double , long double );
__attribute__((nothrow)) long double frexpl(long double , int* ) __attribute__((__nonnull__(2)));
__attribute__((nothrow)) long double ldexpl(long double , int );
__attribute__((nothrow)) long double logl(long double );
__attribute__((nothrow)) long double log10l(long double );
__attribute__((nothrow)) long double modfl(long double , long double * ) __attribute__((__nonnull__(2)));
__attribute__((nothrow)) long double powl(long double , long double );
__attribute__((nothrow)) long double sinl(long double );
__attribute__((nothrow)) long double sinhl(long double );
__attribute__((nothrow)) long double sqrtl(long double );
__attribute__((nothrow)) long double tanl(long double );
__attribute__((nothrow)) long double tanhl(long double );






extern __attribute__((nothrow)) float acoshf(float );
__attribute__((nothrow)) long double acoshl(long double );
extern __attribute__((nothrow)) float asinhf(float );
__attribute__((nothrow)) long double asinhl(long double );
extern __attribute__((nothrow)) float atanhf(float );
__attribute__((nothrow)) long double atanhl(long double );
__attribute__((nothrow)) long double copysignl(long double , long double );
extern __attribute__((nothrow)) float cbrtf(float );
__attribute__((nothrow)) long double cbrtl(long double );
extern __attribute__((nothrow)) float erff(float );
__attribute__((nothrow)) long double erfl(long double );
extern __attribute__((nothrow)) float erfcf(float );
__attribute__((nothrow)) long double erfcl(long double );
extern __attribute__((nothrow)) float expm1f(float );
__attribute__((nothrow)) long double expm1l(long double );
extern __attribute__((nothrow)) float log1pf(float );
__attribute__((nothrow)) long double log1pl(long double );
extern __attribute__((nothrow)) float hypotf(float , float );
__attribute__((nothrow)) long double hypotl(long double , long double );
extern __attribute__((nothrow)) float lgammaf(float );
__attribute__((nothrow)) long double lgammal(long double );
extern __attribute__((nothrow)) float remainderf(float , float );
__attribute__((nothrow)) long double remainderl(long double , long double );
extern __attribute__((nothrow)) float rintf(float );
__attribute__((nothrow)) long double rintl(long double );







extern __attribute__((nothrow)) double exp2(double );
extern __attribute__((nothrow)) float exp2f(float );
__attribute__((nothrow)) long double exp2l(long double );
extern __attribute__((nothrow)) double fdim(double , double );
extern __attribute__((nothrow)) float fdimf(float , float );
__attribute__((nothrow)) long double fdiml(long double , long double );
# 855 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((nothrow)) double fma(double , double , double );
extern __attribute__((nothrow)) float fmaf(float , float , float );

static __inline __attribute__((nothrow)) long double fmal(long double __x, long double __y, long double __z) { return (long double)fma((double)__x, (double)__y, (double)__z); }


extern __attribute__((nothrow)) __attribute__((const)) double fmax(double , double );
extern __attribute__((nothrow)) __attribute__((const)) float fmaxf(float , float );
__attribute__((nothrow)) long double fmaxl(long double , long double );
extern __attribute__((nothrow)) __attribute__((const)) double fmin(double , double );
extern __attribute__((nothrow)) __attribute__((const)) float fminf(float , float );
__attribute__((nothrow)) long double fminl(long double , long double );
extern __attribute__((nothrow)) double log2(double );
extern __attribute__((nothrow)) float log2f(float );
__attribute__((nothrow)) long double log2l(long double );
extern __attribute__((nothrow)) long lrint(double );
extern __attribute__((nothrow)) long lrintf(float );

static __inline __attribute__((nothrow)) long lrintl(long double __x) { return lrint((double)__x); }


extern __attribute__((nothrow)) long long llrint(double );
extern __attribute__((nothrow)) long long llrintf(float );

static __inline __attribute__((nothrow)) long long llrintl(long double __x) { return llrint((double)__x); }


extern __attribute__((nothrow)) long lround(double );
extern __attribute__((nothrow)) long lroundf(float );

static __inline __attribute__((nothrow)) long lroundl(long double __x) { return lround((double)__x); }


extern __attribute__((nothrow)) long long llround(double );
extern __attribute__((nothrow)) long long llroundf(float );

static __inline __attribute__((nothrow)) long long llroundl(long double __x) { return llround((double)__x); }


extern __attribute__((nothrow)) __attribute__((const)) double nan(const char * );
extern __attribute__((nothrow)) __attribute__((const)) float nanf(const char * );

static __inline __attribute__((nothrow)) __attribute__((const)) long double nanl(const char *__t) { return (long double)nan(__t); }
# 908 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((nothrow)) __attribute__((const)) double nearbyint(double );
extern __attribute__((nothrow)) __attribute__((const)) float nearbyintf(float );
__attribute__((nothrow)) long double nearbyintl(long double );
extern __attribute__((nothrow)) double remquo(double , double , int * );
extern __attribute__((nothrow)) float remquof(float , float , int * );

static __inline long double remquol(long double __x, long double __y, int *__q) { return (long double)remquo((double)__x, (double)__y, __q); }


extern __attribute__((nothrow)) __attribute__((const)) double round(double );
extern __attribute__((nothrow)) __attribute__((const)) float roundf(float );
__attribute__((nothrow)) long double roundl(long double );
extern __attribute__((nothrow)) double tgamma(double );
extern __attribute__((nothrow)) float tgammaf(float );
__attribute__((nothrow)) long double tgammal(long double );
extern __attribute__((nothrow)) __attribute__((const)) double trunc(double );
extern __attribute__((nothrow)) __attribute__((const)) float truncf(float );
__attribute__((nothrow)) long double truncl(long double );
# 15 "../Src/display.c" 2
# 1 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 1 3
# 71 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
    typedef unsigned int size_t;
# 91 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
    typedef unsigned short wchar_t;




typedef struct div_t { int quot, rem; } div_t;

typedef struct ldiv_t { long int quot, rem; } ldiv_t;


typedef struct lldiv_t { long long quot, rem; } lldiv_t;
# 139 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) int __aeabi_MB_CUR_MAX(void);
# 158 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) double atof(const char * ) __attribute__((__nonnull__(1)));





extern __attribute__((nothrow)) int atoi(const char * ) __attribute__((__nonnull__(1)));





extern __attribute__((nothrow)) long int atol(const char * ) __attribute__((__nonnull__(1)));






extern __attribute__((nothrow)) long long atoll(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((nothrow)) double strtod(const char * __restrict , char ** __restrict ) __attribute__((__nonnull__(1)));
# 206 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) float strtof(const char * __restrict , char ** __restrict ) __attribute__((__nonnull__(1)));
extern __attribute__((nothrow)) long double strtold(const char * __restrict , char ** __restrict ) __attribute__((__nonnull__(1)));




extern __attribute__((nothrow)) long int strtol(const char * __restrict ,
                        char ** __restrict , int ) __attribute__((__nonnull__(1)));
# 243 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) unsigned long int strtoul(const char * __restrict ,
                                       char ** __restrict , int ) __attribute__((__nonnull__(1)));
# 275 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) long long strtoll(const char * __restrict ,
                                  char ** __restrict , int )
                          __attribute__((__nonnull__(1)));






extern __attribute__((nothrow)) unsigned long long strtoull(const char * __restrict ,
                                            char ** __restrict , int )
                                   __attribute__((__nonnull__(1)));






extern __attribute__((nothrow)) int rand(void);
# 303 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) void srand(unsigned int );
# 313 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
struct _rand_state { int __x[57]; };
extern __attribute__((nothrow)) int _rand_r(struct _rand_state *);
extern __attribute__((nothrow)) void _srand_r(struct _rand_state *, unsigned int);
struct _ANSI_rand_state { int __x[1]; };
extern __attribute__((nothrow)) int _ANSI_rand_r(struct _ANSI_rand_state *);
extern __attribute__((nothrow)) void _ANSI_srand_r(struct _ANSI_rand_state *, unsigned int);





extern __attribute__((nothrow)) void *calloc(size_t , size_t );





extern __attribute__((nothrow)) void free(void * );







extern __attribute__((nothrow)) void *malloc(size_t );





extern __attribute__((nothrow)) void *realloc(void * , size_t );
# 374 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
typedef int (*__heapprt)(void *, char const *, ...);
extern __attribute__((nothrow)) void __heapstats(int (* )(void * ,
                                           char const * , ...),
                        void * ) __attribute__((__nonnull__(1)));
# 390 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) int __heapvalid(int (* )(void * ,
                                           char const * , ...),
                       void * , int ) __attribute__((__nonnull__(1)));
# 409 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) __attribute__((noreturn)) void abort(void);
# 420 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) int atexit(void (* )(void)) __attribute__((__nonnull__(1)));
# 442 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) __attribute__((noreturn)) void exit(int );
# 458 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) __attribute__((noreturn)) void _Exit(int );
# 469 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) char *getenv(const char * ) __attribute__((__nonnull__(1)));
# 482 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) int system(const char * );
# 495 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern void *bsearch(const void * , const void * ,
              size_t , size_t ,
              int (* )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
# 530 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern void qsort(void * , size_t , size_t ,
           int (* )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
# 558 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) __attribute__((const)) int abs(int );






extern __attribute__((nothrow)) __attribute__((const)) div_t div(int , int );
# 577 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) __attribute__((const)) long int labs(long int );
# 587 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) __attribute__((const)) ldiv_t ldiv(long int , long int );
# 608 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) __attribute__((const)) long long llabs(long long );
# 618 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) __attribute__((const)) lldiv_t lldiv(long long , long long );
# 642 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
typedef struct __sdiv32by16 { long quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned long quot, rem; } __udiv32by16;

typedef struct __sdiv64by32 { long rem, quot; } __sdiv64by32;

__attribute__((value_in_regs)) extern __attribute__((nothrow)) __attribute__((const)) __sdiv32by16 __rt_sdiv32by16(
     int ,
     short int );



__attribute__((value_in_regs)) extern __attribute__((nothrow)) __attribute__((const)) __udiv32by16 __rt_udiv32by16(
     unsigned int ,
     unsigned short );



__attribute__((value_in_regs)) extern __attribute__((nothrow)) __attribute__((const)) __sdiv64by32 __rt_sdiv64by32(
     int , unsigned int ,
     int );







extern __attribute__((nothrow)) unsigned int __fp_status(unsigned int , unsigned int );
# 703 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) int mblen(const char * , size_t );
# 718 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) int mbtowc(wchar_t * __restrict ,
                   const char * __restrict , size_t );
# 737 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) int wctomb(char * , wchar_t );
# 759 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) size_t mbstowcs(wchar_t * __restrict ,
                      const char * __restrict , size_t ) __attribute__((__nonnull__(2)));
# 777 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) size_t wcstombs(char * __restrict ,
                      const wchar_t * __restrict , size_t ) __attribute__((__nonnull__(2)));
# 796 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((nothrow)) void __use_realtime_heap(void);
extern __attribute__((nothrow)) void __use_realtime_division(void);
extern __attribute__((nothrow)) void __use_two_region_memory(void);
extern __attribute__((nothrow)) void __use_no_heap(void);
extern __attribute__((nothrow)) void __use_no_heap_region(void);

extern __attribute__((nothrow)) char const *__C_library_version_string(void);
extern __attribute__((nothrow)) int __C_library_version_number(void);
# 16 "../Src/display.c" 2
# 1 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 1 3
# 58 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) void *memcpy(void * __restrict ,
                    const void * __restrict , size_t ) __attribute__((__nonnull__(1,2)));






extern __attribute__((nothrow)) void *memmove(void * ,
                    const void * , size_t ) __attribute__((__nonnull__(1,2)));
# 77 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) char *strcpy(char * __restrict , const char * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((nothrow)) char *strncpy(char * __restrict , const char * __restrict , size_t ) __attribute__((__nonnull__(1,2)));
# 93 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) char *strcat(char * __restrict , const char * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((nothrow)) char *strncat(char * __restrict , const char * __restrict , size_t ) __attribute__((__nonnull__(1,2)));
# 117 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) int memcmp(const void * , const void * , size_t ) __attribute__((__nonnull__(1,2)));







extern __attribute__((nothrow)) int strcmp(const char * , const char * ) __attribute__((__nonnull__(1,2)));






extern __attribute__((nothrow)) int strncmp(const char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 141 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) int strcasecmp(const char * , const char * ) __attribute__((__nonnull__(1,2)));







extern __attribute__((nothrow)) int strncasecmp(const char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 158 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) int strcoll(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 169 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) size_t strxfrm(char * __restrict , const char * __restrict , size_t ) __attribute__((__nonnull__(2)));
# 193 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) void *memchr(const void * , int , size_t ) __attribute__((__nonnull__(1)));
# 209 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) char *strchr(const char * , int ) __attribute__((__nonnull__(1)));
# 218 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) size_t strcspn(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 232 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) char *strpbrk(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 247 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) char *strrchr(const char * , int ) __attribute__((__nonnull__(1)));
# 257 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) size_t strspn(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 270 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) char *strstr(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 280 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) char *strtok(char * __restrict , const char * __restrict ) __attribute__((__nonnull__(2)));
extern __attribute__((nothrow)) char *_strtok_r(char * , const char * , char ** ) __attribute__((__nonnull__(2,3)));
# 321 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) void *memset(void * , int , size_t ) __attribute__((__nonnull__(1)));





extern __attribute__((nothrow)) char *strerror(int );







extern __attribute__((nothrow)) size_t strlen(const char * ) __attribute__((__nonnull__(1)));






extern __attribute__((nothrow)) size_t strlcpy(char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 362 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) size_t strlcat(char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 388 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((nothrow)) void _membitcpybl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) void _membitcpybb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) void _membitcpyhl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) void _membitcpyhb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) void _membitcpywl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) void _membitcpywb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) void _membitmovebl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) void _membitmovebb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) void _membitmovehl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) void _membitmovehb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) void _membitmovewl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) void _membitmovewb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
# 17 "../Src/display.c" 2
# 1 "../Inc\\main.h" 1
# 18 "../Inc\\main.h"
# 1 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include\\stm32f7xx.h" 1
# 140 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include\\stm32f7xx.h"
# 1 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h" 1
# 65 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h"
typedef enum
{

  NonMaskableInt_IRQn = -14,
  MemoryManagement_IRQn = -12,
  BusFault_IRQn = -11,
  UsageFault_IRQn = -10,
  SVCall_IRQn = -5,
  DebugMonitor_IRQn = -4,
  PendSV_IRQn = -2,
  SysTick_IRQn = -1,

  WWDG_IRQn = 0,
  PVD_IRQn = 1,
  TAMP_STAMP_IRQn = 2,
  RTC_WKUP_IRQn = 3,
  FLASH_IRQn = 4,
  RCC_IRQn = 5,
  EXTI0_IRQn = 6,
  EXTI1_IRQn = 7,
  EXTI2_IRQn = 8,
  EXTI3_IRQn = 9,
  EXTI4_IRQn = 10,
  DMA1_Stream0_IRQn = 11,
  DMA1_Stream1_IRQn = 12,
  DMA1_Stream2_IRQn = 13,
  DMA1_Stream3_IRQn = 14,
  DMA1_Stream4_IRQn = 15,
  DMA1_Stream5_IRQn = 16,
  DMA1_Stream6_IRQn = 17,
  ADC_IRQn = 18,
  CAN1_TX_IRQn = 19,
  CAN1_RX0_IRQn = 20,
  CAN1_RX1_IRQn = 21,
  CAN1_SCE_IRQn = 22,
  EXTI9_5_IRQn = 23,
  TIM1_BRK_TIM9_IRQn = 24,
  TIM1_UP_TIM10_IRQn = 25,
  TIM1_TRG_COM_TIM11_IRQn = 26,
  TIM1_CC_IRQn = 27,
  TIM2_IRQn = 28,
  TIM3_IRQn = 29,
  TIM4_IRQn = 30,
  I2C1_EV_IRQn = 31,
  I2C1_ER_IRQn = 32,
  I2C2_EV_IRQn = 33,
  I2C2_ER_IRQn = 34,
  SPI1_IRQn = 35,
  SPI2_IRQn = 36,
  USART1_IRQn = 37,
  USART2_IRQn = 38,
  USART3_IRQn = 39,
  EXTI15_10_IRQn = 40,
  RTC_Alarm_IRQn = 41,
  OTG_FS_WKUP_IRQn = 42,
  TIM8_BRK_TIM12_IRQn = 43,
  TIM8_UP_TIM13_IRQn = 44,
  TIM8_TRG_COM_TIM14_IRQn = 45,
  TIM8_CC_IRQn = 46,
  DMA1_Stream7_IRQn = 47,
  FMC_IRQn = 48,
  SDMMC1_IRQn = 49,
  TIM5_IRQn = 50,
  SPI3_IRQn = 51,
  UART4_IRQn = 52,
  UART5_IRQn = 53,
  TIM6_DAC_IRQn = 54,
  TIM7_IRQn = 55,
  DMA2_Stream0_IRQn = 56,
  DMA2_Stream1_IRQn = 57,
  DMA2_Stream2_IRQn = 58,
  DMA2_Stream3_IRQn = 59,
  DMA2_Stream4_IRQn = 60,
  ETH_IRQn = 61,
  ETH_WKUP_IRQn = 62,
  CAN2_TX_IRQn = 63,
  CAN2_RX0_IRQn = 64,
  CAN2_RX1_IRQn = 65,
  CAN2_SCE_IRQn = 66,
  OTG_FS_IRQn = 67,
  DMA2_Stream5_IRQn = 68,
  DMA2_Stream6_IRQn = 69,
  DMA2_Stream7_IRQn = 70,
  USART6_IRQn = 71,
  I2C3_EV_IRQn = 72,
  I2C3_ER_IRQn = 73,
  OTG_HS_EP1_OUT_IRQn = 74,
  OTG_HS_EP1_IN_IRQn = 75,
  OTG_HS_WKUP_IRQn = 76,
  OTG_HS_IRQn = 77,
  DCMI_IRQn = 78,
  RNG_IRQn = 80,
  FPU_IRQn = 81,
  UART7_IRQn = 82,
  UART8_IRQn = 83,
  SPI4_IRQn = 84,
  SPI5_IRQn = 85,
  SPI6_IRQn = 86,
  SAI1_IRQn = 87,
  LTDC_IRQn = 88,
  LTDC_ER_IRQn = 89,
  DMA2D_IRQn = 90,
  SAI2_IRQn = 91,
  QUADSPI_IRQn = 92,
  LPTIM1_IRQn = 93,
  CEC_IRQn = 94,
  I2C4_EV_IRQn = 95,
  I2C4_ER_IRQn = 96,
  SPDIF_RX_IRQn = 97,
} IRQn_Type;
# 190 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h"
# 1 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 1
# 29 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3





# 1 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 1 3
# 56 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 3
typedef signed char int8_t;
typedef signed short int int16_t;
typedef signed int int32_t;
typedef signed long long int int64_t;


typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long int uint64_t;





typedef signed char int_least8_t;
typedef signed short int int_least16_t;
typedef signed int int_least32_t;
typedef signed long long int int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long int uint_least64_t;




typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed int int_fast32_t;
typedef signed long long int int_fast64_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long int uint_fast64_t;






typedef signed int intptr_t;
typedef unsigned int uintptr_t;



typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
# 35 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 2 3
# 63 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
# 1 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_version.h" 1 3
# 29 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_version.h" 3
# 64 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 2 3
# 162 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
# 1 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_compiler.h" 1 3
# 41 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_compiler.h" 3
# 1 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 1 3
# 31 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3


# 1 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 1 3






# 1 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 1 3
# 48 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ void __attribute__((__always_inline__, __nodebug__)) __wfi(void) {
  __builtin_arm_wfi();
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __wfe(void) {
  __builtin_arm_wfe();
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __sev(void) {
  __builtin_arm_sev();
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __sevl(void) {
  __builtin_arm_sevl();
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __yield(void) {
  __builtin_arm_yield();
}







static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__swp(uint32_t __x, volatile uint32_t *__p) {
  uint32_t v;
  do
    v = __builtin_arm_ldrex(__p);
  while (__builtin_arm_strex(__x, __p));
  return v;
}
# 107 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ void __attribute__((__always_inline__, __nodebug__)) __nop(void) {
  __builtin_arm_nop();
}




static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__ror(uint32_t __x, uint32_t __y) {
  __y %= 32;
  if (__y == 0)
    return __x;
  return (__x >> __y) | (__x << (32 - __y));
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rorll(uint64_t __x, uint32_t __y) {
  __y %= 64;
  if (__y == 0)
    return __x;
  return (__x >> __y) | (__x << (64 - __y));
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rorl(unsigned long __x, uint32_t __y) {

  return __ror(__x, __y);



}



static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__clz(uint32_t __t) {
  return __builtin_clz(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__clzl(unsigned long __t) {
  return __builtin_clzl(__t);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__clzll(uint64_t __t) {
  return __builtin_clzll(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rev(uint32_t __t) {
  return __builtin_bswap32(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__revl(unsigned long __t) {

  return __builtin_bswap32(__t);



}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__revll(uint64_t __t) {
  return __builtin_bswap64(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rev16(uint32_t __t) {
  return __ror(__rev(__t), 16);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rev16ll(uint64_t __t) {
  return (((uint64_t)__rev16(__t >> 32)) << 32) | __rev16(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rev16l(unsigned long __t) {

    return __rev16(__t);



}


static __inline__ int16_t __attribute__((__always_inline__, __nodebug__))
__revsh(int16_t __t) {
  return __builtin_bswap16(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rbit(uint32_t __t) {
  return __builtin_arm_rbit(__t);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rbitll(uint64_t __t) {

  return (((uint64_t)__builtin_arm_rbit(__t)) << 32) |
         __builtin_arm_rbit(__t >> 32);



}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rbitl(unsigned long __t) {

  return __rbit(__t);



}





static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulbb(int32_t __a, int32_t __b) {
  return __builtin_arm_smulbb(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulbt(int32_t __a, int32_t __b) {
  return __builtin_arm_smulbt(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smultb(int32_t __a, int32_t __b) {
  return __builtin_arm_smultb(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smultt(int32_t __a, int32_t __b) {
  return __builtin_arm_smultt(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulwb(int32_t __a, int32_t __b) {
  return __builtin_arm_smulwb(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulwt(int32_t __a, int32_t __b) {
  return __builtin_arm_smulwt(__a, __b);
}
# 271 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__qadd(int32_t __t, int32_t __v) {
  return __builtin_arm_qadd(__t, __v);
}

static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__qsub(int32_t __t, int32_t __v) {
  return __builtin_arm_qsub(__t, __v);
}

static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__qdbl(int32_t __t) {
  return __builtin_arm_qadd(__t, __t);
}




static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlabb(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlabb(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlabt(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlabt(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlatb(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlatb(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlatt(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlatt(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlawb(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlawb(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlawt(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlawt(__a, __b, __c);
}
# 324 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
typedef int32_t int8x4_t;
typedef int32_t int16x2_t;
typedef uint32_t uint8x4_t;
typedef uint32_t uint16x2_t;

static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sxtab16(int16x2_t __a, int8x4_t __b) {
  return __builtin_arm_sxtab16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sxtb16(int8x4_t __a) {
  return __builtin_arm_sxtb16(__a);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__uxtab16(int16x2_t __a, int8x4_t __b) {
  return __builtin_arm_uxtab16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__uxtb16(int8x4_t __a) {
  return __builtin_arm_uxtb16(__a);
}




static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__sel(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_sel(__a, __b);
}




static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__qadd8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_qadd8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__qsub8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_qsub8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__sadd8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_sadd8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__shadd8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_shadd8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__shsub8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_shsub8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__ssub8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_ssub8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uadd8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uadd8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uhadd8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uhadd8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uhsub8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uhsub8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uqadd8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uqadd8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uqsub8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uqsub8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__usub8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_usub8(__a, __b);
}




static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__usad8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_usad8(__a, __b);
}
static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__usada8(uint8x4_t __a, uint8x4_t __b, uint32_t __c) {
  return __builtin_arm_usada8(__a, __b, __c);
}




static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qadd16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qadd16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qasx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qasx(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qsax(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qsax(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qsub16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qsub16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sadd16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_sadd16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sasx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_sasx(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shadd16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shadd16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shasx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shasx(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shsax(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shsax(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shsub16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shsub16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__ssax(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_ssax(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__ssub16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_ssub16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uadd16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uadd16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uasx(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uasx(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhadd16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhadd16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhasx(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhasx(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhsax(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhsax(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhsub16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhsub16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqadd16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqadd16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqasx(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqasx(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqsax(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqsax(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqsub16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqsub16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__usax(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_usax(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__usub16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_usub16(__a, __b);
}




static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlad(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smlad(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smladx(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smladx(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlald(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlald(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlaldx(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlaldx(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlsd(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smlsd(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlsdx(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smlsdx(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlsld(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlsld(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlsldx(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlsldx(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smuad(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smuad(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smuadx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smuadx(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smusd(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smusd(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smusdx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smusdx(__a, __b);
}
# 8 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 2 3
# 40 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__disable_fiq(void) {
  unsigned int cpsr;

  __asm__ __volatile__("mrs %[cpsr], faultmask\n"
                       "cpsid f\n"
                       : [cpsr] "=r"(cpsr));
  return cpsr & 0x1;
# 62 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}


static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__disable_irq(void) {
  unsigned int cpsr;


  __asm__ __volatile__("mrs %[cpsr], primask\n"
                       "cpsid i\n"
                       : [cpsr] "=r"(cpsr));
  return cpsr & 0x1;
# 89 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}







static __inline__ void __attribute__((__always_inline__, __nodebug__))
__enable_fiq(void) {

  __asm__ __volatile__("cpsie f");
# 109 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}


static __inline__ void __attribute__((__always_inline__, __nodebug__))
__enable_irq(void) {

  __asm__ __volatile__("cpsie i");
# 124 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __force_stores(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static void __attribute__((__always_inline__, __nodebug__)) __memory_changed(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static void __attribute__((__always_inline__, __nodebug__)) __schedule_barrier(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static __inline__ int __attribute__((__always_inline__, __nodebug__))
__semihost(int val, const void *ptr) {
  register int v __asm__("r0") = val;
  register const void *p __asm__("r1") = ptr;
  __asm__ __volatile__(


      "bkpt 0xab"
# 160 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
      : "+r"(v), "+r"(p)
      :
      : "memory", "cc");
  return v;
}


static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__vfp_status(unsigned int mask, unsigned int flags) {
  unsigned int fpscr;
  __asm__ __volatile__("vmrs %[fpscr], fpscr" : [fpscr] "=r"(fpscr));
  unsigned int set = mask & flags;
  unsigned int clear = mask & ~flags;
  unsigned int toggle = ~mask & flags;
  fpscr |= set;
  fpscr &= ~clear;
  fpscr ^= toggle;
  __asm__ __volatile__("vmsr fpscr, %[fpscr]" : : [fpscr] "r"(fpscr));
  return fpscr;
}
# 34 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 2 3
# 68 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed)) T_UINT32 { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT16_WRITE { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT16_READ { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT32_WRITE { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT32_READ { uint32_t v; };
#pragma clang diagnostic pop
# 142 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_CONTROL(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, control" : "=r" (result) );
  return(result);
}
# 172 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_CONTROL(uint32_t control)
{
  __asm volatile ("MSR control, %0" : : "r" (control) : "memory");
}
# 196 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_IPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, ipsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_APSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, apsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_xPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, xpsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_PSP(void)
{
  register uint32_t result;

  __asm volatile ("MRS %0, psp" : "=r" (result) );
  return(result);
}
# 268 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PSP(uint32_t topOfProcStack)
{
  __asm volatile ("MSR psp, %0" : : "r" (topOfProcStack) : );
}
# 292 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_MSP(void)
{
  register uint32_t result;

  __asm volatile ("MRS %0, msp" : "=r" (result) );
  return(result);
}
# 322 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_MSP(uint32_t topOfMainStack)
{
  __asm volatile ("MSR msp, %0" : : "r" (topOfMainStack) : );
}
# 373 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_PRIMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, primask" : "=r" (result) );
  return(result);
}
# 403 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PRIMASK(uint32_t priMask)
{
  __asm volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}
# 446 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_BASEPRI(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, basepri" : "=r" (result) );
  return(result);
}
# 476 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI(uint32_t basePri)
{
  __asm volatile ("MSR basepri, %0" : : "r" (basePri) : "memory");
}
# 501 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI_MAX(uint32_t basePri)
{
  __asm volatile ("MSR basepri_max, %0" : : "r" (basePri) : "memory");
}







__attribute__((always_inline)) static __inline uint32_t __get_FAULTMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, faultmask" : "=r" (result) );
  return(result);
}
# 542 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  __asm volatile ("MSR faultmask, %0" : : "r" (faultMask) : "memory");
}
# 884 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  op2 %= 32U;
  if (op2 == 0U)
  {
    return op1;
  }
  return (op1 >> op2) | (op1 << (32U - op2));
}
# 1029 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __RRX(uint32_t value)
{
  uint32_t result;

  __asm volatile ("rrx %0, %1" : "=r" (result) : "r" (value) );
  return(result);
}
# 1044 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint8_t __LDRBT(volatile uint8_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrbt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint8_t) result);
}
# 1059 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint16_t __LDRHT(volatile uint16_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrht %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint16_t) result);
}
# 1074 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __LDRT(volatile uint32_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return(result);
}
# 1089 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRBT(uint8_t value, volatile uint8_t *ptr)
{
  __asm volatile ("strbt %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 1101 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRHT(uint16_t value, volatile uint16_t *ptr)
{
  __asm volatile ("strht %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 1113 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRT(uint32_t value, volatile uint32_t *ptr)
{
  __asm volatile ("strt %1, %0" : "=Q" (*ptr) : "r" (value) );
}
# 1332 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __SADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}


__attribute__((always_inline)) static __inline uint32_t __SSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("ssub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}


__attribute__((always_inline)) static __inline uint32_t __SADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("ssub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("ssax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USAD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usad8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USADA8(uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("usada8 %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}
# 1652 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __UXTB16(uint32_t op1)
{
  uint32_t result;

  __asm volatile ("uxtb16 %0, %1" : "=r" (result) : "r" (op1));
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UXTAB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uxtab16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SXTB16(uint32_t op1)
{
  uint32_t result;

  __asm volatile ("sxtb16 %0, %1" : "=r" (result) : "r" (op1));
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SXTAB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sxtab16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMUAD (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smuad %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMUADX (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smuadx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMLAD (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smlad %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMLADX (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smladx %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static __inline uint64_t __SMLALD (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlald %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static __inline uint64_t __SMLALDX (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlaldx %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static __inline uint32_t __SMUSD (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smusd %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMUSDX (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smusdx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMLSD (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smlsd %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMLSDX (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smlsdx %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static __inline uint64_t __SMLSLD (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlsld %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static __inline uint64_t __SMLSLDX (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlsldx %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static __inline uint32_t __SEL (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sel %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline int32_t __QADD( int32_t op1, int32_t op2)
{
  int32_t result;

  __asm volatile ("qadd %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline int32_t __QSUB( int32_t op1, int32_t op2)
{
  int32_t result;

  __asm volatile ("qsub %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}
# 1865 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline int32_t __SMMLA (int32_t op1, int32_t op2, int32_t op3)
{
  int32_t result;

  __asm volatile ("smmla %0, %1, %2, %3" : "=r" (result): "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}
# 42 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_compiler.h" 2 3
# 163 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 2 3
# 274 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef union
{
  struct
  {
    uint32_t _reserved0:16;
    uint32_t GE:4;
    uint32_t _reserved1:7;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} APSR_Type;
# 313 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:23;
  } b;
  uint32_t w;
} IPSR_Type;
# 331 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:1;
    uint32_t ICI_IT_1:6;
    uint32_t GE:4;
    uint32_t _reserved1:4;
    uint32_t T:1;
    uint32_t ICI_IT_2:2;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} xPSR_Type;
# 386 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef union
{
  struct
  {
    uint32_t nPRIV:1;
    uint32_t SPSEL:1;
    uint32_t FPCA:1;
    uint32_t _reserved0:29;
  } b;
  uint32_t w;
} CONTROL_Type;
# 421 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t ISER[8U];
        uint32_t RESERVED0[24U];
  volatile uint32_t ICER[8U];
        uint32_t RSERVED1[24U];
  volatile uint32_t ISPR[8U];
        uint32_t RESERVED2[24U];
  volatile uint32_t ICPR[8U];
        uint32_t RESERVED3[24U];
  volatile uint32_t IABR[8U];
        uint32_t RESERVED4[56U];
  volatile uint8_t IP[240U];
        uint32_t RESERVED5[644U];
  volatile uint32_t STIR;
} NVIC_Type;
# 455 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile const uint32_t CPUID;
  volatile uint32_t ICSR;
  volatile uint32_t VTOR;
  volatile uint32_t AIRCR;
  volatile uint32_t SCR;
  volatile uint32_t CCR;
  volatile uint8_t SHPR[12U];
  volatile uint32_t SHCSR;
  volatile uint32_t CFSR;
  volatile uint32_t HFSR;
  volatile uint32_t DFSR;
  volatile uint32_t MMFAR;
  volatile uint32_t BFAR;
  volatile uint32_t AFSR;
  volatile const uint32_t ID_PFR[2U];
  volatile const uint32_t ID_DFR;
  volatile const uint32_t ID_AFR;
  volatile const uint32_t ID_MFR[4U];
  volatile const uint32_t ID_ISAR[5U];
        uint32_t RESERVED0[1U];
  volatile const uint32_t CLIDR;
  volatile const uint32_t CTR;
  volatile const uint32_t CCSIDR;
  volatile uint32_t CSSELR;
  volatile uint32_t CPACR;
        uint32_t RESERVED3[93U];
  volatile uint32_t STIR;
        uint32_t RESERVED4[15U];
  volatile const uint32_t MVFR0;
  volatile const uint32_t MVFR1;
  volatile const uint32_t MVFR2;
        uint32_t RESERVED5[1U];
  volatile uint32_t ICIALLU;
        uint32_t RESERVED6[1U];
  volatile uint32_t ICIMVAU;
  volatile uint32_t DCIMVAC;
  volatile uint32_t DCISW;
  volatile uint32_t DCCMVAU;
  volatile uint32_t DCCMVAC;
  volatile uint32_t DCCSW;
  volatile uint32_t DCCIMVAC;
  volatile uint32_t DCCISW;
        uint32_t RESERVED7[6U];
  volatile uint32_t ITCMCR;
  volatile uint32_t DTCMCR;
  volatile uint32_t AHBPCR;
  volatile uint32_t CACR;
  volatile uint32_t AHBSCR;
        uint32_t RESERVED8[1U];
  volatile uint32_t ABFSR;
} SCB_Type;
# 921 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile const uint32_t ICTR;
  volatile uint32_t ACTLR;
} SCnSCB_Type;
# 961 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t LOAD;
  volatile uint32_t VAL;
  volatile const uint32_t CALIB;
} SysTick_Type;
# 1013 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile union
  {
    volatile uint8_t u8;
    volatile uint16_t u16;
    volatile uint32_t u32;
  } PORT [32U];
        uint32_t RESERVED0[864U];
  volatile uint32_t TER;
        uint32_t RESERVED1[15U];
  volatile uint32_t TPR;
        uint32_t RESERVED2[15U];
  volatile uint32_t TCR;
        uint32_t RESERVED3[29U];
  volatile uint32_t IWR;
  volatile const uint32_t IRR;
  volatile uint32_t IMCR;
        uint32_t RESERVED4[43U];
  volatile uint32_t LAR;
  volatile const uint32_t LSR;
        uint32_t RESERVED5[6U];
  volatile const uint32_t PID4;
  volatile const uint32_t PID5;
  volatile const uint32_t PID6;
  volatile const uint32_t PID7;
  volatile const uint32_t PID0;
  volatile const uint32_t PID1;
  volatile const uint32_t PID2;
  volatile const uint32_t PID3;
  volatile const uint32_t CID0;
  volatile const uint32_t CID1;
  volatile const uint32_t CID2;
  volatile const uint32_t CID3;
} ITM_Type;
# 1116 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t CYCCNT;
  volatile uint32_t CPICNT;
  volatile uint32_t EXCCNT;
  volatile uint32_t SLEEPCNT;
  volatile uint32_t LSUCNT;
  volatile uint32_t FOLDCNT;
  volatile const uint32_t PCSR;
  volatile uint32_t COMP0;
  volatile uint32_t MASK0;
  volatile uint32_t FUNCTION0;
        uint32_t RESERVED0[1U];
  volatile uint32_t COMP1;
  volatile uint32_t MASK1;
  volatile uint32_t FUNCTION1;
        uint32_t RESERVED1[1U];
  volatile uint32_t COMP2;
  volatile uint32_t MASK2;
  volatile uint32_t FUNCTION2;
        uint32_t RESERVED2[1U];
  volatile uint32_t COMP3;
  volatile uint32_t MASK3;
  volatile uint32_t FUNCTION3;
        uint32_t RESERVED3[981U];
  volatile uint32_t LAR;
  volatile const uint32_t LSR;
} DWT_Type;
# 1266 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t SSPSR;
  volatile uint32_t CSPSR;
        uint32_t RESERVED0[2U];
  volatile uint32_t ACPR;
        uint32_t RESERVED1[55U];
  volatile uint32_t SPPR;
        uint32_t RESERVED2[131U];
  volatile const uint32_t FFSR;
  volatile uint32_t FFCR;
  volatile const uint32_t FSCR;
        uint32_t RESERVED3[759U];
  volatile const uint32_t TRIGGER;
  volatile const uint32_t FIFO0;
  volatile const uint32_t ITATBCTR2;
        uint32_t RESERVED4[1U];
  volatile const uint32_t ITATBCTR0;
  volatile const uint32_t FIFO1;
  volatile uint32_t ITCTRL;
        uint32_t RESERVED5[39U];
  volatile uint32_t CLAIMSET;
  volatile uint32_t CLAIMCLR;
        uint32_t RESERVED7[8U];
  volatile const uint32_t DEVID;
  volatile const uint32_t DEVTYPE;
} TPI_Type;
# 1425 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile const uint32_t TYPE;
  volatile uint32_t CTRL;
  volatile uint32_t RNR;
  volatile uint32_t RBAR;
  volatile uint32_t RASR;
  volatile uint32_t RBAR_A1;
  volatile uint32_t RASR_A1;
  volatile uint32_t RBAR_A2;
  volatile uint32_t RASR_A2;
  volatile uint32_t RBAR_A3;
  volatile uint32_t RASR_A3;
} MPU_Type;
# 1521 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile uint32_t FPCCR;
  volatile uint32_t FPCAR;
  volatile uint32_t FPDSCR;
  volatile const uint32_t MVFR0;
  volatile const uint32_t MVFR1;
  volatile const uint32_t MVFR2;
} FPU_Type;
# 1630 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t DHCSR;
  volatile uint32_t DCRSR;
  volatile uint32_t DCRDR;
  volatile uint32_t DEMCR;
} CoreDebug_Type;
# 1854 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);

  reg_value = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;
  reg_value &= ~((uint32_t)((0xFFFFUL << 16U) | (7UL << 8U)));
  reg_value = (reg_value |
                ((uint32_t)0x5FAUL << 16U) |
                (PriorityGroupTmp << 8U) );
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = reg_value;
}







static __inline uint32_t __NVIC_GetPriorityGrouping(void)
{
  return ((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) >> 8U));
}
# 1885 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_EnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1902 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetEnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1921 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_DisableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;
  }
}
# 1940 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1959 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1974 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1991 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetActive(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 2013 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] = (uint8_t)((priority << (8U - 4)) & (uint32_t)0xFFUL);
  }
  else
  {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHPR[(((uint32_t)IRQn) & 0xFUL)-4UL] = (uint8_t)((priority << (8U - 4)) & (uint32_t)0xFFUL);
  }
}
# 2035 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetPriority(IRQn_Type IRQn)
{

  if ((int32_t)(IRQn) >= 0)
  {
    return(((uint32_t)((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] >> (8U - 4)));
  }
  else
  {
    return(((uint32_t)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHPR[(((uint32_t)IRQn) & 0xFUL)-4UL] >> (8U - 4)));
  }
}
# 2060 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4)) ? (uint32_t)(4) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4));

  return (
           ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
           ((SubPriority & (uint32_t)((1UL << (SubPriorityBits )) - 1UL)))
         );
}
# 2087 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* const pPreemptPriority, uint32_t* const pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4)) ? (uint32_t)(4) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4));

  *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
  *pSubPriority = (Priority ) & (uint32_t)((1UL << (SubPriorityBits )) - 1UL);
}
# 2110 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_SetVector(IRQn_Type IRQn, uint32_t vector)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  vectors[(int32_t)IRQn + 16] = vector;
}
# 2125 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetVector(IRQn_Type IRQn)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  return vectors[(int32_t)IRQn + 16];
}






static __inline void __NVIC_SystemReset(void)
{
  __builtin_arm_dsb(0xF);;

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = (uint32_t)((0x5FAUL << 16U) |
                           (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) |
                            (1UL << 2U) );
  __builtin_arm_dsb(0xF);;

  for(;;)
  {
    __builtin_arm_nop();
  }
}








# 1 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/mpu_armv7.h" 1 3
# 29 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/mpu_armv7.h" 3
# 107 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/mpu_armv7.h" 3
typedef struct {
  uint32_t RBAR;
  uint32_t RASR;
} ARM_MPU_Region_t;




static __inline void ARM_MPU_Enable(uint32_t MPU_Control)
{
  __builtin_arm_dsb(0xF);;
  __builtin_arm_isb(0xF);;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL = MPU_Control | (1UL );

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR |= (1UL << 16U);

}



static __inline void ARM_MPU_Disable(void)
{
  __builtin_arm_dsb(0xF);;
  __builtin_arm_isb(0xF);;

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR &= ~(1UL << 16U);

  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL &= ~(1UL );
}




static __inline void ARM_MPU_ClrRegion(uint32_t rnr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = 0U;
}





static __inline void ARM_MPU_SetRegion(uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}






static __inline void ARM_MPU_SetRegionEx(uint32_t rnr, uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}






static __inline void orderedCpy(volatile uint32_t* dst, const uint32_t* __restrict src, uint32_t len)
{
  uint32_t i;
  for (i = 0U; i < len; ++i)
  {
    dst[i] = src[i];
  }
}





static __inline void ARM_MPU_Load(ARM_MPU_Region_t const* table, uint32_t cnt)
{
  const uint32_t rowWordSize = sizeof(ARM_MPU_Region_t)/4U;
  while (cnt > 4U) {
    orderedCpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), 4U*rowWordSize);
    table += 4U;
    cnt -= 4U;
  }
  orderedCpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), cnt*rowWordSize);
}
# 2158 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 2 3
# 2177 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t SCB_GetFPUType(void)
{
  uint32_t mvfr0;

  mvfr0 = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->MVFR0;
  if ((mvfr0 & ((0xFUL << 4U) | (0xFUL << 8U))) == 0x220U)
  {
    return 2U;
  }
  else if ((mvfr0 & ((0xFUL << 4U) | (0xFUL << 8U))) == 0x020U)
  {
    return 1U;
  }
  else
  {
    return 0U;
  }
}
# 2218 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void SCB_EnableICache (void)
{

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->ICIALLU = 0UL;
    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR |= (uint32_t)(1UL << 17U);
    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_DisableICache (void)
{

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR &= ~(uint32_t)(1UL << 17U);
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->ICIALLU = 0UL;
    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_InvalidateICache (void)
{

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->ICIALLU = 0UL;
    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_EnableDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
    __builtin_arm_dsb(0xF);;

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                      ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);
    __builtin_arm_dsb(0xF);;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR |= (uint32_t)(1UL << 16U);

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_DisableDCache (void)
{

    register uint32_t ccsidr;
    register uint32_t sets;
    register uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
    __builtin_arm_dsb(0xF);;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR &= ~(uint32_t)(1UL << 16U);
    __builtin_arm_dsb(0xF);;

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                       ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_InvalidateDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
    __builtin_arm_dsb(0xF);;

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                      ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_CleanDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

     ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
   __builtin_arm_dsb(0xF);;

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCSW = (((sets << 5U) & (0x1FFUL << 5U)) |
                      ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_CleanInvalidateDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
    __builtin_arm_dsb(0xF);;

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                       ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}
# 2453 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void SCB_InvalidateDCache_by_Addr (uint32_t *addr, int32_t dsize)
{

     int32_t op_size = dsize;
    uint32_t op_addr = (uint32_t)addr;
     int32_t linesize = 32;

    __builtin_arm_dsb(0xF);;

    while (op_size > 0) {
      ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCIMVAC = op_addr;
      op_addr += (uint32_t)linesize;
      op_size -= linesize;
    }

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}
# 2480 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void SCB_CleanDCache_by_Addr (uint32_t *addr, int32_t dsize)
{

     int32_t op_size = dsize;
    uint32_t op_addr = (uint32_t) addr;
     int32_t linesize = 32;

    __builtin_arm_dsb(0xF);;

    while (op_size > 0) {
      ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCMVAC = op_addr;
      op_addr += (uint32_t)linesize;
      op_size -= linesize;
    }

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}
# 2507 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void SCB_CleanInvalidateDCache_by_Addr (uint32_t *addr, int32_t dsize)
{

     int32_t op_size = dsize;
    uint32_t op_addr = (uint32_t) addr;
     int32_t linesize = 32;

    __builtin_arm_dsb(0xF);;

    while (op_size > 0) {
      ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCIMVAC = op_addr;
      op_addr += (uint32_t)linesize;
      op_size -= linesize;
    }

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}
# 2553 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1UL) > (0xFFFFFFUL ))
  {
    return (1UL);
  }

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = (uint32_t)(ticks - 1UL);
  __NVIC_SetPriority (SysTick_IRQn, (1UL << 4) - 1UL);
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0UL;
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2U) |
                   (1UL << 1U) |
                   (1UL );
  return (0UL);
}
# 2583 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
extern volatile int32_t ITM_RxBuffer;
# 2595 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if (((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL )) != 0UL) &&
      ((((ITM_Type *) (0xE0000000UL) )->TER & 1UL ) != 0UL) )
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0U].u32 == 0UL)
    {
      __builtin_arm_nop();
    }
    ((ITM_Type *) (0xE0000000UL) )->PORT[0U].u8 = (uint8_t)ch;
  }
  return (ch);
}
# 2616 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline int32_t ITM_ReceiveChar (void)
{
  int32_t ch = -1;

  if (ITM_RxBuffer != ((int32_t)0x5AA55AA5U))
  {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = ((int32_t)0x5AA55AA5U);
  }

  return (ch);
}
# 2636 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline int32_t ITM_CheckChar (void)
{

  if (ITM_RxBuffer == ((int32_t)0x5AA55AA5U))
  {
    return (0);
  }
  else
  {
    return (1);
  }
}
# 191 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h" 2


# 1 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/system_stm32f7xx.h" 1
# 74 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/system_stm32f7xx.h"
extern uint32_t SystemCoreClock;

extern const uint8_t AHBPrescTable[16];
extern const uint8_t APBPrescTable[8];
# 104 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/system_stm32f7xx.h"
extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);
# 194 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h" 2
# 204 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h"
typedef struct
{
  volatile uint32_t SR;
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SMPR1;
  volatile uint32_t SMPR2;
  volatile uint32_t JOFR1;
  volatile uint32_t JOFR2;
  volatile uint32_t JOFR3;
  volatile uint32_t JOFR4;
  volatile uint32_t HTR;
  volatile uint32_t LTR;
  volatile uint32_t SQR1;
  volatile uint32_t SQR2;
  volatile uint32_t SQR3;
  volatile uint32_t JSQR;
  volatile uint32_t JDR1;
  volatile uint32_t JDR2;
  volatile uint32_t JDR3;
  volatile uint32_t JDR4;
  volatile uint32_t DR;
} ADC_TypeDef;

typedef struct
{
  volatile uint32_t CSR;
  volatile uint32_t CCR;
  volatile uint32_t CDR;

} ADC_Common_TypeDef;






typedef struct
{
  volatile uint32_t TIR;
  volatile uint32_t TDTR;
  volatile uint32_t TDLR;
  volatile uint32_t TDHR;
} CAN_TxMailBox_TypeDef;





typedef struct
{
  volatile uint32_t RIR;
  volatile uint32_t RDTR;
  volatile uint32_t RDLR;
  volatile uint32_t RDHR;
} CAN_FIFOMailBox_TypeDef;





typedef struct
{
  volatile uint32_t FR1;
  volatile uint32_t FR2;
} CAN_FilterRegister_TypeDef;





typedef struct
{
  volatile uint32_t MCR;
  volatile uint32_t MSR;
  volatile uint32_t TSR;
  volatile uint32_t RF0R;
  volatile uint32_t RF1R;
  volatile uint32_t IER;
  volatile uint32_t ESR;
  volatile uint32_t BTR;
  uint32_t RESERVED0[88];
  CAN_TxMailBox_TypeDef sTxMailBox[3];
  CAN_FIFOMailBox_TypeDef sFIFOMailBox[2];
  uint32_t RESERVED1[12];
  volatile uint32_t FMR;
  volatile uint32_t FM1R;
  uint32_t RESERVED2;
  volatile uint32_t FS1R;
  uint32_t RESERVED3;
  volatile uint32_t FFA1R;
  uint32_t RESERVED4;
  volatile uint32_t FA1R;
  uint32_t RESERVED5[8];
  CAN_FilterRegister_TypeDef sFilterRegister[28];
} CAN_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CFGR;
  volatile uint32_t TXDR;
  volatile uint32_t RXDR;
  volatile uint32_t ISR;
  volatile uint32_t IER;
}CEC_TypeDef;





typedef struct
{
  volatile uint32_t DR;
  volatile uint8_t IDR;
  uint8_t RESERVED0;
  uint16_t RESERVED1;
  volatile uint32_t CR;
  uint32_t RESERVED2;
  volatile uint32_t INIT;
  volatile uint32_t POL;
} CRC_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t SWTRIGR;
  volatile uint32_t DHR12R1;
  volatile uint32_t DHR12L1;
  volatile uint32_t DHR8R1;
  volatile uint32_t DHR12R2;
  volatile uint32_t DHR12L2;
  volatile uint32_t DHR8R2;
  volatile uint32_t DHR12RD;
  volatile uint32_t DHR12LD;
  volatile uint32_t DHR8RD;
  volatile uint32_t DOR1;
  volatile uint32_t DOR2;
  volatile uint32_t SR;
} DAC_TypeDef;






typedef struct
{
  volatile uint32_t IDCODE;
  volatile uint32_t CR;
  volatile uint32_t APB1FZ;
  volatile uint32_t APB2FZ;
}DBGMCU_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t SR;
  volatile uint32_t RISR;
  volatile uint32_t IER;
  volatile uint32_t MISR;
  volatile uint32_t ICR;
  volatile uint32_t ESCR;
  volatile uint32_t ESUR;
  volatile uint32_t CWSTRTR;
  volatile uint32_t CWSIZER;
  volatile uint32_t DR;
} DCMI_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t NDTR;
  volatile uint32_t PAR;
  volatile uint32_t M0AR;
  volatile uint32_t M1AR;
  volatile uint32_t FCR;
} DMA_Stream_TypeDef;

typedef struct
{
  volatile uint32_t LISR;
  volatile uint32_t HISR;
  volatile uint32_t LIFCR;
  volatile uint32_t HIFCR;
} DMA_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t ISR;
  volatile uint32_t IFCR;
  volatile uint32_t FGMAR;
  volatile uint32_t FGOR;
  volatile uint32_t BGMAR;
  volatile uint32_t BGOR;
  volatile uint32_t FGPFCCR;
  volatile uint32_t FGCOLR;
  volatile uint32_t BGPFCCR;
  volatile uint32_t BGCOLR;
  volatile uint32_t FGCMAR;
  volatile uint32_t BGCMAR;
  volatile uint32_t OPFCCR;
  volatile uint32_t OCOLR;
  volatile uint32_t OMAR;
  volatile uint32_t OOR;
  volatile uint32_t NLR;
  volatile uint32_t LWR;
  volatile uint32_t AMTCR;
  uint32_t RESERVED[236];
  volatile uint32_t FGCLUT[256];
  volatile uint32_t BGCLUT[256];
} DMA2D_TypeDef;






typedef struct
{
  volatile uint32_t MACCR;
  volatile uint32_t MACFFR;
  volatile uint32_t MACHTHR;
  volatile uint32_t MACHTLR;
  volatile uint32_t MACMIIAR;
  volatile uint32_t MACMIIDR;
  volatile uint32_t MACFCR;
  volatile uint32_t MACVLANTR;
  uint32_t RESERVED0[2];
  volatile uint32_t MACRWUFFR;
  volatile uint32_t MACPMTCSR;
  uint32_t RESERVED1;
  volatile uint32_t MACDBGR;
  volatile uint32_t MACSR;
  volatile uint32_t MACIMR;
  volatile uint32_t MACA0HR;
  volatile uint32_t MACA0LR;
  volatile uint32_t MACA1HR;
  volatile uint32_t MACA1LR;
  volatile uint32_t MACA2HR;
  volatile uint32_t MACA2LR;
  volatile uint32_t MACA3HR;
  volatile uint32_t MACA3LR;
  uint32_t RESERVED2[40];
  volatile uint32_t MMCCR;
  volatile uint32_t MMCRIR;
  volatile uint32_t MMCTIR;
  volatile uint32_t MMCRIMR;
  volatile uint32_t MMCTIMR;
  uint32_t RESERVED3[14];
  volatile uint32_t MMCTGFSCCR;
  volatile uint32_t MMCTGFMSCCR;
  uint32_t RESERVED4[5];
  volatile uint32_t MMCTGFCR;
  uint32_t RESERVED5[10];
  volatile uint32_t MMCRFCECR;
  volatile uint32_t MMCRFAECR;
  uint32_t RESERVED6[10];
  volatile uint32_t MMCRGUFCR;
  uint32_t RESERVED7[334];
  volatile uint32_t PTPTSCR;
  volatile uint32_t PTPSSIR;
  volatile uint32_t PTPTSHR;
  volatile uint32_t PTPTSLR;
  volatile uint32_t PTPTSHUR;
  volatile uint32_t PTPTSLUR;
  volatile uint32_t PTPTSAR;
  volatile uint32_t PTPTTHR;
  volatile uint32_t PTPTTLR;
  volatile uint32_t RESERVED8;
  volatile uint32_t PTPTSSR;
  uint32_t RESERVED9[565];
  volatile uint32_t DMABMR;
  volatile uint32_t DMATPDR;
  volatile uint32_t DMARPDR;
  volatile uint32_t DMARDLAR;
  volatile uint32_t DMATDLAR;
  volatile uint32_t DMASR;
  volatile uint32_t DMAOMR;
  volatile uint32_t DMAIER;
  volatile uint32_t DMAMFBOCR;
  volatile uint32_t DMARSWTR;
  uint32_t RESERVED10[8];
  volatile uint32_t DMACHTDR;
  volatile uint32_t DMACHRDR;
  volatile uint32_t DMACHTBAR;
  volatile uint32_t DMACHRBAR;
} ETH_TypeDef;





typedef struct
{
  volatile uint32_t IMR;
  volatile uint32_t EMR;
  volatile uint32_t RTSR;
  volatile uint32_t FTSR;
  volatile uint32_t SWIER;
  volatile uint32_t PR;
} EXTI_TypeDef;





typedef struct
{
  volatile uint32_t ACR;
  volatile uint32_t KEYR;
  volatile uint32_t OPTKEYR;
  volatile uint32_t SR;
  volatile uint32_t CR;
  volatile uint32_t OPTCR;
  volatile uint32_t OPTCR1;
} FLASH_TypeDef;







typedef struct
{
  volatile uint32_t BTCR[8];
} FMC_Bank1_TypeDef;





typedef struct
{
  volatile uint32_t BWTR[7];
} FMC_Bank1E_TypeDef;





typedef struct
{
  volatile uint32_t PCR;
  volatile uint32_t SR;
  volatile uint32_t PMEM;
  volatile uint32_t PATT;
  uint32_t RESERVED0;
  volatile uint32_t ECCR;
} FMC_Bank3_TypeDef;





typedef struct
{
  volatile uint32_t SDCR[2];
  volatile uint32_t SDTR[2];
  volatile uint32_t SDCMR;
  volatile uint32_t SDRTR;
  volatile uint32_t SDSR;
} FMC_Bank5_6_TypeDef;






typedef struct
{
  volatile uint32_t MODER;
  volatile uint32_t OTYPER;
  volatile uint32_t OSPEEDR;
  volatile uint32_t PUPDR;
  volatile uint32_t IDR;
  volatile uint32_t ODR;
  volatile uint32_t BSRR;
  volatile uint32_t LCKR;
  volatile uint32_t AFR[2];
} GPIO_TypeDef;





typedef struct
{
  volatile uint32_t MEMRMP;
  volatile uint32_t PMC;
  volatile uint32_t EXTICR[4];
  uint32_t RESERVED[2];
  volatile uint32_t CMPCR;
} SYSCFG_TypeDef;





typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t OAR1;
  volatile uint32_t OAR2;
  volatile uint32_t TIMINGR;
  volatile uint32_t TIMEOUTR;
  volatile uint32_t ISR;
  volatile uint32_t ICR;
  volatile uint32_t PECR;
  volatile uint32_t RXDR;
  volatile uint32_t TXDR;
} I2C_TypeDef;





typedef struct
{
  volatile uint32_t KR;
  volatile uint32_t PR;
  volatile uint32_t RLR;
  volatile uint32_t SR;
  volatile uint32_t WINR;
} IWDG_TypeDef;






typedef struct
{
  uint32_t RESERVED0[2];
  volatile uint32_t SSCR;
  volatile uint32_t BPCR;
  volatile uint32_t AWCR;
  volatile uint32_t TWCR;
  volatile uint32_t GCR;
  uint32_t RESERVED1[2];
  volatile uint32_t SRCR;
  uint32_t RESERVED2[1];
  volatile uint32_t BCCR;
  uint32_t RESERVED3[1];
  volatile uint32_t IER;
  volatile uint32_t ISR;
  volatile uint32_t ICR;
  volatile uint32_t LIPCR;
  volatile uint32_t CPSR;
  volatile uint32_t CDSR;
} LTDC_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t WHPCR;
  volatile uint32_t WVPCR;
  volatile uint32_t CKCR;
  volatile uint32_t PFCR;
  volatile uint32_t CACR;
  volatile uint32_t DCCR;
  volatile uint32_t BFCR;
  uint32_t RESERVED0[2];
  volatile uint32_t CFBAR;
  volatile uint32_t CFBLR;
  volatile uint32_t CFBLNR;
  uint32_t RESERVED1[3];
  volatile uint32_t CLUTWR;

} LTDC_Layer_TypeDef;





typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CSR1;
  volatile uint32_t CR2;
  volatile uint32_t CSR2;
} PWR_TypeDef;






typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t PLLCFGR;
  volatile uint32_t CFGR;
  volatile uint32_t CIR;
  volatile uint32_t AHB1RSTR;
  volatile uint32_t AHB2RSTR;
  volatile uint32_t AHB3RSTR;
  uint32_t RESERVED0;
  volatile uint32_t APB1RSTR;
  volatile uint32_t APB2RSTR;
  uint32_t RESERVED1[2];
  volatile uint32_t AHB1ENR;
  volatile uint32_t AHB2ENR;
  volatile uint32_t AHB3ENR;
  uint32_t RESERVED2;
  volatile uint32_t APB1ENR;
  volatile uint32_t APB2ENR;
  uint32_t RESERVED3[2];
  volatile uint32_t AHB1LPENR;
  volatile uint32_t AHB2LPENR;
  volatile uint32_t AHB3LPENR;
  uint32_t RESERVED4;
  volatile uint32_t APB1LPENR;
  volatile uint32_t APB2LPENR;
  uint32_t RESERVED5[2];
  volatile uint32_t BDCR;
  volatile uint32_t CSR;
  uint32_t RESERVED6[2];
  volatile uint32_t SSCGR;
  volatile uint32_t PLLI2SCFGR;
  volatile uint32_t PLLSAICFGR;
  volatile uint32_t DCKCFGR1;
  volatile uint32_t DCKCFGR2;

} RCC_TypeDef;





typedef struct
{
  volatile uint32_t TR;
  volatile uint32_t DR;
  volatile uint32_t CR;
  volatile uint32_t ISR;
  volatile uint32_t PRER;
  volatile uint32_t WUTR;
       uint32_t reserved;
  volatile uint32_t ALRMAR;
  volatile uint32_t ALRMBR;
  volatile uint32_t WPR;
  volatile uint32_t SSR;
  volatile uint32_t SHIFTR;
  volatile uint32_t TSTR;
  volatile uint32_t TSDR;
  volatile uint32_t TSSSR;
  volatile uint32_t CALR;
  volatile uint32_t TAMPCR;
  volatile uint32_t ALRMASSR;
  volatile uint32_t ALRMBSSR;
  volatile uint32_t OR;
  volatile uint32_t BKP0R;
  volatile uint32_t BKP1R;
  volatile uint32_t BKP2R;
  volatile uint32_t BKP3R;
  volatile uint32_t BKP4R;
  volatile uint32_t BKP5R;
  volatile uint32_t BKP6R;
  volatile uint32_t BKP7R;
  volatile uint32_t BKP8R;
  volatile uint32_t BKP9R;
  volatile uint32_t BKP10R;
  volatile uint32_t BKP11R;
  volatile uint32_t BKP12R;
  volatile uint32_t BKP13R;
  volatile uint32_t BKP14R;
  volatile uint32_t BKP15R;
  volatile uint32_t BKP16R;
  volatile uint32_t BKP17R;
  volatile uint32_t BKP18R;
  volatile uint32_t BKP19R;
  volatile uint32_t BKP20R;
  volatile uint32_t BKP21R;
  volatile uint32_t BKP22R;
  volatile uint32_t BKP23R;
  volatile uint32_t BKP24R;
  volatile uint32_t BKP25R;
  volatile uint32_t BKP26R;
  volatile uint32_t BKP27R;
  volatile uint32_t BKP28R;
  volatile uint32_t BKP29R;
  volatile uint32_t BKP30R;
  volatile uint32_t BKP31R;
} RTC_TypeDef;






typedef struct
{
  volatile uint32_t GCR;
} SAI_TypeDef;

typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t FRCR;
  volatile uint32_t SLOTR;
  volatile uint32_t IMR;
  volatile uint32_t SR;
  volatile uint32_t CLRFR;
  volatile uint32_t DR;
} SAI_Block_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t IMR;
  volatile uint32_t SR;
  volatile uint32_t IFCR;
  volatile uint32_t DR;
  volatile uint32_t CSR;
  volatile uint32_t DIR;
} SPDIFRX_TypeDef;





typedef struct
{
  volatile uint32_t POWER;
  volatile uint32_t CLKCR;
  volatile uint32_t ARG;
  volatile uint32_t CMD;
  volatile const uint32_t RESPCMD;
  volatile const uint32_t RESP1;
  volatile const uint32_t RESP2;
  volatile const uint32_t RESP3;
  volatile const uint32_t RESP4;
  volatile uint32_t DTIMER;
  volatile uint32_t DLEN;
  volatile uint32_t DCTRL;
  volatile const uint32_t DCOUNT;
  volatile const uint32_t STA;
  volatile uint32_t ICR;
  volatile uint32_t MASK;
  uint32_t RESERVED0[2];
  volatile const uint32_t FIFOCNT;
  uint32_t RESERVED1[13];
  volatile uint32_t FIFO;
} SDMMC_TypeDef;





typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SR;
  volatile uint32_t DR;
  volatile uint32_t CRCPR;
  volatile uint32_t RXCRCR;
  volatile uint32_t TXCRCR;
  volatile uint32_t I2SCFGR;
  volatile uint32_t I2SPR;
} SPI_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t DCR;
  volatile uint32_t SR;
  volatile uint32_t FCR;
  volatile uint32_t DLR;
  volatile uint32_t CCR;
  volatile uint32_t AR;
  volatile uint32_t ABR;
  volatile uint32_t DR;
  volatile uint32_t PSMKR;
  volatile uint32_t PSMAR;
  volatile uint32_t PIR;
  volatile uint32_t LPTR;
} QUADSPI_TypeDef;





typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SMCR;
  volatile uint32_t DIER;
  volatile uint32_t SR;
  volatile uint32_t EGR;
  volatile uint32_t CCMR1;
  volatile uint32_t CCMR2;
  volatile uint32_t CCER;
  volatile uint32_t CNT;
  volatile uint32_t PSC;
  volatile uint32_t ARR;
  volatile uint32_t RCR;
  volatile uint32_t CCR1;
  volatile uint32_t CCR2;
  volatile uint32_t CCR3;
  volatile uint32_t CCR4;
  volatile uint32_t BDTR;
  volatile uint32_t DCR;
  volatile uint32_t DMAR;
  volatile uint32_t OR;
  volatile uint32_t CCMR3;
  volatile uint32_t CCR5;
  volatile uint32_t CCR6;

} TIM_TypeDef;




typedef struct
{
  volatile uint32_t ISR;
  volatile uint32_t ICR;
  volatile uint32_t IER;
  volatile uint32_t CFGR;
  volatile uint32_t CR;
  volatile uint32_t CMP;
  volatile uint32_t ARR;
  volatile uint32_t CNT;
} LPTIM_TypeDef;






typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t CR3;
  volatile uint32_t BRR;
  volatile uint32_t GTPR;
  volatile uint32_t RTOR;
  volatile uint32_t RQR;
  volatile uint32_t ISR;
  volatile uint32_t ICR;
  volatile uint32_t RDR;
  volatile uint32_t TDR;
} USART_TypeDef;






typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CFR;
  volatile uint32_t SR;
} WWDG_TypeDef;






typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t SR;
  volatile uint32_t DR;
} RNG_TypeDef;
# 1019 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h"
typedef struct
{
 volatile uint32_t GOTGCTL;
  volatile uint32_t GOTGINT;
  volatile uint32_t GAHBCFG;
  volatile uint32_t GUSBCFG;
  volatile uint32_t GRSTCTL;
  volatile uint32_t GINTSTS;
  volatile uint32_t GINTMSK;
  volatile uint32_t GRXSTSR;
  volatile uint32_t GRXSTSP;
  volatile uint32_t GRXFSIZ;
  volatile uint32_t DIEPTXF0_HNPTXFSIZ;
  volatile uint32_t HNPTXSTS;
  uint32_t Reserved30[2];
  volatile uint32_t GCCFG;
  volatile uint32_t CID;
  uint32_t Reserved5[3];
  volatile uint32_t GHWCFG3;
  uint32_t Reserved6;
  volatile uint32_t GLPMCFG;
  volatile uint32_t GPWRDN;
  volatile uint32_t GDFIFOCFG;
   volatile uint32_t GADPCTL;
    uint32_t Reserved43[39];
  volatile uint32_t HPTXFSIZ;
  volatile uint32_t DIEPTXF[0x0F];
} USB_OTG_GlobalTypeDef;





typedef struct
{
  volatile uint32_t DCFG;
  volatile uint32_t DCTL;
  volatile uint32_t DSTS;
  uint32_t Reserved0C;
  volatile uint32_t DIEPMSK;
  volatile uint32_t DOEPMSK;
  volatile uint32_t DAINT;
  volatile uint32_t DAINTMSK;
  uint32_t Reserved20;
  uint32_t Reserved9;
  volatile uint32_t DVBUSDIS;
  volatile uint32_t DVBUSPULSE;
  volatile uint32_t DTHRCTL;
  volatile uint32_t DIEPEMPMSK;
  volatile uint32_t DEACHINT;
  volatile uint32_t DEACHMSK;
  uint32_t Reserved40;
  volatile uint32_t DINEP1MSK;
  uint32_t Reserved44[15];
  volatile uint32_t DOUTEP1MSK;
} USB_OTG_DeviceTypeDef;





typedef struct
{
  volatile uint32_t DIEPCTL;
  uint32_t Reserved04;
  volatile uint32_t DIEPINT;
  uint32_t Reserved0C;
  volatile uint32_t DIEPTSIZ;
  volatile uint32_t DIEPDMA;
  volatile uint32_t DTXFSTS;
  uint32_t Reserved18;
} USB_OTG_INEndpointTypeDef;





typedef struct
{
  volatile uint32_t DOEPCTL;
  uint32_t Reserved04;
  volatile uint32_t DOEPINT;
  uint32_t Reserved0C;
  volatile uint32_t DOEPTSIZ;
  volatile uint32_t DOEPDMA;
  uint32_t Reserved18[2];
} USB_OTG_OUTEndpointTypeDef;





typedef struct
{
  volatile uint32_t HCFG;
  volatile uint32_t HFIR;
  volatile uint32_t HFNUM;
  uint32_t Reserved40C;
  volatile uint32_t HPTXSTS;
  volatile uint32_t HAINT;
  volatile uint32_t HAINTMSK;
} USB_OTG_HostTypeDef;




typedef struct
{
  volatile uint32_t HCCHAR;
  volatile uint32_t HCSPLT;
  volatile uint32_t HCINT;
  volatile uint32_t HCINTMSK;
  volatile uint32_t HCTSIZ;
  volatile uint32_t HCDMA;
  uint32_t Reserved[2];
} USB_OTG_HostChannelTypeDef;
# 141 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include\\stm32f7xx.h" 2
# 164 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include\\stm32f7xx.h"
typedef enum
{
  RESET = 0U,
  SET = !RESET
} FlagStatus, ITStatus;

typedef enum
{
  DISABLE = 0U,
  ENABLE = !DISABLE
} FunctionalState;


typedef enum
{
  ERROR = 0U,
  SUCCESS = !ERROR
} ErrorStatus;
# 211 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include\\stm32f7xx.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal.h" 1
# 46 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal.h"
# 1 "../Inc\\stm32f7xx_hal_conf.h" 1
# 238 "../Inc\\stm32f7xx_hal_conf.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h" 1
# 45 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h" 1
# 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h"
# 1 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include\\stm32f7xx.h" 1
# 47 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h" 2
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h" 1
# 48 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h" 2
# 1 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 1 3
# 68 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    typedef __builtin_va_list __va_list;
# 87 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
typedef struct __fpos_t_struct {
    unsigned long long int __pos;





    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
# 108 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
typedef struct __FILE FILE;
# 119 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
struct __FILE {
    union {
        long __FILE_alignment;



        char __FILE_size[84];

    } __FILE_opaque;
};
# 138 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;
# 224 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int remove(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((nothrow)) int rename(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 243 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) FILE *tmpfile(void);






extern __attribute__((nothrow)) char *tmpnam(char * );
# 265 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fclose(FILE * ) __attribute__((__nonnull__(1)));
# 275 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fflush(FILE * );
# 285 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) FILE *fopen(const char * __restrict ,
                           const char * __restrict ) __attribute__((__nonnull__(1,2)));
# 329 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) FILE *freopen(const char * __restrict ,
                    const char * __restrict ,
                    FILE * __restrict ) __attribute__((__nonnull__(2,3)));
# 342 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) void setbuf(FILE * __restrict ,
                    char * __restrict ) __attribute__((__nonnull__(1)));






extern __attribute__((nothrow)) int setvbuf(FILE * __restrict ,
                   char * __restrict ,
                   int , size_t ) __attribute__((__nonnull__(1)));
# 370 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((nothrow)) int fprintf(FILE * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 393 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((nothrow)) int _fprintf(FILE * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));





#pragma __printf_args
extern __attribute__((nothrow)) int printf(const char * __restrict , ...) __attribute__((__nonnull__(1)));






#pragma __printf_args
extern __attribute__((nothrow)) int _printf(const char * __restrict , ...) __attribute__((__nonnull__(1)));





#pragma __printf_args
extern __attribute__((nothrow)) int sprintf(char * __restrict , const char * __restrict , ...) __attribute__((__nonnull__(1,2)));








#pragma __printf_args
extern __attribute__((nothrow)) int _sprintf(char * __restrict , const char * __restrict , ...) __attribute__((__nonnull__(1,2)));






#pragma __printf_args
extern __attribute__((nothrow)) int __ARM_snprintf(char * __restrict , size_t ,
                     const char * __restrict , ...) __attribute__((__nonnull__(3)));


#pragma __printf_args
extern __attribute__((nothrow)) int snprintf(char * __restrict , size_t ,
                     const char * __restrict , ...) __attribute__((__nonnull__(3)));
# 460 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((nothrow)) int _snprintf(char * __restrict , size_t ,
                      const char * __restrict , ...) __attribute__((__nonnull__(3)));





#pragma __scanf_args
extern __attribute__((nothrow)) int fscanf(FILE * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 503 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __scanf_args
extern __attribute__((nothrow)) int _fscanf(FILE * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));





#pragma __scanf_args
extern __attribute__((nothrow)) int scanf(const char * __restrict , ...) __attribute__((__nonnull__(1)));








#pragma __scanf_args
extern __attribute__((nothrow)) int _scanf(const char * __restrict , ...) __attribute__((__nonnull__(1)));





#pragma __scanf_args
extern __attribute__((nothrow)) int sscanf(const char * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 541 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __scanf_args
extern __attribute__((nothrow)) int _sscanf(const char * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));







extern __attribute__((nothrow)) int vfscanf(FILE * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) int vscanf(const char * __restrict , __va_list) __attribute__((__nonnull__(1)));
extern __attribute__((nothrow)) int vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));

extern __attribute__((nothrow)) int _vfscanf(FILE * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) int _vscanf(const char * __restrict , __va_list) __attribute__((__nonnull__(1)));
extern __attribute__((nothrow)) int _vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) int __ARM_vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));

extern __attribute__((nothrow)) int vprintf(const char * __restrict , __va_list ) __attribute__((__nonnull__(1)));







extern __attribute__((nothrow)) int _vprintf(const char * __restrict , __va_list ) __attribute__((__nonnull__(1)));





extern __attribute__((nothrow)) int vfprintf(FILE * __restrict ,
                    const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));
# 584 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int vsprintf(char * __restrict ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));
# 594 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int __ARM_vsnprintf(char * __restrict , size_t ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));

extern __attribute__((nothrow)) int vsnprintf(char * __restrict , size_t ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));
# 609 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int _vsprintf(char * __restrict ,
                      const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));





extern __attribute__((nothrow)) int _vfprintf(FILE * __restrict ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));





extern __attribute__((nothrow)) int _vsnprintf(char * __restrict , size_t ,
                      const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));
# 635 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((nothrow)) int __ARM_asprintf(char ** , const char * __restrict , ...) __attribute__((__nonnull__(2)));
extern __attribute__((nothrow)) int __ARM_vasprintf(char ** , const char * __restrict , __va_list ) __attribute__((__nonnull__(2)));
# 649 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fgetc(FILE * ) __attribute__((__nonnull__(1)));
# 659 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) char *fgets(char * __restrict , int ,
                    FILE * __restrict ) __attribute__((__nonnull__(1,3)));
# 673 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fputc(int , FILE * ) __attribute__((__nonnull__(2)));
# 683 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fputs(const char * __restrict , FILE * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((nothrow)) int getc(FILE * ) __attribute__((__nonnull__(1)));
# 704 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    extern __attribute__((nothrow)) int (getchar)(void);
# 713 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) char *gets(char * ) __attribute__((__nonnull__(1)));
# 725 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int putc(int , FILE * ) __attribute__((__nonnull__(2)));
# 737 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    extern __attribute__((nothrow)) int (putchar)(int );






extern __attribute__((nothrow)) int puts(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((nothrow)) int ungetc(int , FILE * ) __attribute__((__nonnull__(2)));
# 778 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) size_t fread(void * __restrict ,
                    size_t , size_t , FILE * __restrict ) __attribute__((__nonnull__(1,4)));
# 794 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) size_t __fread_bytes_avail(void * __restrict ,
                    size_t , FILE * __restrict ) __attribute__((__nonnull__(1,3)));
# 810 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) size_t fwrite(const void * __restrict ,
                    size_t , size_t , FILE * __restrict ) __attribute__((__nonnull__(1,4)));
# 822 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fgetpos(FILE * __restrict , fpos_t * __restrict ) __attribute__((__nonnull__(1,2)));
# 833 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fseek(FILE * , long int , int ) __attribute__((__nonnull__(1)));
# 850 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fsetpos(FILE * __restrict , const fpos_t * __restrict ) __attribute__((__nonnull__(1,2)));
# 863 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) long int ftell(FILE * ) __attribute__((__nonnull__(1)));
# 877 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) void rewind(FILE * ) __attribute__((__nonnull__(1)));
# 886 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) void clearerr(FILE * ) __attribute__((__nonnull__(1)));







extern __attribute__((nothrow)) int feof(FILE * ) __attribute__((__nonnull__(1)));




extern __attribute__((nothrow)) int ferror(FILE * ) __attribute__((__nonnull__(1)));




extern __attribute__((nothrow)) void perror(const char * );
# 917 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int _fisatty(FILE * ) __attribute__((__nonnull__(1)));



extern __attribute__((nothrow)) void __use_no_semihosting_swi(void);
extern __attribute__((nothrow)) void __use_no_semihosting(void);
# 49 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h" 2





typedef enum
{
  HAL_OK = 0x00U,
  HAL_ERROR = 0x01U,
  HAL_BUSY = 0x02U,
  HAL_TIMEOUT = 0x03U
} HAL_StatusTypeDef;




typedef enum
{
  HAL_UNLOCKED = 0x00,
  HAL_LOCKED = 0x01
} HAL_LockTypeDef;
# 46 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
typedef struct
{
  uint32_t PLLState;


  uint32_t PLLSource;


  uint32_t PLLM;


  uint32_t PLLN;


  uint32_t PLLP;


  uint32_t PLLQ;






}RCC_PLLInitTypeDef;




typedef struct
{
  uint32_t PLLI2SN;



  uint32_t PLLI2SR;



  uint32_t PLLI2SQ;





  uint32_t PLLI2SP;



}RCC_PLLI2SInitTypeDef;




typedef struct
{
  uint32_t PLLSAIN;



  uint32_t PLLSAIQ;





  uint32_t PLLSAIR;




  uint32_t PLLSAIP;


}RCC_PLLSAIInitTypeDef;




typedef struct
{
  uint32_t PeriphClockSelection;


  RCC_PLLI2SInitTypeDef PLLI2S;


  RCC_PLLSAIInitTypeDef PLLSAI;


  uint32_t PLLI2SDivQ;



  uint32_t PLLSAIDivQ;



  uint32_t PLLSAIDivR;


  uint32_t RTCClockSelection;


  uint32_t I2sClockSelection;


  uint32_t TIMPresSelection;


  uint32_t Sai1ClockSelection;


  uint32_t Sai2ClockSelection;


  uint32_t Usart1ClockSelection;


  uint32_t Usart2ClockSelection;


  uint32_t Usart3ClockSelection;


  uint32_t Uart4ClockSelection;


  uint32_t Uart5ClockSelection;


  uint32_t Usart6ClockSelection;


  uint32_t Uart7ClockSelection;


  uint32_t Uart8ClockSelection;


  uint32_t I2c1ClockSelection;


  uint32_t I2c2ClockSelection;


  uint32_t I2c3ClockSelection;


  uint32_t I2c4ClockSelection;


  uint32_t Lptim1ClockSelection;


  uint32_t CecClockSelection;


  uint32_t Clk48ClockSelection;


  uint32_t Sdmmc1ClockSelection;
# 240 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
}RCC_PeriphCLKInitTypeDef;
# 3204 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
HAL_StatusTypeDef HAL_RCCEx_PeriphCLKConfig(RCC_PeriphCLKInitTypeDef *PeriphClkInit);
void HAL_RCCEx_GetPeriphCLKConfig(RCC_PeriphCLKInitTypeDef *PeriphClkInit);
uint32_t HAL_RCCEx_GetPeriphCLKFreq(uint32_t PeriphClk);
# 50 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h" 2
# 68 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h"
typedef struct
{
  uint32_t OscillatorType;


  uint32_t HSEState;


  uint32_t LSEState;


  uint32_t HSIState;


  uint32_t HSICalibrationValue;


  uint32_t LSIState;


  RCC_PLLInitTypeDef PLL;

}RCC_OscInitTypeDef;




typedef struct
{
  uint32_t ClockType;


  uint32_t SYSCLKSource;


  uint32_t AHBCLKDivider;


  uint32_t APB1CLKDivider;


  uint32_t APB2CLKDivider;


}RCC_ClkInitTypeDef;
# 1133 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h"
void HAL_RCC_DeInit(void);
HAL_StatusTypeDef HAL_RCC_OscConfig(RCC_OscInitTypeDef *RCC_OscInitStruct);
HAL_StatusTypeDef HAL_RCC_ClockConfig(RCC_ClkInitTypeDef *RCC_ClkInitStruct, uint32_t FLatency);
# 1144 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h"
void HAL_RCC_MCOConfig(uint32_t RCC_MCOx, uint32_t RCC_MCOSource, uint32_t RCC_MCODiv);
void HAL_RCC_EnableCSS(void);
void HAL_RCC_DisableCSS(void);
uint32_t HAL_RCC_GetSysClockFreq(void);
uint32_t HAL_RCC_GetHCLKFreq(void);
uint32_t HAL_RCC_GetPCLK1Freq(void);
uint32_t HAL_RCC_GetPCLK2Freq(void);
void HAL_RCC_GetOscConfig(RCC_OscInitTypeDef *RCC_OscInitStruct);
void HAL_RCC_GetClockConfig(RCC_ClkInitTypeDef *RCC_ClkInitStruct, uint32_t *pFLatency);


void HAL_RCC_NMI_IRQHandler(void);


void HAL_RCC_CSSCallback(void);
# 239 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_gpio.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_gpio.h"
typedef struct
{
  uint32_t Pin;


  uint32_t Mode;


  uint32_t Pull;


  uint32_t Speed;


  uint32_t Alternate;

}GPIO_InitTypeDef;




typedef enum
{
  GPIO_PIN_RESET = 0,
  GPIO_PIN_SET
}GPIO_PinState;
# 230 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_gpio.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h" 1
# 231 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_gpio.h" 2
# 241 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_gpio.h"
void HAL_GPIO_Init(GPIO_TypeDef *GPIOx, GPIO_InitTypeDef *GPIO_Init);
void HAL_GPIO_DeInit(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin);
# 251 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_gpio.h"
GPIO_PinState HAL_GPIO_ReadPin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void HAL_GPIO_WritePin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, GPIO_PinState PinState);
void HAL_GPIO_TogglePin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
HAL_StatusTypeDef HAL_GPIO_LockPin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void HAL_GPIO_EXTI_IRQHandler(uint16_t GPIO_Pin);
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin);
# 243 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h" 1
# 65 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h"
typedef struct
{
  uint32_t Channel;


  uint32_t Direction;



  uint32_t PeriphInc;


  uint32_t MemInc;


  uint32_t PeriphDataAlignment;


  uint32_t MemDataAlignment;


  uint32_t Mode;




  uint32_t Priority;


  uint32_t FIFOMode;




  uint32_t FIFOThreshold;


  uint32_t MemBurst;





  uint32_t PeriphBurst;




}DMA_InitTypeDef;




typedef enum
{
  HAL_DMA_STATE_RESET = 0x00U,
  HAL_DMA_STATE_READY = 0x01U,
  HAL_DMA_STATE_BUSY = 0x02U,
  HAL_DMA_STATE_TIMEOUT = 0x03U,
  HAL_DMA_STATE_ERROR = 0x04U,
  HAL_DMA_STATE_ABORT = 0x05U,
}HAL_DMA_StateTypeDef;




typedef enum
{
  HAL_DMA_FULL_TRANSFER = 0x00U,
  HAL_DMA_HALF_TRANSFER = 0x01U,
}HAL_DMA_LevelCompleteTypeDef;




typedef enum
{
  HAL_DMA_XFER_CPLT_CB_ID = 0x00U,
  HAL_DMA_XFER_HALFCPLT_CB_ID = 0x01U,
  HAL_DMA_XFER_M1CPLT_CB_ID = 0x02U,
  HAL_DMA_XFER_M1HALFCPLT_CB_ID = 0x03U,
  HAL_DMA_XFER_ERROR_CB_ID = 0x04U,
  HAL_DMA_XFER_ABORT_CB_ID = 0x05U,
  HAL_DMA_XFER_ALL_CB_ID = 0x06U
}HAL_DMA_CallbackIDTypeDef;




typedef struct __DMA_HandleTypeDef
{
  DMA_Stream_TypeDef *Instance;

  DMA_InitTypeDef Init;

  HAL_LockTypeDef Lock;

  volatile HAL_DMA_StateTypeDef State;

  void *Parent;

  void (* XferCpltCallback)( struct __DMA_HandleTypeDef * hdma);

  void (* XferHalfCpltCallback)( struct __DMA_HandleTypeDef * hdma);

  void (* XferM1CpltCallback)( struct __DMA_HandleTypeDef * hdma);

  void (* XferM1HalfCpltCallback)( struct __DMA_HandleTypeDef * hdma);

  void (* XferErrorCallback)( struct __DMA_HandleTypeDef * hdma);

  void (* XferAbortCallback)( struct __DMA_HandleTypeDef * hdma);

 volatile uint32_t ErrorCode;

 uint32_t StreamBaseAddress;

 uint32_t StreamIndex;

}DMA_HandleTypeDef;
# 630 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma_ex.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma_ex.h"
typedef enum
{
  MEMORY0 = 0x00U,
  MEMORY1 = 0x01U,

}HAL_DMA_MemoryTypeDef;
# 128 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma_ex.h"
HAL_StatusTypeDef HAL_DMAEx_MultiBufferStart(DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t SecondMemAddress, uint32_t DataLength);
HAL_StatusTypeDef HAL_DMAEx_MultiBufferStart_IT(DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t SecondMemAddress, uint32_t DataLength);
HAL_StatusTypeDef HAL_DMAEx_ChangeMemory(DMA_HandleTypeDef *hdma, uint32_t Address, HAL_DMA_MemoryTypeDef memory);
# 631 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h" 2
# 643 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h"
HAL_StatusTypeDef HAL_DMA_Init(DMA_HandleTypeDef *hdma);
HAL_StatusTypeDef HAL_DMA_DeInit(DMA_HandleTypeDef *hdma);
# 653 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h"
HAL_StatusTypeDef HAL_DMA_Start (DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t DataLength);
HAL_StatusTypeDef HAL_DMA_Start_IT(DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t DataLength);
HAL_StatusTypeDef HAL_DMA_Abort(DMA_HandleTypeDef *hdma);
HAL_StatusTypeDef HAL_DMA_Abort_IT(DMA_HandleTypeDef *hdma);
HAL_StatusTypeDef HAL_DMA_PollForTransfer(DMA_HandleTypeDef *hdma, HAL_DMA_LevelCompleteTypeDef CompleteLevel, uint32_t Timeout);
void HAL_DMA_IRQHandler(DMA_HandleTypeDef *hdma);
HAL_StatusTypeDef HAL_DMA_RegisterCallback(DMA_HandleTypeDef *hdma, HAL_DMA_CallbackIDTypeDef CallbackID, void (* pCallback)(DMA_HandleTypeDef *_hdma));
HAL_StatusTypeDef HAL_DMA_UnRegisterCallback(DMA_HandleTypeDef *hdma, HAL_DMA_CallbackIDTypeDef CallbackID);
# 670 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h"
HAL_DMA_StateTypeDef HAL_DMA_GetState(DMA_HandleTypeDef *hdma);
uint32_t HAL_DMA_GetError(DMA_HandleTypeDef *hdma);
# 247 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_cortex.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_cortex.h"
typedef struct
{
  uint8_t Enable;

  uint8_t Number;

  uint32_t BaseAddress;
  uint8_t Size;

  uint8_t SubRegionDisable;

  uint8_t TypeExtField;

  uint8_t AccessPermission;

  uint8_t DisableExec;

  uint8_t IsShareable;

  uint8_t IsCacheable;

  uint8_t IsBufferable;

}MPU_Region_InitTypeDef;
# 277 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_cortex.h"
void HAL_NVIC_SetPriorityGrouping(uint32_t PriorityGroup);
void HAL_NVIC_SetPriority(IRQn_Type IRQn, uint32_t PreemptPriority, uint32_t SubPriority);
void HAL_NVIC_EnableIRQ(IRQn_Type IRQn);
void HAL_NVIC_DisableIRQ(IRQn_Type IRQn);
void HAL_NVIC_SystemReset(void);
uint32_t HAL_SYSTICK_Config(uint32_t TicksNumb);
# 292 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_cortex.h"
void HAL_MPU_Enable(uint32_t MPU_Control);
void HAL_MPU_Disable(void);
void HAL_MPU_ConfigRegion(MPU_Region_InitTypeDef *MPU_Init);

uint32_t HAL_NVIC_GetPriorityGrouping(void);
void HAL_NVIC_GetPriority(IRQn_Type IRQn, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority);
uint32_t HAL_NVIC_GetPendingIRQ(IRQn_Type IRQn);
void HAL_NVIC_SetPendingIRQ(IRQn_Type IRQn);
void HAL_NVIC_ClearPendingIRQ(IRQn_Type IRQn);
uint32_t HAL_NVIC_GetActive(IRQn_Type IRQn);
void HAL_SYSTICK_CLKSourceConfig(uint32_t CLKSource);
void HAL_SYSTICK_IRQHandler(void);
void HAL_SYSTICK_Callback(void);
# 251 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h" 1
# 73 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
typedef struct
{
  uint32_t ClockPrescaler;


  uint32_t Resolution;

  uint32_t DataAlign;


  uint32_t ScanConvMode;







  uint32_t EOCSelection;






  uint32_t ContinuousConvMode;


  uint32_t NbrOfConversion;


  uint32_t DiscontinuousConvMode;



  uint32_t NbrOfDiscConversion;


  uint32_t ExternalTrigConv;



  uint32_t ExternalTrigConvEdge;


  uint32_t DMAContinuousRequests;




}ADC_InitTypeDef;
# 132 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
typedef struct
{
  uint32_t Channel;

  uint32_t Rank;


  uint32_t SamplingTime;
# 148 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
  uint32_t Offset;
}ADC_ChannelConfTypeDef;




typedef struct
{
  uint32_t WatchdogMode;

  uint32_t HighThreshold;

  uint32_t LowThreshold;

  uint32_t Channel;


  uint32_t ITMode;


  uint32_t WatchdogNumber;
}ADC_AnalogWDGConfTypeDef;
# 208 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
typedef struct
{
  ADC_TypeDef *Instance;

  ADC_InitTypeDef Init;

  volatile uint32_t NbrOfCurrentConversionRank;

  DMA_HandleTypeDef *DMA_Handle;

  HAL_LockTypeDef Lock;

  volatile uint32_t State;

  volatile uint32_t ErrorCode;
}ADC_HandleTypeDef;
# 556 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_adc_ex.h" 1
# 72 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_adc_ex.h"
typedef struct
{
  uint32_t InjectedChannel;


  uint32_t InjectedRank;


  uint32_t InjectedSamplingTime;
# 89 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_adc_ex.h"
  uint32_t InjectedOffset;



  uint32_t InjectedNbrOfConversion;




  uint32_t InjectedDiscontinuousConvMode;






  uint32_t AutoInjectedConv;







  uint32_t ExternalTrigInjecConv;







  uint32_t ExternalTrigInjecConvEdge;




}ADC_InjectionConfTypeDef;




typedef struct
{
  uint32_t Mode;

  uint32_t DMAAccessMode;

  uint32_t TwoSamplingDelay;

}ADC_MultiModeTypeDef;
# 256 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_adc_ex.h"
HAL_StatusTypeDef HAL_ADCEx_InjectedStart(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADCEx_InjectedStop(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADCEx_InjectedPollForConversion(ADC_HandleTypeDef* hadc, uint32_t Timeout);
HAL_StatusTypeDef HAL_ADCEx_InjectedStart_IT(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADCEx_InjectedStop_IT(ADC_HandleTypeDef* hadc);
uint32_t HAL_ADCEx_InjectedGetValue(ADC_HandleTypeDef* hadc, uint32_t InjectedRank);
HAL_StatusTypeDef HAL_ADCEx_MultiModeStart_DMA(ADC_HandleTypeDef* hadc, uint32_t* pData, uint32_t Length);
HAL_StatusTypeDef HAL_ADCEx_MultiModeStop_DMA(ADC_HandleTypeDef* hadc);
uint32_t HAL_ADCEx_MultiModeGetValue(ADC_HandleTypeDef* hadc);
void HAL_ADCEx_InjectedConvCpltCallback(ADC_HandleTypeDef* hadc);


HAL_StatusTypeDef HAL_ADCEx_InjectedConfigChannel(ADC_HandleTypeDef* hadc,ADC_InjectionConfTypeDef* sConfigInjected);
HAL_StatusTypeDef HAL_ADCEx_MultiModeConfigChannel(ADC_HandleTypeDef* hadc, ADC_MultiModeTypeDef* multimode);
# 557 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h" 2
# 567 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
HAL_StatusTypeDef HAL_ADC_Init(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADC_DeInit(ADC_HandleTypeDef *hadc);
void HAL_ADC_MspInit(ADC_HandleTypeDef* hadc);
void HAL_ADC_MspDeInit(ADC_HandleTypeDef* hadc);
# 579 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
HAL_StatusTypeDef HAL_ADC_Start(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADC_Stop(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADC_PollForConversion(ADC_HandleTypeDef* hadc, uint32_t Timeout);

HAL_StatusTypeDef HAL_ADC_PollForEvent(ADC_HandleTypeDef* hadc, uint32_t EventType, uint32_t Timeout);

HAL_StatusTypeDef HAL_ADC_Start_IT(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADC_Stop_IT(ADC_HandleTypeDef* hadc);

void HAL_ADC_IRQHandler(ADC_HandleTypeDef* hadc);

HAL_StatusTypeDef HAL_ADC_Start_DMA(ADC_HandleTypeDef* hadc, uint32_t* pData, uint32_t Length);
HAL_StatusTypeDef HAL_ADC_Stop_DMA(ADC_HandleTypeDef* hadc);

uint32_t HAL_ADC_GetValue(ADC_HandleTypeDef* hadc);

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc);
void HAL_ADC_ConvHalfCpltCallback(ADC_HandleTypeDef* hadc);
void HAL_ADC_LevelOutOfWindowCallback(ADC_HandleTypeDef* hadc);
void HAL_ADC_ErrorCallback(ADC_HandleTypeDef *hadc);
# 607 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
HAL_StatusTypeDef HAL_ADC_ConfigChannel(ADC_HandleTypeDef* hadc, ADC_ChannelConfTypeDef* sConfig);
HAL_StatusTypeDef HAL_ADC_AnalogWDGConfig(ADC_HandleTypeDef* hadc, ADC_AnalogWDGConfTypeDef* AnalogWDGConfig);
# 617 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
uint32_t HAL_ADC_GetState(ADC_HandleTypeDef* hadc);
uint32_t HAL_ADC_GetError(ADC_HandleTypeDef *hadc);
# 255 "../Inc\\stm32f7xx_hal_conf.h" 2
# 266 "../Inc\\stm32f7xx_hal_conf.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h"
typedef enum
{
  HAL_CRC_STATE_RESET = 0x00U,
  HAL_CRC_STATE_READY = 0x01U,
  HAL_CRC_STATE_BUSY = 0x02U,
  HAL_CRC_STATE_TIMEOUT = 0x03U,
  HAL_CRC_STATE_ERROR = 0x04U
}HAL_CRC_StateTypeDef;







typedef struct
{
  uint8_t DefaultPolynomialUse;





  uint8_t DefaultInitValueUse;




  uint32_t GeneratingPolynomial;




  uint32_t CRCLength;






  uint32_t InitValue;


  uint32_t InputDataInversionMode;






  uint32_t OutputDataInversionMode;



}CRC_InitTypeDef;







typedef struct
{
  CRC_TypeDef *Instance;

  CRC_InitTypeDef Init;

  HAL_LockTypeDef Lock;

  volatile HAL_CRC_StateTypeDef State;

  uint32_t InputDataFormat;






}CRC_HandleTypeDef;
# 283 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_crc_ex.h" 1
# 136 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_crc_ex.h"
HAL_StatusTypeDef HAL_CRCEx_Polynomial_Set(CRC_HandleTypeDef *hcrc, uint32_t Pol, uint32_t PolyLength);
HAL_StatusTypeDef HAL_CRCEx_Input_Data_Reverse(CRC_HandleTypeDef *hcrc, uint32_t InputReverseMode);
HAL_StatusTypeDef HAL_CRCEx_Output_Data_Reverse(CRC_HandleTypeDef *hcrc, uint32_t OutputReverseMode);
# 284 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h" 2
# 294 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h"
HAL_StatusTypeDef HAL_CRC_Init(CRC_HandleTypeDef *hcrc);
HAL_StatusTypeDef HAL_CRC_DeInit (CRC_HandleTypeDef *hcrc);
void HAL_CRC_MspInit(CRC_HandleTypeDef *hcrc);
void HAL_CRC_MspDeInit(CRC_HandleTypeDef *hcrc);
# 310 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h"
uint32_t HAL_CRC_Accumulate(CRC_HandleTypeDef *hcrc, uint32_t pBuffer[], uint32_t BufferLength);
uint32_t HAL_CRC_Calculate(CRC_HandleTypeDef *hcrc, uint32_t pBuffer[], uint32_t BufferLength);
# 320 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h"
HAL_CRC_StateTypeDef HAL_CRC_GetState(CRC_HandleTypeDef *hcrc);
# 267 "../Inc\\stm32f7xx_hal_conf.h" 2







# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h" 1
# 67 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
typedef struct
{
  uint32_t Blue;


  uint32_t Green;


  uint32_t Red;

} DMA2D_ColorTypeDef;




typedef struct
{
  uint32_t *pCLUT;

  uint32_t CLUTColorMode;


  uint32_t Size;

} DMA2D_CLUTCfgTypeDef;




typedef struct
{
  uint32_t Mode;


  uint32_t ColorMode;


  uint32_t OutputOffset;
# 117 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
} DMA2D_InitTypeDef;





typedef struct
{
  uint32_t InputOffset;


  uint32_t InputColorMode;


  uint32_t AlphaMode;


  uint32_t InputAlpha;
# 159 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
} DMA2D_LayerCfgTypeDef;




typedef enum
{
  HAL_DMA2D_STATE_RESET = 0x00U,
  HAL_DMA2D_STATE_READY = 0x01U,
  HAL_DMA2D_STATE_BUSY = 0x02U,
  HAL_DMA2D_STATE_TIMEOUT = 0x03U,
  HAL_DMA2D_STATE_ERROR = 0x04U,
  HAL_DMA2D_STATE_SUSPEND = 0x05U
}HAL_DMA2D_StateTypeDef;




typedef struct __DMA2D_HandleTypeDef
{
  DMA2D_TypeDef *Instance;

  DMA2D_InitTypeDef Init;

  void (* XferCpltCallback)(struct __DMA2D_HandleTypeDef * hdma2d);

  void (* XferErrorCallback)(struct __DMA2D_HandleTypeDef * hdma2d);

  DMA2D_LayerCfgTypeDef LayerCfg[2];

  HAL_LockTypeDef Lock;

  volatile HAL_DMA2D_StateTypeDef State;

  volatile uint32_t ErrorCode;
} DMA2D_HandleTypeDef;
# 447 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
HAL_StatusTypeDef HAL_DMA2D_Init(DMA2D_HandleTypeDef *hdma2d);
HAL_StatusTypeDef HAL_DMA2D_DeInit (DMA2D_HandleTypeDef *hdma2d);
void HAL_DMA2D_MspInit(DMA2D_HandleTypeDef* hdma2d);
void HAL_DMA2D_MspDeInit(DMA2D_HandleTypeDef* hdma2d);
# 462 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
HAL_StatusTypeDef HAL_DMA2D_Start(DMA2D_HandleTypeDef *hdma2d, uint32_t pdata, uint32_t DstAddress, uint32_t Width, uint32_t Height);
HAL_StatusTypeDef HAL_DMA2D_BlendingStart(DMA2D_HandleTypeDef *hdma2d, uint32_t SrcAddress1, uint32_t SrcAddress2, uint32_t DstAddress, uint32_t Width, uint32_t Height);
HAL_StatusTypeDef HAL_DMA2D_Start_IT(DMA2D_HandleTypeDef *hdma2d, uint32_t pdata, uint32_t DstAddress, uint32_t Width, uint32_t Height);
HAL_StatusTypeDef HAL_DMA2D_BlendingStart_IT(DMA2D_HandleTypeDef *hdma2d, uint32_t SrcAddress1, uint32_t SrcAddress2, uint32_t DstAddress, uint32_t Width, uint32_t Height);
HAL_StatusTypeDef HAL_DMA2D_Suspend(DMA2D_HandleTypeDef *hdma2d);
HAL_StatusTypeDef HAL_DMA2D_Resume(DMA2D_HandleTypeDef *hdma2d);
HAL_StatusTypeDef HAL_DMA2D_Abort(DMA2D_HandleTypeDef *hdma2d);
HAL_StatusTypeDef HAL_DMA2D_EnableCLUT(DMA2D_HandleTypeDef *hdma2d, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_CLUTLoad(DMA2D_HandleTypeDef *hdma2d, DMA2D_CLUTCfgTypeDef CLUTCfg, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_CLUTLoad_IT(DMA2D_HandleTypeDef *hdma2d, DMA2D_CLUTCfgTypeDef CLUTCfg, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_CLUTLoading_Abort(DMA2D_HandleTypeDef *hdma2d, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_CLUTLoading_Suspend(DMA2D_HandleTypeDef *hdma2d, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_CLUTLoading_Resume(DMA2D_HandleTypeDef *hdma2d, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_PollForTransfer(DMA2D_HandleTypeDef *hdma2d, uint32_t Timeout);
void HAL_DMA2D_IRQHandler(DMA2D_HandleTypeDef *hdma2d);
void HAL_DMA2D_LineEventCallback(DMA2D_HandleTypeDef *hdma2d);
void HAL_DMA2D_CLUTLoadingCpltCallback(DMA2D_HandleTypeDef *hdma2d);
# 489 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
HAL_StatusTypeDef HAL_DMA2D_ConfigLayer(DMA2D_HandleTypeDef *hdma2d, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_ConfigCLUT(DMA2D_HandleTypeDef *hdma2d, DMA2D_CLUTCfgTypeDef CLUTCfg, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_ProgramLineEvent(DMA2D_HandleTypeDef *hdma2d, uint32_t Line);
HAL_StatusTypeDef HAL_DMA2D_EnableDeadTime(DMA2D_HandleTypeDef *hdma2d);
HAL_StatusTypeDef HAL_DMA2D_DisableDeadTime(DMA2D_HandleTypeDef *hdma2d);
HAL_StatusTypeDef HAL_DMA2D_ConfigDeadTime(DMA2D_HandleTypeDef *hdma2d, uint8_t DeadTime);
# 505 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
HAL_DMA2D_StateTypeDef HAL_DMA2D_GetState(DMA2D_HandleTypeDef *hdma2d);
uint32_t HAL_DMA2D_GetError(DMA2D_HandleTypeDef *hdma2d);
# 275 "../Inc\\stm32f7xx_hal_conf.h" 2
# 290 "../Inc\\stm32f7xx_hal_conf.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h"
typedef enum
{
  FLASH_PROC_NONE = 0U,
  FLASH_PROC_SECTERASE,
  FLASH_PROC_MASSERASE,
  FLASH_PROC_PROGRAM
} FLASH_ProcedureTypeDef;





typedef struct
{
  volatile FLASH_ProcedureTypeDef ProcedureOnGoing;

  volatile uint32_t NbSectorsToErase;

  volatile uint8_t VoltageForErase;

  volatile uint32_t Sector;

  volatile uint32_t Address;

  HAL_LockTypeDef Lock;

  volatile uint32_t ErrorCode;

}FLASH_ProcessTypeDef;
# 310 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"
typedef struct
{
  uint32_t TypeErase;







  uint32_t Sector;


  uint32_t NbSectors;


  uint32_t VoltageRange;


} FLASH_EraseInitTypeDef;




typedef struct
{
  uint32_t OptionType;


  uint32_t WRPState;


  uint32_t WRPSector;


  uint32_t RDPLevel;


  uint32_t BORLevel;


  uint32_t USERConfig;



  uint32_t BootAddr0;


  uint32_t BootAddr1;
# 122 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"
} FLASH_OBProgramInitTypeDef;
# 498 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"
HAL_StatusTypeDef HAL_FLASHEx_Erase(FLASH_EraseInitTypeDef *pEraseInit, uint32_t *SectorError);
HAL_StatusTypeDef HAL_FLASHEx_Erase_IT(FLASH_EraseInitTypeDef *pEraseInit);
HAL_StatusTypeDef HAL_FLASHEx_OBProgram(FLASH_OBProgramInitTypeDef *pOBInit);
void HAL_FLASHEx_OBGetConfig(FLASH_OBProgramInitTypeDef *pOBInit);
# 642 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"
void FLASH_Erase_Sector(uint32_t Sector, uint8_t VoltageRange);
# 311 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h" 2
# 320 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h"
HAL_StatusTypeDef HAL_FLASH_Program(uint32_t TypeProgram, uint32_t Address, uint64_t Data);
HAL_StatusTypeDef HAL_FLASH_Program_IT(uint32_t TypeProgram, uint32_t Address, uint64_t Data);

void HAL_FLASH_IRQHandler(void);

void HAL_FLASH_EndOfOperationCallback(uint32_t ReturnValue);
void HAL_FLASH_OperationErrorCallback(uint32_t ReturnValue);
# 335 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h"
HAL_StatusTypeDef HAL_FLASH_Unlock(void);
HAL_StatusTypeDef HAL_FLASH_Lock(void);
HAL_StatusTypeDef HAL_FLASH_OB_Unlock(void);
HAL_StatusTypeDef HAL_FLASH_OB_Lock(void);

HAL_StatusTypeDef HAL_FLASH_OB_Launch(void);
# 349 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h"
uint32_t HAL_FLASH_GetError(void);
HAL_StatusTypeDef FLASH_WaitForLastOperation(uint32_t Timeout);
# 291 "../Inc\\stm32f7xx_hal_conf.h" 2
# 306 "../Inc\\stm32f7xx_hal_conf.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h" 1
# 45 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_ll_fmc.h" 1
# 412 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_ll_fmc.h"
typedef struct
{
  uint32_t NSBank;


  uint32_t DataAddressMux;



  uint32_t MemoryType;



  uint32_t MemoryDataWidth;


  uint32_t BurstAccessMode;



  uint32_t WaitSignalPolarity;



  uint32_t WaitSignalActive;




  uint32_t WriteOperation;


  uint32_t WaitSignal;



  uint32_t ExtendedMode;


  uint32_t AsynchronousWait;



  uint32_t WriteBurst;


  uint32_t ContinuousClock;




  uint32_t WriteFifo;




  uint32_t PageSize;


}FMC_NORSRAM_InitTypeDef;




typedef struct
{
  uint32_t AddressSetupTime;




  uint32_t AddressHoldTime;




  uint32_t DataSetupTime;





  uint32_t BusTurnAroundDuration;




  uint32_t CLKDivision;




  uint32_t DataLatency;







  uint32_t AccessMode;

}FMC_NORSRAM_TimingTypeDef;




typedef struct
{
  uint32_t NandBank;


  uint32_t Waitfeature;


  uint32_t MemoryDataWidth;


  uint32_t EccComputation;


  uint32_t ECCPageSize;


  uint32_t TCLRSetupTime;



  uint32_t TARSetupTime;


}FMC_NAND_InitTypeDef;




typedef struct
{
  uint32_t SetupTime;





  uint32_t WaitSetupTime;





  uint32_t HoldSetupTime;






  uint32_t HiZSetupTime;




}FMC_NAND_PCC_TimingTypeDef;




typedef struct
{
  uint32_t SDBank;


  uint32_t ColumnBitsNumber;


  uint32_t RowBitsNumber;


  uint32_t MemoryDataWidth;


  uint32_t InternalBankNumber;


  uint32_t CASLatency;


  uint32_t WriteProtection;


  uint32_t SDClockPeriod;



  uint32_t ReadBurst;



  uint32_t ReadPipeDelay;

}FMC_SDRAM_InitTypeDef;




typedef struct
{
  uint32_t LoadToActiveDelay;



  uint32_t ExitSelfRefreshDelay;



  uint32_t SelfRefreshTime;



  uint32_t RowCycleDelay;




  uint32_t WriteRecoveryTime;


  uint32_t RPDelay;



  uint32_t RCDDelay;


}FMC_SDRAM_TimingTypeDef;




typedef struct
{
  uint32_t CommandMode;


  uint32_t CommandTarget;


  uint32_t AutoRefreshNumber;


  uint32_t ModeRegisterDefinition;
}FMC_SDRAM_CommandTypeDef;
# 1245 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_ll_fmc.h"
HAL_StatusTypeDef FMC_NORSRAM_Init(FMC_Bank1_TypeDef *Device, FMC_NORSRAM_InitTypeDef *Init);
HAL_StatusTypeDef FMC_NORSRAM_Timing_Init(FMC_Bank1_TypeDef *Device, FMC_NORSRAM_TimingTypeDef *Timing, uint32_t Bank);
HAL_StatusTypeDef FMC_NORSRAM_Extended_Timing_Init(FMC_Bank1E_TypeDef *Device, FMC_NORSRAM_TimingTypeDef *Timing, uint32_t Bank, uint32_t ExtendedMode);
HAL_StatusTypeDef FMC_NORSRAM_DeInit(FMC_Bank1_TypeDef *Device, FMC_Bank1E_TypeDef *ExDevice, uint32_t Bank);







HAL_StatusTypeDef FMC_NORSRAM_WriteOperation_Enable(FMC_Bank1_TypeDef *Device, uint32_t Bank);
HAL_StatusTypeDef FMC_NORSRAM_WriteOperation_Disable(FMC_Bank1_TypeDef *Device, uint32_t Bank);
# 1271 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_ll_fmc.h"
HAL_StatusTypeDef FMC_NAND_Init(FMC_Bank3_TypeDef *Device, FMC_NAND_InitTypeDef *Init);
HAL_StatusTypeDef FMC_NAND_CommonSpace_Timing_Init(FMC_Bank3_TypeDef *Device, FMC_NAND_PCC_TimingTypeDef *Timing, uint32_t Bank);
HAL_StatusTypeDef FMC_NAND_AttributeSpace_Timing_Init(FMC_Bank3_TypeDef *Device, FMC_NAND_PCC_TimingTypeDef *Timing, uint32_t Bank);
HAL_StatusTypeDef FMC_NAND_DeInit(FMC_Bank3_TypeDef *Device, uint32_t Bank);







HAL_StatusTypeDef FMC_NAND_ECC_Enable(FMC_Bank3_TypeDef *Device, uint32_t Bank);
HAL_StatusTypeDef FMC_NAND_ECC_Disable(FMC_Bank3_TypeDef *Device, uint32_t Bank);
HAL_StatusTypeDef FMC_NAND_GetECC(FMC_Bank3_TypeDef *Device, uint32_t *ECCval, uint32_t Bank, uint32_t Timeout);
# 1295 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_ll_fmc.h"
HAL_StatusTypeDef FMC_SDRAM_Init(FMC_Bank5_6_TypeDef *Device, FMC_SDRAM_InitTypeDef *Init);
HAL_StatusTypeDef FMC_SDRAM_Timing_Init(FMC_Bank5_6_TypeDef *Device, FMC_SDRAM_TimingTypeDef *Timing, uint32_t Bank);
HAL_StatusTypeDef FMC_SDRAM_DeInit(FMC_Bank5_6_TypeDef *Device, uint32_t Bank);
# 1306 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_ll_fmc.h"
HAL_StatusTypeDef FMC_SDRAM_WriteProtection_Enable(FMC_Bank5_6_TypeDef *Device, uint32_t Bank);
HAL_StatusTypeDef FMC_SDRAM_WriteProtection_Disable(FMC_Bank5_6_TypeDef *Device, uint32_t Bank);
HAL_StatusTypeDef FMC_SDRAM_SendCommand(FMC_Bank5_6_TypeDef *Device, FMC_SDRAM_CommandTypeDef *Command, uint32_t Timeout);
HAL_StatusTypeDef FMC_SDRAM_ProgramRefreshRate(FMC_Bank5_6_TypeDef *Device, uint32_t RefreshRate);
HAL_StatusTypeDef FMC_SDRAM_SetAutoRefreshNumber(FMC_Bank5_6_TypeDef *Device, uint32_t AutoRefreshNumber);
uint32_t FMC_SDRAM_GetModeStatus(FMC_Bank5_6_TypeDef *Device, uint32_t Bank);
# 46 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h" 2
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h"
typedef enum
{
  HAL_SDRAM_STATE_RESET = 0x00U,
  HAL_SDRAM_STATE_READY = 0x01U,
  HAL_SDRAM_STATE_BUSY = 0x02U,
  HAL_SDRAM_STATE_ERROR = 0x03U,
  HAL_SDRAM_STATE_WRITE_PROTECTED = 0x04U,
  HAL_SDRAM_STATE_PRECHARGED = 0x05U

}HAL_SDRAM_StateTypeDef;




typedef struct
{
  FMC_Bank5_6_TypeDef *Instance;

  FMC_SDRAM_InitTypeDef Init;

  volatile HAL_SDRAM_StateTypeDef State;

  HAL_LockTypeDef Lock;

  DMA_HandleTypeDef *hdma;

}SDRAM_HandleTypeDef;
# 123 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h"
HAL_StatusTypeDef HAL_SDRAM_Init(SDRAM_HandleTypeDef *hsdram, FMC_SDRAM_TimingTypeDef *Timing);
HAL_StatusTypeDef HAL_SDRAM_DeInit(SDRAM_HandleTypeDef *hsdram);
void HAL_SDRAM_MspInit(SDRAM_HandleTypeDef *hsdram);
void HAL_SDRAM_MspDeInit(SDRAM_HandleTypeDef *hsdram);

void HAL_SDRAM_IRQHandler(SDRAM_HandleTypeDef *hsdram);
void HAL_SDRAM_RefreshErrorCallback(SDRAM_HandleTypeDef *hsdram);
void HAL_SDRAM_DMA_XferCpltCallback(DMA_HandleTypeDef *hdma);
void HAL_SDRAM_DMA_XferErrorCallback(DMA_HandleTypeDef *hdma);
# 141 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h"
HAL_StatusTypeDef HAL_SDRAM_Read_8b(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint8_t *pDstBuffer, uint32_t BufferSize);
HAL_StatusTypeDef HAL_SDRAM_Write_8b(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint8_t *pSrcBuffer, uint32_t BufferSize);
HAL_StatusTypeDef HAL_SDRAM_Read_16b(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint16_t *pDstBuffer, uint32_t BufferSize);
HAL_StatusTypeDef HAL_SDRAM_Write_16b(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint16_t *pSrcBuffer, uint32_t BufferSize);
HAL_StatusTypeDef HAL_SDRAM_Read_32b(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint32_t *pDstBuffer, uint32_t BufferSize);
HAL_StatusTypeDef HAL_SDRAM_Write_32b(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint32_t *pSrcBuffer, uint32_t BufferSize);

HAL_StatusTypeDef HAL_SDRAM_Read_DMA(SDRAM_HandleTypeDef *hsdram, uint32_t * pAddress, uint32_t *pDstBuffer, uint32_t BufferSize);
HAL_StatusTypeDef HAL_SDRAM_Write_DMA(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint32_t *pSrcBuffer, uint32_t BufferSize);
# 159 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h"
HAL_StatusTypeDef HAL_SDRAM_WriteProtection_Enable(SDRAM_HandleTypeDef *hsdram);
HAL_StatusTypeDef HAL_SDRAM_WriteProtection_Disable(SDRAM_HandleTypeDef *hsdram);
HAL_StatusTypeDef HAL_SDRAM_SendCommand(SDRAM_HandleTypeDef *hsdram, FMC_SDRAM_CommandTypeDef *Command, uint32_t Timeout);
HAL_StatusTypeDef HAL_SDRAM_ProgramRefreshRate(SDRAM_HandleTypeDef *hsdram, uint32_t RefreshRate);
HAL_StatusTypeDef HAL_SDRAM_SetAutoRefreshNumber(SDRAM_HandleTypeDef *hsdram, uint32_t AutoRefreshNumber);
uint32_t HAL_SDRAM_GetModeStatus(SDRAM_HandleTypeDef *hsdram);
# 174 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h"
HAL_SDRAM_StateTypeDef HAL_SDRAM_GetState(SDRAM_HandleTypeDef *hsdram);
# 307 "../Inc\\stm32f7xx_hal_conf.h" 2







# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
typedef struct
{
  uint32_t Timing;



  uint32_t OwnAddress1;


  uint32_t AddressingMode;


  uint32_t DualAddressMode;


  uint32_t OwnAddress2;


  uint32_t OwnAddress2Masks;


  uint32_t GeneralCallMode;


  uint32_t NoStretchMode;


}I2C_InitTypeDef;
# 124 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
typedef enum
{
  HAL_I2C_STATE_RESET = 0x00U,
  HAL_I2C_STATE_READY = 0x20U,
  HAL_I2C_STATE_BUSY = 0x24U,
  HAL_I2C_STATE_BUSY_TX = 0x21U,
  HAL_I2C_STATE_BUSY_RX = 0x22U,
  HAL_I2C_STATE_LISTEN = 0x28U,
  HAL_I2C_STATE_BUSY_TX_LISTEN = 0x29U,

  HAL_I2C_STATE_BUSY_RX_LISTEN = 0x2AU,

  HAL_I2C_STATE_ABORT = 0x60U,
  HAL_I2C_STATE_TIMEOUT = 0xA0U,
  HAL_I2C_STATE_ERROR = 0xE0U

}HAL_I2C_StateTypeDef;
# 164 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
typedef enum
{
  HAL_I2C_MODE_NONE = 0x00U,
  HAL_I2C_MODE_MASTER = 0x10U,
  HAL_I2C_MODE_SLAVE = 0x20U,
  HAL_I2C_MODE_MEM = 0x40U

}HAL_I2C_ModeTypeDef;
# 197 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
typedef struct __I2C_HandleTypeDef
{
  I2C_TypeDef *Instance;

  I2C_InitTypeDef Init;

  uint8_t *pBuffPtr;

  uint16_t XferSize;

  volatile uint16_t XferCount;

  volatile uint32_t XferOptions;


  volatile uint32_t PreviousState;

  HAL_StatusTypeDef (*XferISR)(struct __I2C_HandleTypeDef *hi2c, uint32_t ITFlags, uint32_t ITSources);

  DMA_HandleTypeDef *hdmatx;

  DMA_HandleTypeDef *hdmarx;

  HAL_LockTypeDef Lock;

  volatile HAL_I2C_StateTypeDef State;

  volatile HAL_I2C_ModeTypeDef Mode;

  volatile uint32_t ErrorCode;

  volatile uint32_t AddrEventCount;
}I2C_HandleTypeDef;
# 516 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c_ex.h" 1
# 130 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c_ex.h"
HAL_StatusTypeDef HAL_I2CEx_ConfigAnalogFilter(I2C_HandleTypeDef *hi2c, uint32_t AnalogFilter);
HAL_StatusTypeDef HAL_I2CEx_ConfigDigitalFilter(I2C_HandleTypeDef *hi2c, uint32_t DigitalFilter);
# 517 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h" 2
# 527 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
HAL_StatusTypeDef HAL_I2C_Init(I2C_HandleTypeDef *hi2c);
HAL_StatusTypeDef HAL_I2C_DeInit (I2C_HandleTypeDef *hi2c);
void HAL_I2C_MspInit(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MspDeInit(I2C_HandleTypeDef *hi2c);
# 540 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
HAL_StatusTypeDef HAL_I2C_Master_Transmit(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Master_Receive(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Slave_Transmit(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Slave_Receive(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Mem_Write(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Mem_Read(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_IsDeviceReady(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint32_t Trials, uint32_t Timeout);


HAL_StatusTypeDef HAL_I2C_Master_Transmit_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Master_Receive_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Slave_Transmit_IT(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Slave_Receive_IT(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Mem_Write_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Mem_Read_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size);

HAL_StatusTypeDef HAL_I2C_Master_Sequential_Transmit_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size, uint32_t XferOptions);
HAL_StatusTypeDef HAL_I2C_Master_Sequential_Receive_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size, uint32_t XferOptions);
HAL_StatusTypeDef HAL_I2C_Slave_Sequential_Transmit_IT(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size, uint32_t XferOptions);
HAL_StatusTypeDef HAL_I2C_Slave_Sequential_Receive_IT(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size, uint32_t XferOptions);
HAL_StatusTypeDef HAL_I2C_EnableListen_IT(I2C_HandleTypeDef *hi2c);
HAL_StatusTypeDef HAL_I2C_DisableListen_IT(I2C_HandleTypeDef *hi2c);
HAL_StatusTypeDef HAL_I2C_Master_Abort_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress);


HAL_StatusTypeDef HAL_I2C_Master_Transmit_DMA(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Master_Receive_DMA(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Slave_Transmit_DMA(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Slave_Receive_DMA(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Mem_Write_DMA(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Mem_Read_DMA(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size);
# 579 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
void HAL_I2C_EV_IRQHandler(I2C_HandleTypeDef *hi2c);
void HAL_I2C_ER_IRQHandler(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MasterTxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MasterRxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_SlaveTxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_SlaveRxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_AddrCallback(I2C_HandleTypeDef *hi2c, uint8_t TransferDirection, uint16_t AddrMatchCode);
void HAL_I2C_ListenCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MemTxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MemRxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_ErrorCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_AbortCpltCallback(I2C_HandleTypeDef *hi2c);
# 599 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
HAL_I2C_StateTypeDef HAL_I2C_GetState(I2C_HandleTypeDef *hi2c);
HAL_I2C_ModeTypeDef HAL_I2C_GetMode(I2C_HandleTypeDef *hi2c);
uint32_t HAL_I2C_GetError(I2C_HandleTypeDef *hi2c);
# 315 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2s.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2s.h"
typedef struct
{
  uint32_t Mode;


  uint32_t Standard;


  uint32_t DataFormat;


  uint32_t MCLKOutput;


  uint32_t AudioFreq;


  uint32_t CPOL;


  uint32_t ClockSource;

}I2S_InitTypeDef;




typedef enum
{
  HAL_I2S_STATE_RESET = 0x00U,
  HAL_I2S_STATE_READY = 0x01U,
  HAL_I2S_STATE_BUSY = 0x02U,
  HAL_I2S_STATE_BUSY_TX = 0x03U,
  HAL_I2S_STATE_BUSY_RX = 0x04U,
  HAL_I2S_STATE_BUSY_TX_RX = 0x05U,
  HAL_I2S_STATE_TIMEOUT = 0x06U,
  HAL_I2S_STATE_ERROR = 0x07U

}HAL_I2S_StateTypeDef;




typedef struct
{
  SPI_TypeDef *Instance;

  I2S_InitTypeDef Init;

  uint16_t *pTxBuffPtr;

  volatile uint16_t TxXferSize;

  volatile uint16_t TxXferCount;

  uint16_t *pRxBuffPtr;

  volatile uint16_t RxXferSize;

  volatile uint16_t RxXferCount;






  DMA_HandleTypeDef *hdmatx;

  DMA_HandleTypeDef *hdmarx;

  volatile HAL_LockTypeDef Lock;

  volatile HAL_I2S_StateTypeDef State;

  volatile uint32_t ErrorCode;

}I2S_HandleTypeDef;
# 365 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2s.h"
HAL_StatusTypeDef HAL_I2S_Init(I2S_HandleTypeDef *hi2s);
HAL_StatusTypeDef HAL_I2S_DeInit (I2S_HandleTypeDef *hi2s);
void HAL_I2S_MspInit(I2S_HandleTypeDef *hi2s);
void HAL_I2S_MspDeInit(I2S_HandleTypeDef *hi2s);
# 378 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2s.h"
HAL_StatusTypeDef HAL_I2S_Transmit(I2S_HandleTypeDef *hi2s, uint16_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2S_Receive(I2S_HandleTypeDef *hi2s, uint16_t *pData, uint16_t Size, uint32_t Timeout);


HAL_StatusTypeDef HAL_I2S_Transmit_IT(I2S_HandleTypeDef *hi2s, uint16_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2S_Receive_IT(I2S_HandleTypeDef *hi2s, uint16_t *pData, uint16_t Size);
void HAL_I2S_IRQHandler(I2S_HandleTypeDef *hi2s);


HAL_StatusTypeDef HAL_I2S_Transmit_DMA(I2S_HandleTypeDef *hi2s, uint16_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2S_Receive_DMA(I2S_HandleTypeDef *hi2s, uint16_t *pData, uint16_t Size);

HAL_StatusTypeDef HAL_I2S_DMAPause(I2S_HandleTypeDef *hi2s);
HAL_StatusTypeDef HAL_I2S_DMAResume(I2S_HandleTypeDef *hi2s);
HAL_StatusTypeDef HAL_I2S_DMAStop(I2S_HandleTypeDef *hi2s);


void HAL_I2S_TxHalfCpltCallback(I2S_HandleTypeDef *hi2s);
void HAL_I2S_TxCpltCallback(I2S_HandleTypeDef *hi2s);
void HAL_I2S_RxHalfCpltCallback(I2S_HandleTypeDef *hi2s);
void HAL_I2S_RxCpltCallback(I2S_HandleTypeDef *hi2s);
void HAL_I2S_ErrorCallback(I2S_HandleTypeDef *hi2s);
# 408 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2s.h"
HAL_I2S_StateTypeDef HAL_I2S_GetState(I2S_HandleTypeDef *hi2s);
uint32_t HAL_I2S_GetError(I2S_HandleTypeDef *hi2s);
# 319 "../Inc\\stm32f7xx_hal_conf.h" 2
# 330 "../Inc\\stm32f7xx_hal_conf.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_ltdc.h" 1
# 68 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_ltdc.h"
typedef struct
{
  uint8_t Blue;


  uint8_t Green;


  uint8_t Red;


  uint8_t Reserved;
} LTDC_ColorTypeDef;




typedef struct
{
  uint32_t HSPolarity;


  uint32_t VSPolarity;


  uint32_t DEPolarity;


  uint32_t PCPolarity;


  uint32_t HorizontalSync;


  uint32_t VerticalSync;


  uint32_t AccumulatedHBP;


  uint32_t AccumulatedVBP;


  uint32_t AccumulatedActiveW;


  uint32_t AccumulatedActiveH;


  uint32_t TotalWidth;


  uint32_t TotalHeigh;


  LTDC_ColorTypeDef Backcolor;
} LTDC_InitTypeDef;




typedef struct
{
  uint32_t WindowX0;


  uint32_t WindowX1;


  uint32_t WindowY0;


  uint32_t WindowY1;


  uint32_t PixelFormat;


  uint32_t Alpha;


  uint32_t Alpha0;


  uint32_t BlendingFactor1;


  uint32_t BlendingFactor2;


  uint32_t FBStartAdress;

  uint32_t ImageWidth;


  uint32_t ImageHeight;


  LTDC_ColorTypeDef Backcolor;
} LTDC_LayerCfgTypeDef;




typedef enum
{
  HAL_LTDC_STATE_RESET = 0x00U,
  HAL_LTDC_STATE_READY = 0x01U,
  HAL_LTDC_STATE_BUSY = 0x02U,
  HAL_LTDC_STATE_TIMEOUT = 0x03U,
  HAL_LTDC_STATE_ERROR = 0x04U
}HAL_LTDC_StateTypeDef;




typedef struct
{
  LTDC_TypeDef *Instance;

  LTDC_InitTypeDef Init;

  LTDC_LayerCfgTypeDef LayerCfg[2];

  HAL_LockTypeDef Lock;

  volatile HAL_LTDC_StateTypeDef State;

  volatile uint32_t ErrorCode;

} LTDC_HandleTypeDef;
# 492 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_ltdc.h"
HAL_StatusTypeDef HAL_LTDC_Init(LTDC_HandleTypeDef *hltdc);
HAL_StatusTypeDef HAL_LTDC_DeInit(LTDC_HandleTypeDef *hltdc);
void HAL_LTDC_MspInit(LTDC_HandleTypeDef* hltdc);
void HAL_LTDC_MspDeInit(LTDC_HandleTypeDef* hltdc);
void HAL_LTDC_ErrorCallback(LTDC_HandleTypeDef *hltdc);
void HAL_LTDC_LineEventCallback(LTDC_HandleTypeDef *hltdc);
void HAL_LTDC_ReloadEventCallback(LTDC_HandleTypeDef *hltdc);
# 507 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_ltdc.h"
void HAL_LTDC_IRQHandler(LTDC_HandleTypeDef *hltdc);
# 516 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_ltdc.h"
HAL_StatusTypeDef HAL_LTDC_ConfigLayer(LTDC_HandleTypeDef *hltdc, LTDC_LayerCfgTypeDef *pLayerCfg, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetWindowSize(LTDC_HandleTypeDef *hltdc, uint32_t XSize, uint32_t YSize, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetWindowPosition(LTDC_HandleTypeDef *hltdc, uint32_t X0, uint32_t Y0, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetPixelFormat(LTDC_HandleTypeDef *hltdc, uint32_t Pixelformat, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetAlpha(LTDC_HandleTypeDef *hltdc, uint32_t Alpha, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetAddress(LTDC_HandleTypeDef *hltdc, uint32_t Address, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetPitch(LTDC_HandleTypeDef *hltdc, uint32_t LinePitchInPixels, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_ConfigColorKeying(LTDC_HandleTypeDef *hltdc, uint32_t RGBValue, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_ConfigCLUT(LTDC_HandleTypeDef *hltdc, uint32_t *pCLUT, uint32_t CLUTSize, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_EnableColorKeying(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_DisableColorKeying(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_EnableCLUT(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_DisableCLUT(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_ProgramLineEvent(LTDC_HandleTypeDef *hltdc, uint32_t Line);
HAL_StatusTypeDef HAL_LTDC_EnableDither(LTDC_HandleTypeDef *hltdc);
HAL_StatusTypeDef HAL_LTDC_DisableDither(LTDC_HandleTypeDef *hltdc);
HAL_StatusTypeDef HAL_LTDC_Reload(LTDC_HandleTypeDef *hltdc, uint32_t ReloadType);
HAL_StatusTypeDef HAL_LTDC_ConfigLayer_NoReload(LTDC_HandleTypeDef *hltdc, LTDC_LayerCfgTypeDef *pLayerCfg, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetWindowSize_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t XSize, uint32_t YSize, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetWindowPosition_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t X0, uint32_t Y0, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetPixelFormat_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t Pixelformat, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetAlpha_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t Alpha, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetAddress_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t Address, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetPitch_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t LinePitchInPixels, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_ConfigColorKeying_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t RGBValue, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_EnableColorKeying_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_DisableColorKeying_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_EnableCLUT_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_DisableCLUT_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
# 554 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_ltdc.h"
HAL_LTDC_StateTypeDef HAL_LTDC_GetState(LTDC_HandleTypeDef *hltdc);
uint32_t HAL_LTDC_GetError(LTDC_HandleTypeDef *hltdc);
# 331 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_pwr.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_pwr.h"
typedef struct
{
  uint32_t PVDLevel;


  uint32_t Mode;

}PWR_PVDTypeDef;
# 302 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_pwr.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr_ex.h" 1
# 200 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr_ex.h"
uint32_t HAL_PWREx_GetVoltageRange(void);
HAL_StatusTypeDef HAL_PWREx_ControlVoltageScaling(uint32_t VoltageScaling);

void HAL_PWREx_EnableFlashPowerDown(void);
void HAL_PWREx_DisableFlashPowerDown(void);
HAL_StatusTypeDef HAL_PWREx_EnableBkUpReg(void);
HAL_StatusTypeDef HAL_PWREx_DisableBkUpReg(void);

void HAL_PWREx_EnableMainRegulatorLowVoltage(void);
void HAL_PWREx_DisableMainRegulatorLowVoltage(void);
void HAL_PWREx_EnableLowRegulatorLowVoltage(void);
void HAL_PWREx_DisableLowRegulatorLowVoltage(void);

HAL_StatusTypeDef HAL_PWREx_EnableOverDrive(void);
HAL_StatusTypeDef HAL_PWREx_DisableOverDrive(void);
HAL_StatusTypeDef HAL_PWREx_EnterUnderDriveSTOPMode(uint32_t Regulator, uint8_t STOPEntry);
# 303 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_pwr.h" 2
# 313 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_pwr.h"
void HAL_PWR_DeInit(void);
void HAL_PWR_EnableBkUpAccess(void);
void HAL_PWR_DisableBkUpAccess(void);
# 325 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_pwr.h"
void HAL_PWR_ConfigPVD(PWR_PVDTypeDef *sConfigPVD);
void HAL_PWR_EnablePVD(void);
void HAL_PWR_DisablePVD(void);


void HAL_PWR_EnableWakeUpPin(uint32_t WakeUpPinPolarity);
void HAL_PWR_DisableWakeUpPin(uint32_t WakeUpPinx);


void HAL_PWR_EnterSTOPMode(uint32_t Regulator, uint8_t STOPEntry);
void HAL_PWR_EnterSLEEPMode(uint32_t Regulator, uint8_t SLEEPEntry);
void HAL_PWR_EnterSTANDBYMode(void);


void HAL_PWR_PVD_IRQHandler(void);
void HAL_PWR_PVDCallback(void);


void HAL_PWR_EnableSleepOnExit(void);
void HAL_PWR_DisableSleepOnExit(void);
void HAL_PWR_EnableSEVOnPend(void);
void HAL_PWR_DisableSEVOnPend(void);
# 335 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_qspi.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_qspi.h"
typedef struct
{
  uint32_t ClockPrescaler;


  uint32_t FifoThreshold;


  uint32_t SampleShifting;



  uint32_t FlashSize;





  uint32_t ChipSelectHighTime;



  uint32_t ClockMode;


  uint32_t FlashID;


  uint32_t DualFlash;

}QSPI_InitTypeDef;




typedef enum
{
  HAL_QSPI_STATE_RESET = 0x00U,
  HAL_QSPI_STATE_READY = 0x01U,
  HAL_QSPI_STATE_BUSY = 0x02U,
  HAL_QSPI_STATE_BUSY_INDIRECT_TX = 0x12U,
  HAL_QSPI_STATE_BUSY_INDIRECT_RX = 0x22U,
  HAL_QSPI_STATE_BUSY_AUTO_POLLING = 0x42U,
  HAL_QSPI_STATE_BUSY_MEM_MAPPED = 0x82U,
  HAL_QSPI_STATE_ABORT = 0x08U,
  HAL_QSPI_STATE_ERROR = 0x04U
}HAL_QSPI_StateTypeDef;




typedef struct
{
  QUADSPI_TypeDef *Instance;
  QSPI_InitTypeDef Init;
  uint8_t *pTxBuffPtr;
  volatile uint32_t TxXferSize;
  volatile uint32_t TxXferCount;
  uint8_t *pRxBuffPtr;
  volatile uint32_t RxXferSize;
  volatile uint32_t RxXferCount;
  DMA_HandleTypeDef *hdma;
  volatile HAL_LockTypeDef Lock;
  volatile HAL_QSPI_StateTypeDef State;
  volatile uint32_t ErrorCode;
  uint32_t Timeout;
}QSPI_HandleTypeDef;




typedef struct
{
  uint32_t Instruction;

  uint32_t Address;

  uint32_t AlternateBytes;

  uint32_t AddressSize;

  uint32_t AlternateBytesSize;

  uint32_t DummyCycles;

  uint32_t InstructionMode;

  uint32_t AddressMode;

  uint32_t AlternateByteMode;

  uint32_t DataMode;

  uint32_t NbData;


  uint32_t DdrMode;

  uint32_t DdrHoldHalfCycle;


  uint32_t SIOOMode;

}QSPI_CommandTypeDef;




typedef struct
{
  uint32_t Match;

  uint32_t Mask;

  uint32_t Interval;

  uint32_t StatusBytesSize;

  uint32_t MatchMode;

  uint32_t AutomaticStop;

}QSPI_AutoPollingTypeDef;




typedef struct
{
  uint32_t TimeOutPeriod;

  uint32_t TimeOutActivation;

}QSPI_MemoryMappedTypeDef;
# 528 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_qspi.h"
HAL_StatusTypeDef HAL_QSPI_Init (QSPI_HandleTypeDef *hqspi);
HAL_StatusTypeDef HAL_QSPI_DeInit (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_MspInit (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_MspDeInit(QSPI_HandleTypeDef *hqspi);
# 541 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_qspi.h"
void HAL_QSPI_IRQHandler(QSPI_HandleTypeDef *hqspi);


HAL_StatusTypeDef HAL_QSPI_Command (QSPI_HandleTypeDef *hqspi, QSPI_CommandTypeDef *cmd, uint32_t Timeout);
HAL_StatusTypeDef HAL_QSPI_Transmit (QSPI_HandleTypeDef *hqspi, uint8_t *pData, uint32_t Timeout);
HAL_StatusTypeDef HAL_QSPI_Receive (QSPI_HandleTypeDef *hqspi, uint8_t *pData, uint32_t Timeout);
HAL_StatusTypeDef HAL_QSPI_Command_IT (QSPI_HandleTypeDef *hqspi, QSPI_CommandTypeDef *cmd);
HAL_StatusTypeDef HAL_QSPI_Transmit_IT (QSPI_HandleTypeDef *hqspi, uint8_t *pData);
HAL_StatusTypeDef HAL_QSPI_Receive_IT (QSPI_HandleTypeDef *hqspi, uint8_t *pData);
HAL_StatusTypeDef HAL_QSPI_Transmit_DMA (QSPI_HandleTypeDef *hqspi, uint8_t *pData);
HAL_StatusTypeDef HAL_QSPI_Receive_DMA (QSPI_HandleTypeDef *hqspi, uint8_t *pData);


HAL_StatusTypeDef HAL_QSPI_AutoPolling (QSPI_HandleTypeDef *hqspi, QSPI_CommandTypeDef *cmd, QSPI_AutoPollingTypeDef *cfg, uint32_t Timeout);
HAL_StatusTypeDef HAL_QSPI_AutoPolling_IT(QSPI_HandleTypeDef *hqspi, QSPI_CommandTypeDef *cmd, QSPI_AutoPollingTypeDef *cfg);


HAL_StatusTypeDef HAL_QSPI_MemoryMapped(QSPI_HandleTypeDef *hqspi, QSPI_CommandTypeDef *cmd, QSPI_MemoryMappedTypeDef *cfg);
# 567 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_qspi.h"
void HAL_QSPI_ErrorCallback (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_AbortCpltCallback (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_FifoThresholdCallback(QSPI_HandleTypeDef *hqspi);


void HAL_QSPI_CmdCpltCallback (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_RxCpltCallback (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_TxCpltCallback (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_RxHalfCpltCallback (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_TxHalfCpltCallback (QSPI_HandleTypeDef *hqspi);


void HAL_QSPI_StatusMatchCallback (QSPI_HandleTypeDef *hqspi);


void HAL_QSPI_TimeOutCallback (QSPI_HandleTypeDef *hqspi);
# 591 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_qspi.h"
HAL_QSPI_StateTypeDef HAL_QSPI_GetState (QSPI_HandleTypeDef *hqspi);
uint32_t HAL_QSPI_GetError (QSPI_HandleTypeDef *hqspi);
HAL_StatusTypeDef HAL_QSPI_Abort (QSPI_HandleTypeDef *hqspi);
HAL_StatusTypeDef HAL_QSPI_Abort_IT (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_SetTimeout (QSPI_HandleTypeDef *hqspi, uint32_t Timeout);
HAL_StatusTypeDef HAL_QSPI_SetFifoThreshold(QSPI_HandleTypeDef *hqspi, uint32_t Threshold);
uint32_t HAL_QSPI_GetFifoThreshold(QSPI_HandleTypeDef *hqspi);
# 339 "../Inc\\stm32f7xx_hal_conf.h" 2







# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
typedef enum
{
  HAL_RTC_STATE_RESET = 0x00U,
  HAL_RTC_STATE_READY = 0x01U,
  HAL_RTC_STATE_BUSY = 0x02U,
  HAL_RTC_STATE_TIMEOUT = 0x03U,
  HAL_RTC_STATE_ERROR = 0x04U

}HAL_RTCStateTypeDef;




typedef struct
{
  uint32_t HourFormat;


  uint32_t AsynchPrediv;


  uint32_t SynchPrediv;


  uint32_t OutPut;


  uint32_t OutPutPolarity;


  uint32_t OutPutType;

}RTC_InitTypeDef;




typedef struct
{
  uint8_t Hours;



  uint8_t Minutes;


  uint8_t Seconds;


  uint32_t SubSeconds;



  uint32_t SecondFraction;





  uint8_t TimeFormat;


  uint32_t DayLightSaving;


  uint32_t StoreOperation;


}RTC_TimeTypeDef;




typedef struct
{
  uint8_t WeekDay;


  uint8_t Month;


  uint8_t Date;


  uint8_t Year;


}RTC_DateTypeDef;




typedef struct
{
  RTC_TimeTypeDef AlarmTime;

  uint32_t AlarmMask;


  uint32_t AlarmSubSecondMask;


  uint32_t AlarmDateWeekDaySel;


  uint8_t AlarmDateWeekDay;



  uint32_t Alarm;

}RTC_AlarmTypeDef;




typedef struct
{
  RTC_TypeDef *Instance;

  RTC_InitTypeDef Init;

  HAL_LockTypeDef Lock;

  volatile HAL_RTCStateTypeDef State;

}RTC_HandleTypeDef;
# 623 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rtc_ex.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rtc_ex.h"
typedef struct
{
  uint32_t Tamper;


  uint32_t Interrupt;


  uint32_t Trigger;


  uint32_t NoErase;


  uint32_t MaskFlag;


  uint32_t Filter;


  uint32_t SamplingFrequency;


  uint32_t PrechargeDuration;


  uint32_t TamperPullUp;


  uint32_t TimeStampOnTamperDetection;

}RTC_TamperTypeDef;
# 848 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rtc_ex.h"
HAL_StatusTypeDef HAL_RTCEx_SetTimeStamp(RTC_HandleTypeDef *hrtc, uint32_t TimeStampEdge, uint32_t RTC_TimeStampPin);
HAL_StatusTypeDef HAL_RTCEx_SetTimeStamp_IT(RTC_HandleTypeDef *hrtc, uint32_t TimeStampEdge, uint32_t RTC_TimeStampPin);
HAL_StatusTypeDef HAL_RTCEx_DeactivateTimeStamp(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_SetInternalTimeStamp(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_DeactivateInternalTimeStamp(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_GetTimeStamp(RTC_HandleTypeDef *hrtc, RTC_TimeTypeDef *sTimeStamp, RTC_DateTypeDef *sTimeStampDate, uint32_t Format);

HAL_StatusTypeDef HAL_RTCEx_SetTamper(RTC_HandleTypeDef *hrtc, RTC_TamperTypeDef* sTamper);
HAL_StatusTypeDef HAL_RTCEx_SetTamper_IT(RTC_HandleTypeDef *hrtc, RTC_TamperTypeDef* sTamper);
HAL_StatusTypeDef HAL_RTCEx_DeactivateTamper(RTC_HandleTypeDef *hrtc, uint32_t Tamper);
void HAL_RTCEx_TamperTimeStampIRQHandler(RTC_HandleTypeDef *hrtc);

void HAL_RTCEx_Tamper1EventCallback(RTC_HandleTypeDef *hrtc);
void HAL_RTCEx_Tamper2EventCallback(RTC_HandleTypeDef *hrtc);
void HAL_RTCEx_Tamper3EventCallback(RTC_HandleTypeDef *hrtc);
void HAL_RTCEx_TimeStampEventCallback(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_PollForTimeStampEvent(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
HAL_StatusTypeDef HAL_RTCEx_PollForTamper1Event(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
HAL_StatusTypeDef HAL_RTCEx_PollForTamper2Event(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
HAL_StatusTypeDef HAL_RTCEx_PollForTamper3Event(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
# 876 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rtc_ex.h"
HAL_StatusTypeDef HAL_RTCEx_SetWakeUpTimer(RTC_HandleTypeDef *hrtc, uint32_t WakeUpCounter, uint32_t WakeUpClock);
HAL_StatusTypeDef HAL_RTCEx_SetWakeUpTimer_IT(RTC_HandleTypeDef *hrtc, uint32_t WakeUpCounter, uint32_t WakeUpClock);
uint32_t HAL_RTCEx_DeactivateWakeUpTimer(RTC_HandleTypeDef *hrtc);
uint32_t HAL_RTCEx_GetWakeUpTimer(RTC_HandleTypeDef *hrtc);
void HAL_RTCEx_WakeUpTimerIRQHandler(RTC_HandleTypeDef *hrtc);
void HAL_RTCEx_WakeUpTimerEventCallback(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_PollForWakeUpTimerEvent(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
# 891 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rtc_ex.h"
void HAL_RTCEx_BKUPWrite(RTC_HandleTypeDef *hrtc, uint32_t BackupRegister, uint32_t Data);
uint32_t HAL_RTCEx_BKUPRead(RTC_HandleTypeDef *hrtc, uint32_t BackupRegister);

HAL_StatusTypeDef HAL_RTCEx_SetSmoothCalib(RTC_HandleTypeDef *hrtc, uint32_t SmoothCalibPeriod, uint32_t SmoothCalibPlusPulses, uint32_t SmouthCalibMinusPulsesValue);
HAL_StatusTypeDef HAL_RTCEx_SetSynchroShift(RTC_HandleTypeDef *hrtc, uint32_t ShiftAdd1S, uint32_t ShiftSubFS);
HAL_StatusTypeDef HAL_RTCEx_SetCalibrationOutPut(RTC_HandleTypeDef *hrtc, uint32_t CalibOutput);
HAL_StatusTypeDef HAL_RTCEx_DeactivateCalibrationOutPut(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_SetRefClock(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_DeactivateRefClock(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_EnableBypassShadow(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_DisableBypassShadow(RTC_HandleTypeDef *hrtc);
# 910 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rtc_ex.h"
void HAL_RTCEx_AlarmBEventCallback(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_PollForAlarmBEvent(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
# 624 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h" 2
# 634 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
HAL_StatusTypeDef HAL_RTC_Init(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTC_DeInit(RTC_HandleTypeDef *hrtc);
void HAL_RTC_MspInit(RTC_HandleTypeDef *hrtc);
void HAL_RTC_MspDeInit(RTC_HandleTypeDef *hrtc);
# 646 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
HAL_StatusTypeDef HAL_RTC_SetTime(RTC_HandleTypeDef *hrtc, RTC_TimeTypeDef *sTime, uint32_t Format);
HAL_StatusTypeDef HAL_RTC_GetTime(RTC_HandleTypeDef *hrtc, RTC_TimeTypeDef *sTime, uint32_t Format);
HAL_StatusTypeDef HAL_RTC_SetDate(RTC_HandleTypeDef *hrtc, RTC_DateTypeDef *sDate, uint32_t Format);
HAL_StatusTypeDef HAL_RTC_GetDate(RTC_HandleTypeDef *hrtc, RTC_DateTypeDef *sDate, uint32_t Format);
# 658 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
HAL_StatusTypeDef HAL_RTC_SetAlarm(RTC_HandleTypeDef *hrtc, RTC_AlarmTypeDef *sAlarm, uint32_t Format);
HAL_StatusTypeDef HAL_RTC_SetAlarm_IT(RTC_HandleTypeDef *hrtc, RTC_AlarmTypeDef *sAlarm, uint32_t Format);
HAL_StatusTypeDef HAL_RTC_DeactivateAlarm(RTC_HandleTypeDef *hrtc, uint32_t Alarm);
HAL_StatusTypeDef HAL_RTC_GetAlarm(RTC_HandleTypeDef *hrtc, RTC_AlarmTypeDef *sAlarm, uint32_t Alarm, uint32_t Format);
void HAL_RTC_AlarmIRQHandler(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTC_PollForAlarmAEvent(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
void HAL_RTC_AlarmAEventCallback(RTC_HandleTypeDef *hrtc);
# 673 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
HAL_StatusTypeDef HAL_RTC_WaitForSynchro(RTC_HandleTypeDef* hrtc);
# 682 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
HAL_RTCStateTypeDef HAL_RTC_GetState(RTC_HandleTypeDef *hrtc);
# 790 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
HAL_StatusTypeDef RTC_EnterInitMode(RTC_HandleTypeDef* hrtc);
uint8_t RTC_ByteToBcd2(uint8_t Value);
uint8_t RTC_Bcd2ToByte(uint8_t Value);
# 347 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
typedef enum
{
  HAL_SAI_STATE_RESET = 0x00U,
  HAL_SAI_STATE_READY = 0x01U,
  HAL_SAI_STATE_BUSY = 0x02U,
  HAL_SAI_STATE_BUSY_TX = 0x12U,
  HAL_SAI_STATE_BUSY_RX = 0x22U,
}HAL_SAI_StateTypeDef;




typedef void (*SAIcallback)(void);





typedef struct
{
  uint32_t AudioMode;


  uint32_t Synchro;


  uint32_t SynchroExt;





  uint32_t OutputDrive;




  uint32_t NoDivider;
# 110 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
  uint32_t FIFOThreshold;


  uint32_t AudioFrequency;


  uint32_t Mckdiv;



  uint32_t MonoStereoMode;


  uint32_t CompandingMode;


  uint32_t TriState;





  uint32_t Protocol;


  uint32_t DataSize;


  uint32_t FirstBit;


  uint32_t ClockStrobing;

}SAI_InitTypeDef;
# 152 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
typedef struct
{

  uint32_t FrameLength;





  uint32_t ActiveFrameLength;




  uint32_t FSDefinition;


  uint32_t FSPolarity;


  uint32_t FSOffset;


}SAI_FrameInitTypeDef;
# 184 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
typedef struct
{
  uint32_t FirstBitOffset;


  uint32_t SlotSize;


  uint32_t SlotNumber;


  uint32_t SlotActive;

}SAI_SlotInitTypeDef;
# 206 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
typedef struct __SAI_HandleTypeDef
{
  SAI_Block_TypeDef *Instance;

  SAI_InitTypeDef Init;

  SAI_FrameInitTypeDef FrameInit;

  SAI_SlotInitTypeDef SlotInit;

  uint8_t *pBuffPtr;

  uint16_t XferSize;

  uint16_t XferCount;

  DMA_HandleTypeDef *hdmatx;

  DMA_HandleTypeDef *hdmarx;

  SAIcallback mutecallback;

  void (*InterruptServiceRoutine)(struct __SAI_HandleTypeDef *hsai);

  HAL_LockTypeDef Lock;

  volatile HAL_SAI_StateTypeDef State;

  volatile uint32_t ErrorCode;
}SAI_HandleTypeDef;
# 651 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
HAL_StatusTypeDef HAL_SAI_InitProtocol(SAI_HandleTypeDef *hsai, uint32_t protocol, uint32_t datasize, uint32_t nbslot);
HAL_StatusTypeDef HAL_SAI_Init(SAI_HandleTypeDef *hsai);
HAL_StatusTypeDef HAL_SAI_DeInit (SAI_HandleTypeDef *hsai);
void HAL_SAI_MspInit(SAI_HandleTypeDef *hsai);
void HAL_SAI_MspDeInit(SAI_HandleTypeDef *hsai);
# 667 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
HAL_StatusTypeDef HAL_SAI_Transmit(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_SAI_Receive(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size, uint32_t Timeout);


HAL_StatusTypeDef HAL_SAI_Transmit_IT(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_SAI_Receive_IT(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size);


HAL_StatusTypeDef HAL_SAI_Transmit_DMA(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_SAI_Receive_DMA(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_SAI_DMAPause(SAI_HandleTypeDef *hsai);
HAL_StatusTypeDef HAL_SAI_DMAResume(SAI_HandleTypeDef *hsai);
HAL_StatusTypeDef HAL_SAI_DMAStop(SAI_HandleTypeDef *hsai);


HAL_StatusTypeDef HAL_SAI_Abort(SAI_HandleTypeDef *hsai);


HAL_StatusTypeDef HAL_SAI_EnableTxMuteMode(SAI_HandleTypeDef *hsai, uint16_t val);
HAL_StatusTypeDef HAL_SAI_DisableTxMuteMode(SAI_HandleTypeDef *hsai);
HAL_StatusTypeDef HAL_SAI_EnableRxMuteMode(SAI_HandleTypeDef *hsai, SAIcallback callback, uint16_t counter);
HAL_StatusTypeDef HAL_SAI_DisableRxMuteMode(SAI_HandleTypeDef *hsai);


void HAL_SAI_IRQHandler(SAI_HandleTypeDef *hsai);
void HAL_SAI_TxHalfCpltCallback(SAI_HandleTypeDef *hsai);
void HAL_SAI_TxCpltCallback(SAI_HandleTypeDef *hsai);
void HAL_SAI_RxHalfCpltCallback(SAI_HandleTypeDef *hsai);
void HAL_SAI_RxCpltCallback(SAI_HandleTypeDef *hsai);
void HAL_SAI_ErrorCallback(SAI_HandleTypeDef *hsai);
# 705 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
HAL_SAI_StateTypeDef HAL_SAI_GetState(SAI_HandleTypeDef *hsai);
uint32_t HAL_SAI_GetError(SAI_HandleTypeDef *hsai);
# 351 "../Inc\\stm32f7xx_hal_conf.h" 2
# 366 "../Inc\\stm32f7xx_hal_conf.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
typedef struct
{
  uint32_t Prescaler;


  uint32_t CounterMode;


  uint32_t Period;



  uint32_t ClockDivision;


  uint32_t RepetitionCounter;
# 87 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
  uint32_t AutoReloadPreload;


} TIM_Base_InitTypeDef;





typedef struct
{
  uint32_t OCMode;


  uint32_t Pulse;


  uint32_t OCPolarity;


  uint32_t OCNPolarity;



  uint32_t OCFastMode;




  uint32_t OCIdleState;



  uint32_t OCNIdleState;


} TIM_OC_InitTypeDef;




typedef struct
{
  uint32_t OCMode;


  uint32_t Pulse;


  uint32_t OCPolarity;


  uint32_t OCNPolarity;



  uint32_t OCIdleState;



  uint32_t OCNIdleState;



  uint32_t ICPolarity;


  uint32_t ICSelection;


  uint32_t ICFilter;

} TIM_OnePulse_InitTypeDef;






typedef struct
{
  uint32_t ICPolarity;


  uint32_t ICSelection;


  uint32_t ICPrescaler;


  uint32_t ICFilter;

} TIM_IC_InitTypeDef;





typedef struct
{
  uint32_t EncoderMode;


  uint32_t IC1Polarity;


  uint32_t IC1Selection;


  uint32_t IC1Prescaler;


  uint32_t IC1Filter;


  uint32_t IC2Polarity;


  uint32_t IC2Selection;


  uint32_t IC2Prescaler;


  uint32_t IC2Filter;

} TIM_Encoder_InitTypeDef;




typedef struct
{
  uint32_t ClockSource;

  uint32_t ClockPolarity;

  uint32_t ClockPrescaler;

  uint32_t ClockFilter;

}TIM_ClockConfigTypeDef;




typedef struct
{
  uint32_t ClearInputState;

  uint32_t ClearInputSource;

  uint32_t ClearInputPolarity;

  uint32_t ClearInputPrescaler;

  uint32_t ClearInputFilter;

}TIM_ClearInputConfigTypeDef;




typedef struct {
  uint32_t SlaveMode;

  uint32_t InputTrigger;

  uint32_t TriggerPolarity;

  uint32_t TriggerPrescaler;

  uint32_t TriggerFilter;


}TIM_SlaveConfigTypeDef;




typedef enum
{
  HAL_TIM_STATE_RESET = 0x00U,
  HAL_TIM_STATE_READY = 0x01U,
  HAL_TIM_STATE_BUSY = 0x02U,
  HAL_TIM_STATE_TIMEOUT = 0x03U,
  HAL_TIM_STATE_ERROR = 0x04U
}HAL_TIM_StateTypeDef;




typedef enum
{
  HAL_TIM_ACTIVE_CHANNEL_1 = 0x01U,
  HAL_TIM_ACTIVE_CHANNEL_2 = 0x02U,
  HAL_TIM_ACTIVE_CHANNEL_3 = 0x04U,
  HAL_TIM_ACTIVE_CHANNEL_4 = 0x08U,
  HAL_TIM_ACTIVE_CHANNEL_CLEARED = 0x00U
}HAL_TIM_ActiveChannel;




typedef struct
{
  TIM_TypeDef *Instance;
  TIM_Base_InitTypeDef Init;
  HAL_TIM_ActiveChannel Channel;
  DMA_HandleTypeDef *hdma[7];

  HAL_LockTypeDef Lock;
  volatile HAL_TIM_StateTypeDef State;
}TIM_HandleTypeDef;
# 1075 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
typedef struct
{

  uint32_t IC1Polarity;


  uint32_t IC1Prescaler;


  uint32_t IC1Filter;

  uint32_t Commutation_Delay;

} TIM_HallSensor_InitTypeDef;




typedef struct {
  uint32_t MasterOutputTrigger;

  uint32_t MasterOutputTrigger2;

  uint32_t MasterSlaveMode;

}TIM_MasterConfigTypeDef;






typedef struct
{
  uint32_t OffStateRunMode;

  uint32_t OffStateIDLEMode;

  uint32_t LockLevel;

  uint32_t DeadTime;

  uint32_t BreakState;

  uint32_t BreakPolarity;

  uint32_t BreakFilter;

  uint32_t Break2State;

  uint32_t Break2Polarity;

  uint32_t Break2Filter;

  uint32_t AutomaticOutput;

} TIM_BreakDeadTimeConfigTypeDef;
# 423 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Init(TIM_HandleTypeDef* htim, TIM_HallSensor_InitTypeDef* sConfig);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_DeInit(TIM_HandleTypeDef* htim);

void HAL_TIMEx_HallSensor_MspInit(TIM_HandleTypeDef* htim);
void HAL_TIMEx_HallSensor_MspDeInit(TIM_HandleTypeDef* htim);


HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start(TIM_HandleTypeDef* htim);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop(TIM_HandleTypeDef* htim);

HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start_IT(TIM_HandleTypeDef* htim);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop_IT(TIM_HandleTypeDef* htim);

HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start_DMA(TIM_HandleTypeDef* htim, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop_DMA(TIM_HandleTypeDef* htim);
# 447 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
HAL_StatusTypeDef HAL_TIMEx_OCN_Start(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_OCN_Stop(TIM_HandleTypeDef* htim, uint32_t Channel);


HAL_StatusTypeDef HAL_TIMEx_OCN_Start_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_OCN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t Channel);


HAL_StatusTypeDef HAL_TIMEx_OCN_Start_DMA(TIM_HandleTypeDef* htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIMEx_OCN_Stop_DMA(TIM_HandleTypeDef* htim, uint32_t Channel);
# 466 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
HAL_StatusTypeDef HAL_TIMEx_PWMN_Start(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop(TIM_HandleTypeDef* htim, uint32_t Channel);


HAL_StatusTypeDef HAL_TIMEx_PWMN_Start_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIMEx_PWMN_Start_DMA(TIM_HandleTypeDef* htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop_DMA(TIM_HandleTypeDef* htim, uint32_t Channel);
# 484 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Start(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Stop(TIM_HandleTypeDef* htim, uint32_t OutputChannel);


HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Start_IT(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
# 498 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent(TIM_HandleTypeDef* htim, uint32_t InputTrigger, uint32_t CommutationSource);
HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent_IT(TIM_HandleTypeDef* htim, uint32_t InputTrigger, uint32_t CommutationSource);
HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent_DMA(TIM_HandleTypeDef* htim, uint32_t InputTrigger, uint32_t CommutationSource);
HAL_StatusTypeDef HAL_TIMEx_MasterConfigSynchronization(TIM_HandleTypeDef* htim, TIM_MasterConfigTypeDef * sMasterConfig);
HAL_StatusTypeDef HAL_TIMEx_ConfigBreakDeadTime(TIM_HandleTypeDef* htim, TIM_BreakDeadTimeConfigTypeDef *sBreakDeadTimeConfig);



HAL_StatusTypeDef HAL_TIMEx_RemapConfig(TIM_HandleTypeDef* htim, uint32_t Remap);
HAL_StatusTypeDef HAL_TIMEx_GroupChannel5(TIM_HandleTypeDef *htim, uint32_t OCRef);
# 516 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
void HAL_TIMEx_CommutationCallback(TIM_HandleTypeDef* htim);
void HAL_TIMEx_BreakCallback(TIM_HandleTypeDef* htim);
void TIMEx_DMACommutationCplt(DMA_HandleTypeDef *hdma);
# 527 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
HAL_TIM_StateTypeDef HAL_TIMEx_HallSensor_GetState(TIM_HandleTypeDef* htim);
# 1076 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h" 2
# 1087 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_Base_Init(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_Base_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_Base_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_Base_MspDeInit(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_Base_Start(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_Base_Stop(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_Base_Start_IT(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_Base_Stop_IT(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_Base_Start_DMA(TIM_HandleTypeDef *htim, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_Base_Stop_DMA(TIM_HandleTypeDef *htim);
# 1108 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_OC_Init(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_OC_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_OC_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_OC_MspDeInit(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_OC_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_OC_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_OC_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_OC_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_OC_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_OC_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);
# 1130 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_PWM_Init(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_PWM_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_PWM_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_PWM_MspDeInit(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_PWM_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_PWM_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_PWM_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_PWM_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_PWM_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_PWM_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);
# 1152 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_IC_Init(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_IC_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_IC_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_IC_MspDeInit(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_IC_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_IC_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_IC_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_IC_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_IC_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_IC_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);
# 1174 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_OnePulse_Init(TIM_HandleTypeDef *htim, uint32_t OnePulseMode);
HAL_StatusTypeDef HAL_TIM_OnePulse_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_OnePulse_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_OnePulse_MspDeInit(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_OnePulse_Start(TIM_HandleTypeDef *htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIM_OnePulse_Stop(TIM_HandleTypeDef *htim, uint32_t OutputChannel);


HAL_StatusTypeDef HAL_TIM_OnePulse_Start_IT(TIM_HandleTypeDef *htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIM_OnePulse_Stop_IT(TIM_HandleTypeDef *htim, uint32_t OutputChannel);
# 1194 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_Encoder_Init(TIM_HandleTypeDef *htim, TIM_Encoder_InitTypeDef* sConfig);
HAL_StatusTypeDef HAL_TIM_Encoder_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_Encoder_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_Encoder_MspDeInit(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_Encoder_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_Encoder_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_Encoder_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_Encoder_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_Encoder_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData1, uint32_t *pData2, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_Encoder_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);
# 1216 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
void HAL_TIM_IRQHandler(TIM_HandleTypeDef *htim);
# 1226 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_OC_ConfigChannel(TIM_HandleTypeDef *htim, TIM_OC_InitTypeDef* sConfig, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_PWM_ConfigChannel(TIM_HandleTypeDef *htim, TIM_OC_InitTypeDef* sConfig, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_IC_ConfigChannel(TIM_HandleTypeDef *htim, TIM_IC_InitTypeDef* sConfig, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_OnePulse_ConfigChannel(TIM_HandleTypeDef *htim, TIM_OnePulse_InitTypeDef* sConfig, uint32_t OutputChannel, uint32_t InputChannel);
HAL_StatusTypeDef HAL_TIM_ConfigOCrefClear(TIM_HandleTypeDef *htim, TIM_ClearInputConfigTypeDef * sClearInputConfig, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_ConfigClockSource(TIM_HandleTypeDef *htim, TIM_ClockConfigTypeDef * sClockSourceConfig);
HAL_StatusTypeDef HAL_TIM_ConfigTI1Input(TIM_HandleTypeDef *htim, uint32_t TI1_Selection);
HAL_StatusTypeDef HAL_TIM_SlaveConfigSynchronization(TIM_HandleTypeDef *htim, TIM_SlaveConfigTypeDef * sSlaveConfig);
HAL_StatusTypeDef HAL_TIM_SlaveConfigSynchronization_IT(TIM_HandleTypeDef *htim, TIM_SlaveConfigTypeDef * sSlaveConfig);
HAL_StatusTypeDef HAL_TIM_DMABurst_WriteStart(TIM_HandleTypeDef *htim, uint32_t BurstBaseAddress, uint32_t BurstRequestSrc, uint32_t *BurstBuffer, uint32_t BurstLength);

HAL_StatusTypeDef HAL_TIM_DMABurst_WriteStop(TIM_HandleTypeDef *htim, uint32_t BurstRequestSrc);
HAL_StatusTypeDef HAL_TIM_DMABurst_ReadStart(TIM_HandleTypeDef *htim, uint32_t BurstBaseAddress, uint32_t BurstRequestSrc, uint32_t *BurstBuffer, uint32_t BurstLength);

HAL_StatusTypeDef HAL_TIM_DMABurst_ReadStop(TIM_HandleTypeDef *htim, uint32_t BurstRequestSrc);
HAL_StatusTypeDef HAL_TIM_GenerateEvent(TIM_HandleTypeDef *htim, uint32_t EventSource);
uint32_t HAL_TIM_ReadCapturedValue(TIM_HandleTypeDef *htim, uint32_t Channel);
# 1252 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_OC_DelayElapsedCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_IC_CaptureCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_PWM_PulseFinishedCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_TriggerCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_ErrorCallback(TIM_HandleTypeDef *htim);
# 1267 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_TIM_StateTypeDef HAL_TIM_Base_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_OC_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_PWM_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_IC_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_OnePulse_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_Encoder_GetState(TIM_HandleTypeDef *htim);
# 1531 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
void TIM_Base_SetConfig(TIM_TypeDef *TIMx, TIM_Base_InitTypeDef *Structure);
void TIM_TI1_SetConfig(TIM_TypeDef *TIMx, uint32_t TIM_ICPolarity, uint32_t TIM_ICSelection, uint32_t TIM_ICFilter);
void TIM_OC1_SetConfig(TIM_TypeDef *TIMx, TIM_OC_InitTypeDef *OC_Config);
void TIM_OC2_SetConfig(TIM_TypeDef *TIMx, TIM_OC_InitTypeDef *OC_Config);
void TIM_OC3_SetConfig(TIM_TypeDef *TIMx, TIM_OC_InitTypeDef *OC_Config);
void TIM_OC4_SetConfig(TIM_TypeDef *TIMx, TIM_OC_InitTypeDef *OC_Config);
void TIM_ETR_SetConfig(TIM_TypeDef* TIMx, uint32_t TIM_ExtTRGPrescaler, uint32_t TIM_ExtTRGPolarity, uint32_t ExtTRGFilter);

void TIM_DMADelayPulseCplt(DMA_HandleTypeDef *hdma);
void TIM_DMAError(DMA_HandleTypeDef *hdma);
void TIM_DMACaptureCplt(DMA_HandleTypeDef *hdma);
void TIM_CCxChannelCmd(TIM_TypeDef* TIMx, uint32_t Channel, uint32_t ChannelState);
# 367 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
typedef struct
{
  uint32_t BaudRate;
# 74 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
  uint32_t WordLength;


  uint32_t StopBits;


  uint32_t Parity;






  uint32_t Mode;


  uint32_t HwFlowCtl;



  uint32_t OverSampling;


  uint32_t OneBitSampling;


}UART_InitTypeDef;




typedef struct
{
  uint32_t AdvFeatureInit;



  uint32_t TxPinLevelInvert;


  uint32_t RxPinLevelInvert;


  uint32_t DataInvert;



  uint32_t Swap;


  uint32_t OverrunDisable;


  uint32_t DMADisableonRxError;


  uint32_t AutoBaudRateEnable;


  uint32_t AutoBaudRateMode;



  uint32_t MSBFirst;

} UART_AdvFeatureInitTypeDef;
# 182 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
typedef enum
{
  HAL_UART_STATE_RESET = 0x00U,

  HAL_UART_STATE_READY = 0x20U,

  HAL_UART_STATE_BUSY = 0x24U,

  HAL_UART_STATE_BUSY_TX = 0x21U,

  HAL_UART_STATE_BUSY_RX = 0x22U,

  HAL_UART_STATE_BUSY_TX_RX = 0x23U,


  HAL_UART_STATE_TIMEOUT = 0xA0U,

  HAL_UART_STATE_ERROR = 0xE0U

}HAL_UART_StateTypeDef;




typedef enum
{
  UART_CLOCKSOURCE_PCLK1 = 0x00U,
  UART_CLOCKSOURCE_PCLK2 = 0x01U,
  UART_CLOCKSOURCE_HSI = 0x02U,
  UART_CLOCKSOURCE_SYSCLK = 0x04U,
  UART_CLOCKSOURCE_LSE = 0x08U,
  UART_CLOCKSOURCE_UNDEFINED = 0x10U
}UART_ClockSourceTypeDef;




typedef struct
{
  USART_TypeDef *Instance;

  UART_InitTypeDef Init;

  UART_AdvFeatureInitTypeDef AdvancedInit;

  uint8_t *pTxBuffPtr;

  uint16_t TxXferSize;

  volatile uint16_t TxXferCount;

  uint8_t *pRxBuffPtr;

  uint16_t RxXferSize;

  volatile uint16_t RxXferCount;

  uint16_t Mask;

  DMA_HandleTypeDef *hdmatx;

  DMA_HandleTypeDef *hdmarx;

  HAL_LockTypeDef Lock;

  volatile HAL_UART_StateTypeDef gState;



  volatile HAL_UART_StateTypeDef RxState;


  volatile uint32_t ErrorCode;

}UART_HandleTypeDef;
# 1108 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart_ex.h" 1
# 328 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart_ex.h"
HAL_StatusTypeDef HAL_RS485Ex_Init(UART_HandleTypeDef *huart, uint32_t Polarity, uint32_t AssertionTime, uint32_t DeassertionTime);
# 343 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart_ex.h"
HAL_StatusTypeDef HAL_MultiProcessorEx_AddressLength_Set(UART_HandleTypeDef *huart, uint32_t AddressLength);
# 1109 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h" 2
# 1119 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
HAL_StatusTypeDef HAL_UART_Init(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_HalfDuplex_Init(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_LIN_Init(UART_HandleTypeDef *huart, uint32_t BreakDetectLength);
HAL_StatusTypeDef HAL_MultiProcessor_Init(UART_HandleTypeDef *huart, uint8_t Address, uint32_t WakeUpMethod);
HAL_StatusTypeDef HAL_RS485Ex_Init(UART_HandleTypeDef *huart, uint32_t Polarity, uint32_t AssertionTime, uint32_t DeassertionTime);
HAL_StatusTypeDef HAL_UART_DeInit (UART_HandleTypeDef *huart);
void HAL_UART_MspInit(UART_HandleTypeDef *huart);
void HAL_UART_MspDeInit(UART_HandleTypeDef *huart);
# 1137 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
HAL_StatusTypeDef HAL_UART_Transmit(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_UART_Receive(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_UART_Transmit_IT(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_UART_Receive_IT(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_UART_Transmit_DMA(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_UART_Receive_DMA(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_UART_DMAPause(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_UART_DMAResume(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_UART_DMAStop(UART_HandleTypeDef *huart);

void HAL_UART_IRQHandler(UART_HandleTypeDef *huart);
void HAL_UART_TxHalfCpltCallback(UART_HandleTypeDef *huart);
void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart);
void HAL_UART_RxHalfCpltCallback(UART_HandleTypeDef *huart);
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart);
void HAL_UART_ErrorCallback(UART_HandleTypeDef *huart);
# 1163 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
HAL_StatusTypeDef HAL_LIN_SendBreak(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_MultiProcessorEx_AddressLength_Set(UART_HandleTypeDef *huart, uint32_t AddressLength);
HAL_StatusTypeDef HAL_MultiProcessor_EnableMuteMode(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_MultiProcessor_DisableMuteMode(UART_HandleTypeDef *huart);
void HAL_MultiProcessor_EnterMuteMode(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_HalfDuplex_EnableTransmitter(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_HalfDuplex_EnableReceiver(UART_HandleTypeDef *huart);
# 1180 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
HAL_UART_StateTypeDef HAL_UART_GetState(UART_HandleTypeDef *huart);
uint32_t HAL_UART_GetError(UART_HandleTypeDef *huart);
# 1196 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
HAL_StatusTypeDef UART_SetConfig(UART_HandleTypeDef *huart);
HAL_StatusTypeDef UART_CheckIdleState(UART_HandleTypeDef *huart);
HAL_StatusTypeDef UART_WaitOnFlagUntilTimeout(UART_HandleTypeDef *huart, uint32_t Flag, FlagStatus Status, uint32_t Tickstart, uint32_t Timeout);
void UART_AdvFeatureConfig(UART_HandleTypeDef *huart);
# 371 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h"
typedef struct
{
  uint32_t BaudRate;



  uint32_t WordLength;


  uint32_t StopBits;


  uint32_t Parity;






  uint32_t Mode;


  uint32_t OverSampling;


  uint32_t CLKPolarity;


  uint32_t CLKPhase;


  uint32_t CLKLastBit;


}USART_InitTypeDef;




typedef enum
{
  HAL_USART_STATE_RESET = 0x00U,
  HAL_USART_STATE_READY = 0x01U,
  HAL_USART_STATE_BUSY = 0x02U,
  HAL_USART_STATE_BUSY_TX = 0x12U,
  HAL_USART_STATE_BUSY_RX = 0x22U,
  HAL_USART_STATE_BUSY_TX_RX = 0x32U,
  HAL_USART_STATE_TIMEOUT = 0x03U,
  HAL_USART_STATE_ERROR = 0x04U
}HAL_USART_StateTypeDef;





typedef enum
{
  USART_CLOCKSOURCE_PCLK1 = 0x00U,
  USART_CLOCKSOURCE_PCLK2 = 0x01U,
  USART_CLOCKSOURCE_HSI = 0x02U,
  USART_CLOCKSOURCE_SYSCLK = 0x04U,
  USART_CLOCKSOURCE_LSE = 0x08U,
  USART_CLOCKSOURCE_UNDEFINED = 0x10U
}USART_ClockSourceTypeDef;





typedef struct
{
  USART_TypeDef *Instance;

  USART_InitTypeDef Init;

  uint8_t *pTxBuffPtr;

  uint16_t TxXferSize;

  volatile uint16_t TxXferCount;

  uint8_t *pRxBuffPtr;

  uint16_t RxXferSize;

  volatile uint16_t RxXferCount;

  uint16_t Mask;

  DMA_HandleTypeDef *hdmatx;

  DMA_HandleTypeDef *hdmarx;

  HAL_LockTypeDef Lock;

  HAL_USART_StateTypeDef State;

  volatile uint32_t ErrorCode;

}USART_HandleTypeDef;
# 478 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_usart_ex.h" 1
# 479 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h" 2
# 489 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h"
HAL_StatusTypeDef HAL_USART_Init(USART_HandleTypeDef *husart);
HAL_StatusTypeDef HAL_USART_DeInit(USART_HandleTypeDef *husart);
void HAL_USART_MspInit(USART_HandleTypeDef *husart);
void HAL_USART_MspDeInit(USART_HandleTypeDef *husart);
HAL_StatusTypeDef HAL_USART_CheckIdleState(USART_HandleTypeDef *husart);
# 502 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h"
HAL_StatusTypeDef HAL_USART_Transmit(USART_HandleTypeDef *husart, uint8_t *pTxData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_USART_Receive(USART_HandleTypeDef *husart, uint8_t *pRxData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_USART_TransmitReceive(USART_HandleTypeDef *husart, uint8_t *pTxData, uint8_t *pRxData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_USART_Transmit_IT(USART_HandleTypeDef *husart, uint8_t *pTxData, uint16_t Size);
HAL_StatusTypeDef HAL_USART_Receive_IT(USART_HandleTypeDef *husart, uint8_t *pRxData, uint16_t Size);
HAL_StatusTypeDef HAL_USART_TransmitReceive_IT(USART_HandleTypeDef *husart, uint8_t *pTxData, uint8_t *pRxData, uint16_t Size);
HAL_StatusTypeDef HAL_USART_Transmit_DMA(USART_HandleTypeDef *husart, uint8_t *pTxData, uint16_t Size);
HAL_StatusTypeDef HAL_USART_Receive_DMA(USART_HandleTypeDef *husart, uint8_t *pRxData, uint16_t Size);
HAL_StatusTypeDef HAL_USART_TransmitReceive_DMA(USART_HandleTypeDef *husart, uint8_t *pTxData, uint8_t *pRxData, uint16_t Size);
HAL_StatusTypeDef HAL_USART_DMAPause(USART_HandleTypeDef *husart);
HAL_StatusTypeDef HAL_USART_DMAResume(USART_HandleTypeDef *husart);
HAL_StatusTypeDef HAL_USART_DMAStop(USART_HandleTypeDef *husart);
void HAL_USART_IRQHandler(USART_HandleTypeDef *husart);
void HAL_USART_TxHalfCpltCallback(USART_HandleTypeDef *husart);
void HAL_USART_TxCpltCallback(USART_HandleTypeDef *husart);
void HAL_USART_RxCpltCallback(USART_HandleTypeDef *husart);
void HAL_USART_RxHalfCpltCallback(USART_HandleTypeDef *husart);
void HAL_USART_TxRxCpltCallback(USART_HandleTypeDef *husart);
void HAL_USART_ErrorCallback(USART_HandleTypeDef *husart);
# 530 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h"
HAL_USART_StateTypeDef HAL_USART_GetState(USART_HandleTypeDef *husart);
uint32_t HAL_USART_GetError(USART_HandleTypeDef *husart);
# 375 "../Inc\\stm32f7xx_hal_conf.h" 2
# 47 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal.h" 2
# 178 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal.h"
HAL_StatusTypeDef HAL_Init(void);
HAL_StatusTypeDef HAL_DeInit(void);
void HAL_MspInit(void);
void HAL_MspDeInit(void);
HAL_StatusTypeDef HAL_InitTick (uint32_t TickPriority);
# 191 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal.h"
void HAL_IncTick(void);
void HAL_Delay(volatile uint32_t Delay);
uint32_t HAL_GetTick(void);
void HAL_SuspendTick(void);
void HAL_ResumeTick(void);
uint32_t HAL_GetHalVersion(void);
uint32_t HAL_GetREVID(void);
uint32_t HAL_GetDEVID(void);
uint32_t HAL_GetUIDw0(void);
uint32_t HAL_GetUIDw1(void);
uint32_t HAL_GetUIDw2(void);
void HAL_DBGMCU_EnableDBGSleepMode(void);
void HAL_DBGMCU_DisableDBGSleepMode(void);
void HAL_DBGMCU_EnableDBGStopMode(void);
void HAL_DBGMCU_DisableDBGStopMode(void);
void HAL_DBGMCU_EnableDBGStandbyMode(void);
void HAL_DBGMCU_DisableDBGStandbyMode(void);
void HAL_EnableCompensationCell(void);
void HAL_DisableCompensationCell(void);
void HAL_EnableFMCMemorySwapping(void);
void HAL_DisableFMCMemorySwapping(void);
# 212 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include\\stm32f7xx.h" 2
# 19 "../Inc\\main.h" 2



extern UART_HandleTypeDef huart2;
extern TIM_HandleTypeDef htim3;
extern RTC_HandleTypeDef hrtc;
extern RTC_TimeTypeDef time;
extern RTC_DateTypeDef date;
extern LTDC_HandleTypeDef hltdc;
extern DMA2D_HandleTypeDef hdma2d;

typedef struct
{
 uint8_t seconds;
 uint16_t subseconds;
 uint8_t minutes;
 uint8_t hours;
 uint8_t day;
 uint8_t date;
 uint8_t month;
 uint8_t year;
 uint32_t unix;

} RTC_t;
# 64 "../Inc\\main.h"
extern uint16_t ntc_temperature;
extern uint8_t GUI_Initialized;
extern volatile uint32_t SystickCnt;
extern uint32_t triac_on_time;

void Error_Handler(void);
uint32_t RTC_GetUnixTimeStamp(RTC_t* data);
void RTC_GetDateTimeFromUnix(RTC_t* data, uint32_t unix);
void RTC_GetDateTime(RTC_t* data, uint32_t format);
void FAN_SetSpeed(uint8_t fan_speed);
# 18 "../Src/display.c" 2
# 1 "../Inc\\display.h" 1
# 23 "../Inc\\display.h"
typedef enum
{
 DISPLAY_INIT,
 DISPLAY_THERMOSTAT,
 DISPLAY_FORECAST,
 DISPLAY_ALARM_CLOCK

}eActivDisplayTypeDef;

typedef enum
{
 RELEASED = 0,
 PRESSED

}BUTTON_StateTypeDef;


typedef union
{
 uint8_t forecast[5];

 struct{
  uint8_t week_day;
  uint8_t low_temp;
  uint8_t high_temp;
  uint8_t humidity;
  uint8_t cloudness;
 }para;

}FORECAST_DayTypeDef;

extern eActivDisplayTypeDef ActivDisplay;
extern FORECAST_DayTypeDef FORECAST_Monday;
extern FORECAST_DayTypeDef FORECAST_Tuesday;
extern FORECAST_DayTypeDef FORECAST_Wednesday;
extern FORECAST_DayTypeDef FORECAST_Thurstday;
extern FORECAST_DayTypeDef FORECAST_Freeday;
extern FORECAST_DayTypeDef FORECAST_Saturday;
extern FORECAST_DayTypeDef FORECAST_Sunday;
# 92 "../Inc\\display.h"
extern uint32_t display_flags;
extern volatile uint32_t display_timer;
extern volatile uint32_t display_knob_timer;
extern volatile uint32_t display_date_time_timer;
extern volatile uint32_t display_doorbell_animation_timer;
extern uint8_t display_buffer[32];
extern uint8_t current_outdoor_temperature;
# 146 "../Inc\\display.h"
void DISPLAY_Init(void);
void DISPLAY_Service(void);
void BUTTON_SetNewState(uint16_t button_id, BUTTON_StateTypeDef new_state);
BUTTON_StateTypeDef BUTTON_GetState(uint16_t button_id);
# 19 "../Src/display.c" 2
# 1 "../Inc\\Resource.h" 1
# 26 "../Inc\\Resource.h"
# 1 "../Middlewares/ST/STemWin/inc\\GUI.h" 1
# 56 "../Middlewares/ST/STemWin/inc\\GUI.h"
# 1 "../Middlewares/ST/STemWin/inc/GUI_ConfDefaults.h" 1
# 60 "../Middlewares/ST/STemWin/inc/GUI_ConfDefaults.h"
# 1 "../Inc\\GUIConf.h" 1
# 61 "../Middlewares/ST/STemWin/inc/GUI_ConfDefaults.h" 2
# 57 "../Middlewares/ST/STemWin/inc\\GUI.h" 2
# 1 "../Middlewares/ST/STemWin/inc/GUI_Type.h" 1
# 60 "../Middlewares/ST/STemWin/inc/GUI_Type.h"
# 1 "../Middlewares/ST/STemWin/inc/LCD.h" 1
# 57 "../Middlewares/ST/STemWin/inc/LCD.h"
# 1 "../Middlewares/ST/STemWin/inc/Global.h" 1
# 58 "../Middlewares/ST/STemWin/inc/LCD.h" 2
# 113 "../Middlewares/ST/STemWin/inc/LCD.h"
typedef int LCD_DRAWMODE;
typedef unsigned long LCD_COLOR;





typedef struct { signed short x,y; } GUI_POINT;
typedef struct { signed short x0,y0,x1,y1; } LCD_RECT;

typedef struct {
  int NumEntries;
  char HasTrans;
  const LCD_COLOR * pPalEntries;
} LCD_LOGPALETTE;


typedef struct {
  int x,y;
  unsigned char KeyStat;
} LCD_tMouseState;

typedef struct {
  int NumEntries;
  const LCD_COLOR * pPalEntries;
} LCD_PHYSPALETTE;





typedef LCD_COLOR tLCDDEV_Index2Color (unsigned long Index);
typedef unsigned long tLCDDEV_Color2Index (LCD_COLOR Color);
typedef unsigned long tLCDDEV_GetIndexMask (void);

typedef void tLCDDEV_Index2ColorBulk(void * pIndex, LCD_COLOR * pColor, unsigned long NumItems, unsigned char SizeOfIndex);
typedef void tLCDDEV_Color2IndexBulk(LCD_COLOR * pColor, void * pIndex, unsigned long NumItems, unsigned char SizeOfIndex);





typedef struct
{
 tLCDDEV_Color2Index * pfColor2Index;
 tLCDDEV_Index2Color * pfIndex2Color;
 tLCDDEV_GetIndexMask * pfGetIndexMask;
 int NoAlpha;
 tLCDDEV_Color2IndexBulk * pfColor2IndexBulk;
 tLCDDEV_Index2ColorBulk * pfIndex2ColorBulk;

} LCD_API_COLOR_CONV;

extern const LCD_API_COLOR_CONV LCD_API_ColorConv_0;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1_2;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1_4;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1_5;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1_8;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1_16;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1_24;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_2;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_4;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_5;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_6;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_8;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_16;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1616I;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_111;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_222;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_233;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_323;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_332;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_444_12;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_444_12_1;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_444_16;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_555;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_565;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_556;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_655;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_666;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_666_9;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_822216;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_84444;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_8666;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_8666_1;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_88666I;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_888;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_8888;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M111;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M1555I;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M222;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M233;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M323;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M332;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M4444I;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M444_12;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M444_12_1;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M444_16;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M555;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M565;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M556;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M655;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M666;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M666_9;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M8565;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M888;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M8888;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M8888I;
# 280 "../Middlewares/ST/STemWin/inc/LCD.h"
void GUICC_M1555I_SetCustColorConv(tLCDDEV_Color2IndexBulk * pfColor2IndexBulk, tLCDDEV_Index2ColorBulk * pfIndex2ColorBulk);
void GUICC_M565_SetCustColorConv (tLCDDEV_Color2IndexBulk * pfColor2IndexBulk, tLCDDEV_Index2ColorBulk * pfIndex2ColorBulk);
void GUICC_M4444I_SetCustColorConv(tLCDDEV_Color2IndexBulk * pfColor2IndexBulk, tLCDDEV_Index2ColorBulk * pfIndex2ColorBulk);
void GUICC_M888_SetCustColorConv (tLCDDEV_Color2IndexBulk * pfColor2IndexBulk, tLCDDEV_Index2ColorBulk * pfIndex2ColorBulk);
void GUICC_M8888I_SetCustColorConv(tLCDDEV_Color2IndexBulk * pfColor2IndexBulk, tLCDDEV_Index2ColorBulk * pfIndex2ColorBulk);
# 311 "../Middlewares/ST/STemWin/inc/LCD.h"
typedef void tLCDDEV_DrawPixel (int x, int y);
typedef void tLCDDEV_DrawHLine (int x0, int y0, int x1);
typedef void tLCDDEV_DrawVLine (int x , int y0, int y1);
typedef void tLCDDEV_FillRect (int x0, int y0, int x1, int y1);
typedef unsigned int tLCDDEV_GetPixelIndex(int x, int y);
typedef void tLCDDEV_SetPixelIndex(int x, int y, int ColorIndex);
typedef void tLCDDEV_XorPixel (int x, int y);
typedef void tLCDDEV_FillPolygon (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
typedef void tLCDDEV_FillPolygonAA(const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
typedef void tLCDDEV_GetRect (LCD_RECT * pRect);
typedef int tLCDDEV_Init (void);
typedef void tLCDDEV_On (void);
typedef void tLCDDEV_Off (void);
typedef void tLCDDEV_SetLUTEntry (unsigned char Pos, LCD_COLOR color);
typedef void * tLCDDEV_GetDevFunc (int Index);
typedef signed long tLCDDEV_GetDevProp (int Index);
typedef void tLCDDEV_SetOrg (int x, int y);





typedef struct GUI_DEVICE GUI_DEVICE;
typedef struct GUI_DEVICE_API GUI_DEVICE_API;

typedef void tLCDDEV_DrawBitmap (int x0, int y0, int xsize, int ysize,
                       int BitsPerPixel, int BytesPerLine,
                       const unsigned char * pData, int Diff,
                       const void * pTrans);
# 376 "../Middlewares/ST/STemWin/inc/LCD.h"
int LCD_GetXSizeMax(void);
int LCD_GetYSizeMax(void);
int LCD_GetVXSizeMax(void);
int LCD_GetVYSizeMax(void);
int LCD_GetBitsPerPixelMax(void);
void LCD_SetDisplaySize(int xSizeDisplay, int ySizeDisplay);
int LCD_GetXSizeDisplay(void);
int LCD_GetYSizeDisplay(void);

int LCD_GetXSizeEx (int LayerIndex);
int LCD_GetYSizeEx (int LayerIndex);
int LCD_GetVXSizeEx (int LayerIndex);
int LCD_GetVYSizeEx (int LayerIndex);
int LCD_GetBitsPerPixelEx (int LayerIndex);
unsigned long LCD_GetNumColorsEx (int LayerIndex);
int LCD_GetXMagEx (int LayerIndex);
int LCD_GetYMagEx (int LayerIndex);
int LCD_GetMirrorXEx (int LayerIndex);
int LCD_GetMirrorYEx (int LayerIndex);
int LCD_GetSwapXYEx (int LayerIndex);
int LCD_GetReversLUTEx (int LayerIndex);
int LCD_GetPhysColorsInRAMEx(int LayerIndex);

int LCD_GetXSize (void);
int LCD_GetYSize (void);
int LCD_GetVXSize (void);
int LCD_GetVYSize (void);
int LCD_GetBitsPerPixel (void);
unsigned long LCD_GetNumColors (void);
int LCD_GetXMag (void);
int LCD_GetYMag (void);
int LCD_GetMirrorX (void);
int LCD_GetMirrorY (void);
int LCD_GetSwapXY (void);
int LCD_GetReversLUT (void);
int LCD_GetPhysColorsInRAM (void);

signed long LCD__GetBPP (unsigned long IndexMask);
signed long LCD__GetBPPDevice(unsigned long IndexMask);

tLCDDEV_Index2Color * LCD_GetpfIndex2ColorEx(int LayerIndex);
tLCDDEV_Color2Index * LCD_GetpfColor2IndexEx(int LayerIndex);

tLCDDEV_Color2Index * LCD_GetpfColor2Index(void);

int LCD_GetNumLayers(void);

LCD_COLOR * LCD_GetPalette (void);
LCD_COLOR * LCD_GetPaletteEx(int LayerIndex);

void (* LCD_GetDevFunc(int LayerIndex, int Item))(void);
# 488 "../Middlewares/ST/STemWin/inc/LCD.h"
typedef struct {
  void * pVRAM;
} LCD_X_SETVRAMADDR_INFO;

typedef struct {
  int xPos, yPos;
} LCD_X_SETORG_INFO;

typedef struct {
  LCD_COLOR Color;
  unsigned char Pos;
} LCD_X_SETLUTENTRY_INFO;

typedef struct {
  int xSize, ySize;
} LCD_X_SETSIZE_INFO;

typedef struct {
  int xPos, yPos;
  int xLen, yLen;
  int BytesPerPixel;
  unsigned long Off;
} LCD_X_SETPOS_INFO;

typedef struct {
  int Alpha;
} LCD_X_SETALPHA_INFO;

typedef struct {
  int OnOff;
} LCD_X_SETVIS_INFO;

typedef struct {
  int AlphaMode;
} LCD_X_SETALPHAMODE_INFO;

typedef struct {
  int ChromaMode;
} LCD_X_SETCHROMAMODE_INFO;

typedef struct {
  LCD_COLOR ChromaMin;
  LCD_COLOR ChromaMax;
} LCD_X_SETCHROMA_INFO;

typedef struct {
  int Index;
} LCD_X_SHOWBUFFER_INFO;
# 556 "../Middlewares/ST/STemWin/inc/LCD.h"
int LCD_X_DisplayDriver(unsigned LayerIndex, unsigned Cmd, void * pData);
void LCD_X_Config(void);





int LCD_SetAlphaEx (int LayerIndex, int Alpha);
int LCD_SetPosEx (int LayerIndex, int xPos, int yPos);
int LCD_SetSizeEx (int LayerIndex, int xSize, int ySize);
int LCD_SetVisEx (int LayerIndex, int OnOff);
int LCD_SetVRAMAddrEx (int LayerIndex, void * pVRAM);
int LCD_SetVSizeEx (int LayerIndex, int xSize, int ySize);
int LCD_SetAlphaModeEx (int LayerIndex, int AlphaMode);
int LCD_SetChromaModeEx(int LayerIndex, int ChromaMode);
int LCD_SetChromaEx (int LayerIndex, LCD_COLOR ChromaMin, LCD_COLOR ChromaMax);

int LCD_SetAlpha (int Alpha);
int LCD_SetVRAMAddr (void * pVRAM);
int LCD_SetVSize (int xSize, int ySize);
int LCD_SetSize (int xSize, int ySize);
int LCD_SetVis (int OnOff);
int LCD_SetPos (int xPos, int yPos);
int LCD_SetAlphaMode (int AlphaMode);
int LCD_SetChromaMode(int ChromaMode);
int LCD_SetChroma (LCD_COLOR ChromaMin, LCD_COLOR ChromaMax);
int LCD_SetLUTEntry (unsigned char Pos, LCD_COLOR Color);
int LCD_SetDevFunc (int LayerIndex, int IdFunc, void (* pDriverFunc)(void));

void LCD_SetOrg(int xOrg, int yOrg);

int LCD_OnEx (int LayerIndex);
int LCD_OffEx(int LayerIndex);
int LCD_On (void);
int LCD_Off (void);





int LCD_GetPosEx(int LayerIndex, int * pxPos, int * pyPos);

int LCD_GetPos (int * pxPos, int * pyPos);





int LCD_Refresh (void);
int LCD_RefreshEx(int LayerIndex);





typedef struct {
  int (* pfStart) (int x0, int y0, int x1, int y1);
  void (* pfSetPixel)(unsigned long PixelIndex);
  void (* pfNextLine)(void);
  void (* pfEnd) (void);
} LCD_API_NEXT_PIXEL;

LCD_API_NEXT_PIXEL * LCD_GetNextPixelAPI(void);





typedef void tLCD_HL_DrawHLine (int x0, int y0, int x1);
typedef void tLCD_HL_DrawPixel (int x0, int y0);

typedef struct {
  tLCD_HL_DrawHLine * pfDrawHLine;
  tLCD_HL_DrawPixel * pfDrawPixel;
} tLCD_HL_APIList;

void LCD_DrawHLine(int x0, int y0, int x1);
void LCD_DrawPixel(int x0, int y0);
void LCD_DrawVLine(int x, int y0, int y1);






void LCD_SetClipRectEx(const LCD_RECT * pRect);
void LCD_SetClipRectMax(void);


signed long LCD_GetDevCap (int Index);
signed long LCD_GetDevCapEx(int LayerIndex, int Index);


int emWin_LCD_Init(void);
int LCD_InitColors(void);

void LCD_SetBkColor (LCD_COLOR Color);
void LCD_SetColor (LCD_COLOR Color);
void LCD_SetPixelIndex(int x, int y, int ColorIndex);


void LCD_InitLUT(void);
int LCD_SetLUTEntryEx(int LayerIndex, unsigned char Pos, LCD_COLOR Color);
void LCD_SetLUTEx(int LayerIndex, const LCD_PHYSPALETTE * pPalette);
void LCD_SetLUT (const LCD_PHYSPALETTE * pPalette);

LCD_DRAWMODE LCD_SetDrawMode (LCD_DRAWMODE dm);
void LCD_SetColorIndex(unsigned PixelIndex);
void LCD_SetBkColorIndex(unsigned PixelIndex);
void LCD_FillRect(int x0, int y0, int x1, int y1);
typedef void tLCD_SetPixelAA(int x, int y, unsigned char Intens);

void LCD_SetPixelAA4_Trans (int x, int y, unsigned char Intens);
void LCD_SetPixelAA4_NoTrans(int x, int y, unsigned char Intens);

void LCD_SetPixelAA8_Trans (int x, int y, unsigned char Intens);
void LCD_SetPixelAA8_NoTrans(int x, int y, unsigned char Intens);

void LCD_AA_EnableGamma(int OnOff);
void LCD_AA_SetGamma (unsigned char * pGamma);
void LCD_AA_GetGamma (unsigned char * pGamma);

LCD_COLOR LCD_AA_MixColors16 (LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);
LCD_COLOR LCD_AA_MixColors256(LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);
LCD_COLOR LCD_MixColors256 (LCD_COLOR Color, LCD_COLOR BkColor, unsigned Intens);
LCD_COLOR LCD_GetPixelColor(int x, int y);
unsigned int LCD_GetPixelIndex(int x, int y);
int LCD_GetBkColorIndex (void);
int LCD_GetColorIndex (void);



unsigned long LCD_AA_SetAndMask(unsigned long AndMask);



int LCD_SetMaxNumColors(unsigned MaxNumColors);
int LCD_GetMaxNumColors(void);
void LCD__SetPaletteConversionHook(void (* pfPaletteConversionHook)(const LCD_LOGPALETTE * pLogPal));







typedef void tLCD_DrawBitmap(int x0, int y0, int xsize, int ysize,
                             int xMul, int yMul, int BitsPerPixel, int BytesPerLine,
                             const unsigned char * pPixel, const void * pTrans);
typedef void tRect2TextRect (LCD_RECT * pRect);

struct tLCD_APIList_struct {
  tLCD_DrawBitmap * pfDrawBitmap;
  tRect2TextRect * pfRect2TextRect;
  tRect2TextRect * pfTransformRect;
};

typedef struct tLCD_APIList_struct tLCD_APIList;

extern tLCD_APIList LCD_APIListCCW;
extern tLCD_APIList LCD_APIListCW;
extern tLCD_APIList LCD_APIList180;







tLCD_SetPixelAA * LCD__GetPfSetPixel(int BitsPerPixel);







void LCD__SetPhysColor(unsigned char Pos, LCD_COLOR Color);
# 743 "../Middlewares/ST/STemWin/inc/LCD.h"
int LCD_ControlCache (int Cmd);
int LCD_ControlCacheEx(int LayerIndex, int Cmd);





unsigned long LCD_Color2Index (LCD_COLOR Color);
LCD_COLOR LCD_Index2Color (int Index);
LCD_COLOR LCD_Index2ColorEx (int i, unsigned LayerIndex);





unsigned char LCD_X_Read00(void);
unsigned char LCD_X_Read01(void);
void LCD_X_Write00 (unsigned char c);
void LCD_X_Write01 (unsigned char c);
void LCD_X_WriteM01(unsigned char * pData, int NumBytes);
# 61 "../Middlewares/ST/STemWin/inc/GUI_Type.h" 2






typedef const char * GUI_ConstString;

typedef LCD_COLOR GUI_COLOR;
typedef LCD_LOGPALETTE GUI_LOGPALETTE;
typedef LCD_DRAWMODE GUI_DRAWMODE;
typedef LCD_RECT GUI_RECT;

typedef struct {
  void (* pfDraw) (int x0,
                         int y0,
                         int xsize,
                         int ysize,
                         const unsigned char * pPixel,
                         const LCD_LOGPALETTE * pLogPal,
                         int xMag,
                         int yMag);
  GUI_COLOR (* pfIndex2Color)(unsigned long Index);
  void (* pfDrawHW)(int x0,
                         int y0,
                         int xsize,
                         int ysize,
                         const unsigned char * pPixel,
                         const LCD_LOGPALETTE * pLogPal,
                         int xMag,
                         int yMag);
  const LCD_API_COLOR_CONV * pColorConvAPI;
} GUI_BITMAP_METHODS;

typedef struct {
  unsigned short XSize;
  unsigned short YSize;
  unsigned short BytesPerLine;
  unsigned short BitsPerPixel;
  const unsigned char * pData;
  const GUI_LOGPALETTE * pPal;
  const GUI_BITMAP_METHODS * pMethods;
} GUI_BITMAP;






typedef struct {
  unsigned short ID;
  unsigned short Format;
  unsigned short XSize;
  unsigned short YSize;
  unsigned short BytesPerLine;
  unsigned short BitsPerPixel;
  unsigned short NumColors;
  unsigned short HasTrans;
} GUI_BITMAP_STREAM;

typedef struct {
  int Cmd;
  unsigned long v;
  void * p;
} GUI_BITMAPSTREAM_PARAM;

typedef struct {
  int XSize;
  int YSize;
  int BitsPerPixel;
  int NumColors;
  int HasTrans;
} GUI_BITMAPSTREAM_INFO;

typedef void * (* GUI_BITMAPSTREAM_CALLBACK)(GUI_BITMAPSTREAM_PARAM * pParam);

typedef struct {
  int x,y;
  unsigned char Pressed;
  unsigned char Layer;
} GUI_PID_STATE;

typedef struct {
  int Key;
  int Pressed;
} GUI_KEY_STATE;

typedef struct {
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  int Delay;
} GUI_GIF_IMAGE_INFO;

typedef struct {
  int xSize;
  int ySize;
  int NumImages;
} GUI_GIF_INFO;

typedef struct GUI_REGISTER_EXIT GUI_REGISTER_EXIT;

struct GUI_REGISTER_EXIT {
  void (* pfVoid)(void);
  GUI_REGISTER_EXIT * pNext;
};

typedef struct {
  void (* cbBegin)(void);
  void (* cbEnd) (void);
} GUI_MULTIBUF_API;

typedef struct {
  void (* cbBeginEx)(int LayerIndex);
  void (* cbEndEx) (int LayerIndex);
} GUI_MULTIBUF_API_EX;
# 187 "../Middlewares/ST/STemWin/inc/GUI_Type.h"
typedef struct {
  signed short c0;
  signed short c1;
} GUI_FONT_TRANSLIST;

typedef struct {
  unsigned short FirstChar;
  unsigned short LastChar;
  const GUI_FONT_TRANSLIST * pList;
} GUI_FONT_TRANSINFO;

typedef struct {
  unsigned char XSize;
  unsigned char XDist;
  unsigned char BytesPerLine;
  const unsigned char * pData;
} GUI_CHARINFO;

typedef struct {
  unsigned char XSize;
  unsigned char YSize;
  signed char XPos;
  signed char YPos;
  unsigned char XDist;
  const unsigned char * pData;
} GUI_CHARINFO_EXT;

typedef struct GUI_FONT_PROP {
  unsigned short First;
  unsigned short Last;
  const GUI_CHARINFO * paCharInfo;
  const struct GUI_FONT_PROP * pNext;
} GUI_FONT_PROP;

typedef struct GUI_FONT_PROP_EXT {
  unsigned short First;
  unsigned short Last;
  const GUI_CHARINFO_EXT * paCharInfo;
  const struct GUI_FONT_PROP_EXT * pNext;
} GUI_FONT_PROP_EXT;

typedef struct {
  const unsigned char * pData;
  const unsigned char * pTransData;
  const GUI_FONT_TRANSINFO * pTrans;
  unsigned short FirstChar;
  unsigned short LastChar;
  unsigned char XSize;
  unsigned char XDist;
  unsigned char BytesPerLine;
} GUI_FONT_MONO;
# 246 "../Middlewares/ST/STemWin/inc/GUI_Type.h"
typedef struct {
  unsigned short Flags;
  unsigned char Baseline;
  unsigned char LHeight;
  unsigned char CHeight;
} GUI_FONTINFO;
# 264 "../Middlewares/ST/STemWin/inc/GUI_Type.h"
typedef unsigned short tGUI_GetCharCode (const char * s);
typedef int tGUI_GetCharSize (const char * s);
typedef int tGUI_CalcSizeOfChar(unsigned short Char);
typedef int tGUI_Encode (char * s, unsigned short Char);

typedef struct {
  tGUI_GetCharCode * pfGetCharCode;
  tGUI_GetCharSize * pfGetCharSize;
  tGUI_CalcSizeOfChar * pfCalcSizeOfChar;
  tGUI_Encode * pfEncode;
} GUI_UC_ENC_APILIST;





typedef int tGUI_GetLineDistX(const char * s, int Len);
typedef int tGUI_GetLineLen (const char * s, int MaxLen);
typedef void tGL_DispLine (const char * s, int Len);

typedef struct {
  tGUI_GetLineDistX * pfGetLineDistX;
  tGUI_GetLineLen * pfGetLineLen;
  tGL_DispLine * pfDispLine;
} tGUI_ENC_APIList;

extern const tGUI_ENC_APIList GUI_ENC_APIList_SJIS;
extern const tGUI_ENC_APIList GUI_ENC_APIList_EXT;





typedef struct GUI_FONT GUI_FONT;

typedef void GUI_DISPCHAR (unsigned short c);
typedef int GUI_GETCHARDISTX(unsigned short c, int * pSizeX);
typedef void GUI_GETFONTINFO (const GUI_FONT * pFont, GUI_FONTINFO * pfi);
typedef char GUI_ISINFONT (const GUI_FONT * pFont, unsigned short c);
typedef int GUI_GETCHARINFO (unsigned short c, GUI_CHARINFO_EXT * pInfo);
# 316 "../Middlewares/ST/STemWin/inc/GUI_Type.h"
void GUIMONO_DispChar (unsigned short c); int GUIMONO_GetCharDistX(unsigned short c, int * pSizeX); void GUIMONO_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIMONO_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIMONO_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
void GUIPROP_DispChar (unsigned short c); int GUIPROP_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
void GUIPROP_EXT_DispChar (unsigned short c); int GUIPROP_EXT_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_EXT_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_EXT_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_EXT_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
void GUIPROP_FRM_DispChar (unsigned short c); int GUIPROP_FRM_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_FRM_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_FRM_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_FRM_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
void GUIPROPAA_DispChar (unsigned short c); int GUIPROPAA_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROPAA_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROPAA_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROPAA_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
void GUIPROP_AA2_DispChar (unsigned short c); int GUIPROP_AA2_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_AA2_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA2_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_AA2_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
void GUIPROP_AA2_EXT_DispChar (unsigned short c); int GUIPROP_AA2_EXT_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_AA2_EXT_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA2_EXT_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_AA2_EXT_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
void GUIPROP_AA4_DispChar (unsigned short c); int GUIPROP_AA4_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_AA4_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA4_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_AA4_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
void GUIPROP_AA4_EXT_DispChar (unsigned short c); int GUIPROP_AA4_EXT_GetCharDistX(unsigned short c, int * pSizeX); void GUIPROP_AA4_EXT_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA4_EXT_IsInFont (const GUI_FONT * pFont, unsigned short c); int GUIPROP_AA4_EXT_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
# 438 "../Middlewares/ST/STemWin/inc/GUI_Type.h"
struct GUI_FONT {
  GUI_DISPCHAR * pfDispChar;
  GUI_GETCHARDISTX * pfGetCharDistX;
  GUI_GETFONTINFO * pfGetFontInfo;
  GUI_ISINFONT * pfIsInFont;
  GUI_GETCHARINFO * pfGetCharInfo;
  const tGUI_ENC_APIList* pafEncode;
  unsigned char YSize;
  unsigned char YDist;
  unsigned char XMag;
  unsigned char YMag;
  union {
    const void * pFontData;
    const GUI_FONT_MONO * pMono;
    const GUI_FONT_PROP * pProp;
    const GUI_FONT_PROP_EXT * pPropExt;
  } p;
  unsigned char Baseline;
  unsigned char LHeight;
  unsigned char CHeight;
};





typedef void GUI_CALLBACK_VOID_U8_P(unsigned char Data, void * p);





typedef struct {
  unsigned long ID;
  unsigned short YSize;
  unsigned short YDist;
  unsigned short Baseline;
  unsigned short LHeight;
  unsigned short CHeight;
  unsigned short NumAreas;
} GUI_SI_FONT;

typedef struct {
  unsigned short First;
  unsigned short Last;
} GUI_SIF_CHAR_AREA;

typedef struct {
  unsigned short XSize;
  unsigned short XDist;
  unsigned short BytesPerLine;
  unsigned short Dummy;
  unsigned long OffData;
} GUI_SIF_CHARINFO;

typedef struct {
  unsigned short XSize;
  unsigned short YSize;
  signed short XOff;
  signed short YOff;
  unsigned short XDist;
  unsigned short Dummy;
  unsigned long OffData;
} GUI_SIF_CHARINFO_EXT;

typedef struct tGUI_SIF_APIList_struct {
  GUI_DISPCHAR * pfDispChar;
  GUI_GETCHARDISTX * pfGetCharDistX;
  GUI_GETFONTINFO * pfGetFontInfo;
  GUI_ISINFONT * pfIsInFont;
  GUI_GETCHARINFO * pfGetCharInfo;
  const tGUI_ENC_APIList* pafEncode;
} tGUI_SIF_APIList;
# 525 "../Middlewares/ST/STemWin/inc/GUI_Type.h"
typedef int GUI_XBF_GET_DATA_FUNC(unsigned long Off, unsigned short NumBytes, void * pVoid, void * pBuffer);

typedef struct {
  unsigned short First;
  unsigned short Last;
  void * pVoid;
  GUI_XBF_GET_DATA_FUNC * pfGetData;
} GUI_XBF_DATA;

typedef struct tGUI_XBF_APIList_struct {
  GUI_DISPCHAR * pfDispChar;
  GUI_GETCHARDISTX * pfGetCharDistX;
  GUI_GETFONTINFO * pfGetFontInfo;
  GUI_ISINFONT * pfIsInFont;
  GUI_GETCHARINFO * pfGetCharInfo;
  const tGUI_ENC_APIList* pafEncode;
} tGUI_XBF_APIList;
# 554 "../Middlewares/ST/STemWin/inc/GUI_Type.h"
typedef struct {
  const void * pData;
  unsigned long NumBytes;
} GUI_TTF_DATA;

typedef struct {
  GUI_TTF_DATA * pTTF;
  unsigned long aImageTypeBuffer[4];
  int PixelHeight;



  int FaceIndex;


} GUI_TTF_CS;





typedef void (* GUI_SIGNAL_EVENT_FUNC) (void);
typedef void (* GUI_WAIT_EVENT_FUNC) (void);
typedef void (* GUI_WAIT_EVENT_TIMED_FUNC)(int Period);
# 587 "../Middlewares/ST/STemWin/inc/GUI_Type.h"
typedef signed long GUI_HWIN;
typedef signed long GUI_HSPRITE;
# 598 "../Middlewares/ST/STemWin/inc/GUI_Type.h"
typedef struct {
  signed long x;
  signed long y;
  unsigned long Id;
  unsigned short Flags;
} GUI_MTOUCH_INPUT;

typedef struct {
  int LayerIndex;
  unsigned NumPoints;
  int TimeStamp;
  signed long hInput;
} GUI_MTOUCH_EVENT;




typedef struct {
  unsigned char Layer;
  unsigned char NumPoints;
  signed short ax[5];
  signed short ay[5];
  unsigned short aId[5];
  unsigned char aFlags[5];
} GUI_MTOUCH_STATE;

typedef void (* T_GUI_MTOUCH_STOREEVENT)(GUI_MTOUCH_EVENT *, GUI_MTOUCH_INPUT * pInput);





typedef struct {



  void (* pfWrite8_A0) (unsigned char Data);
  void (* pfWrite8_A1) (unsigned char Data);
  void (* pfWriteM8_A0) (unsigned char * pData, int NumItems);
  void (* pfWriteM8_A1) (unsigned char * pData, int NumItems);
  unsigned char (* pfRead8_A0) (void);
  unsigned char (* pfRead8_A1) (void);
  void (* pfReadM8_A0) (unsigned char * pData, int NumItems);
  void (* pfReadM8_A1) (unsigned char * pData, int NumItems);



  void (* pfWrite16_A0) (unsigned short Data);
  void (* pfWrite16_A1) (unsigned short Data);
  void (* pfWriteM16_A0)(unsigned short * pData, int NumItems);
  void (* pfWriteM16_A1)(unsigned short * pData, int NumItems);
  unsigned short (* pfRead16_A0) (void);
  unsigned short (* pfRead16_A1) (void);
  void (* pfReadM16_A0) (unsigned short * pData, int NumItems);
  void (* pfReadM16_A1) (unsigned short * pData, int NumItems);



  void (* pfWrite32_A0) (unsigned long Data);
  void (* pfWrite32_A1) (unsigned long Data);
  void (* pfWriteM32_A0)(unsigned long * pData, int NumItems);
  void (* pfWriteM32_A1)(unsigned long * pData, int NumItems);
  unsigned long (* pfRead32_A0) (void);
  unsigned long (* pfRead32_A1) (void);
  void (* pfReadM32_A0) (unsigned long * pData, int NumItems);
  void (* pfReadM32_A1) (unsigned long * pData, int NumItems);



  void (* pfSetCS) (unsigned char NotActive);



  void (* pfFlushBuffer)(void);
} GUI_PORT_API;





typedef int (* GUI_tSend) (const unsigned char * pData, int len, void * p);
typedef int (* GUI_tRecv) ( unsigned char * pData, int len, void * p);





typedef void * (* GUI_tMalloc)(unsigned int);
typedef void (* GUI_tFree) (void *);
# 58 "../Middlewares/ST/STemWin/inc\\GUI.h" 2
# 1 "../Middlewares/ST/STemWin/inc/GUI_Version.h" 1
# 59 "../Middlewares/ST/STemWin/inc\\GUI.h" 2
# 87 "../Middlewares/ST/STemWin/inc\\GUI.h"
typedef struct GUI_CONTEXT GUI_CONTEXT;
# 112 "../Middlewares/ST/STemWin/inc\\GUI.h"
struct GUI_DEVICE_API {



  int DeviceClassIndex;



  void (* pfDrawBitmap )(GUI_DEVICE * pDevice, int x0, int y0, int xsize, int ysize, int BitsPerPixel, int BytesPerLine, const unsigned char * pData, int Diff, const unsigned long * pTrans);
  void (* pfDrawHLine )(GUI_DEVICE * pDevice, int x0, int y0, int x1);
  void (* pfDrawVLine )(GUI_DEVICE * pDevice, int x , int y0, int y1);
  void (* pfFillRect )(GUI_DEVICE * pDevice, int x0, int y0, int x1, int y1);
  unsigned long (* pfGetPixelIndex)(GUI_DEVICE * pDevice, int x, int y);
  void (* pfSetPixelIndex)(GUI_DEVICE * pDevice, int x, int y, unsigned long ColorIndex);
  void (* pfXorPixel )(GUI_DEVICE * pDevice, int x, int y);



  void (* pfSetOrg )(GUI_DEVICE * pDevice, int x, int y);



  void (*(* pfGetDevFunc) (GUI_DEVICE ** ppDevice, int Index))(void);
  signed long (* pfGetDevProp )(GUI_DEVICE * pDevice, int Index);
  void *(* pfGetDevData )(GUI_DEVICE * pDevice, int Index);
  void (* pfGetRect )(GUI_DEVICE * pDevice, LCD_RECT * pRect);
};





typedef enum {
  DEVICE_CLASS_DRIVER = 0,
  DEVICE_CLASS_DRIVER_MODIFIER,
  DEVICE_CLASS_VNC,
  DEVICE_CLASS_SPRITE,
  DEVICE_CLASS_MEMDEV,
  DEVICE_CLASS_ALPHA,
  DEVICE_CLASS_AUTOALPHA,
  DEVICE_CLASS_MEASDEV
} DEVICE_CLASS;
# 164 "../Middlewares/ST/STemWin/inc\\GUI.h"
extern const GUI_DEVICE_API GUIDRV_Win_API;
extern const GUI_DEVICE_API GUIDRV_Template_API;
# 182 "../Middlewares/ST/STemWin/inc\\GUI.h"
struct GUI_DEVICE {



  GUI_DEVICE * pNext;
  GUI_DEVICE * pPrev;



  union {
    signed long hContext;
    void * pContext;
  } u;



  const GUI_DEVICE_API * pDeviceAPI;
  const LCD_API_COLOR_CONV * pColorConvAPI;
  unsigned short Flags;
  int LayerIndex;
};

extern const GUI_DEVICE_API GUI_MEMDEV_DEVICE_1;
extern const GUI_DEVICE_API GUI_MEMDEV_DEVICE_8;
extern const GUI_DEVICE_API GUI_MEMDEV_DEVICE_16;
extern const GUI_DEVICE_API GUI_MEMDEV_DEVICE_32;
# 216 "../Middlewares/ST/STemWin/inc\\GUI.h"
typedef union {
  unsigned char aColorIndex8[2];
  unsigned short aColorIndex16[2];
  unsigned long aColorIndex32[2];
} LCD_COLORINDEX_UNION;

struct GUI_CONTEXT {



  LCD_COLORINDEX_UNION uLCD;
  LCD_RECT ClipRect;
  unsigned char DrawMode;
  unsigned char SelLayer;
  unsigned char TextStyle;



  GUI_RECT * pClipRect_HL;
  unsigned char PenSize;
  unsigned char PenShape;
  unsigned char LineStyle;



  const GUI_FONT * pAFont;
  signed short LBorder;
  signed short DispPosX, DispPosY;
  signed short DrawPosX, DrawPosY;
  signed short TextMode, TextAlign;
  GUI_COLOR Color, BkColor;



  unsigned long * LCD_pBkColorIndex;
  unsigned long * LCD_pColorIndex;
  unsigned long * LCD_pAColorIndex;




    const GUI_RECT * WM__pUserClipRect;
    GUI_HWIN hAWin;
    int xOff, yOff;
    unsigned char WM_IsActive;




  GUI_DEVICE * apDriver[(2)];



  signed long hDevData;



  const tLCD_HL_APIList * pLCD_HL;
  unsigned char AA_Factor;
  unsigned char AA_HiResEnable;
  void (* AA_pfSetPixelAA)(int x, int y, unsigned char Intens);
};
# 290 "../Middlewares/ST/STemWin/inc\\GUI.h"
GUI_DEVICE * GUI_DEVICE_Create (const GUI_DEVICE_API * pDeviceAPI, const LCD_API_COLOR_CONV * pColorConvAPI, unsigned short Flags, int LayerIndex);
GUI_DEVICE * GUI_DEVICE_CreateAndLink(const GUI_DEVICE_API * pDeviceAPI, const LCD_API_COLOR_CONV * pColorConvAPI, unsigned short Flags, int LayerIndex);
void GUI_DEVICE_Delete (GUI_DEVICE * pDevice);
int GUI_DEVICE_Link (GUI_DEVICE * pDevice);
void GUI_DEVICE_Unlink (GUI_DEVICE * pDevice);
GUI_DEVICE * GUI_DEVICE__GetpDriver (int LayerIndex);
GUI_DEVICE * GUI_DEVICE__GetpDevice (int LayerIndex, int DeviceClass);

GUI_DEVICE * GUI_DEVICE_UnlinkTaskDevices(void);
void GUI_DEVICE_LinkDevices (GUI_DEVICE * pDevice);





typedef struct {
  void * pData;
  int x0, y0;
  int xSize, ySize;
  int LineOff;
  int BytesPerPixel;
  int IsDirty;
} GUI_DIRTYDEVICE_INFO;

int GUI_DIRTYDEVICE_Create (void);
int GUI_DIRTYDEVICE_CreateEx (int LayerIndex);
int GUI_DIRTYDEVICE_CreateExInfo(GUI_DIRTYDEVICE_INFO * pInfo, int LayerIndex);
int GUI_DIRTYDEVICE_Delete (void);
int GUI_DIRTYDEVICE_DeleteEx (int LayerIndex);
int GUI_DIRTYDEVICE_Fetch (GUI_DIRTYDEVICE_INFO * pInfo);
int GUI_DIRTYDEVICE_FetchEx (GUI_DIRTYDEVICE_INFO * pInfo, int LayerIndex);





int GUI_GCACHE_4_Create(const LCD_API_COLOR_CONV * pColorConvAPI);
int GUI_GCACHE_4_CreateEx(int LayerIndex, const LCD_API_COLOR_CONV * pColorConvAPI);





void GUI_DCACHE_SetClearCacheHook(void (* pFunc)(unsigned long LayerMask));
void GUI_DCACHE_Clear (unsigned long LayerMask);

extern void (* GUI_DCACHE__pfClearCacheHook)(unsigned long LayerMask);





typedef struct {
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  int Visible;
} GUI_SOFTLAYER_CONFIG;

int GUI_SOFTLAYER_Enable (GUI_SOFTLAYER_CONFIG * pConfig, int NumLayers, GUI_COLOR CompositeColor);
int GUI_SOFTLAYER_Refresh (void);
void GUI_SOFTLAYER_SetCompositeColor(unsigned long Color);
int GUI_SOFTLAYER_MULTIBUF_Enable (int OnOff);





void GUI_Exit (void);
GUI_COLOR GUI_GetDefaultBkColor(void);
GUI_COLOR GUI_GetDefaultColor (void);
const GUI_FONT * GUI_GetDefaultFont (void);
int GUI_GetScreenSizeX (void);
int GUI_GetScreenSizeY (void);
const char * GUI_GetVersionString (void);
int GUI_Init (void);
int GUI_IsInitialized (void);
void GUI_SetAfterInitHook (void (* pFunc)(void));
void GUI_RestoreContext (const GUI_CONTEXT * pContext);
void GUI_SaveContext_W (GUI_CONTEXT * pContext);
const GUI_RECT * GUI_SetClipRect (const GUI_RECT * pRect);
void GUI_SetControlHook (void (* pFunc)(int LayerIndex, int Cmd));
void GUI_SetDefault (void);
void GUI_SetDefaultBkColor(GUI_COLOR Color);
void GUI_SetDefaultColor (GUI_COLOR Color);
void GUI_SetDefaultFont (const GUI_FONT * pFont);
GUI_DRAWMODE GUI_SetDrawMode (GUI_DRAWMODE dm);
void GUI_SetScreenSizeX (int xSize);
void GUI_SetScreenSizeY (int ySize);
void GUI_SetRefreshHook (void (* pFunc)(void));
void MainTask (void);







void GUI_SetpfMemset(void * (* pFunc)(void * pDest, int c, unsigned Cnt));
void GUI_SetpfMemcpy(void * (* pFunc)(void * pDest, const void * pSrc, unsigned Cnt));





int GUI_RectsIntersect(const GUI_RECT * pr0, const GUI_RECT * pr1);
void GUI_MoveRect (GUI_RECT * pRect, int x, int y);
void GUI_MergeRect (GUI_RECT * pDest, const GUI_RECT * pr0, const GUI_RECT * pr1);
int GUI__IntersectRects(GUI_RECT * pDest, const GUI_RECT * pr0, const GUI_RECT * pr1);
void GUI__IntersectRect (GUI_RECT * pDest, const GUI_RECT * pr0);
void GUI__ReduceRect (GUI_RECT * pDest, const GUI_RECT * pRect, int Dist);





signed long GUI__ATan2(signed long x, signed long y, signed long * ph);
signed long GUI__ASinHQ(signed long SinHQ);
int GUI__CompactPixelIndices (unsigned long * pBuffer, int NumPixels, int BitsPerPixel);
int GUI__CompactPixelIndicesEx(unsigned long * pBuffer, int NumPixels, int BitsPerPixel, const LCD_API_COLOR_CONV * pColorConvAPI);
int GUI__ConvertColor2Index (unsigned long * pBuffer, int NumPixels, int BitsPerPixel, const LCD_API_COLOR_CONV * pColorConvAPI, void * pResult);
void GUI__Config(void);
signed long GUI__CosHQ(signed long Ang1000);
int GUI__DivideRound (int a, int b);
signed long GUI__DivideRound32 (signed long a, signed long b);
void GUI__ExpandPixelIndices (void * pBuffer, int NumPixels, int BitsPerPixel);
void GUI__ExpandPixelIndicesEx (void * pBuffer, int NumPixels, int BitsPerPixel, const LCD_API_COLOR_CONV * pColorConvAPI);
int GUI__SetText(signed long * phText, const char * s);
signed long GUI__SinHQ(signed long Ang1000);
signed long GUI__sqrt32(signed long Square);
void GUI__DrawTwinArc2(int xl, int xr, int y0, int r, GUI_COLOR ColorR0, GUI_COLOR ColorR1, GUI_COLOR ColorFill);
void GUI__DrawTwinArc4(int x0, int y0, int x1, int y1, int r, GUI_COLOR ColorR0, GUI_COLOR ColorR1, GUI_COLOR ColorFill);
void GUI__FillTrippleArc(int x0, int y0, int Size, GUI_COLOR ColorR0, GUI_COLOR ColorR1, GUI_COLOR ColorR2, GUI_COLOR ColorFill);
void GUI__RegisterExit(GUI_REGISTER_EXIT * pRegisterExit);





void * GUI__memcpy(void * pDest, const void * pSrc, unsigned NumBytes);
void * GUI__memset(void * pDest, int c, unsigned Cnt);





GUI_COLOR GUI_GetBkColor (void);
int GUI_GetBkColorIndex(void);
GUI_COLOR GUI_GetColor (void);
int GUI_GetColorIndex (void);
unsigned char GUI_GetLineStyle (void);
unsigned char GUI_GetPenSize (void);
unsigned char GUI_GetPenShape (void);
unsigned GUI_GetPixelIndex (int x, int y);

void GUI_SetBkColor (GUI_COLOR);
void GUI_SetColor (GUI_COLOR);
void GUI_SetBkColorIndex(int Index);
void GUI_SetColorIndex(int Index);

unsigned char GUI_SetPenSize (unsigned char Size);
unsigned char GUI_SetPenShape (unsigned char Shape);
unsigned char GUI_SetLineStyle (unsigned char Style);


char GUI_GetDecChar(void);
char GUI_SetDecChar(char c);





int GUI_Color2Index(GUI_COLOR color);
GUI_COLOR GUI_Color2VisColor(GUI_COLOR color);
char GUI_ColorIsAvailable(GUI_COLOR color);
GUI_COLOR GUI_Index2Color(int Index);
unsigned long GUI_CalcColorDist (GUI_COLOR Color0, GUI_COLOR Color1);
unsigned long GUI_CalcVisColorError(GUI_COLOR color);





void GUI_SetOnErrorFunc(void (* pFunc)(const char * s));





void GUI_Log (const char * s);
void GUI_Log1 (const char * s, signed long p0);
void GUI_Log2 (const char * s, signed long p0, signed long p1);
void GUI_Log3 (const char * s, signed long p0, signed long p1, signed long p2);
void GUI_Log4 (const char * s, signed long p0, signed long p1, signed long p2,signed long p3);
void GUI_Warn (const char * s);
void GUI_Warn1 (const char * s, signed long p0);
void GUI_Warn2 (const char * s, signed long p0, signed long p1);
void GUI_Warn3 (const char * s, signed long p0, signed long p1, signed long p2);
void GUI_Warn4 (const char * s, signed long p0, signed long p1, signed long p2, signed long p3);
void GUI_ErrorOut (const char * s);
void GUI_ErrorOut1(const char * s, signed long p0);
void GUI_ErrorOut2(const char * s, signed long p0, signed long p1);
void GUI_ErrorOut3(const char * s, signed long p0, signed long p1, signed long p2);
void GUI_ErrorOut4(const char * s, signed long p0, signed long p1, signed long p2, signed long p3);





void GUI_Clear (void);
void GUI_ClearRect (int x0, int y0, int x1, int y1);
void GUI_ClearRectEx (const GUI_RECT * pRect);
void GUI_CopyRect (int x0, int y0, int x1, int y1, int dx, int dy);
void GUI_DrawArc (int x0, int y0, int rx, int ry, int a0, int a1);
void GUI_DrawBitmap (const GUI_BITMAP * pBM, int x0, int y0);
void GUI_DrawBitmapMag (const GUI_BITMAP * pBM, int x0, int y0, int XMul, int YMul);
void GUI_DrawBitmapEx (const GUI_BITMAP * pBM, int x0, int y0, int xCenter, int yCenter, int xMag, int yMag);
void GUI_DrawBitmapExp (int x0, int y0, int XSize, int YSize, int XMul, int YMul, int BitsPerPixel, int BytesPerLine, const unsigned char * pData, const GUI_LOGPALETTE * pPal);
void GUI_DrawBitmapHWAlpha(const GUI_BITMAP * pBM, int x0, int y0);
void GUI_DrawCircle (int x0, int y0, int r);
void GUI_DrawEllipse (int x0, int y0, int rx, int ry);
void GUI_DrawGradientH (int x0, int y0, int x1, int y1, GUI_COLOR Color0, GUI_COLOR Color1);
void GUI_DrawGradientV (int x0, int y0, int x1, int y1, GUI_COLOR Color0, GUI_COLOR Color1);
void GUI_DrawGradientRoundedH(int x0, int y0, int x1, int y1, int rd, GUI_COLOR Color0, GUI_COLOR Color1);
void GUI_DrawGradientRoundedV(int x0, int y0, int x1, int y1, int rd, GUI_COLOR Color0, GUI_COLOR Color1);
void GUI_DrawGraph (signed short * pay, int NumPoints, int x0, int y0);
void GUI_DrawGraphEx (signed short * pay, int NumPoints, int x0, int y0, int Numerator, int Denominator, int MirrorX);
void GUI_DrawHLine (int y0, int x0, int x1);
void GUI_DrawLine (int x0, int y0, int x1, int y1);
void GUI_DrawLineRel (int dx, int dy);
void GUI_DrawLineTo (int x, int y);
void GUI_DrawPie (int x0, int y0, int r, int a0, int a1, int Type);
void GUI_DrawPixel (int x, int y);
void GUI_DrawPoint (int x, int y);
void GUI_DrawPolygon (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
void GUI_DrawPolyLine (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
void GUI_DrawFocusRect (const GUI_RECT * pRect, int Dist);
void GUI_DrawRect (int x0, int y0, int x1, int y1);
void GUI_DrawRectEx (const GUI_RECT * pRect);
void GUI_DrawRoundedFrame (int x0, int y0, int x1, int y1, int r, int w);
void GUI_DrawRoundedRect (int x0, int y0, int x1, int y1, int r);
void GUI_DrawVLine (int x0, int y0, int y1);
void GUI_FillCircle (int x0, int y0, int r);
void GUI_FillEllipse (int x0, int y0, int rx, int ry);
void GUI_FillPolygon (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
void GUI_FillRect (int x0, int y0, int x1, int y1);
void GUI_FillRectEx (const GUI_RECT * pRect);
void GUI_FillRoundedFrame (int x0, int y0, int x1, int y1, int r, int w);
void GUI_FillRoundedRect (int x0, int y0, int x1, int y1, int r);
void GUI_FillRoundedRectB (int x0, int y0, int x1, int y1, int r);
void GUI_FillRoundedRectT (int x0, int y0, int x1, int y1, int r);
void GUI_GetClientRect (GUI_RECT * pRect);
void GUI_InvertRect (int x0, int y0, int x1, int y1);
void GUI_MoveRel (int dx, int dy);
void GUI_MoveTo (int x, int y);
void GUI_SetAlphaMask8888 (unsigned long OrMask, unsigned long AndMask);





typedef int GUI_GET_DATA_FUNC(void * p, const unsigned char ** ppData, unsigned NumBytes, unsigned long Off);





int GUI_GIF_Draw (const void * pGIF, unsigned long NumBytes, int x0, int y0);
int GUI_GIF_DrawEx (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0);
int GUI_GIF_DrawSub (const void * pGIF, unsigned long NumBytes, int x0, int y0, int Index);
int GUI_GIF_DrawSubEx (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0, int Index);
int GUI_GIF_DrawSubScaled (const void * pGIF, unsigned long NumBytes, int x0, int y0, int Index, int Num, int Denom);
int GUI_GIF_DrawSubScaledEx(GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0, int Index, int Num, int Denom);
int GUI_GIF_GetComment (const void * pGIF, unsigned long NumBytes, unsigned char * pBuffer, int MaxSize, int Index);
int GUI_GIF_GetCommentEx (GUI_GET_DATA_FUNC * pfGetData, void * p, unsigned char * pBuffer, int MaxSize, int Index);
int GUI_GIF_GetImageInfo (const void * pGIF, unsigned long NumBytes, GUI_GIF_IMAGE_INFO * pInfo, int Index);
int GUI_GIF_GetImageInfoEx (GUI_GET_DATA_FUNC * pfGetData, void * p, GUI_GIF_IMAGE_INFO * pInfo, int Index);
int GUI_GIF_GetInfo (const void * pGIF, unsigned long NumBytes, GUI_GIF_INFO * pInfo);
int GUI_GIF_GetInfoEx (GUI_GET_DATA_FUNC * pfGetData, void * p, GUI_GIF_INFO * pInfo);
int GUI_GIF_GetXSize (const void * pGIF);
int GUI_GIF_GetXSizeEx (GUI_GET_DATA_FUNC * pfGetData, void * p);
int GUI_GIF_GetYSize (const void * pGIF);
int GUI_GIF_GetYSizeEx (GUI_GET_DATA_FUNC * pfGetData, void * p);
int GUI_GIF_SetFillTrans (int OnOff);





int GUI_BMP_Draw (const void * pFileData, int x0, int y0);
int GUI_BMP_DrawEx (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0);
int GUI_BMP_DrawScaled (const void * pFileData, int x0, int y0, int Num, int Denom);
int GUI_BMP_DrawScaledEx(GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0, int Num, int Denom);
int GUI_BMP_GetXSize (const void * pFileData);
int GUI_BMP_GetXSizeEx (GUI_GET_DATA_FUNC * pfGetData, void * p);
int GUI_BMP_GetYSize (const void * pFileData);
int GUI_BMP_GetYSizeEx (GUI_GET_DATA_FUNC * pfGetData, void * p);
void GUI_BMP_EnableAlpha (void);
void GUI_BMP_DisableAlpha(void);





int GUI_PNG_Draw (const void * pFileData, int DataSize, int x0, int y0);
int GUI_PNG_DrawEx (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0);
int GUI_PNG_GetXSize (const void * pFileData, int FileSize);
int GUI_PNG_GetXSizeEx(GUI_GET_DATA_FUNC * pfGetData, void * p);
int GUI_PNG_GetYSize (const void * pFileData, int FileSize);
int GUI_PNG_GetYSizeEx(GUI_GET_DATA_FUNC * pfGetData, void * p);





typedef struct {
  int XSize;
  int YSize;
} GUI_JPEG_INFO;

int GUI_JPEG_Draw (const void * pFileData, int DataSize, int x0, int y0);
int GUI_JPEG_DrawEx (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0);
int GUI_JPEG_DrawScaled (const void * pFileData, int DataSize, int x0, int y0, int Num, int Denom);
int GUI_JPEG_DrawScaledEx(GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0, int Num, int Denom);
int GUI_JPEG_GetInfo (const void * pFileData, int DataSize, GUI_JPEG_INFO * pInfo);
int GUI_JPEG_GetInfoEx (GUI_GET_DATA_FUNC * pfGetData, void * p, GUI_JPEG_INFO * pInfo);
# 628 "../Middlewares/ST/STemWin/inc\\GUI.h"
typedef signed long GUI_MOVIE_HANDLE;

typedef void GUI_MOVIE_FUNC(GUI_MOVIE_HANDLE hMovie, int Notification, unsigned long CurrentFrame);

typedef struct {
  int xSize;
  int ySize;
  int msPerFrame;
  unsigned long NumFrames;
} GUI_MOVIE_INFO;

GUI_MOVIE_HANDLE GUI_MOVIE_Create (const void * pFileData, unsigned long FileSize, GUI_MOVIE_FUNC * pfNotify);
GUI_MOVIE_HANDLE GUI_MOVIE_CreateEx (GUI_GET_DATA_FUNC * pfGetData, void * pParam, GUI_MOVIE_FUNC * pfNotify);
int GUI_MOVIE_Delete (GUI_MOVIE_HANDLE hMovie);
void GUI_MOVIE_DrawFrame (GUI_MOVIE_HANDLE hMovie, int Index, int x, int y);
unsigned long GUI_MOVIE_GetFrameIndex(GUI_MOVIE_HANDLE hMovie);
int GUI_MOVIE_GetInfo (const void * pFileData, unsigned long FileSize, GUI_MOVIE_INFO * pInfo);
int GUI_MOVIE_GetInfoEx (GUI_GET_DATA_FUNC * pfGetData, void * pParam, GUI_MOVIE_INFO * pInfo);
int GUI_MOVIE_GetPos (GUI_MOVIE_HANDLE hMovie, int * pxPos, int * pyPos, int * pxSize, int * pySize);
int GUI_MOVIE_GotoFrame (GUI_MOVIE_HANDLE hMovie, unsigned long Frame);
int GUI_MOVIE_Pause (GUI_MOVIE_HANDLE hMovie);
int GUI_MOVIE_Play (GUI_MOVIE_HANDLE hMovie);
int GUI_MOVIE_SetPeriod (GUI_MOVIE_HANDLE hMovie, unsigned Period);
int GUI_MOVIE_SetPos (GUI_MOVIE_HANDLE hMovie, int xPos, int yPos);
int GUI_MOVIE_Show (GUI_MOVIE_HANDLE hMovie, int xPos, int yPos, int DoLoop);
int GUI_MOVIE_ShowScaled (GUI_MOVIE_HANDLE hMovie, int xPos, int yPos, int num, int denom, int DoLoop);







typedef struct {
  const GUI_BITMAP * pBitmap;
  int xHot;
  int yHot;
} GUI_CURSOR;

typedef struct {
  const GUI_BITMAP ** ppBm;
  int xHot;
  int yHot;
  unsigned Period;
  const unsigned * pPeriod;
  int NumItems;
} GUI_CURSOR_ANIM;


  int GUI_CURSOR_GetState (void);
  int GUI_CURSOR_GetStateEx (int Layer);
  void GUI_CURSOR_Hide (void);
  void GUI_CURSOR_HideEx (int Layer);
  const GUI_CURSOR * GUI_CURSOR_Select (const GUI_CURSOR * pCursor);
  const GUI_CURSOR * GUI_CURSOR_SelectEx (const GUI_CURSOR * pCursor, int Layer);
  int GUI_CURSOR_SelectAnim (const GUI_CURSOR_ANIM * pCursorAnim);
  int GUI_CURSOR_SelectAnimEx (const GUI_CURSOR_ANIM * pCursorAnim, int LayerIndex);
  int GUI_CURSOR_SetBitmap (const GUI_BITMAP * pBM);
  int GUI_CURSOR_SetBitmapEx (const GUI_BITMAP * pBM, int Layer);
  void GUI_CURSOR_SetPosition (int x, int y);
  void GUI_CURSOR_SetPositionEx(int xNewPos, int yNewPos, int Layer);
  void GUI_CURSOR_Show (void);
  void GUI_CURSOR_ShowEx (int Layer);
  GUI_HSPRITE GUI_CURSOR__GetSpriteEx (int LayerIndex, int * pxPos, int * pyPos);
  void GUI_CURSOR__SetSpriteEx (GUI_HSPRITE hSprite, const GUI_CURSOR * pCursor, int LayerIndex);
# 708 "../Middlewares/ST/STemWin/inc\\GUI.h"
GUI_HSPRITE GUI_SPRITE__CreateEx (const GUI_BITMAP * pBM, int x, int y, int Layer, unsigned short Flags);
void GUI_SPRITE__SetCallback (GUI_HSPRITE hSprite, signed long hContext, void (* pCB)(GUI_HSPRITE, int));
GUI_HSPRITE GUI_SPRITE_Create (const GUI_BITMAP * pBM, int x, int y);
GUI_HSPRITE GUI_SPRITE_CreateAnim (const GUI_BITMAP ** ppBm, int x, int y, unsigned Period, const unsigned * pPeriod, int NumItems);
GUI_HSPRITE GUI_SPRITE_CreateEx (const GUI_BITMAP * pBM, int x, int y, int Layer);
GUI_HSPRITE GUI_SPRITE_CreateExAnim (const GUI_BITMAP ** ppBm, int x, int y, unsigned Period, const unsigned * pPeriod, int NumItems, int LayerIndex);
GUI_HSPRITE GUI_SPRITE_CreateHidden (const GUI_BITMAP * pBM, int x, int y);
GUI_HSPRITE GUI_SPRITE_CreateHiddenEx (const GUI_BITMAP * pBM, int x, int y, int Layer);
void GUI_SPRITE_Delete (GUI_HSPRITE hSprite);
int GUI_SPRITE_GetState (GUI_HSPRITE hSprite);
void GUI_SPRITE_Hide (GUI_HSPRITE hSprite);
int GUI_SPRITE_SetBitmap (GUI_HSPRITE hSprite, const GUI_BITMAP * pBM);
int GUI_SPRITE_SetBitmapAndPosition(GUI_HSPRITE hSprite, const GUI_BITMAP * pBM, int x, int y);
int GUI_SPRITE_SetLoop (GUI_HSPRITE hSprite, int OnOff);
void GUI_SPRITE_SetPosition (GUI_HSPRITE hSprite, int x, int y);
int GUI_SPRITE_StartAnim (GUI_HSPRITE hSprite);
int GUI_SPRITE_StopAnim (GUI_HSPRITE hSprite);
void GUI_SPRITE_Show (GUI_HSPRITE hSprite);





extern const GUI_CURSOR GUI_CursorArrowS, GUI_CursorArrowSI;
extern const GUI_CURSOR GUI_CursorArrowM, GUI_CursorArrowMI;
extern const GUI_CURSOR GUI_CursorArrowL, GUI_CursorArrowLI;
extern const GUI_CURSOR GUI_CursorCrossS, GUI_CursorCrossSI;
extern const GUI_CURSOR GUI_CursorCrossM, GUI_CursorCrossMI;
extern const GUI_CURSOR GUI_CursorCrossL, GUI_CursorCrossLI;
extern const GUI_CURSOR GUI_CursorHeaderM, GUI_CursorHeaderMI;
extern const GUI_CURSOR_ANIM GUI_CursorAnimHourglassM;





typedef enum { GUI_WRAPMODE_NONE, GUI_WRAPMODE_WORD, GUI_WRAPMODE_CHAR } GUI_WRAPMODE;





void GUI_DispCEOL (void);
void GUI_DispChar (unsigned short c);
void GUI_DispCharAt (unsigned short c, signed short x, signed short y);
void GUI_DispChars (unsigned short c, int Cnt);
void GUI_DispNextLine (void);
void GUI_DispString (const char * s);
void GUI_DispStringAt (const char * s, int x, int y);
void GUI_DispStringAtCEOL (const char * s, int x, int y);
void GUI_DispStringHCenterAt (const char * s, int x, int y);
void GUI__DispStringInRect (const char * s, GUI_RECT * pRect, int TextAlign, int MaxNumChars);
void GUI_DispStringInRect (const char * s, GUI_RECT * pRect, int TextAlign);

  void GUI_DispStringInRectEx (const char * s, GUI_RECT * pRect, int TextAlign, int MaxLen, const tLCD_APIList * pLCD_Api);

void GUI_DispStringInRectMax (const char * s, GUI_RECT * pRect, int TextAlign, int MaxLen);
void GUI_DispStringInRectWrap (const char * s, GUI_RECT * pRect, int TextAlign, GUI_WRAPMODE WrapMode);
void GUI_DispStringLen (const char * s, int Len);
void GUI_GetTextExtend (GUI_RECT* pRect, const char * s, int Len);
int GUI_GetYAdjust (void);
int GUI_GetDispPosX (void);
int GUI_GetDispPosY (void);
const GUI_FONT * GUI_GetFont(void);
int GUI_GetCharDistX (unsigned short c);
int GUI_GetCharDistXEx (unsigned short c, int * pSizeX);
int GUI_GetStringDistX (const char * s);
GUI_DRAWMODE GUI_GetDrawMode (void);
int GUI_GetFontDistY (void);
int GUI_GetFontSizeY (void);
void GUI_GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi);
void GUI_GetOrg (int * px, int * py);
int GUI_GetYSizeOfFont (const GUI_FONT * pFont);
int GUI_GetYDistOfFont (const GUI_FONT * pFont);
int GUI_GetTextAlign (void);
int GUI_GetTextMode (void);
char GUI_IsInFont (const GUI_FONT * pFont, unsigned short c);
int GUI_SetTextAlign (int Align);
int GUI_SetTextMode (int Mode);
char GUI_SetTextStyle (char Style);
int GUI_SetLBorder (int x);
const GUI_FONT * GUI_SetFont(const GUI_FONT * pNewFont);
char GUI_GotoXY (int x, int y);
char GUI_GotoX (int x);
char GUI_GotoY (int y);
int GUI_WrapGetNumLines (const char * pText, int xSize, GUI_WRAPMODE WrapMode);
int GUI_WrapGetPositions (const char * pText, int xSize, GUI_WRAPMODE WrapMode, int * aPos, int NumItems);
void GUI_WrapSetSeparators (const unsigned short * pSep, int NumSeps);

int GUI_GetLeadingBlankCols (unsigned short c);
int GUI_GetTrailingBlankCols(unsigned short c);






void GUI_SIF_CreateFont(const void * pFontData, GUI_FONT * pFont, const tGUI_SIF_APIList * pFontType);
void GUI_SIF_DeleteFont(GUI_FONT * pFont);





int GUI_XBF_CreateFont(GUI_FONT * pFont, GUI_XBF_DATA * pXBF, const tGUI_XBF_APIList * pFontType, GUI_XBF_GET_DATA_FUNC * pfGetData, void * pVoid);
void GUI_XBF_DeleteFont(GUI_FONT * pFont);





int GUI_TTF_CreateFont (GUI_FONT * pFont, GUI_TTF_CS * pCS);
int GUI_TTF_CreateFontAA (GUI_FONT * pFont, GUI_TTF_CS * pCS);
void GUI_TTF_DestroyCache (void);
void GUI_TTF_Done (void);
int GUI_TTF_GetFamilyName(GUI_FONT * pFont, char * pBuffer, int NumBytes);
int GUI_TTF_GetStyleName (GUI_FONT * pFont, char * pBuffer, int NumBytes);
void GUI_TTF_SetCacheSize (unsigned MaxFaces, unsigned MaxSizes, unsigned long MaxBytes);





int GUI_LANG_GetLang (void);
int GUI_LANG_GetNumItems (int IndexLang);
const char * GUI_LANG_GetText (int IndexText);
int GUI_LANG_GetTextBuffered (int IndexText, char * pBuffer, int SizeOfBuffer);
int GUI_LANG_GetTextBufferedEx(int IndexText, int IndexLang, char * pBuffer, int SizeOfBuffer);
const char * GUI_LANG_GetTextEx (int IndexText, int IndexLang);
int GUI_LANG_LoadCSV (unsigned char * pFileData, unsigned long FileSize);
int GUI_LANG_LoadCSVEx (GUI_GET_DATA_FUNC * pfGetData, void * p);
int GUI_LANG_LoadText (unsigned char * pFileData, unsigned long FileSize, int IndexLang);
int GUI_LANG_LoadTextEx (GUI_GET_DATA_FUNC * pfGetData, void * p, int IndexLang);
int GUI_LANG_SetLang (int IndexLang);
unsigned GUI_LANG_SetMaxNumLang (unsigned MaxNumLang);
unsigned short GUI_LANG_SetSep (unsigned short Sep);





int GUI_UC_ConvertUC2UTF8(const unsigned short * s, int Len, char * pBuffer, int BufferSize);
int GUI_UC_ConvertUTF82UC(const char * s, int Len, unsigned short * pBuffer, int BufferSize);
int GUI_UC_EnableBIDI (int OnOff);
int GUI_UC_Encode (char * s, unsigned short Char);
int GUI_UC_GetCharSize (const char * s);
unsigned short GUI_UC_GetCharCode (const char * s);
void GUI_UC_SetEncodeNone (void);
void GUI_UC_SetEncodeUTF8 (void);
void GUI_UC_SetBaseDir (int Dir);
int GUI_UC_GetBaseDir (void);

void GUI_UC_DispString(const unsigned short * s);
void GUI_UC2DB (unsigned short Code, unsigned char * pOut);
unsigned short GUI_DB2UC (unsigned char Byte0, unsigned char Byte1);
# 876 "../Middlewares/ST/STemWin/inc\\GUI.h"
void GUI_DispBin (unsigned long v, unsigned char Len);
void GUI_DispBinAt(unsigned long v, signed short x, signed short y, unsigned char Len);
void GUI_DispDec (signed long v, unsigned char Len);
void GUI_DispDecAt (signed long v, signed short x, signed short y, unsigned char Len);
void GUI_DispDecMin(signed long v);
void GUI_DispDecShift(signed long v, unsigned char Len, unsigned char Shift);
void GUI_DispDecSpace(signed long v, unsigned char MaxDigits);
void GUI_DispHex (unsigned long v, unsigned char Len);
void GUI_DispHexAt(unsigned long v, signed short x, signed short y, unsigned char Len);
void GUI_DispSDec(signed long v, unsigned char Len);
void GUI_DispSDecShift(signed long v, unsigned char Len, unsigned char Shift);





void GUI_DispFloat (float v, char Len);
void GUI_DispFloatFix (float v, char Len, char Fract);
void GUI_DispFloatMin (float v, char Fract);
void GUI_DispSFloatFix(float v, char Len, char Fract);
void GUI_DispSFloatMin(float v, char Fract);





typedef struct {
  unsigned long TotalBytes;
  unsigned long FreeBytes;
  unsigned long UsedBytes;
  unsigned long AllocSize;
  unsigned long NumFixedBytes;
  unsigned long MaxUsedBytes;
} GUI_ALLOC_INFO;

signed long GUI_ALLOC_GetNumFreeBlocks(void);
signed long GUI_ALLOC_GetNumFreeBytes (void);
signed long GUI_ALLOC_GetNumUsedBlocks(void);
signed long GUI_ALLOC_GetNumUsedBytes (void);
signed long GUI_ALLOC_GetMaxUsedBytes (void);

void GUI_ALLOC_GetMemInfo (GUI_ALLOC_INFO * pInfo);
void GUI_ALLOC_SuppressPeak(int OnOff);

signed long GUI_ALLOC_AllocInit (const void * pInitData, signed long Size);
signed long GUI_ALLOC_AllocNoInit (signed long size);
signed long GUI_ALLOC_AllocZero (signed long size);
void GUI_ALLOC_AssignMemory (void * p, unsigned long NumBytes);
void GUI_ALLOC_Free (signed long hMem);
void GUI_ALLOC_FreeFixedBlock (void * p);
void GUI_ALLOC_FreePtrArray (signed long * pArray, int NumElems);
void GUI_ALLOC_FreePtr (signed long * phMem);
void * GUI_ALLOC_GetFixedBlock (signed long Size);
signed long GUI_ALLOC_GetMaxSize (void);
signed long GUI_ALLOC_GetSize (signed long hMem);
void * GUI_ALLOC_h2p (signed long hMem);
signed long GUI_ALLOC_p2h (void * p);
void GUI_ALLOC_Init (void);
void GUI_ALLOC_Lock (void);
void * GUI_ALLOC_LockH (signed long hMem);
signed long GUI_ALLOC_Realloc (signed long hOld, int NewSize);
signed long GUI_ALLOC_RequestSize (void);
void GUI_ALLOC_SetAvBlockSize (unsigned long BlockSize);
void GUI_ALLOC_Unlock (void);
void * GUI_ALLOC_UnlockH (void ** pp);
int GUI_ALLOC_SetMaxPercentage(int MaxPercentage);
void GUI_ALLOC_Exit (void);
# 951 "../Middlewares/ST/STemWin/inc\\GUI.h"
typedef signed long GUI_MEMDEV_Handle;
typedef void GUI_CALLBACK_VOID_P (void * p);
typedef int GUI_ANIMATION_CALLBACK_FUNC(int TimeRem, void * pVoid);
typedef void GUI_DRAWMEMDEV_16BPP_FUNC (void * pDst, const void * pSrc, int xSize, int ySize, int BytesPerLineDst, int BytesPerLineSrc);



typedef void GUI_DRAWBITMAP_FUNC (int LayerIndex, int x, int y, const void * p, int xSize, int ySize, int BytesPerLine);

int GUI_SetFuncDrawAlpha(GUI_DRAWMEMDEV_16BPP_FUNC * pfDrawMemdevFunc, GUI_DRAWBITMAP_FUNC * pfDrawBitmapFunc);
int GUI_SetFuncDrawM565 (GUI_DRAWMEMDEV_16BPP_FUNC * pfDrawMemdevFunc, GUI_DRAWBITMAP_FUNC * pfDrawBitmapFunc);

extern GUI_ANIMATION_CALLBACK_FUNC * GUI_MEMDEV__pCbAnimation;
extern void * GUI_MEMDEV__pVoid;

extern void (* GUI_MEMDEV__pfMEMDEV_Write) (GUI_MEMDEV_Handle hMem);
extern void (* GUI_MEMDEV__pfMEMDEV_CopyToLCD)(GUI_MEMDEV_Handle hMem);

typedef struct {
  GUI_RECT rView, rPrev;
  char FirstCall;
} GUI_AUTODEV;

typedef struct {
  char DrawFixed;
  char IsMeasurement;
} GUI_AUTODEV_INFO;

int GUI_MEMDEV_CreateAuto(GUI_AUTODEV * pAutoDev);
void GUI_MEMDEV_DeleteAuto(GUI_AUTODEV * pAutoDev);
int GUI_MEMDEV_DrawAuto (GUI_AUTODEV * pAutoDev, GUI_AUTODEV_INFO * pAutoDevInfo, GUI_CALLBACK_VOID_P * pfDraw, void * pData);


GUI_MEMDEV_Handle GUI_MEMDEV_Create (int x0, int y0, int xSize, int ySize);
GUI_MEMDEV_Handle GUI_MEMDEV_CreateEx (int x0, int y0, int xSize, int ySize, int Flags);
GUI_MEMDEV_Handle GUI_MEMDEV_CreateFixed (int x0, int y0, int xSize, int ySize, int Flags,
                                           const GUI_DEVICE_API * pDeviceAPI,
                                           const LCD_API_COLOR_CONV * pColorConvAPI);
GUI_MEMDEV_Handle GUI_MEMDEV_CreateFixed32(int x0, int y0, int xSize, int ySize);

void GUI_MEMDEV_Clear (GUI_MEMDEV_Handle hMem);
int GUI_MEMDEV_ClearAlpha (GUI_MEMDEV_Handle hMemData, GUI_MEMDEV_Handle hMemMask);
void GUI_MEMDEV_CopyFromLCD (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_CopyFromLCDAA (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_CopyToLCD (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_CopyToLCDAA (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_CopyToLCDAt (GUI_MEMDEV_Handle hMem, int x, int y);
int GUI_MEMDEV_CompareWithLCD (GUI_MEMDEV_Handle hMem, int * px, int * py, int * pExp, int * pAct);
void GUI_MEMDEV_Delete (GUI_MEMDEV_Handle MemDev);
void GUI_MEMDEV_DrawPerspectiveX (GUI_MEMDEV_Handle hMem, int x, int y, int h0, int h1, int dx, int dy);
int GUI_MEMDEV_GetXPos (GUI_MEMDEV_Handle hMem);
int GUI_MEMDEV_GetXSize (GUI_MEMDEV_Handle hMem);
int GUI_MEMDEV_GetYPos (GUI_MEMDEV_Handle hMem);
int GUI_MEMDEV_GetYSize (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_MarkDirty (GUI_MEMDEV_Handle hMem, int x0, int y0, int x1, int y1);
void GUI_MEMDEV_ReduceYSize (GUI_MEMDEV_Handle hMem, int YSize);
void GUI_MEMDEV_Rotate (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag);
void GUI_MEMDEV_RotateAlpha (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag, unsigned char Alpha);
void GUI_MEMDEV_RotateHR (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, signed long dx, signed long dy, int a, int Mag);
void GUI_MEMDEV__Rotate (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag, unsigned long Mask);
void GUI_MEMDEV__RotateHR (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, signed long dx, signed long dy, int a, int Mag, unsigned long Mask);
void GUI_MEMDEV_RotateHQ (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag);
void GUI_MEMDEV_RotateHQAlpha (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag, unsigned char Alpha);
void GUI_MEMDEV_RotateHQHR (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, signed long dx, signed long dy, int a, int Mag);
void GUI_MEMDEV_RotateHQT (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag);
void GUI_MEMDEV_RotateHQTI (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag);
GUI_MEMDEV_Handle GUI_MEMDEV_Select (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_SetOrg (GUI_MEMDEV_Handle hMem, int x0, int y0);
void GUI_MEMDEV_WriteAt (GUI_MEMDEV_Handle hMem, int x, int y);
void GUI_MEMDEV_Write (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_WriteAlphaAt (GUI_MEMDEV_Handle hMem, int Alpha, int x, int y);
void GUI_MEMDEV_WriteAlpha (GUI_MEMDEV_Handle hMem, int Alpha);
void GUI_MEMDEV_WriteExAt (GUI_MEMDEV_Handle hMem, int x, int y, int xMag, int yMag, int Alpha);
void GUI_MEMDEV_WriteEx (GUI_MEMDEV_Handle hMem, int xMag, int yMag, int Alpha);
void GUI_MEMDEV_WriteOpaque (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_WriteOpaqueAt (GUI_MEMDEV_Handle hMem, int x, int y);
int GUI_MEMDEV_Draw (GUI_RECT * pRect, GUI_CALLBACK_VOID_P * pfDraw, void * pData, int NumLines, int Flags);
void* GUI_MEMDEV_GetDataPtr (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_SetColorConv (GUI_MEMDEV_Handle hMem, const LCD_API_COLOR_CONV * pColorConvAPI);
const LCD_API_COLOR_CONV * GUI_MEMDEV_GetColorConv(GUI_MEMDEV_Handle hMemDev);
int GUI_MEMDEV_GetBitsPerPixel (GUI_MEMDEV_Handle hMemDev);
int GUI_MEMDEV_FadeInDevices (GUI_MEMDEV_Handle hMem0, GUI_MEMDEV_Handle hMem1, int Period);
int GUI_MEMDEV_FadeOutDevices (GUI_MEMDEV_Handle hMem0, GUI_MEMDEV_Handle hMem1, int Period);
void GUI_MEMDEV_SerializeBMP (GUI_MEMDEV_Handle hDev, GUI_CALLBACK_VOID_U8_P * pfSerialize, void * p);
void GUI_MEMDEV_SetAnimationCallback(GUI_ANIMATION_CALLBACK_FUNC * pCbAnimation, void * pVoid);
void GUI_MEMDEV__FadeDevice (GUI_MEMDEV_Handle hMemWin, GUI_MEMDEV_Handle hMemBk, GUI_MEMDEV_Handle hMemDst, unsigned char Intens);
void GUI_MEMDEV__FadeDeviceEx (GUI_MEMDEV_Handle hMemWin, GUI_MEMDEV_Handle hMemBk, GUI_MEMDEV_Handle hMemDst, unsigned char Intens, int xPosWin, int yPosWin);
int GUI_MEMDEV_PunchOutDevice (GUI_MEMDEV_Handle hMemData, GUI_MEMDEV_Handle hMemMask);
void GUI_MEMDEV_SetTimePerFrame (unsigned TimePerFrame);
int GUI_MEMDEV_MULTIBUF_Enable (int OnOff);

void GUI_SelectLCD(void);


GUI_MEMDEV_Handle GUI_MEMDEV_CreateBlurredDevice32 (GUI_MEMDEV_Handle hMem, unsigned char Depth);
GUI_MEMDEV_Handle GUI_MEMDEV_CreateBlurredDevice32HQ(GUI_MEMDEV_Handle hMem, unsigned char Depth);
GUI_MEMDEV_Handle GUI_MEMDEV_CreateBlurredDevice32LQ(GUI_MEMDEV_Handle hMem, unsigned char Depth);
void GUI_MEMDEV_SetBlurHQ (void);
void GUI_MEMDEV_SetBlurLQ (void);
int GUI_MEMDEV_BlendColor32 (GUI_MEMDEV_Handle hMem, unsigned long BlendColor, unsigned char BlendIntens);
int GUI_MEMDEV_Dither32 (GUI_MEMDEV_Handle hMem, const LCD_API_COLOR_CONV * pColorConvAPI);


void GUI_MEMDEV_SetDrawMemdev16bppFunc(GUI_DRAWMEMDEV_16BPP_FUNC * pfDrawMemdev16bppFunc);





typedef struct {
  unsigned long UserAlpha;
} GUI_ALPHA_STATE;



unsigned GUI_EnableAlpha (unsigned OnOff);
unsigned long GUI_RestoreUserAlpha (GUI_ALPHA_STATE * pAlphaState);
unsigned GUI_SetAlpha (unsigned char Alpha);
unsigned long GUI_SetUserAlpha (GUI_ALPHA_STATE * pAlphaState, unsigned long UserAlpha);
void (* GUI_SetFuncAlphaBlending(void (* pfAlphaBlending)(LCD_COLOR *, LCD_COLOR *, LCD_COLOR *, unsigned long)))
                                                              (LCD_COLOR *, LCD_COLOR *, LCD_COLOR *, unsigned long);
LCD_COLOR (* GUI_SetFuncMixColors (LCD_COLOR (* pFunc)(LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens)))
                                                         (LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);
void (* GUI_SetFuncMixColorsBulk(void (* pFunc)(unsigned long * pFG, unsigned long * pBG, unsigned long * pDst, unsigned OffFG, unsigned OffBG, unsigned OffDest, unsigned xSize, unsigned ySize, unsigned char Intens)))
                                                    (unsigned long * pFG, unsigned long * pBG, unsigned long * pDst, unsigned OffFG, unsigned OffBG, unsigned OffDest, unsigned xSize, unsigned ySize, unsigned char Intens);
unsigned GUI_PreserveTrans (unsigned OnOff);





unsigned GUI_SelectLayer(unsigned Index);
unsigned GUI_GetSelLayer(void);

int GUI_SetLayerPosEx (unsigned Index, int xPos, int yPos);
int GUI_SetLayerSizeEx (unsigned Index, int xSize, int ySize);
int GUI_SetLayerVisEx (unsigned Index, int OnOff);
int GUI_SetLayerAlphaEx(unsigned Index, int Alpha);
int GUI_GetLayerPosEx (unsigned Index, int * pxPos, int * pyPos);

void GUI_AssignCursorLayer(unsigned Index, unsigned CursorLayer);
unsigned GUI_GetCursorLayer (unsigned Index);





void GUI_SetOrg(int x, int y);

void GUI_MULTIBUF_Begin (void);
void GUI_MULTIBUF_BeginEx (int LayerIndex);
void GUI_MULTIBUF_End (void);
void GUI_MULTIBUF_EndEx (int LayerIndex);
void GUI_MULTIBUF_Config (int NumBuffers);
void GUI_MULTIBUF_ConfigEx (int LayerIndex, int NumBuffers);
void GUI_MULTIBUF_Confirm (int Index);
void GUI_MULTIBUF_ConfirmEx (int LayerIndex, int BufferIndex);
int GUI_MULTIBUF_GetNumBuffers (void);
int GUI_MULTIBUF_GetNumBuffersEx(int LayerIndex);
void GUI_MULTIBUF_SetLayerMask (unsigned long LayerMask);
void GUI_MULTIBUF_UseSingleBuffer(void);





int GUI_SPY_Process (GUI_tSend pfSend, GUI_tRecv pfRecv, void * pConnectInfo);
void GUI_SPY_SetMemHandler(GUI_tMalloc pMalloc, GUI_tFree pFree);
int GUI_SPY_StartServer (void);
int GUI_SPY_X_StartServer(void);
# 1131 "../Middlewares/ST/STemWin/inc\\GUI.h"
typedef struct {
  int Version;
  int Width;
  int Size;
} GUI_QR_INFO;

signed long GUI_QR_Create (const char * pText, int PixelSize, int EccLevel, int Version);
void GUI_QR_Draw (signed long hQR, int xPos, int yPos);
void GUI_QR_GetInfo(signed long hQR, GUI_QR_INFO * pInfo);
void GUI_QR_Delete (signed long hQR);
# 1159 "../Middlewares/ST/STemWin/inc\\GUI.h"
typedef signed long GUI_ANIM_HANDLE;

typedef signed long (* GUI_ANIM_GETPOS_FUNC)(int ts, int te, int tNow);

typedef struct {
  int Pos;
  int State;
  GUI_ANIM_HANDLE hAnim;
  int Period;
} GUI_ANIM_INFO;

typedef void GUI_ANIMATION_FUNC(GUI_ANIM_INFO * pInfo, void * pVoid);

signed long GUI_ANIM__Linear (int ts, int te, int tNow);
signed long GUI_ANIM__Decel (int ts, int te, int tNow);
signed long GUI_ANIM__Accel (int ts, int te, int tNow);
signed long GUI_ANIM__AccelDecel(int ts, int te, int tNow);

int GUI_ANIM_AddItem(GUI_ANIM_HANDLE hAnim, int ts, int te, GUI_ANIM_GETPOS_FUNC pfGetPos, void * pVoid, GUI_ANIMATION_FUNC * pfAnim);
GUI_ANIM_HANDLE GUI_ANIM_Create (int Period, unsigned MinTimePerFrame, void * pVoid, void (* pfSliceInfo)(int State, void * pVoid));
void GUI_ANIM_Delete (GUI_ANIM_HANDLE hAnim);
int GUI_ANIM_Exec (GUI_ANIM_HANDLE hAnim);
void GUI_ANIM_Start (GUI_ANIM_HANDLE hAnim);
void GUI_ANIM_StartEx(GUI_ANIM_HANDLE hAnim, int NumLoops, void (* pfOnDelete)(void * pVoid));
void GUI_ANIM_Stop (GUI_ANIM_HANDLE hAnim);
# 1193 "../Middlewares/ST/STemWin/inc\\GUI.h"
typedef struct {
  void (* pfDrawBitmap )(GUI_DEVICE * pDevice, int x0, int y0, int xsize, int ysize, int BitsPerPixel, int BytesPerLine, const unsigned char * pData, int Diff, const unsigned long * pTrans);
  void (* pfDrawHLine )(GUI_DEVICE * pDevice, int x0, int y0, int x1);
  void (* pfDrawVLine )(GUI_DEVICE * pDevice, int x , int y0, int y1);
  void (* pfFillRect )(GUI_DEVICE * pDevice, int x0, int y0, int x1, int y1);
  unsigned long (* pfGetPixelIndex)(GUI_DEVICE * pDevice, int x, int y);
  void (* pfSetPixelIndex)(GUI_DEVICE * pDevice, int x, int y, unsigned long ColorIndex);
  void (* pfXorPixel )(GUI_DEVICE * pDevice, int x, int y);
  int BytesPerPixel;
} GUI_ORIENTATION_API;

extern const GUI_ORIENTATION_API GUI_OrientationAPI_C0;
extern const GUI_ORIENTATION_API GUI_OrientationAPI_C8;
extern const GUI_ORIENTATION_API GUI_OrientationAPI_C16;
extern const GUI_ORIENTATION_API GUI_OrientationAPI_C32;






int GUI_SetOrientation (int Orientation);
int GUI_SetOrientationEx (int Orientation, int LayerIndex);
int GUI_SetOrientationExCached(int Orientation, int LayerIndex, const GUI_ORIENTATION_API * pAPI);





typedef signed long GUI_MEASDEV_Handle;

GUI_MEASDEV_Handle GUI_MEASDEV_Create (void);
void GUI_MEASDEV_Delete (GUI_MEASDEV_Handle hMemDev);
void GUI_MEASDEV_Select (GUI_MEASDEV_Handle hMem);
void GUI_MEASDEV_GetRect(GUI_MEASDEV_Handle hMem, GUI_RECT * pRect);
void GUI_MEASDEV_ClearRect(GUI_MEASDEV_Handle hMem);





void GUI_RotatePolygon (GUI_POINT * pDest, const GUI_POINT * pSrc, int NumPoints, float Angle);
void GUI_MagnifyPolygon(GUI_POINT * pDest, const GUI_POINT * pSrc, int NumPoints, int Mag);
void GUI_EnlargePolygon(GUI_POINT * pDest, const GUI_POINT * pSrc, int NumPoints, int Len);
# 1248 "../Middlewares/ST/STemWin/inc\\GUI.h"
int GUI_CreateBitmapFromStreamIDX(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamRLE4(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamRLE8(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStream565(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamM565(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStream555(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamM555(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamA565(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamAM565(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamA555(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamAM555(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamRLE16(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamRLEM16(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStream24(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamAlpha(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamM8888I(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamRLEAlpha(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamRLE32(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStream444_12(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamM444_12(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStream444_12_1(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamM444_12_1(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStream444_16(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamM444_16(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);

int GUI_CreateBitmapFromStream (GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
void GUI_DrawStreamedBitmap (const void * p, int x, int y);
void GUI_DrawStreamedBitmapAuto (const void * p, int x, int y);
int GUI_DrawStreamedBitmapEx (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
int GUI_DrawStreamedBitmapExAuto (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
int GUI_DrawStreamedBitmap555Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
int GUI_DrawStreamedBitmapM555Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
int GUI_DrawStreamedBitmap565Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
int GUI_DrawStreamedBitmapM565Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
int GUI_DrawStreamedBitmapA555Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
int GUI_DrawStreamedBitmapAM555Ex(GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
int GUI_DrawStreamedBitmapA565Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
int GUI_DrawStreamedBitmapAM565Ex(GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
int GUI_DrawStreamedBitmap24Ex (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
void GUI_GetStreamedBitmapInfo (const void * p, GUI_BITMAPSTREAM_INFO * pInfo);
int GUI_GetStreamedBitmapInfoEx (GUI_GET_DATA_FUNC * pfGetData, const void * p, GUI_BITMAPSTREAM_INFO * pInfo);
void GUI_SetStreamedBitmapHook (GUI_BITMAPSTREAM_CALLBACK pfStreamedBitmapHook);

void LCD__RLE4_SetFunc (GUI_GET_DATA_FUNC * pfGetData, void * pVoid, unsigned long Off, const LCD_LOGPALETTE * pLogPal);
void LCD__RLE8_SetFunc (GUI_GET_DATA_FUNC * pfGetData, void * pVoid, unsigned long Off, const LCD_LOGPALETTE * pLogPal);
void LCD__RLE16_SetFunc(GUI_GET_DATA_FUNC * pfGetData, void * pVoid, unsigned long Off);
void LCD__RLE32_SetFunc(GUI_GET_DATA_FUNC * pfGetData, void * pVoid, unsigned long Off);





void GUI_BMP_Serialize (GUI_CALLBACK_VOID_U8_P * pfSerialize, void * p);
void GUI_BMP_SerializeEx (GUI_CALLBACK_VOID_U8_P * pfSerialize, int x0, int y0, int xSize, int ySize, void * p);
void GUI_BMP_SerializeExBpp(GUI_CALLBACK_VOID_U8_P * pfSerialize, int x0, int y0, int xSize, int ySize, void * p, int BitsPerPixel);

void GUI_BMP__WriteBitmapHeader(GUI_CALLBACK_VOID_U8_P * pfSerialize, int xSize, int ySize, void * p, int BitsPerPixel, int BytesPerLine, int BytesPerPixel, int NumColors, int Padding);





void GUI_Delay (int Period);
int GUI_GetTime (void);
int GUI_GetTimeSlice(void);
int GUI_Exec (void);
int GUI_Exec1 (void);
void GUI_SetTimeSlice(int TimeSlice);





int GUI_MessageBox (const char * sMessage, const char * sCaption, int Flags);
# 1335 "../Middlewares/ST/STemWin/inc\\GUI.h"
typedef signed long GUI_TIMER_HANDLE;

typedef struct {
  int Time;
  unsigned long Context;
  GUI_TIMER_HANDLE hTimer;
} GUI_TIMER_MESSAGE;

typedef void GUI_TIMER_CALLBACK( GUI_TIMER_MESSAGE* pTM);

GUI_TIMER_HANDLE GUI_TIMER_Create (GUI_TIMER_CALLBACK * cb, int Time, unsigned long Context, unsigned short Flags);
void GUI_TIMER_Delete (GUI_TIMER_HANDLE hObj);


int GUI_TIMER_GetPeriod(GUI_TIMER_HANDLE hObj);
void GUI_TIMER_SetPeriod(GUI_TIMER_HANDLE hObj, int Period);
void GUI_TIMER_SetTime (GUI_TIMER_HANDLE hObj, int Period);
void GUI_TIMER_SetDelay (GUI_TIMER_HANDLE hObj, int Delay);
void GUI_TIMER_Restart (GUI_TIMER_HANDLE hObj);
int GUI_TIMER_GetFlag (GUI_TIMER_HANDLE hObj, int Flag);
int GUI_TIMER_Exec (void);
# 1364 "../Middlewares/ST/STemWin/inc\\GUI.h"
void GUI_AA_DisableHiRes (void);
void GUI_AA_EnableHiRes (void);
int GUI_AA_GetFactor (void);
void GUI_AA_SetFactor (int Factor);
void GUI_AA_DrawArc (int x0, int y0, int rx, int ry, int a0, int a1);
void GUI_AA_DrawLine (int x0, int y0, int x1, int y1);
void GUI_AA_DrawPolyOutline (const GUI_POINT * pSrc, int NumPoints, int Thickness, int x, int y);
void GUI_AA_DrawPolyOutlineEx(const GUI_POINT * pSrc, int NumPoints, int Thickness, int x, int y, GUI_POINT * pBuffer);
void GUI_AA_DrawRoundedRect (int x0, int y0, int x1, int y1, int r);
void GUI_AA_DrawRoundedRectEx(GUI_RECT * pRect, int r);
void GUI_AA_FillCircle (int x0, int y0, int r);
void GUI_AA_FillEllipse (int x0, int y0, int rx, int ry);
void GUI_AA_FillPolygon (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
void GUI_AA_FillRoundedRect (int x0, int y0, int x1, int y1, int r);
void GUI_AA_FillRoundedRectEx(GUI_RECT * pRect, int r);
int GUI_AA_SetDrawMode (int Mode);
void GUI_AA_SetpfDrawCharAA4 (int (* pfDrawChar)(int LayerIndex, int x, int y, unsigned char const * p, int xSize, int ySize, int BytesPerLine));
void GUI_AA_SetGammaAA4 (unsigned char * pGamma);
void GUI_AA_GetGammaAA4 (unsigned char * pGamma);
void GUI_AA_EnableGammaAA4 (int OnOff);
# 1392 "../Middlewares/ST/STemWin/inc\\GUI.h"
void GUI_StoreKeyMsg(int Key, int Pressed);
void GUI_SendKeyMsg (int Key, int Pressed);
int GUI_PollKeyMsg (void);
void GUI_GetKeyState(GUI_KEY_STATE * pState);

void GUI_KEY__SetHook(void (* pfHook)(const GUI_KEY_STATE *));


int GUI_GetKey(void);
int GUI_WaitKey(void);
void GUI_StoreKey(int c);
void GUI_ClearKeyBuffer(void);





void GUI_WaitEvent (void);
void GUI_SignalEvent (void);
void GUI_SetSignalEventFunc (GUI_SIGNAL_EVENT_FUNC pfSignalEvent);
void GUI_SetWaitEventFunc (GUI_WAIT_EVENT_FUNC pfWaitEvent);
void GUI_SetWaitEventTimedFunc(GUI_WAIT_EVENT_TIMED_FUNC pfWaitEventTimed);





void GUI_JOYSTICK_StoreState(const GUI_PID_STATE * pState);





void GUI_PID_StoreState (const GUI_PID_STATE * pState);
int GUI_PID_GetState ( GUI_PID_STATE * pState);
void GUI_PID_GetCurrentState( GUI_PID_STATE * pState);
int GUI_PID_IsEmpty (void);
int GUI_PID_IsPressed (void);
void GUI_PID_SetHook (void (* pfHook)( GUI_PID_STATE *));
void GUI_PID__SetHook (void (* pfHook)(const GUI_PID_STATE *));





int GUI_MOUSE_GetState ( GUI_PID_STATE * pState);
void GUI_MOUSE_StoreState(const GUI_PID_STATE * pState);





int GUI_TOUCH_GetLayer (void);
int GUI_TOUCH_GetState (GUI_PID_STATE * pState);
void GUI_TOUCH_GetUnstable (int * px, int * py);
void GUI_TOUCH_SetLayer (int Layer);
void GUI_TOUCH_StoreState (int x, int y);
void GUI_TOUCH_StoreStateEx (const GUI_PID_STATE * pState);
void GUI_TOUCH_StoreUnstable(int x, int y);





void GUI_MOUSE_DRIVER_PS2_Init(void);
void GUI_MOUSE_DRIVER_PS2_OnRx(unsigned char Data);





int GUI_TOUCH_CalcCoefficients (int NumPoints, int * pxRef, int * pyRef, int * pxSample, int * pySample, int xSize, int ySize);
int GUI_TOUCH_Calibrate (int Coord, int Log0, int Log1, int Phys0, int Phys1);
int GUI_TOUCH_CalibratePoint (int * px, int * py);
void GUI_TOUCH_EnableCalibration(int OnOff);
void GUI_TOUCH_Exec (void);
int GUI_TOUCH_GetxPhys (void);
int GUI_TOUCH_GetyPhys (void);
void GUI_TOUCH_SetCalibration (int (* pFunc)(int *, int *));
void GUI_TOUCH_SetOrientation (unsigned Orientation);
int GUI_TOUCH_TransformPoint (int * px, int * py);
# 1482 "../Middlewares/ST/STemWin/inc\\GUI.h"
void GUI_TOUCH_X_ActivateX(void);
void GUI_TOUCH_X_ActivateY(void);
void GUI_TOUCH_X_Disable (void);
int GUI_TOUCH_X_MeasureX (void);
int GUI_TOUCH_X_MeasureY (void);
# 1505 "../Middlewares/ST/STemWin/inc\\GUI.h"
void GUI_X_Config(void);
void GUI_X_Init (void);




int GUI_X_GetTime(void);
void GUI_X_Delay (int Period);




void GUI_X_Unlock (void);
void GUI_X_Lock (void);
unsigned long GUI_X_GetTaskId(void);
void GUI_X_InitOS (void);




void GUI_X_ExecIdle (void);
void GUI_X_WaitEvent (void);
void GUI_X_WaitEventTimed(int Period);
void GUI_X_SignalEvent (void);




void GUI_X_Log (const char * s);
void GUI_X_Warn (const char * s);
void GUI_X_ErrorOut(const char * s);





extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE4;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE4Ex;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE8;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE8Ex;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE16;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE16Ex;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLEM16;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLEM16Ex;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE32;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE32Ex;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLEAlpha;

extern const GUI_BITMAP_METHODS GUI_BitmapMethods444_12;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM444_12;
extern const GUI_BITMAP_METHODS GUI_BitmapMethods444_12_1;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM444_12_1;
extern const GUI_BITMAP_METHODS GUI_BitmapMethods444_16;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM444_16;
extern const GUI_BITMAP_METHODS GUI_BitmapMethods555;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM555;
extern const GUI_BITMAP_METHODS GUI_BitmapMethods565;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM565;
extern const GUI_BITMAP_METHODS GUI_BitmapMethods24;
extern const GUI_BITMAP_METHODS GUI_BitmapMethods888;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM888;
extern const GUI_BITMAP_METHODS GUI_BitmapMethods8888;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM8888I;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsA565;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsAM565;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsA555;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsAM555;
# 1603 "../Middlewares/ST/STemWin/inc\\GUI.h"
extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop;
extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_Ext;
extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_Frm;
extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_AA2;
extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_AA4;
extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_AA2_EXT;
extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_AA4_EXT;

extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop;
extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop_Ext;
extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop_Frm;
extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop_AA2_Ext;
extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop_AA4_Ext;
# 1988 "../Middlewares/ST/STemWin/inc\\GUI.h"
extern T_GUI_MTOUCH_STOREEVENT GUI_MTOUCH__pStoreEvent;




void GUI_MTOUCH_Enable (int OnOff);
int GUI_MTOUCH_GetEvent (GUI_MTOUCH_EVENT * pEvent);
int GUI_MTOUCH_GetTouchInput (GUI_MTOUCH_EVENT * pEvent, GUI_MTOUCH_INPUT * pBuffer, unsigned Index);
int GUI_MTOUCH_IsEmpty (void);
void GUI_MTOUCH_SetOrientation (int Orientation);
void GUI_MTOUCH_SetOrientationEx(int Orientation, int LayerIndex);
void GUI_MTOUCH_StoreEvent (GUI_MTOUCH_EVENT * pEvent, GUI_MTOUCH_INPUT * pInput);
# 2015 "../Middlewares/ST/STemWin/inc\\GUI.h"
extern const GUI_FONT GUI_Font8_ASCII, GUI_Font8_1;
extern const GUI_FONT GUI_Font10S_ASCII, GUI_Font10S_1;
extern const GUI_FONT GUI_Font10_ASCII, GUI_Font10_1;
extern const GUI_FONT GUI_Font13_ASCII, GUI_Font13_1;
extern const GUI_FONT GUI_Font13B_ASCII, GUI_Font13B_1;
extern const GUI_FONT GUI_Font13H_ASCII, GUI_Font13H_1;
extern const GUI_FONT GUI_Font13HB_ASCII, GUI_Font13HB_1;
extern const GUI_FONT GUI_Font16_ASCII, GUI_Font16_1, GUI_Font16_HK, GUI_Font16_1HK;
extern const GUI_FONT GUI_Font16B_ASCII, GUI_Font16B_1;
extern const GUI_FONT GUI_Font20_ASCII, GUI_Font20_1;
extern const GUI_FONT GUI_Font20B_ASCII, GUI_Font20B_1;
extern const GUI_FONT GUI_Font24_ASCII, GUI_Font24_1;
extern const GUI_FONT GUI_Font24B_ASCII, GUI_Font24B_1;
extern const GUI_FONT GUI_Font32_ASCII, GUI_Font32_1;
extern const GUI_FONT GUI_Font32B_ASCII, GUI_Font32B_1;




extern const GUI_FONT GUI_Font20F_ASCII;




extern const GUI_FONT GUI_Font4x6;
extern const GUI_FONT GUI_Font6x8, GUI_Font6x9;
extern const GUI_FONT GUI_Font6x8_ASCII, GUI_Font6x8_1;
extern const GUI_FONT GUI_Font8x8, GUI_Font8x9;
extern const GUI_FONT GUI_Font8x8_ASCII, GUI_Font8x8_1;
extern const GUI_FONT GUI_Font8x10_ASCII;
extern const GUI_FONT GUI_Font8x12_ASCII;
extern const GUI_FONT GUI_Font8x13_ASCII, GUI_Font8x13_1;
extern const GUI_FONT GUI_Font8x15B_ASCII, GUI_Font8x15B_1;
extern const GUI_FONT GUI_Font8x16, GUI_Font8x17, GUI_Font8x18;
extern const GUI_FONT GUI_Font8x16x1x2, GUI_Font8x16x2x2, GUI_Font8x16x3x3;
extern const GUI_FONT GUI_Font8x16_ASCII, GUI_Font8x16_1;




extern const GUI_FONT GUI_FontD24x32;
extern const GUI_FONT GUI_FontD32;
extern const GUI_FONT GUI_FontD36x48;
extern const GUI_FONT GUI_FontD48;
extern const GUI_FONT GUI_FontD48x64;
extern const GUI_FONT GUI_FontD64;
extern const GUI_FONT GUI_FontD60x80;
extern const GUI_FONT GUI_FontD80;




extern const GUI_FONT GUI_FontComic18B_ASCII, GUI_FontComic18B_1;
extern const GUI_FONT GUI_FontComic24B_ASCII, GUI_FontComic24B_1;
# 27 "../Inc\\Resource.h" 2
# 42 "../Inc\\Resource.h"
extern const GUI_FONT GUI_Font23S_AA4;
extern const GUI_FONT GUI_Font23SL_AA4;
extern const GUI_FONT GUI_Font32S_AA4;
extern const GUI_FONT GUI_Font32SL_AA4;



extern const GUI_BITMAP bmbckgnd_thermostat;


extern const GUI_BITMAP bmknob;
# 63 "../Inc\\Resource.h"
extern const GUI_BITMAP * apbmdoor_bell_anim[10];
extern const unsigned aDelaydoor_bell_anim[10];
# 20 "../Src/display.c" 2
# 1 "../Inc\\one_wire.h" 1
# 20 "../Inc\\one_wire.h"
typedef enum
{
 ONEWIRE_INIT = 0x00,
 ONEWIRE_PACKET_PENDING = 0x01,
 ONEWIRE_PACKET_RECEIVED = 0x02,
 ONEWIRE_PACKET_SEND = 0x03,
 ONEWIRE_ERROR = 0x04

}OnewireStateTypeDef;

typedef struct
{
 uint8_t sensor_id;
 uint8_t rom_code[8];
 int temperature;

}TempSensorTypeDef;

extern OnewireStateTypeDef OnewireState;
extern TempSensorTypeDef ds18b20_1;
extern TempSensorTypeDef ds18b20_2;
extern TempSensorTypeDef ds18b20_3;
extern TempSensorTypeDef ds18b20_4;
extern TempSensorTypeDef ds18b20_5;
extern TempSensorTypeDef ds18b20_6;
extern TempSensorTypeDef ds18b20_7;
extern TempSensorTypeDef ds18b20_8;
# 141 "../Inc\\one_wire.h"
extern volatile uint32_t onewire_timer;
extern volatile uint32_t onewire_timeout_timer;
extern uint32_t onewire_flags;
extern uint8_t onewire_buffer[96];
# 166 "../Inc\\one_wire.h"
void ONEWIRE_Init(void);
void ONEWIRE_Service(void);
void ONEWIRE_SetUsart(uint32_t setup);
# 21 "../Src/display.c" 2
# 1 "../Inc\\common.h" 1
# 37 "../Inc\\common.h"
void Delay(volatile uint32_t nCount);
int GetLenght(char * p);
uint8_t Bcd2Dec(uint8_t bcd);
uint8_t Dec2Bcd(uint8_t dec);
uint8_t CalcCRC(uint8_t *buff, uint8_t size);
void Int2Str(uint8_t *p_str, uint32_t intnum);
void ClearBuffer(uint8_t *buffer, uint32_t size);
void ClearBuffer16(uint16_t * buffer, uint32_t size);
uint32_t Str2Int(uint8_t *inputstr, uint32_t *intnum);
uint16_t CalcChecksum(const uint8_t *p_data, uint32_t size);
void Str2Hex(uint8_t *p_str, uint16_t lenght, uint8_t *p_hex);
void Hex2Str(uint8_t *p_hex, uint16_t lenght, uint8_t *p_str);
void Int2StrSized(uint8_t *p_str, uint32_t intnum, uint8_t size);
void CharToBin(unsigned char c, char *out);
# 22 "../Src/display.c" 2
# 1 "../Inc\\thermostat.h" 1
# 20 "../Inc\\thermostat.h"
typedef struct
{
 uint8_t valve;
 uint8_t fan_mode;
 uint8_t fan_speed;
 uint8_t ctrl_mode;
 uint16_t actual_temperature;
 uint16_t set_temperature;
 uint8_t set_temperature_diff;
 uint8_t fan_low_speed_band;
 uint8_t fan_middle_speed_band;
 uint8_t fan_speed_diff;

}THERMOSTAT_TypeDef;

extern THERMOSTAT_TypeDef Thermostat_1;
# 50 "../Inc\\thermostat.h"
extern volatile uint32_t thermostat_timer;
extern volatile uint32_t thermostat_fan_timer;
extern volatile uint32_t thermostat_valve_timer;
extern uint32_t thermostat_flags;
# 72 "../Inc\\thermostat.h"
void THERMOSTAT_Init(void);
void THERMOSTAT_Service(void);
# 23 "../Src/display.c" 2
# 1 "../Inc\\LCDConf.h" 1
# 24 "../Src/display.c" 2
# 1 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 1
# 56 "../Middlewares/ST/STemWin/inc\\DIALOG.h"
# 1 "../Middlewares/ST/STemWin/inc/WM.h" 1
# 59 "../Middlewares/ST/STemWin/inc/WM.h"
# 1 "../Middlewares/ST/STemWin/inc/WM_GUI.h" 1
# 60 "../Middlewares/ST/STemWin/inc/WM_GUI.h"
int WM__InitIVRSearch(const GUI_RECT* pMaxRect);
int WM__GetNextIVR (void);
int WM__GetOrgX_AA(void);
int WM__GetOrgY_AA(void);
# 60 "../Middlewares/ST/STemWin/inc/WM.h" 2
# 136 "../Middlewares/ST/STemWin/inc/WM.h"
typedef struct WM_WINDOW_INFO WM_WINDOW_INFO;

struct WM_WINDOW_INFO {
  signed long hWin;
  signed long hParent;
  signed long hFirstChild;
  signed long hNext;
  GUI_RECT Rect;
  unsigned long Status;
  unsigned long DebugId;
  WM_WINDOW_INFO * pNext;
};

typedef struct {
  int Key, PressedCnt;
} WM_KEY_INFO;

typedef struct {
  int NumItems, v, PageSize;
} WM_SCROLL_STATE;

typedef struct {
  int Done;
  int ReturnValue;
} WM_DIALOG_STATUS;

typedef struct {
  int x,y;
  unsigned char State;
  unsigned char StatePrev;
} WM_PID_STATE_CHANGED_INFO;

typedef struct {
  unsigned char Cmd;
  unsigned char FinalMove;
  unsigned char StopMotion;
  unsigned char IsDragging;
  int dx, dy, da;
  int xPos, yPos;
  int Period;
  int SnapX;
  int SnapY;
  unsigned char IsOutside;
  unsigned Overlap;
  unsigned long Flags;
  GUI_PID_STATE * pState;
  signed long hContext;
} WM_MOTION_INFO;

typedef struct {
  signed long FactorMin;
  signed long FactorMax;
  unsigned long xSize;
  unsigned long ySize;
  unsigned long xSizeParent;
  unsigned long ySizeParent;
  signed long Factor0;
  int xPos0;
  int yPos0;
  GUI_POINT Center0;
} WM_ZOOM_INFO;

typedef struct {
  int Flags;
  GUI_POINT Point;
  GUI_POINT Center;
  signed long Angle;
  signed long Factor;
  WM_ZOOM_INFO * pZoomInfo;
} WM_GESTURE_INFO;

typedef struct {
  int dx, dy;
} WM_MOVE_INFO;
# 401 "../Middlewares/ST/STemWin/inc/WM.h"
typedef struct WM_Obj WM_Obj;
typedef struct WM_MESSAGE WM_MESSAGE;

typedef void WM_CALLBACK( WM_MESSAGE * pMsg);

struct WM_MESSAGE {
  int MsgId;
  GUI_HWIN hWin;
  GUI_HWIN hWinSrc;
  union {
    const void * p;
    int v;
    GUI_COLOR Color;
  } Data;
};

struct WM_Obj {
  GUI_RECT Rect;
  GUI_RECT InvalidRect;
  WM_CALLBACK* cb;
  GUI_HWIN hNextLin;
  GUI_HWIN hParent;
  GUI_HWIN hFirstChild;
  GUI_HWIN hNext;

    GUI_MEMDEV_Handle hMem;

  unsigned long Status;



};

typedef void WM_tfPollPID(void);
typedef void WM_tfForEach(GUI_HWIN hWin, void * pData);

typedef void (* WM_tfInvalidateParent) (const GUI_RECT * pInvalidRect, GUI_HWIN hParent, GUI_HWIN hStop);
typedef void (* WM_tfInvalidateDrawFunc)(GUI_HWIN hWin);
typedef void (* WM_tfPaint1Func) (GUI_HWIN hWin);

typedef struct {
  signed long hTimer;
  GUI_HWIN hWin;
  int UserId;
} WM_TIMER_OBJ;





void WM_Activate (void);
void WM_Deactivate(void);
void WM_Init (void);
int WM_Exec (void);
int WM_Exec1 (void);
unsigned long WM_SetCreateFlags(unsigned long Flags);
WM_tfPollPID * WM_SetpfPollPID(WM_tfPollPID * pf);





void WM_AttachWindow (GUI_HWIN hWin, GUI_HWIN hParent);
void WM_AttachWindowAt (GUI_HWIN hWin, GUI_HWIN hParent, int x, int y);
int WM_CheckScrollPos (WM_SCROLL_STATE * pScrollState, int Pos, int LowerDist, int UpperDist);
void WM_ClrHasTrans (GUI_HWIN hWin);
GUI_HWIN WM_CreateWindow (int x0, int y0, int xSize, int ySize, unsigned long Style, WM_CALLBACK * cb, int NumExtraBytes);
GUI_HWIN WM_CreateWindowAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hWinParent, unsigned long Style, WM_CALLBACK* cb, int NumExtraBytes);
void WM_DeleteWindow (GUI_HWIN hWin);
void WM_DetachWindow (GUI_HWIN hWin);
void WM_EnableGestures (GUI_HWIN hWin, int OnOff);
int WM_GetHasTrans (GUI_HWIN hWin);
GUI_HWIN WM_GetFocusedWindow (void);
int WM_GetInvalidRect (GUI_HWIN hWin, GUI_RECT * pRect);
int WM_GetStayOnTop (GUI_HWIN hWin);
void WM_HideWindow (GUI_HWIN hWin);
void WM_InvalidateArea (const GUI_RECT * pRect);
void WM_InvalidateRect (GUI_HWIN hWin, const GUI_RECT * pRect);
void WM_InvalidateWindow (GUI_HWIN hWin);
void WM_InvalidateWindowAndDescsEx(GUI_HWIN hWin, const GUI_RECT * pInvalidRect, unsigned short Flags);
void WM_InvalidateWindowAndDescs (GUI_HWIN hWin);
int WM_IsEnabled (GUI_HWIN hObj);
char WM_IsCompletelyCovered (GUI_HWIN hWin);
char WM_IsCompletelyVisible (GUI_HWIN hWin);
int WM_IsFocusable (GUI_HWIN hWin);
int WM_IsVisible (GUI_HWIN hWin);
int WM_IsWindow (GUI_HWIN hWin);
void WM_SetAnchor (GUI_HWIN hWin, unsigned short AnchorFlags);
void WM_SetHasTrans (GUI_HWIN hWin);
void WM_SetId (GUI_HWIN hObj, int Id);
void WM_SetStayOnTop (GUI_HWIN hWin, int OnOff);
void WM_SetTransState (GUI_HWIN hWin, unsigned State);
void WM_ShowWindow (GUI_HWIN hWin);
void WM_ValidateRect (GUI_HWIN hWin, const GUI_RECT * pRect);
void WM_ValidateWindow (GUI_HWIN hWin);





void WM_GESTURE_Enable (int OnOff);
int WM_GESTURE_EnableEx(int OnOff, int MaxFactor);
void WM_GESTURE_Exec (void);
signed long WM_GESTURE_SetThresholdAngle(signed long ThresholdAngle);
signed long WM_GESTURE_SetThresholdDist (signed long ThresholdDist);


void WM_MOTION_Enable (int OnOff);
void WM_MOTION_SetMovement (GUI_HWIN hWin, int Axis, signed long Speed, signed long Dist);
void WM_MOTION_SetMotion (GUI_HWIN hWin, int Axis, signed long Speed, signed long Deceleration);
void WM_MOTION_SetMoveable (GUI_HWIN hWin, unsigned long Flags, int OnOff);
void WM_MOTION_SetDeceleration (GUI_HWIN hWin, int Axis, signed long Deceleration);
unsigned WM_MOTION_SetDefaultPeriod(unsigned Period);
void WM_MOTION_SetSpeed (GUI_HWIN hWin, int Axis, signed long Velocity);
void WM_MOTION_SetMinMotion (unsigned MinMotion);
void WM_MOTION_SetThreshold (unsigned Threshold);


signed long WM_MOTION__CreateContext(void);
void WM_MOTION__DeleteContext(signed long hContext);


void WM__SetMotionCallback (void(* cbMotion) (GUI_PID_STATE * pState, void * p));
# 532 "../Middlewares/ST/STemWin/inc/WM.h"
  int GUI_MEMDEV_BlendWinBk (GUI_HWIN hWin, int Period, unsigned long BlendColor, unsigned char BlendIntens);
  int GUI_MEMDEV_BlurAndBlendWinBk(GUI_HWIN hWin, int Period, unsigned char BlurDepth, unsigned long BlendColor, unsigned char BlendIntens);
  int GUI_MEMDEV_BlurWinBk (GUI_HWIN hWin, int Period, unsigned char BlurDepth);
  void GUI_MEMDEV_CreateStatic (GUI_HWIN hWin);
  GUI_MEMDEV_Handle GUI_MEMDEV_CreateWindowDevice(GUI_HWIN hWin);
  int GUI_MEMDEV_FadeInWindow (GUI_HWIN hWin, int Period);
  int GUI_MEMDEV_FadeOutWindow (GUI_HWIN hWin, int Period);
  GUI_MEMDEV_Handle GUI_MEMDEV_GetStaticDevice (GUI_HWIN hWin);
  GUI_MEMDEV_Handle GUI_MEMDEV_GetWindowDevice (GUI_HWIN hWin);
  int GUI_MEMDEV_MoveInWindow (GUI_HWIN hWin, int x, int y, int a180, int Period);
  int GUI_MEMDEV_MoveOutWindow (GUI_HWIN hWin, int x, int y, int a180, int Period);
  void GUI_MEMDEV_Paint1Static (GUI_HWIN hWin);
  int GUI_MEMDEV_ShiftInWindow (GUI_HWIN hWin, int Period, int Direction);
  int GUI_MEMDEV_ShiftOutWindow (GUI_HWIN hWin, int Period, int Direction);
  int GUI_MEMDEV_SwapWindow (GUI_HWIN hWin, int Period, int Edge);

  void GUI_MEMDEV__CreateStatic (GUI_HWIN hWin);



void WM_MoveWindow (GUI_HWIN hWin, int dx, int dy);
void WM_ResizeWindow (GUI_HWIN hWin, int dx, int dy);
void WM_MoveTo (GUI_HWIN hWin, int x, int y);
void WM_MoveChildTo (GUI_HWIN hWin, int x, int y);
void WM_SetSize (GUI_HWIN hWin, int XSize, int YSize);
void WM_SetWindowPos (GUI_HWIN hWin, int xPos, int yPos, int xSize, int ySize);
int WM_SetXSize (GUI_HWIN hWin, int xSize);
int WM_SetYSize (GUI_HWIN hWin, int ySize);
int WM_SetScrollbarH (GUI_HWIN hWin, int OnOff);
int WM_SetScrollbarV (GUI_HWIN hWin, int OnOff);
# 572 "../Middlewares/ST/STemWin/inc/WM.h"
typedef signed long WM_TOOLTIP_HANDLE;

typedef struct {
  int Id;
  const char * pText;
} TOOLTIP_INFO;

int WM_TOOLTIP_AddTool (WM_TOOLTIP_HANDLE hToolTip, GUI_HWIN hTool, const char * pText);
WM_TOOLTIP_HANDLE WM_TOOLTIP_Create (GUI_HWIN hDlg, const TOOLTIP_INFO * pInfo, unsigned NumItems);
void WM_TOOLTIP_Delete (WM_TOOLTIP_HANDLE hToolTip);
GUI_COLOR WM_TOOLTIP_SetDefaultColor (unsigned Index, GUI_COLOR Color);
const GUI_FONT * WM_TOOLTIP_SetDefaultFont (const GUI_FONT * pFont);
unsigned WM_TOOLTIP_SetDefaultPeriod(unsigned Index, unsigned Period);


void WM__SetToolTipCallback(void(* cbToolTip)(GUI_PID_STATE * pState, GUI_HWIN));






  signed long WM_CreateTimer (GUI_HWIN hWin, int UserID, int Period, int Mode);
  void WM_DeleteTimer (signed long hTimer);
  void WM_RestartTimer(signed long hTimer, int Period);

int WM_GetTimerId(signed long hTimer);


int WM_GetNumWindows(void);
int WM_GetNumInvalidWindows(void);


void WM_CheckScrollBounds(WM_SCROLL_STATE * pScrollState);
int WM_GetScrollPosH (GUI_HWIN hWin);
int WM_GetScrollPosV (GUI_HWIN hWin);
void WM_SetScrollPosH (GUI_HWIN hWin, unsigned ScrollPos);
void WM_SetScrollPosV (GUI_HWIN hWin, unsigned ScrollPos);
int WM_SetScrollValue (WM_SCROLL_STATE * pScrollState, int v);


WM_CALLBACK * WM_SetCallback(GUI_HWIN hWin, WM_CALLBACK * cb);
WM_CALLBACK * WM_GetCallback(GUI_HWIN hWin);


void WM_GetClientRect (GUI_RECT * pRect);
void WM_GetClientRectEx (GUI_HWIN hWin, GUI_RECT * pRect);
void WM_GetInsideRect (GUI_RECT * pRect);
void WM_GetInsideRectEx (GUI_HWIN hWin, GUI_RECT * pRect);
void WM_GetInsideRectExScrollbar(GUI_HWIN hWin, GUI_RECT * pRect);
void WM_GetWindowRect (GUI_RECT * pRect);
void WM_GetWindowRectEx (GUI_HWIN hWin, GUI_RECT * pRect);
int WM_GetOrgX (void);
int WM_GetOrgY (void);
int WM_GetWindowOrgX (GUI_HWIN hWin);
int WM_GetWindowOrgY (GUI_HWIN hWin);
int WM_GetWindowSizeX (GUI_HWIN hWin);
int WM_GetWindowSizeY (GUI_HWIN hWin);
GUI_HWIN WM_GetFirstChild (GUI_HWIN hWin);
GUI_HWIN WM_GetNextSibling (GUI_HWIN hWin);
GUI_HWIN WM_GetParent (GUI_HWIN hWin);
GUI_HWIN WM_GetPrevSibling (GUI_HWIN hWin);
int WM_GetId (GUI_HWIN hWin);
GUI_HWIN WM_GetScrollbarV (GUI_HWIN hWin);
GUI_HWIN WM_GetScrollbarH (GUI_HWIN hWin);
GUI_HWIN WM_GetScrollPartner (GUI_HWIN hWin);
GUI_HWIN WM_GetClientWindow (GUI_HWIN hObj);
GUI_COLOR WM_GetBkColor (GUI_HWIN hObj);


void WM_BringToBottom(GUI_HWIN hWin);
void WM_BringToTop(GUI_HWIN hWin);

GUI_COLOR WM_SetDesktopColor (GUI_COLOR Color);
GUI_COLOR WM_SetDesktopColorEx(GUI_COLOR Color, unsigned int LayerIndex);
void WM_SetDesktopColors (GUI_COLOR Color);


GUI_HWIN WM_SelectWindow (GUI_HWIN hWin);
GUI_HWIN WM_GetActiveWindow (void);
void WM_Paint (GUI_HWIN hObj);
void WM_Update (GUI_HWIN hWin);
void WM_PaintWindowAndDescs (GUI_HWIN hWin);
void WM_UpdateWindowAndDescs (GUI_HWIN hWin);


GUI_HWIN WM_GetDesktopWindow (void);
GUI_HWIN WM_GetDesktopWindowEx(unsigned int LayerIndex);


const GUI_RECT * WM_SetUserClipRect(const GUI_RECT * pRect);
void WM_SetDefault (void);


void WM_EnableMemdev (GUI_HWIN hWin);
void WM_DisableMemdev (GUI_HWIN hWin);


int WM_MULTIBUF_Enable (int OnOff);
int WM_MULTIBUF_EnableEx(int OnOff, unsigned long LayerMask);

extern const GUI_MULTIBUF_API * WM_MULTIBUF__pAPI;

typedef void (* T_WM_EXEC_GESTURE)(void);

extern T_WM_EXEC_GESTURE WM__pExecGestures;


int WM_OnKey(int Key, int Pressed);
void WM_MakeModal(GUI_HWIN hWin);
int WM_SetModalLayer(int LayerIndex);
int WM_GetModalLayer(void);
# 692 "../Middlewares/ST/STemWin/inc/WM.h"
void WM_NotifyParent (GUI_HWIN hWin, int Notification);
void WM_SendMessage (GUI_HWIN hWin, WM_MESSAGE * p);
void WM_SendMessageNoPara (GUI_HWIN hWin, int MsgId);
void WM_DefaultProc (WM_MESSAGE * pMsg);
int WM_BroadcastMessage (WM_MESSAGE * pMsg);
void WM_SetScrollState (GUI_HWIN hWin, const WM_SCROLL_STATE * pState);
void WM_SetEnableState (GUI_HWIN hItem, int State);
void WM_SendToParent (GUI_HWIN hWin, WM_MESSAGE * pMsg);
int WM_HasFocus (GUI_HWIN hWin);
int WM_SetFocus (GUI_HWIN hWin);
GUI_HWIN WM_SetFocusOnNextChild (GUI_HWIN hParent);
GUI_HWIN WM_SetFocusOnPrevChild (GUI_HWIN hParent);
GUI_HWIN WM_GetDialogItem (GUI_HWIN hWin, int Id);
void WM_EnableWindow (GUI_HWIN hWin);
void WM_DisableWindow (GUI_HWIN hWin);
void WM_GetScrollState (GUI_HWIN hObj, WM_SCROLL_STATE * pScrollState);





int WM_GetUserData (GUI_HWIN hWin, void * pDest, int SizeOfBuffer);
int WM_SetUserData (GUI_HWIN hWin, const void * pSrc, int SizeOfBuffer);
int WM__GetUserDataEx(GUI_HWIN hWin, void * pDest, int NumBytes, int SizeOfObject);
int WM__SetUserDataEx(GUI_HWIN hWin, const void * pSrc, int NumBytes, int SizeOfObject);





int WM_HasCaptured (GUI_HWIN hWin);
void WM_SetCapture (GUI_HWIN hObj, int AutoRelease);
void WM_SetCaptureMove(GUI_HWIN hWin, const GUI_PID_STATE * pState, int MinVisibility, int LimitTop);
void WM_ReleaseCapture(void);





int WM_HandlePID (void);
GUI_HWIN WM_Screen2hWin (int x, int y);
GUI_HWIN WM_Screen2hWinEx (GUI_HWIN hStop, int x, int y);
void WM_ForEachDesc (GUI_HWIN hWin, WM_tfForEach * pcb, void * pData);
void WM_SetScreenSize (int xSize, int ySize);
int WM_PollSimMsg (void);
int WM_GetWindowInfo (WM_WINDOW_INFO * pInfo, int FirstWindow);
# 57 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/BUTTON.h" 1
# 57 "../Middlewares/ST/STemWin/inc/BUTTON.h"
# 1 "../Middlewares/ST/STemWin/inc/DIALOG_Intern.h" 1
# 70 "../Middlewares/ST/STemWin/inc/DIALOG_Intern.h"
typedef struct GUI_WIDGET_CREATE_INFO_struct GUI_WIDGET_CREATE_INFO;
typedef GUI_HWIN GUI_WIDGET_CREATE_FUNC (const GUI_WIDGET_CREATE_INFO * pCreate, GUI_HWIN hWin, int x0, int y0, WM_CALLBACK * cb);







struct GUI_WIDGET_CREATE_INFO_struct {
  GUI_WIDGET_CREATE_FUNC * pfCreateIndirect;
  const char * pName;
  signed short Id;
  signed short x0;
  signed short y0;
  signed short xSize;
  signed short ySize;
  unsigned short Flags;
  signed long Para;
  unsigned long NumExtraBytes;
};







GUI_HWIN GUI_CreateDialogBox (const GUI_WIDGET_CREATE_INFO * paWidget, int NumWidgets, WM_CALLBACK * cb, GUI_HWIN hParent, int x0, int y0);
void GUI_EndDialog (GUI_HWIN hWin, int r);
int GUI_ExecDialogBox (const GUI_WIDGET_CREATE_INFO * paWidget, int NumWidgets, WM_CALLBACK * cb, GUI_HWIN hParent, int x0, int y0);
int GUI_ExecCreatedDialog (GUI_HWIN hDialog);
WM_DIALOG_STATUS * GUI_GetDialogStatusPtr(GUI_HWIN hDialog);
void GUI_SetDialogStatusPtr(GUI_HWIN hDialog, WM_DIALOG_STATUS * pDialogStatus);





LCD_COLOR DIALOG_GetBkColor(void);
LCD_COLOR DIALOG_SetBkColor(LCD_COLOR BkColor);
# 58 "../Middlewares/ST/STemWin/inc/BUTTON.h" 2
# 1 "../Middlewares/ST/STemWin/inc/WIDGET.h" 1
# 60 "../Middlewares/ST/STemWin/inc/WIDGET.h"
# 1 "../Middlewares/ST/STemWin/inc/WM_Intern.h" 1
# 57 "../Middlewares/ST/STemWin/inc/WM_Intern.h"
# 1 "../Middlewares/ST/STemWin/inc/GUI_Private.h" 1
# 57 "../Middlewares/ST/STemWin/inc/GUI_Private.h"
# 1 "../Middlewares/ST/STemWin/inc/LCD_Protected.h" 1
# 66 "../Middlewares/ST/STemWin/inc/LCD_Protected.h"
typedef struct {
  LCD_COLOR * paColor;
  signed short NumEntries;
} LCD_LUT_INFO;

typedef struct {
  tLCDDEV_DrawPixel * pfDrawPixel;
  tLCDDEV_DrawHLine * pfDrawHLine;
  tLCDDEV_DrawVLine * pfDrawVLine;
  tLCDDEV_FillRect * pfFillRect;
  tLCDDEV_DrawBitmap * pfDrawBitmap;
} LCD_API_LIST;





extern const unsigned char LCD_aMirror[256];
extern unsigned long * LCD__aConvTable;





void LCD_UpdateColorIndices (void);
int LCD_PassingBitmapsAllowed(void);
void LCD_EnableCursor (int OnOff);
void LCD_SelectLCD (void);

void LCD_DrawBitmap(int x0, int y0,
                    int xsize, int ysize,
                    int xMul, int yMul,
                    int BitsPerPixel,
                    int BytesPerLine,
                    const unsigned char * pPixel,
                    const unsigned long * pTrans);

void LCD__DrawBitmap_1bpp(int x0, int y0,
                          int xsize, int ysize,
                          int xMul, int yMul,
                          int BitsPerPixel,
                          int BytesPerLine,
                          const unsigned char * pPixel,
                          const unsigned long * pTrans,
                          int OffData);





tLCDDEV_Index2Color LCD_Index2Color_444_12;
tLCDDEV_Index2Color LCD_Index2Color_M444_12;
tLCDDEV_Index2Color LCD_Index2Color_444_12_1;
tLCDDEV_Index2Color LCD_Index2Color_M444_12_1;
tLCDDEV_Index2Color LCD_Index2Color_444_16;
tLCDDEV_Index2Color LCD_Index2Color_M444_16;
tLCDDEV_Index2Color LCD_Index2Color_555;
tLCDDEV_Index2Color LCD_Index2Color_565;
tLCDDEV_Index2Color LCD_Index2Color_8666;
tLCDDEV_Index2Color LCD_Index2Color_888;
tLCDDEV_Index2Color LCD_Index2Color_8888;
tLCDDEV_Index2Color LCD_Index2Color_M8888I;
tLCDDEV_Index2Color LCD_Index2Color_M555;
tLCDDEV_Index2Color LCD_Index2Color_M565;
tLCDDEV_Index2Color LCD_Index2Color_M888;

tLCDDEV_Color2Index LCD_Color2Index_8666;
# 58 "../Middlewares/ST/STemWin/inc/GUI_Private.h" 2
# 1 "../Middlewares/ST/STemWin/inc/GUI_Debug.h" 1
# 59 "../Middlewares/ST/STemWin/inc/GUI_Debug.h"
# 1 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stddef.h" 1 3
# 38 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stddef.h" 3
  typedef signed int ptrdiff_t;
# 60 "../Middlewares/ST/STemWin/inc/GUI_Debug.h" 2
# 59 "../Middlewares/ST/STemWin/inc/GUI_Private.h" 2
# 138 "../Middlewares/ST/STemWin/inc/GUI_Private.h"
extern const unsigned char GUI__aConvert_15_255[(1 << 4)];
extern const unsigned char GUI__aConvert_31_255[(1 << 5)];
extern const unsigned char GUI__aConvert_63_255[(1 << 6)];
extern const unsigned char GUI__aConvert_255_15[(1 << 8)];
extern const unsigned char GUI__aConvert_255_31[(1 << 8)];
extern const unsigned char GUI__aConvert_255_63[(1 << 8)];







typedef signed long GUI_USAGE_Handle;
typedef struct tsUSAGE_APIList tUSAGE_APIList;
typedef struct GUI_Usage GUI_USAGE;


typedef GUI_USAGE_Handle tUSAGE_CreateCompatible(GUI_USAGE * p);
typedef void tUSAGE_AddPixel (GUI_USAGE * p, int x, int y);
typedef void tUSAGE_AddHLine (GUI_USAGE * p, int x0, int y0, int len);
typedef void tUSAGE_Clear (GUI_USAGE * p);
typedef void tUSAGE_Delete (GUI_USAGE_Handle h);
typedef int tUSAGE_GetNextDirty (GUI_USAGE * p, int * pxOff, int yOff);


void GUI_USAGE_DecUseCnt(GUI_USAGE_Handle hUsage);

GUI_USAGE_Handle GUI_USAGE_BM_Create(int x0, int y0, int xsize, int ysize, int Flags);
void GUI_USAGE_Select(GUI_USAGE_Handle hUsage);
void GUI_USAGE_AddRect(GUI_USAGE * pUsage, int x0, int y0, int xSize, int ySize);






struct tsUSAGE_APIList {
  tUSAGE_AddPixel * pfAddPixel;
  tUSAGE_AddHLine * pfAddHLine;
  tUSAGE_Clear * pfClear;
  tUSAGE_CreateCompatible * pfCreateCompatible;
  tUSAGE_Delete * pfDelete;
  tUSAGE_GetNextDirty * pfGetNextDirty;
} ;

struct GUI_Usage {
  signed short x0, y0, XSize, YSize;
  const tUSAGE_APIList * pAPI;
  signed short UseCnt;
};
# 198 "../Middlewares/ST/STemWin/inc/GUI_Private.h"
typedef struct {
  GUI_DEVICE * pDevice;
  signed short x0, y0, XSize, YSize;
  unsigned BytesPerLine;
  unsigned BitsPerPixel;
  signed long hUsage;
} GUI_MEMDEV;



void GUI_MEMDEV__CopyFromLCD (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV__GetRect (GUI_RECT * pRect);
unsigned GUI_MEMDEV__Color2Index (LCD_COLOR Color);
LCD_COLOR GUI_MEMDEV__Index2Color (int Index);
unsigned int GUI_MEMDEV__GetIndexMask(void);
void GUI_MEMDEV__SetAlphaCallback(unsigned(* pcbSetAlpha)(unsigned char));

GUI_MEMDEV_Handle GUI_MEMDEV__CreateFixed(int x0, int y0, int xSize, int ySize, int Flags,
                                          const GUI_DEVICE_API * pDeviceAPI,
                                          const LCD_API_COLOR_CONV * pColorConvAPI);

void GUI_MEMDEV__DrawSizedAt (GUI_MEMDEV_Handle hMem, int xPos, int yPos, int xSize, int ySize);
GUI_MEMDEV_Handle GUI_MEMDEV__GetEmptyCopy32 (GUI_MEMDEV_Handle hMem, int * pxSize, int * pySize, int * pxPos, int * pyPos);
void GUI_MEMDEV__ReadLine (int x0, int y, int x1, unsigned long * pBuffer);
void GUI_MEMDEV__WriteToActiveAlpha (GUI_MEMDEV_Handle hMem,int x, int y);
void GUI_MEMDEV__WriteToActiveAt (GUI_MEMDEV_Handle hMem,int x, int y);
void GUI_MEMDEV__WriteToActiveOpaque(GUI_MEMDEV_Handle hMem,int x, int y);
void * GUI_MEMDEV__XY2PTR (int x,int y);
void * GUI_MEMDEV__XY2PTREx (GUI_MEMDEV * pDev, int x,int y);
void GUI_MEMDEV__BlendColor32 (GUI_MEMDEV_Handle hMem, unsigned long BlendColor, unsigned char BlendIntens);

unsigned GUI__AlphaPreserveTrans(int OnOff);

extern unsigned GUI_MEMDEV__TimePerFrame;
# 255 "../Middlewares/ST/STemWin/inc/GUI_Private.h"
int GUI_cos(int angle);
int GUI_sin(int angle);
extern const unsigned long GUI_Pow10[10];


void GUI_MTOUCH__ManagePID(int OnOff);


int GUI_AA_Init (int x0, int x1);
int GUI_AA_Init_HiRes (int x0, int x1);
void GUI_AA_Exit (void);
signed short GUI_AA_HiRes2Pixel(int HiRes);

void GL_FillCircleAA_HiRes (int x0, int y0, int r);
void GL_FillEllipseAA_HiRes(int x0, int y0, int rx, int ry);

void GUI_AA__DrawCharAA2(int x0, int y0, int XSize, int YSize, int BytesPerLine, const unsigned char * pData);
void GUI_AA__DrawCharAA4(int x0, int y0, int XSize, int YSize, int BytesPerLine, const unsigned char * pData);
void GUI_AA__DrawCharAA8(int x0, int y0, int XSize, int YSize, int BytesPerLine, const unsigned char * pData);




int GUI__GetAlphaBuffer (unsigned long ** ppCurrent, unsigned long ** ppConvert, unsigned long ** ppData, int * pVXSizeMax);
int GUI__AllocAlphaBuffer (int AllocDataBuffer);
unsigned long * GUI__DoAlphaBlending (int x, int y, unsigned long * pData, int xSize, tLCDDEV_Index2Color * pfIndex2Color_DEV, int * pDone);
unsigned GUI__SetAlphaBufferSize(int xSize);


int GUI_SIF__GetCharDistX (unsigned short c, int * pSizeX);
void GUI_SIF__GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pfi);
char GUI_SIF__IsInFont (const GUI_FONT * pFont, unsigned short c);
const unsigned char * GUI_SIF__GetpCharInfo (const GUI_FONT * pFont, unsigned short c, unsigned SizeOfCharInfo);
int GUI_SIF__GetNumCharAreas (const GUI_FONT * pFont);
int GUI_SIF__GetCharDistX_ExtFrm(unsigned short c, int * pSizeX);
void GUI_SIF__GetFontInfo_ExtFrm (const GUI_FONT * pFont, GUI_FONTINFO * pfi);
char GUI_SIF__IsInFont_ExtFrm (const GUI_FONT * pFont, unsigned short c);
int GUI_SIF__GetCharInfo_ExtFrm (unsigned short c, GUI_CHARINFO_EXT * pInfo);
void GUI_SIF__ClearLine_ExtFrm (const char * s, int Len);


int GUI_XBF__GetOff (const GUI_XBF_DATA * pXBF_Data, unsigned c, unsigned long * pOff);
int GUI_XBF__GetOffAndSize(const GUI_XBF_DATA * pXBF_Data, unsigned c, unsigned long * pOff, unsigned short * pSize);
int GUI_XBF__GetCharDistX (unsigned short c, int * pSizeX);
void GUI_XBF__GetFontInfo (const GUI_FONT * pFont, GUI_FONTINFO * pInfo);
char GUI_XBF__IsInFont (const GUI_FONT * pFont, unsigned short c);
int GUI_XBF__GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
void GUI_XBF__ClearLine (const char * s, int Len);


void GUI_AddHex (unsigned long v, unsigned char Len, char ** ps);
void GUI_AddBin (unsigned long v, unsigned char Len, char ** ps);
void GUI_AddDecMin (signed long v, char ** ps);
void GUI_AddDecShift(signed long v, unsigned char Len, unsigned char Shift, char ** ps);
long GUI_AddSign (long v, char ** ps);
int GUI_Long2Len (signed long v);




int GUI_UC__CalcSizeOfChar (unsigned short Char);
unsigned short GUI_UC__GetCharCodeInc (const char ** ps);
int GUI_UC__NumChars2NumBytes(const char * s, int NumChars);
int GUI_UC__NumBytes2NumChars(const char * s, int NumBytes);

int GUI__GetLineNumChars (const char * s, int MaxNumChars);
int GUI__GetNumChars (const char * s);
int GUI__GetOverlap (unsigned short Char);
int GUI__GetLineDistX (const char * s, int Len);
int GUI__GetFontSizeY (void);
int GUI__HandleEOLine (const char ** ps);
void GUI__InvertRectColors (int x0, int y0, int x1, int y1);
void GUI__DispLine (const char * s, int Len, const GUI_RECT * pr);
void GUI__AddSpaceHex (unsigned long v, unsigned char Len, char ** ps);
void GUI__CalcTextRect (const char * pText, const GUI_RECT * pTextRectIn, GUI_RECT * pTextRectOut, int TextAlign);

void GUI__ClearTextBackground(int xDist, int yDist);

int GUI__WrapGetNumCharsDisp (const char * pText, int xSize, GUI_WRAPMODE WrapMode);
int GUI__WrapGetNumCharsToNextLine (const char * pText, int xSize, GUI_WRAPMODE WrapMode);
int GUI__WrapGetNumBytesToNextLine (const char * pText, int xSize, GUI_WRAPMODE WrapMode);

void GUI__memset16 (unsigned short * p, unsigned short Fill, int NumWords);
int GUI__strlen (const char * s);
int GUI__strcmp (const char * s0, const char * s1);
int GUI__strcmp_hp (signed long hs0, const char * s1);


int GUI__GetCursorPosX (const char * s, int Index, int MaxNumChars);
int GUI__GetCursorPosChar (const char * s, int x, int NumCharsToNextLine);
unsigned short GUI__GetCursorCharacter(const char * s, int Index, int MaxNumChars, int * pIsRTL);


unsigned short GUI__GetPresentationForm (unsigned short Char, unsigned short Next, unsigned short Prev, int * pIgnoreNext, const char * s);
int GUI__IsArabicCharacter (unsigned short c);


int GUI__BIDI_Log2Vis (const char * s, int NumChars, char * pBuffer, int BufferSize);
int GUI__BIDI_GetCursorPosX (const char * s, int NumChars, int Index);
int GUI__BIDI_GetCursorPosChar (const char * s, int NumChars, int x);
unsigned short GUI__BIDI_GetLogChar (const char * s, int NumChars, int Index);
int GUI__BIDI_GetCharDir (const char * s, int NumChars, int Index);
int GUI__BIDI_IsNSM (unsigned short Char);
unsigned short GUI__BIDI_GetCursorCharacter(const char * s, int Index, int MaxNumChars, int * pIsRTL);
int GUI__BIDI_GetWordWrap (const char * s, int xSize, int * pxDist);
int GUI__BIDI_GetCharWrap (const char * s, int xSize);
# 376 "../Middlewares/ST/STemWin/inc/GUI_Private.h"
int GUI__BIDI2_Log2Vis (const char * s, int NumChars, char * pBuffer, int BufferSize);
int GUI__BIDI2_GetCursorPosX (const char * s, int NumChars, int Index);
int GUI__BIDI2_GetCursorPosChar (const char * s, int NumChars, int x);
unsigned short GUI__BIDI2_GetLogChar (const char * s, int NumChars, int Index);
int GUI__BIDI2_GetCharDir (const char * s, int NumChars, int Index);
int GUI__BIDI2_IsNSM (unsigned short Char);
unsigned short GUI__BIDI2_GetCursorCharacter(const char * s, int Index, int MaxNumChars, int * pIsRTL);
int GUI__BIDI2_GetWordWrap (const char * s, int xSize, int * pxDist);
int GUI__BIDI2_GetCharWrap (const char * s, int xSize);
void GUI__BIDI2_SetBaseDir (int Dir);
int GUI__BIDI2_GetBaseDir (void);
# 395 "../Middlewares/ST/STemWin/inc/GUI_Private.h"
const char * GUI__BIDI_Log2VisBuffered(const char * s, int * pMaxNumChars);

extern int GUI__BIDI_Enabled;

extern int (* _pfGUI__BIDI_Log2Vis )(const char * s, int NumChars, char * pBuffer, int BufferSize);
extern int (* _pfGUI__BIDI_GetCursorPosX )(const char * s, int NumChars, int Index);
extern int (* _pfGUI__BIDI_GetCursorPosChar)(const char * s, int NumChars, int x);
extern unsigned short (* _pfGUI__BIDI_GetLogChar )(const char * s, int NumChars, int Index);
extern int (* _pfGUI__BIDI_GetCharDir )(const char * s, int NumChars, int Index);
extern int (* _pfGUI__BIDI_IsNSM )(unsigned short Char);


extern const char * (* GUI_CharLine_pfLog2Vis)(const char * s, int * pMaxNumChars);

extern int (* GUI__GetCursorPos_pfGetPosX) (const char * s, int MaxNumChars, int Index);
extern int (* GUI__GetCursorPos_pfGetPosChar) (const char * s, int MaxNumChars, int x);
extern unsigned short (* GUI__GetCursorPos_pfGetCharacter)(const char * s, int MaxNumChars, int Index, int * pIsRTL);

extern int (* GUI__Wrap_pfGetWordWrap)(const char * s, int xSize, int * pxDist);
extern int (* GUI__Wrap_pfGetCharWrap)(const char * s, int xSize);


const GUI_FONT_PROP * GUIPROP__FindChar(const GUI_FONT_PROP * pProp, unsigned short c);


const GUI_FONT_PROP_EXT * GUIPROP_EXT__FindChar(const GUI_FONT_PROP_EXT * pPropExt, unsigned short c);
void GUIPROP_EXT__DispLine (const char * s, int Len);
void GUIPROP_EXT__ClearLine (const char * s, int Len);
void GUIPROP_EXT__SetfpClearLine(void (* fpClearLine)(const char * s, int Len));


unsigned short GUI__Read16(const unsigned char ** ppData);
unsigned long GUI__Read32(const unsigned char ** ppData);


void GUI__GetOrg(int * px, int * py);
void GUI__SetOrgHook(void(* pfHook)(int x, int y));


int GUI_TIMER__IsActive (void);
int GUI_TIMER__GetPeriod (void);
GUI_TIMER_HANDLE GUI_TIMER__GetNextTimer (GUI_TIMER_HANDLE hTimer, unsigned long * pContext);
GUI_TIMER_HANDLE GUI_TIMER__GetFirstTimer (unsigned long * pContext);
GUI_TIMER_HANDLE GUI_TIMER__GetNextTimerLin(GUI_TIMER_HANDLE hTimer, unsigned long * pContext);


tLCDDEV_Index2Color * GUI_GetpfIndex2ColorEx(int LayerIndex);
tLCDDEV_Color2Index * GUI_GetpfColor2IndexEx(int LayerIndex);

int GUI_GetBitsPerPixelEx(int LayerIndex);

unsigned long * LCD_GetpPalConvTable (const LCD_LOGPALETTE * pLogPal);
unsigned long * LCD_GetpPalConvTableUncached(const LCD_LOGPALETTE * pLogPal);
unsigned long * LCD_GetpPalConvTableBM (const LCD_LOGPALETTE * pLogPal, const GUI_BITMAP * pBitmap, int LayerIndex);


void GUI_SetFuncGetpPalConvTable(unsigned long * (* pFunc)(const LCD_LOGPALETTE * pLogPal, const GUI_BITMAP * pBitmap, int LayerIndex));
# 485 "../Middlewares/ST/STemWin/inc/GUI_Private.h"
void GUI__ReadHeaderFromStream (GUI_BITMAP_STREAM * pBitmapHeader, const unsigned char * pData);
void GUI__CreateBitmapFromStream(const GUI_BITMAP_STREAM * pBitmapHeader, const void * pData, GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const GUI_BITMAP_METHODS * pMethods);


int GUI__ManageCache (int Cmd);
int GUI__ManageCacheEx(int LayerIndex, int Cmd);







void GL_DispChar (unsigned short c);
void GL_DrawArc (int x0, int y0, int rx, int ry, int a0, int a1);
void GL_DrawBitmap (const GUI_BITMAP * pBM, int x0, int y0);
void GL_DrawCircle (int x0, int y0, int r);
void GL_DrawEllipse (int x0, int y0, int rx, int ry, int w);
void GL_DrawHLine (int y0, int x0, int x1);
void GL_DrawPolygon (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
void GL_DrawPoint (int x, int y);
void GL_DrawLine1 (int x0, int y0, int x1, int y1);
void GL_DrawLine1Ex (int x0, int y0, int x1, int y1, unsigned * pPixelCnt);
void GL_DrawLineRel (int dx, int dy);
void GL_DrawLineTo (int x, int y);
void GL_DrawLineToEx (int x, int y, unsigned * pPixelCnt);
void GL_DrawLine (int x0, int y0, int x1, int y1);
void GL_DrawLineEx (int x0, int y0, int x1, int y1, unsigned * pPixelCnt);
void GL_MoveTo (int x, int y);
void GL_FillCircle (int x0, int y0, int r);
void GL_FillCircleAA (int x0, int y0, int r);
void GL_FillEllipse (int x0, int y0, int rx, int ry);
void GL_FillPolygon (const GUI_POINT * pPoints, int NumPoints, int x0, int y0);
void GL_SetDefault (void);
# 529 "../Middlewares/ST/STemWin/inc/GUI_Private.h"
extern void * (* GUI__pfMemset)(void * pDest, int Fill, unsigned Cnt);
extern void * (* GUI__pfMemcpy)(void * pDest, const void * pSrc, unsigned Cnt);
# 544 "../Middlewares/ST/STemWin/inc/GUI_Private.h"
typedef int GUI_tfTimer(void);
typedef int WM_tfHandlePID(void);







extern GUI_RECT GUI_RectDispString;







extern unsigned char GUI__CharHasTrans;







extern int GUITASK__EntranceCnt;
# 578 "../Middlewares/ST/STemWin/inc/GUI_Private.h"
int GUI_GetBitmapPixelIndex(const GUI_BITMAP * pBMP, unsigned x, unsigned y);
GUI_COLOR GUI_GetBitmapPixelColor(const GUI_BITMAP * pBMP, unsigned x, unsigned y);
int GUI_GetBitmapPixelIndexEx(int BitsPerPixel, int BytesPerLine, const unsigned char * pData, unsigned x, unsigned y);

void GUI__DrawBitmap16bpp (int x0, int y0, int xsize, int ysize, const unsigned char * pPixel, const LCD_LOGPALETTE * pLogPal, int xMag, int yMag, tLCDDEV_Index2Color * pfIndex2Color, const LCD_API_COLOR_CONV * pColorConvAPI);
void GUI__DrawBitmapA16bpp(int x0, int y0, int xSize, int ySize, const unsigned char * pPixel, const LCD_LOGPALETTE * pLogPal, int xMag, int yMag, tLCDDEV_Index2Color * pfIndex2Color);
void GUI__SetPixelAlpha (int x, int y, unsigned char Alpha, LCD_COLOR Color);
LCD_COLOR GUI__MixColors (LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);
void GUI__MixColorsBulk (unsigned long * pFG, unsigned long * pBG, unsigned long * pDst, unsigned OffFG, unsigned OffBG, unsigned OffDest, unsigned xSize, unsigned ySize, unsigned char Intens);

extern const GUI_UC_ENC_APILIST GUI_UC_None;
# 611 "../Middlewares/ST/STemWin/inc/GUI_Private.h"
void LCD_ReadRect (int x0, int y0, int x1, int y1, unsigned long * pBuffer, GUI_DEVICE * pDevice);
void GUI_ReadRect (int x0, int y0, int x1, int y1, unsigned long * pBuffer, GUI_DEVICE * pDevice);
void GUI_ReadRectEx(int x0, int y0, int x1, int y1, unsigned long * pBuffer, GUI_DEVICE * pDevice);

void LCD_ReadRectNoClip(int x0, int y0, int x1, int y1, unsigned long * pBuffer, GUI_DEVICE * pDevice);







typedef struct {
  void (* pfSetColor) (LCD_COLOR Index);
  void (* pfSetBkColor) (LCD_COLOR Index);
  LCD_DRAWMODE (* pfSetDrawMode)(LCD_DRAWMODE dm);
} LCD_SET_COLOR_API;

extern const LCD_SET_COLOR_API * LCD__pSetColorAPI;
# 646 "../Middlewares/ST/STemWin/inc/GUI_Private.h"
extern const GUI_FONT * GUI__pFontDefault;
extern GUI_COLOR GUI__ColorDefault;
extern GUI_COLOR GUI__BkColorDefault;

extern GUI_CONTEXT * GUI_pContext;

extern GUI_DEVICE * GUI__apDevice[(2)];




extern unsigned long * (* GUI_pfGetpPalConvTable)(const LCD_LOGPALETTE * pLogPal, const GUI_BITMAP * pBitmap, int LayerIndex);




extern LCD_COLOR (* GUI__pfMixColors)(LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);




extern void (* GUI__pfMixColorsBulk)(unsigned long * pFG, unsigned long * pBG, unsigned long * pDst, unsigned OffFG, unsigned OffBG, unsigned OffDest, unsigned xSize, unsigned ySize, unsigned char Intens);




extern LCD_COLOR (* LCD_AA_pfMixColors16)(LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);




extern GUI_DRAWMEMDEV_16BPP_FUNC * GUI__pfDrawAlphaMemdevFunc;
extern GUI_DRAWMEMDEV_16BPP_FUNC * GUI__pfDrawM565MemdevFunc;




extern GUI_DRAWBITMAP_FUNC * GUI__pfDrawAlphaBitmapFunc;
extern GUI_DRAWBITMAP_FUNC * GUI__pfDrawM565BitmapFunc;




extern const GUI_MULTIBUF_API GUI_MULTIBUF_APIList;
extern const GUI_MULTIBUF_API GUI_MULTIBUF_APIListMasked;
extern const GUI_MULTIBUF_API_EX GUI_MULTIBUF_APIListEx;







extern void (* GUI_pfExecAnimations)(void);
extern int (* GUI_pfUpdateSoftLayer)(void);

extern void (* GUI_pfAfterInitHook)(void);





extern void (* GUI_pfHookMTOUCH)(const GUI_MTOUCH_STATE * pState);

extern const GUI_UC_ENC_APILIST * GUI_pUC_API;

extern char GUI_DecChar;
extern GUI_tfTimer * GUI_pfTimerExec;
extern WM_tfHandlePID * WM_pfHandlePID;
extern void (* GUI_pfDispCharStyle)(unsigned short Char);
extern void (* GUI_pfDispCharLine)(int x0);

extern int GUI__BufferSize;
extern int GUI_AA__ClipX0;

extern signed char GUI__aNumBuffers[(2)];
extern unsigned char GUI__PreserveTrans;
extern unsigned char GUI__IsInitialized;

extern unsigned char GUI__NumLayersInUse;
extern unsigned long GUI__LayerMask;


  extern const tLCD_APIList * GUI_pLCD_APIList;


extern signed short GUI_OrgX, GUI_OrgY;
# 58 "../Middlewares/ST/STemWin/inc/WM_Intern.h" 2
# 113 "../Middlewares/ST/STemWin/inc/WM_Intern.h"
typedef struct {
  GUI_HWIN hOld;
  GUI_HWIN hNew;
} WM_NOTIFY_CHILD_HAS_FOCUS_INFO;

typedef struct WM_CRITICAL_HANDLE {
  struct WM_CRITICAL_HANDLE * pNext;
  volatile GUI_HWIN hWin;
} WM_CRITICAL_HANDLE;







extern unsigned long WM__CreateFlags;
extern GUI_HWIN WM__ahCapture[(2)];
extern GUI_HWIN WM__ahWinFocus[(2)];
extern char WM__CaptureReleaseAuto;
extern WM_tfPollPID * WM_pfPollPID;
extern unsigned char WM__PaintCallbackCnt;
extern GUI_HWIN WM__hCreateStatic;


  extern int WM__TransWindowCnt;
  extern GUI_HWIN WM__hATransWindow;






extern WM_CRITICAL_HANDLE WM__aCHWinModal[(2)];
extern WM_CRITICAL_HANDLE WM__aCHWinLast[(2)];
extern int WM__ModalLayer;


  extern WM_CRITICAL_HANDLE WM__aCHWinMouseOver[(2)];
# 161 "../Middlewares/ST/STemWin/inc/WM_Intern.h"
  extern unsigned long WM__InvalidLayerMask;
  extern unsigned WM__TouchedLayer;





extern unsigned short WM__NumWindows;
extern unsigned short WM__NumInvalidWindows;
extern GUI_HWIN WM__FirstWin;
extern WM_CRITICAL_HANDLE * WM__pFirstCriticalHandle;

extern GUI_HWIN WM__ahDesktopWin[(2)];
extern GUI_COLOR WM__aBkColor[(2)];
# 184 "../Middlewares/ST/STemWin/inc/WM_Intern.h"
void WM__ActivateClipRect (void);
int WM__ClipAtParentBorders (GUI_RECT * pRect, GUI_HWIN hWin);
void WM__Client2Screen (const WM_Obj * pWin, GUI_RECT * pRect);
void WM__DeleteAssocTimer (GUI_HWIN hWin);
void WM__DeleteSecure (GUI_HWIN hWin);
void WM__DetachWindow (GUI_HWIN hChild);
void WM__ForEachDesc (GUI_HWIN hWin, WM_tfForEach * pcb, void * pData);
void WM__GetClientRectWin (const WM_Obj * pWin, GUI_RECT * pRect);
void WM__GetClientRectEx (GUI_HWIN hWin, GUI_RECT * pRect);
GUI_HWIN WM__GetFirstSibling (GUI_HWIN hWin);
GUI_HWIN WM__GetFocusedChild (GUI_HWIN hWin);
int WM__GetHasFocus (GUI_HWIN hWin);
GUI_HWIN WM__GetLastSibling (GUI_HWIN hWin);
GUI_HWIN WM__GetPrevSibling (GUI_HWIN hWin);
int WM__GetTopLevelLayer (GUI_HWIN hWin);
int WM__GetWindowSizeX (const WM_Obj * pWin);
int WM__GetWindowSizeY (const WM_Obj * pWin);
void WM__InsertWindowIntoList (GUI_HWIN hWin, GUI_HWIN hParent);
void WM__Invalidate1Abs (GUI_HWIN hWin, const GUI_RECT * pRect);
void WM__InvalidateAreaBelow (const GUI_RECT * pRect, GUI_HWIN StopWin);
void WM__InvalidateRectEx (const GUI_RECT * pInvalidRect, GUI_HWIN hParent, GUI_HWIN hStop);
void WM__InvalidateTransAreaAbove(const GUI_RECT * pRect, GUI_HWIN StopWin);
int WM__IntersectRect (GUI_RECT * pDest, const GUI_RECT * pr0, const GUI_RECT * pr1);
int WM__IsAncestor (GUI_HWIN hChild, GUI_HWIN hParent);
int WM__IsAncestorOrSelf (GUI_HWIN hChild, GUI_HWIN hParent);
int WM__IsChild (GUI_HWIN hWin, GUI_HWIN hParent);
int WM__IsEnabled (GUI_HWIN hWin);
int WM__IsInModalArea (GUI_HWIN hWin);
int WM__IsInWindow (WM_Obj * pWin, int x, int y);
int WM__IsWindow (GUI_HWIN hWin);
void WM__LeaveIVRSearch (void);
void WM__MoveTo (GUI_HWIN hWin, int x, int y);
void WM__MoveWindow (GUI_HWIN hWin, int dx, int dy);
void WM__NotifyVisChanged (GUI_HWIN hWin, GUI_RECT * pRect);
int WM__RectIsNZ (const GUI_RECT * pr);
void WM__RemoveWindowFromList (GUI_HWIN hWin);
void WM__Screen2Client (const WM_Obj * pWin, GUI_RECT * pRect);
void WM__SelectTopLevelLayer (GUI_HWIN hWin);
void WM__SendMsgNoData (GUI_HWIN hWin, unsigned char MsgId);
void WM__SendMessage (GUI_HWIN hWin, WM_MESSAGE * pm);
void WM__SendMessageIfEnabled (GUI_HWIN hWin, WM_MESSAGE * pm);
void WM__SendMessageNoPara (GUI_HWIN hWin, int MsgId);
void WM__SendPIDMessage (GUI_HWIN hWin, WM_MESSAGE * pMsg);
int WM__SetScrollbarH (GUI_HWIN hWin, int OnOff);
int WM__SetScrollbarV (GUI_HWIN hWin, int OnOff);
void WM__UpdateChildPositions (WM_Obj * pObj, int dx0, int dy0, int dx1, int dy1);
void WM_PID__GetPrevState (GUI_PID_STATE * pPrevState, int Layer);
void WM_PID__SetPrevState (GUI_PID_STATE * pPrevState, int Layer);
void WM__SendTouchMessage (GUI_HWIN hWin, WM_MESSAGE * pMsg);

unsigned short WM_GetFlags (GUI_HWIN hWin);
int WM__Paint (GUI_HWIN hWin);
void WM__Paint1 (GUI_HWIN hWin);
void WM__AddCriticalHandle (WM_CRITICAL_HANDLE * pCH);
void WM__RemoveCriticalHandle (WM_CRITICAL_HANDLE * pCH);
void WM__SetLastTouched (GUI_HWIN hWin);


  void WM__InvalidateDrawAndDescs(GUI_HWIN hWin);






  typedef struct {
    int xSize, ySize;
  } EFFECT_CONTEXT;

  int GUI_MEMDEV__CalcParaFadeIn (int Period, int TimeUsed);
  void GUI_MEMDEV__ClipBK (EFFECT_CONTEXT * pContext);
  void GUI_MEMDEV__RemoveStaticDevice(GUI_HWIN hWin);
  void GUI_MEMDEV__UndoClipBK (EFFECT_CONTEXT * pContext);


void WM__InvalidateParent(const GUI_RECT * pInvalidRect, GUI_HWIN hParent, GUI_HWIN hStop);
void WM__InvalidateRect (const GUI_RECT * pInvalidRect, GUI_HWIN hParent, GUI_HWIN hStop, unsigned short Flags);

WM_tfInvalidateParent WM__SetInvalidateParentFunc(WM_tfInvalidateParent pfInvalidateParentFunc);
WM_tfInvalidateDrawFunc WM__SetInvalidateDrawFunc (WM_tfInvalidateDrawFunc pfInvalidateDrawFunc);
WM_tfPaint1Func WM__SetPaint1Func (WM_tfPaint1Func pfPaint1Func);
# 61 "../Middlewares/ST/STemWin/inc/WIDGET.h" 2
# 70 "../Middlewares/ST/STemWin/inc/WIDGET.h"
typedef struct {
  GUI_HWIN hWin;
  int Cmd;
  int ItemIndex;
  int Col;
  int x0, y0, x1, y1;
  void * p;
} WIDGET_ITEM_DRAW_INFO;

typedef int WIDGET_DRAW_ITEM_FUNC(const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
typedef void WIDGET_PAINT (GUI_HWIN hObj);
typedef void WIDGET_CREATE (GUI_HWIN hObj);

typedef struct {
  WIDGET_PAINT * pfPaint;
  WIDGET_CREATE * pfCreate;
  void * pSkinPrivate;
} WIDGET_SKIN;
# 96 "../Middlewares/ST/STemWin/inc/WIDGET.h"
# 1 "../Middlewares/ST/STemWin/inc/SCROLLBAR.h" 1
# 58 "../Middlewares/ST/STemWin/inc/SCROLLBAR.h"
# 1 "../Middlewares/ST/STemWin/inc/WIDGET.h" 1
# 59 "../Middlewares/ST/STemWin/inc/SCROLLBAR.h" 2
# 104 "../Middlewares/ST/STemWin/inc/SCROLLBAR.h"
typedef signed long SCROLLBAR_Handle;

typedef struct {
  GUI_COLOR aColorFrame[3];
  GUI_COLOR aColorUpper[2];
  GUI_COLOR aColorLower[2];
  GUI_COLOR aColorShaft[2];
  GUI_COLOR ColorArrow;
  GUI_COLOR ColorGrasp;
} SCROLLBAR_SKINFLEX_PROPS;

typedef struct {
  int IsVertical;
  int State;
} SCROLLBAR_SKINFLEX_INFO;







SCROLLBAR_Handle SCROLLBAR_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int WinFlags, int SpecialFlags);
SCROLLBAR_Handle SCROLLBAR_CreateAttached(GUI_HWIN hParent, int SpecialFlags);
SCROLLBAR_Handle SCROLLBAR_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
SCROLLBAR_Handle SCROLLBAR_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
SCROLLBAR_Handle SCROLLBAR_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 139 "../Middlewares/ST/STemWin/inc/SCROLLBAR.h"
void SCROLLBAR_Callback(WM_MESSAGE * pMsg);
# 150 "../Middlewares/ST/STemWin/inc/SCROLLBAR.h"
void SCROLLBAR_AddValue (SCROLLBAR_Handle hObj, int Add);
void SCROLLBAR_Dec (SCROLLBAR_Handle hObj);
void SCROLLBAR_Inc (SCROLLBAR_Handle hObj);
int SCROLLBAR_GetUserData(SCROLLBAR_Handle hObj, void * pDest, int NumBytes);
GUI_COLOR SCROLLBAR_SetColor (SCROLLBAR_Handle hObj, int Index, GUI_COLOR Color);
void SCROLLBAR_SetNumItems(SCROLLBAR_Handle hObj, int NumItems);
void SCROLLBAR_SetPageSize(SCROLLBAR_Handle hObj, int PageSize);
void SCROLLBAR_SetValue (SCROLLBAR_Handle hObj, int v);
int SCROLLBAR_SetWidth (SCROLLBAR_Handle hObj, int Width);
void SCROLLBAR_SetState (SCROLLBAR_Handle hObj, const WM_SCROLL_STATE* pState);
int SCROLLBAR_SetUserData(SCROLLBAR_Handle hObj, const void * pSrc, int NumBytes);







void SCROLLBAR_GetSkinFlexProps (SCROLLBAR_SKINFLEX_PROPS * pProps, int Index);
void SCROLLBAR_SetSkinClassic (SCROLLBAR_Handle hObj);
void SCROLLBAR_SetSkin (SCROLLBAR_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
int SCROLLBAR_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void SCROLLBAR_SetSkinFlexProps (const SCROLLBAR_SKINFLEX_PROPS * pProps, int Index);
void SCROLLBAR_SetDefaultSkinClassic(void);
WIDGET_DRAW_ITEM_FUNC * SCROLLBAR_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
# 184 "../Middlewares/ST/STemWin/inc/SCROLLBAR.h"
int SCROLLBAR_GetDefaultWidth(void);
GUI_COLOR SCROLLBAR_SetDefaultColor(GUI_COLOR Color, unsigned int Index);
int SCROLLBAR_SetDefaultWidth(int DefaultWidth);







int SCROLLBAR_GetThumbSizeMin(void);
int SCROLLBAR_SetThumbSizeMin(int ThumbSizeMin);







int SCROLLBAR_GetNumItems(SCROLLBAR_Handle hObj);
int SCROLLBAR_GetPageSize(SCROLLBAR_Handle hObj);
int SCROLLBAR_GetValue (SCROLLBAR_Handle hObj);
# 97 "../Middlewares/ST/STemWin/inc/WIDGET.h" 2
# 241 "../Middlewares/ST/STemWin/inc/WIDGET.h"
typedef struct {
  int EffectSize;
  void (* pfDrawUp) (void);
  void (* pfDrawUpRect) (const GUI_RECT * pRect);
  void (* pfDrawDown) (void);
  void (* pfDrawDownRect)(const GUI_RECT * pRect);
  void (* pfDrawFlat) (void);
  void (* pfDrawFlatRect)(const GUI_RECT * pRect);
} WIDGET_EFFECT;

typedef struct {
  WM_Obj Win;
  const WIDGET_EFFECT* pEffect;
  signed short Id;
  unsigned short State;



} WIDGET;
# 271 "../Middlewares/ST/STemWin/inc/WIDGET.h"
typedef struct GUI_DRAW GUI_DRAW;
typedef void GUI_DRAW_SELF_CB (GUI_HWIN hWin);
typedef signed long GUI_DRAW_HANDLE;


typedef struct {
  void (* pfDraw) (GUI_DRAW_HANDLE hDrawObj, GUI_HWIN hObj, int x, int y);
  int (* pfGetXSize)(GUI_DRAW_HANDLE hDrawObj);
  int (* pfGetYSize)(GUI_DRAW_HANDLE hDrawObj);
} GUI_DRAW_CONSTS;


struct GUI_DRAW {
  const GUI_DRAW_CONSTS* pConsts;
  union {
    const void * pData;
    GUI_DRAW_SELF_CB* pfDraw;
  } Data;
  signed short xOff, yOff;
};


void GUI_DRAW__Draw (GUI_DRAW_HANDLE hDrawObj, GUI_HWIN hObj, int x, int y);
int GUI_DRAW__GetXSize(GUI_DRAW_HANDLE hDrawObj);
int GUI_DRAW__GetYSize(GUI_DRAW_HANDLE hDrawObj);

void GUI_DrawStreamedEnableAuto(void);


signed long GUI_DRAW_BITMAP_Create (const GUI_BITMAP* pBitmap, int x, int y);
signed long GUI_DRAW_BMP_Create (const void* pBMP, int x, int y);
signed long GUI_DRAW_STREAMED_Create(const GUI_BITMAP_STREAM * pBitmap, int x, int y);
signed long GUI_DRAW_SELF_Create(GUI_DRAW_SELF_CB* pfDraw, int x, int y);
# 312 "../Middlewares/ST/STemWin/inc/WIDGET.h"
extern const WIDGET_EFFECT WIDGET_Effect_3D;
extern const WIDGET_EFFECT WIDGET_Effect_3D1L;
extern const WIDGET_EFFECT WIDGET_Effect_3D2L;
extern const WIDGET_EFFECT WIDGET_Effect_None;
extern const WIDGET_EFFECT WIDGET_Effect_Simple;
# 325 "../Middlewares/ST/STemWin/inc/WIDGET.h"
void WIDGET__DrawFocusRect (WIDGET * pWidget, const GUI_RECT * pRect, int Dist);
void WIDGET__DrawHLine (WIDGET * pWidget, int y, int x0, int x1);
void WIDGET__DrawTriangle (WIDGET * pWidget, int x, int y, int Size, int Inc);
void WIDGET__DrawVLine (WIDGET * pWidget, int x, int y0, int y1);
void WIDGET__EFFECT_DrawDownRect(WIDGET * pWidget, GUI_RECT * pRect);
void WIDGET__EFFECT_DrawDown (WIDGET * pWidget);
void WIDGET__EFFECT_DrawUpRect (WIDGET * pWidget, GUI_RECT * pRect);
void WIDGET__FillRectEx (WIDGET * pWidget, const GUI_RECT * pRect);
int WIDGET__GetWindowSizeX (GUI_HWIN hWin);
GUI_COLOR WIDGET__GetBkColor (GUI_HWIN hObj);
int WIDGET__GetXSize (const WIDGET * pWidget);
int WIDGET__GetYSize (const WIDGET * pWidget);
void WIDGET__GetClientRect (WIDGET * pWidget, GUI_RECT * pRect);
void WIDGET__GetInsideRect (WIDGET * pWidget, GUI_RECT * pRect);
void WIDGET__Init (WIDGET * pWidget, int Id, unsigned short State);
void WIDGET__RotateRect90 (WIDGET * pWidget, GUI_RECT * pDest, const GUI_RECT * pRect);
void WIDGET__SetScrollState (GUI_HWIN hWin, const WM_SCROLL_STATE * pVState, const WM_SCROLL_STATE * pState);
void WIDGET__FillStringInRect (const char * pText, const GUI_RECT * pFillRect, const GUI_RECT * pTextRectMax, const GUI_RECT * pTextRectAct);




extern void (* GUI__pfDrawStreamedBitmap) (const void * p, int x, int y);
extern int (* GUI__pfDrawStreamedBitmapEx)(GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);







void WIDGET_SetState (GUI_HWIN hObj, int State);
void WIDGET_AndState (GUI_HWIN hObj, int State);
void WIDGET_OrState (GUI_HWIN hObj, int State);
int WIDGET_HandleActive (GUI_HWIN hObj, WM_MESSAGE* pMsg);
int WIDGET_GetState (GUI_HWIN hObj);
int WIDGET_SetWidth (GUI_HWIN hObj, int Width);
void WIDGET_SetFocusable (GUI_HWIN hObj, int State);

void WIDGET_EFFECT_3D_DrawUp(void);

const WIDGET_EFFECT* WIDGET_SetDefaultEffect(const WIDGET_EFFECT* pEffect);

void WIDGET_SetEffect (GUI_HWIN hObj, const WIDGET_EFFECT* pEffect);

const WIDGET_EFFECT* WIDGET_GetDefaultEffect(void);

void WIDGET_EFFECT_3D_SetColor (unsigned Index, GUI_COLOR Color);
void WIDGET_EFFECT_3D1L_SetColor (unsigned Index, GUI_COLOR Color);
void WIDGET_EFFECT_3D2L_SetColor (unsigned Index, GUI_COLOR Color);
void WIDGET_EFFECT_Simple_SetColor(unsigned Index, GUI_COLOR Color);

GUI_COLOR WIDGET_EFFECT_3D_GetColor (unsigned Index);
GUI_COLOR WIDGET_EFFECT_3D1L_GetColor (unsigned Index);
GUI_COLOR WIDGET_EFFECT_3D2L_GetColor (unsigned Index);
GUI_COLOR WIDGET_EFFECT_Simple_GetColor(unsigned Index);

int WIDGET_EFFECT_3D_GetNumColors(void);
int WIDGET_EFFECT_3D1L_GetNumColors(void);
int WIDGET_EFFECT_3D2L_GetNumColors(void);
int WIDGET_EFFECT_Simple_GetNumColors(void);
# 59 "../Middlewares/ST/STemWin/inc/BUTTON.h" 2
# 115 "../Middlewares/ST/STemWin/inc/BUTTON.h"
typedef signed long BUTTON_Handle;

typedef struct {
  GUI_COLOR aColorFrame[3];
  GUI_COLOR aColorUpper[2];
  GUI_COLOR aColorLower[2];
  int Radius;
} BUTTON_SKINFLEX_PROPS;
# 132 "../Middlewares/ST/STemWin/inc/BUTTON.h"
BUTTON_Handle BUTTON_Create (int x0, int y0, int xSize, int ySize, int ID, int Flags);
BUTTON_Handle BUTTON_CreateAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags);
BUTTON_Handle BUTTON_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
BUTTON_Handle BUTTON_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
BUTTON_Handle BUTTON_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);







GUI_COLOR BUTTON_GetDefaultBkColor (unsigned Index);
const GUI_FONT * BUTTON_GetDefaultFont (void);
int BUTTON_GetDefaultTextAlign (void);
GUI_COLOR BUTTON_GetDefaultTextColor (unsigned Index);
void BUTTON_SetDefaultBkColor (GUI_COLOR Color, unsigned Index);
GUI_COLOR BUTTON_SetDefaultFocusColor(GUI_COLOR Color);
void BUTTON_SetDefaultFont (const GUI_FONT * pFont);
void BUTTON_SetDefaultTextAlign (int Align);
void BUTTON_SetDefaultTextColor (GUI_COLOR Color, unsigned Index);
# 161 "../Middlewares/ST/STemWin/inc/BUTTON.h"
void BUTTON_Callback(WM_MESSAGE *pMsg);







GUI_COLOR BUTTON_GetBkColor (BUTTON_Handle hObj, unsigned int Index);
const GUI_BITMAP * BUTTON_GetBitmap(BUTTON_Handle hObj,unsigned int Index);
const GUI_FONT * BUTTON_GetFont (BUTTON_Handle hObj);
GUI_COLOR BUTTON_GetFrameColor (BUTTON_Handle hObj);
WIDGET * BUTTON_GetpWidget (BUTTON_Handle hObj);
void BUTTON_GetText (BUTTON_Handle hObj, char * pBuffer, int MaxLen);
GUI_COLOR BUTTON_GetTextColor (BUTTON_Handle hObj, unsigned int Index);
int BUTTON_GetTextAlign (BUTTON_Handle hObj);
int BUTTON_GetUserData (BUTTON_Handle hObj, void * pDest, int NumBytes);
unsigned BUTTON_IsPressed (BUTTON_Handle hObj);
void BUTTON_SetBitmap (BUTTON_Handle hObj, unsigned int Index, const GUI_BITMAP * pBitmap);
void BUTTON_SetBitmapEx (BUTTON_Handle hObj, unsigned int Index, const GUI_BITMAP * pBitmap, int x, int y);
void BUTTON_SetBkColor (BUTTON_Handle hObj, unsigned int Index, GUI_COLOR Color);
void BUTTON_SetBMP (BUTTON_Handle hObj, unsigned int Index, const void * pBitmap);
void BUTTON_SetBMPEx (BUTTON_Handle hObj, unsigned int Index, const void * pBitmap, int x, int y);
void BUTTON_SetFont (BUTTON_Handle hObj, const GUI_FONT * pfont);
void BUTTON_SetFrameColor (BUTTON_Handle hObj, GUI_COLOR Color);
void BUTTON_SetState (BUTTON_Handle hObj, int State);
void BUTTON_SetPressed (BUTTON_Handle hObj, int State);
GUI_COLOR BUTTON_SetFocusColor (BUTTON_Handle hObj, GUI_COLOR Color);
void BUTTON_SetStreamedBitmap (BUTTON_Handle hObj, unsigned int Index, const GUI_BITMAP_STREAM * pBitmap);
void BUTTON_SetStreamedBitmapEx(BUTTON_Handle hObj, unsigned int Index, const GUI_BITMAP_STREAM * pBitmap, int x, int y);
int BUTTON_SetText (BUTTON_Handle hObj, const char* s);
void BUTTON_SetTextAlign (BUTTON_Handle hObj, int Align);
void BUTTON_SetTextColor (BUTTON_Handle hObj, unsigned int Index, GUI_COLOR Color);
void BUTTON_SetTextOffset (BUTTON_Handle hObj, int xPos, int yPos);
void BUTTON_SetSelfDrawEx (BUTTON_Handle hObj, unsigned int Index, GUI_DRAW_SELF_CB * pDraw, int x, int y);
void BUTTON_SetSelfDraw (BUTTON_Handle hObj, unsigned int Index, GUI_DRAW_SELF_CB * pDraw);
void BUTTON_SetReactOnLevel (void);
void BUTTON_SetReactOnTouch (void);
int BUTTON_SetUserData (BUTTON_Handle hObj, const void * pSrc, int NumBytes);
# 210 "../Middlewares/ST/STemWin/inc/BUTTON.h"
void BUTTON_GetSkinFlexProps (BUTTON_SKINFLEX_PROPS * pProps, int Index);
void BUTTON_SetSkinClassic (BUTTON_Handle hObj);
void BUTTON_SetSkin (BUTTON_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
int BUTTON_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void BUTTON_SetSkinFlexProps (const BUTTON_SKINFLEX_PROPS * pProps, int Index);
void BUTTON_SetDefaultSkinClassic(void);
WIDGET_DRAW_ITEM_FUNC * BUTTON_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
# 58 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/CALENDAR.h" 1
# 106 "../Middlewares/ST/STemWin/inc/CALENDAR.h"
typedef struct {
  int Year;
  int Month;
  int Day;
} CALENDAR_DATE;





typedef struct {
  GUI_COLOR aColorFrame[3];
  GUI_COLOR aColorUpper[2];
  GUI_COLOR aColorLower[2];
  GUI_COLOR ColorArrow;
} CALENDAR_SKINFLEX_PROPS;







GUI_HWIN CALENDAR_Create (GUI_HWIN hParent, int xPos, int yPos, unsigned Year, unsigned Month, unsigned Day, unsigned FirstDayOfWeek, int Id, int Flags);
void CALENDAR_GetDate (GUI_HWIN hWin, CALENDAR_DATE * pDate);
void CALENDAR_GetSel (GUI_HWIN hWin, CALENDAR_DATE * pDate);
void CALENDAR_SetDate (GUI_HWIN hWin, CALENDAR_DATE * pDate);
void CALENDAR_SetSel (GUI_HWIN hWin, CALENDAR_DATE * pDate);
void CALENDAR_ShowDate (GUI_HWIN hWin, CALENDAR_DATE * pDate);





void CALENDAR_SetDefaultBkColor(unsigned Index, GUI_COLOR Color);
void CALENDAR_SetDefaultColor (unsigned Index, GUI_COLOR Color);
void CALENDAR_SetDefaultDays (const char ** apDays);
void CALENDAR_SetDefaultFont (unsigned Index, const GUI_FONT * pFont);
void CALENDAR_SetDefaultMonths (const char ** apMonths);
void CALENDAR_SetDefaultSize (unsigned Index, unsigned Size);





void CALENDAR_GetSkinFlexProps (CALENDAR_SKINFLEX_PROPS * pProps, int Index);
void CALENDAR_SetSkinFlexProps (const CALENDAR_SKINFLEX_PROPS * pProps, int Index);
# 161 "../Middlewares/ST/STemWin/inc/CALENDAR.h"
void CALENDAR_Callback(WM_MESSAGE * pMsg);
# 59 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/CHECKBOX.h" 1
# 104 "../Middlewares/ST/STemWin/inc/CHECKBOX.h"
typedef signed long CHECKBOX_Handle;

typedef struct {
  GUI_COLOR aColorFrame[3];
  GUI_COLOR aColorInner[2];
  GUI_COLOR ColorCheck;
  int ButtonSize;
} CHECKBOX_SKINFLEX_PROPS;







CHECKBOX_Handle CHECKBOX_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags);
CHECKBOX_Handle CHECKBOX_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
CHECKBOX_Handle CHECKBOX_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
CHECKBOX_Handle CHECKBOX_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 131 "../Middlewares/ST/STemWin/inc/CHECKBOX.h"
void CHECKBOX_Callback(WM_MESSAGE * pMsg);
# 140 "../Middlewares/ST/STemWin/inc/CHECKBOX.h"
int CHECKBOX_GetDefaultAlign (void);
GUI_COLOR CHECKBOX_GetDefaultBkColor (void);
const GUI_FONT * CHECKBOX_GetDefaultFont (void);
int CHECKBOX_GetDefaultSpacing (void);
int CHECKBOX_GetDefaultTextAlign (void);
GUI_COLOR CHECKBOX_GetDefaultTextColor (void);
int CHECKBOX_GetUserData (CHECKBOX_Handle hObj, void * pDest, int NumBytes);
void CHECKBOX_SetDefaultAlign (int Align);
void CHECKBOX_SetDefaultBkColor (GUI_COLOR Color);
GUI_COLOR CHECKBOX_SetDefaultFocusColor(GUI_COLOR Color);
void CHECKBOX_SetDefaultFont (const GUI_FONT * pFont);
void CHECKBOX_SetDefaultImage (const GUI_BITMAP * pBitmap, unsigned int Index);
void CHECKBOX_SetDefaultSpacing (int Spacing);
void CHECKBOX_SetDefaultTextAlign (int Align);
void CHECKBOX_SetDefaultTextColor (GUI_COLOR Color);
# 163 "../Middlewares/ST/STemWin/inc/CHECKBOX.h"
int CHECKBOX_GetState (CHECKBOX_Handle hObj);
int CHECKBOX_GetText (CHECKBOX_Handle hObj, char * pBuffer, int MaxLen);
int CHECKBOX_IsChecked (CHECKBOX_Handle hObj);
void CHECKBOX_SetBkColor (CHECKBOX_Handle hObj, GUI_COLOR Color);
GUI_COLOR CHECKBOX_SetBoxBkColor(CHECKBOX_Handle hObj, GUI_COLOR Color, int Index);
GUI_COLOR CHECKBOX_SetFocusColor(CHECKBOX_Handle hObj, GUI_COLOR Color);
void CHECKBOX_SetFont (CHECKBOX_Handle hObj, const GUI_FONT * pFont);
void CHECKBOX_SetImage (CHECKBOX_Handle hObj, const GUI_BITMAP * pBitmap, unsigned int Index);
void CHECKBOX_SetNumStates (CHECKBOX_Handle hObj, unsigned NumStates);
void CHECKBOX_SetSpacing (CHECKBOX_Handle hObj, unsigned Spacing);
void CHECKBOX_SetState (CHECKBOX_Handle hObj, unsigned State);
void CHECKBOX_SetText (CHECKBOX_Handle hObj, const char * pText);
void CHECKBOX_SetTextAlign (CHECKBOX_Handle hObj, int Align);
void CHECKBOX_SetTextColor (CHECKBOX_Handle hObj, GUI_COLOR Color);
int CHECKBOX_SetUserData (CHECKBOX_Handle hObj, const void * pSrc, int NumBytes);







void CHECKBOX_GetSkinFlexProps (CHECKBOX_SKINFLEX_PROPS * pProps, int Index);
void CHECKBOX_SetSkinClassic (CHECKBOX_Handle hObj);
void CHECKBOX_SetSkin (CHECKBOX_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
int CHECKBOX_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void CHECKBOX_SetSkinFlexProps (const CHECKBOX_SKINFLEX_PROPS * pProps, int Index);
void CHECKBOX_SetDefaultSkinClassic (void);
int CHECKBOX_GetSkinFlexButtonSize (CHECKBOX_Handle hObj);
void CHECKBOX_SetSkinFlexButtonSize (CHECKBOX_Handle hObj, int ButtonSize);
WIDGET_DRAW_ITEM_FUNC * CHECKBOX_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
# 60 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/CHOOSECOLOR.h" 1
# 85 "../Middlewares/ST/STemWin/inc/CHOOSECOLOR.h"
typedef struct {
  unsigned aBorder[2];
  unsigned aSpace[2];
  unsigned aButtonSize[2];
  GUI_COLOR aColor[2];
} CHOOSECOLOR_PROPS;





typedef struct {
  unsigned long LastColor;
  const GUI_COLOR * pColor;
  unsigned NumColors;
  unsigned NumColorsPerLine;
  int SelOld;
  int Sel;
  GUI_HWIN hParent;
  CHOOSECOLOR_PROPS Props;
} CHOOSECOLOR_CONTEXT;







GUI_HWIN CHOOSECOLOR_Create(GUI_HWIN hParent,
                           int xPos,
                           int yPos,
                           int xSize,
                           int ySize,
                           const GUI_COLOR * pColor,
                           unsigned NumColors,
                           unsigned NumColorsPerLine,
                           int Sel,
                           const char * sCaption,
                           int Flags);

int CHOOSECOLOR_GetSel(GUI_HWIN hObj);
void CHOOSECOLOR_SetSel(GUI_HWIN hObj, int Sel);

void CHOOSECOLOR_SetDefaultColor (unsigned Index, GUI_COLOR Color);
void CHOOSECOLOR_SetDefaultSpace (unsigned Index, unsigned Space);
void CHOOSECOLOR_SetDefaultBorder (unsigned Index, unsigned Border);
void CHOOSECOLOR_SetDefaultButtonSize(unsigned Index, unsigned ButtonSize);
# 140 "../Middlewares/ST/STemWin/inc/CHOOSECOLOR.h"
void CHOOSECOLOR_Callback(WM_MESSAGE * pMsg);
# 61 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/CHOOSEFILE.h" 1
# 93 "../Middlewares/ST/STemWin/inc/CHOOSEFILE.h"
typedef struct CHOOSEFILE_INFO CHOOSEFILE_INFO;

struct CHOOSEFILE_INFO {
  int Cmd;
  int Id;
  const char * pMask;
  char * pName;
  char * pExt;
  char * pAttrib;
  WM_TOOLTIP_HANDLE hToolTip;
  unsigned long SizeL;
  unsigned long SizeH;
  unsigned long Flags;
  char pRoot[256];
  int (* pfGetData)(CHOOSEFILE_INFO * pInfo);
};







GUI_HWIN CHOOSEFILE_Create(GUI_HWIN hParent,
                          int xPos,
                          int yPos,
                          int xSize,
                          int ySize,
                          const char * apRoot[],
                          int NumRoot,
                          int SelRoot,
                          const char * sCaption,
                          int Flags,
                          CHOOSEFILE_INFO * pInfo
                          );

void CHOOSEFILE_Callback (WM_MESSAGE * pMsg);
void CHOOSEFILE_EnableToolTips (void);
void CHOOSEFILE_SetButtonText (GUI_HWIN hWin, unsigned ButtonIndex, const char * pText);
void CHOOSEFILE_SetDefaultButtonText(unsigned ButtonIndex, const char * pText);
void CHOOSEFILE_SetDelim (char Delim);
void CHOOSEFILE_SetToolTips (const TOOLTIP_INFO * pInfo, int NumItems);
void CHOOSEFILE_SetTopMode (unsigned OnOff);
# 62 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/DROPDOWN.h" 1
# 58 "../Middlewares/ST/STemWin/inc/DROPDOWN.h"
# 1 "../Middlewares/ST/STemWin/inc/LISTBOX.h" 1
# 88 "../Middlewares/ST/STemWin/inc/LISTBOX.h"
typedef signed long LISTBOX_Handle;
# 127 "../Middlewares/ST/STemWin/inc/LISTBOX.h"
LISTBOX_Handle LISTBOX_Create (const GUI_ConstString * ppText, int x0, int y0, int xSize, int ySize, int Flags);
LISTBOX_Handle LISTBOX_CreateAsChild (const GUI_ConstString * ppText, GUI_HWIN hWinParent, int x0, int y0, int xSize, int ySize, int Flags);
LISTBOX_Handle LISTBOX_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, const GUI_ConstString * ppText);
LISTBOX_Handle LISTBOX_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, const GUI_ConstString * ppText, int NumExtraBytes);
LISTBOX_Handle LISTBOX_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 140 "../Middlewares/ST/STemWin/inc/LISTBOX.h"
void LISTBOX_Callback(WM_MESSAGE * pMsg);
# 149 "../Middlewares/ST/STemWin/inc/LISTBOX.h"
int LISTBOX_AddKey (LISTBOX_Handle hObj, int Key);
void LISTBOX_AddString (LISTBOX_Handle hObj, const char * s);
void LISTBOX_AddStringH (LISTBOX_Handle hObj, signed long hString);
void LISTBOX_DecSel (LISTBOX_Handle hObj);
void LISTBOX_DeleteItem (LISTBOX_Handle hObj, unsigned int Index);
void LISTBOX_EnableFixedScrollMode(LISTBOX_Handle hObj, unsigned int OnOff, unsigned char FixedPos);
void LISTBOX_EnableWrapMode (LISTBOX_Handle hObj, int OnOff);
unsigned LISTBOX_GetItemSpacing (LISTBOX_Handle hObj);
unsigned LISTBOX_GetNumItems (LISTBOX_Handle hObj);
int LISTBOX_GetSel (LISTBOX_Handle hObj);
const GUI_FONT * LISTBOX_GetFont (LISTBOX_Handle hObj);
int LISTBOX_GetItemDisabled (LISTBOX_Handle hObj, unsigned Index);
int LISTBOX_GetItemSel (LISTBOX_Handle hObj, unsigned Index);
void LISTBOX_GetItemText (LISTBOX_Handle hObj, unsigned Index, char * pBuffer, int MaxSize);
int LISTBOX_GetMulti (LISTBOX_Handle hObj);
GUI_HWIN LISTBOX_GetOwner (LISTBOX_Handle hObj);
int LISTBOX_GetScrollStepH (LISTBOX_Handle hObj);
int LISTBOX_GetTextAlign (LISTBOX_Handle hObj);
int LISTBOX_GetUserData (LISTBOX_Handle hObj, void * pDest, int NumBytes);
void LISTBOX_IncSel (LISTBOX_Handle hObj);
void LISTBOX_InsertString (LISTBOX_Handle hObj, const char * s, unsigned int Index);
void LISTBOX_InvalidateItem (LISTBOX_Handle hObj, int Index);
int LISTBOX_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void LISTBOX_SetAutoScrollH (LISTBOX_Handle hObj, int OnOff);
void LISTBOX_SetAutoScrollV (LISTBOX_Handle hObj, int OnOff);
void LISTBOX_SetBkColor (LISTBOX_Handle hObj, unsigned int Index, GUI_COLOR color);
void LISTBOX_SetFont (LISTBOX_Handle hObj, const GUI_FONT * pFont);
void LISTBOX_SetItemDisabled (LISTBOX_Handle hObj, unsigned Index, int OnOff);
void LISTBOX_SetItemSel (LISTBOX_Handle hObj, unsigned Index, int OnOff);
void LISTBOX_SetItemSpacing (LISTBOX_Handle hObj, unsigned Value);
void LISTBOX_SetMulti (LISTBOX_Handle hObj, int Mode);
void LISTBOX_SetOwner (LISTBOX_Handle hObj, GUI_HWIN hOwner);
void LISTBOX_SetOwnerDraw (LISTBOX_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawItem);
void LISTBOX_SetScrollStepH (LISTBOX_Handle hObj, int Value);
void LISTBOX_SetSel (LISTBOX_Handle hObj, int Sel);
void LISTBOX_SetScrollbarColor(LISTBOX_Handle hObj, unsigned Index, GUI_COLOR Color);
void LISTBOX_SetScrollbarWidth(LISTBOX_Handle hObj, unsigned Width);
void LISTBOX_SetString (LISTBOX_Handle hObj, const char * s, unsigned int Index);
void LISTBOX_SetText (LISTBOX_Handle hObj, const GUI_ConstString * ppText);
void LISTBOX_SetTextAlign (LISTBOX_Handle hObj, int Align);
GUI_COLOR LISTBOX_SetTextColor (LISTBOX_Handle hObj, unsigned int Index, GUI_COLOR Color);
int LISTBOX_SetUserData (LISTBOX_Handle hObj, const void * pSrc, int NumBytes);
int LISTBOX_UpdateScrollers (LISTBOX_Handle hObj);
# 200 "../Middlewares/ST/STemWin/inc/LISTBOX.h"
const GUI_FONT * LISTBOX_GetDefaultFont(void);
int LISTBOX_GetDefaultScrollStepH (void);
GUI_COLOR LISTBOX_GetDefaultBkColor (unsigned Index);
int LISTBOX_GetDefaultTextAlign (void);
GUI_COLOR LISTBOX_GetDefaultTextColor (unsigned Index);
int LISTBOX_GetDefaultScrollMode (void);
void LISTBOX_SetDefaultFont (const GUI_FONT * pFont);
void LISTBOX_SetDefaultScrollStepH (int Value);
void LISTBOX_SetDefaultBkColor (unsigned Index, GUI_COLOR Color);
void LISTBOX_SetDefaultTextAlign (int Align);
void LISTBOX_SetDefaultTextColor (unsigned Index, GUI_COLOR Color);
void LISTBOX_SetDefaultScrollMode (unsigned char ScrollMode);
# 59 "../Middlewares/ST/STemWin/inc/DROPDOWN.h" 2
# 99 "../Middlewares/ST/STemWin/inc/DROPDOWN.h"
typedef signed long DROPDOWN_Handle;

typedef struct {
  GUI_COLOR aColorFrame[3];
  GUI_COLOR aColorUpper[2];
  GUI_COLOR aColorLower[2];
  GUI_COLOR ColorArrow;
  GUI_COLOR ColorText;
  GUI_COLOR ColorSep;
  int Radius;
} DROPDOWN_SKINFLEX_PROPS;







DROPDOWN_Handle DROPDOWN_Create (GUI_HWIN hWinParent, int x0, int y0, int xSize, int ySize, int Flags);
DROPDOWN_Handle DROPDOWN_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
DROPDOWN_Handle DROPDOWN_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
DROPDOWN_Handle DROPDOWN_CreateIndirect(const GUI_WIDGET_CREATE_INFO* pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK* cb);
# 129 "../Middlewares/ST/STemWin/inc/DROPDOWN.h"
void DROPDOWN_Callback(WM_MESSAGE * pMsg);







void DROPDOWN_AddKey (DROPDOWN_Handle hObj, int Key);
void DROPDOWN_AddString (DROPDOWN_Handle hObj, const char* s);
void DROPDOWN_Collapse (DROPDOWN_Handle hObj);
void DROPDOWN_DecSel (DROPDOWN_Handle hObj);
void DROPDOWN_DecSelExp (DROPDOWN_Handle hObj);
void DROPDOWN_DeleteItem (DROPDOWN_Handle hObj, unsigned int Index);
void DROPDOWN_Expand (DROPDOWN_Handle hObj);
unsigned DROPDOWN_GetItemDisabled (DROPDOWN_Handle hObj, unsigned Index);
unsigned DROPDOWN_GetItemSpacing (DROPDOWN_Handle hObj);
int DROPDOWN_GetItemText (DROPDOWN_Handle hObj, unsigned Index, char * pBuffer, int MaxSize);
LISTBOX_Handle DROPDOWN_GetListbox (DROPDOWN_Handle hObj);
int DROPDOWN_GetNumItems (DROPDOWN_Handle hObj);
int DROPDOWN_GetSel (DROPDOWN_Handle hObj);
int DROPDOWN_GetSelExp (DROPDOWN_Handle hObj);
int DROPDOWN_GetUserData (DROPDOWN_Handle hObj, void * pDest, int NumBytes);
void DROPDOWN_IncSel (DROPDOWN_Handle hObj);
void DROPDOWN_IncSelExp (DROPDOWN_Handle hObj);
void DROPDOWN_InsertString (DROPDOWN_Handle hObj, const char* s, unsigned int Index);
void DROPDOWN_SetAutoScroll (DROPDOWN_Handle hObj, int OnOff);
void DROPDOWN_SetBkColor (DROPDOWN_Handle hObj, unsigned int Index, GUI_COLOR color);
void DROPDOWN_SetColor (DROPDOWN_Handle hObj, unsigned int Index, GUI_COLOR Color);
void DROPDOWN_SetFont (DROPDOWN_Handle hObj, const GUI_FONT * pfont);
void DROPDOWN_SetItemDisabled (DROPDOWN_Handle hObj, unsigned Index, int OnOff);
void DROPDOWN_SetItemSpacing (DROPDOWN_Handle hObj, unsigned Value);
int DROPDOWN_SetListHeight (DROPDOWN_Handle hObj, unsigned Height);
void DROPDOWN_SetScrollbarColor(DROPDOWN_Handle hObj, unsigned Index, GUI_COLOR Color);
void DROPDOWN_SetScrollbarWidth(DROPDOWN_Handle hObj, unsigned Width);
void DROPDOWN_SetSel (DROPDOWN_Handle hObj, int Sel);
void DROPDOWN_SetSelExp (DROPDOWN_Handle hObj, int Sel);
void DROPDOWN_SetTextAlign (DROPDOWN_Handle hObj, int Align);
void DROPDOWN_SetTextColor (DROPDOWN_Handle hObj, unsigned int index, GUI_COLOR color);
void DROPDOWN_SetTextHeight (DROPDOWN_Handle hObj, unsigned TextHeight);
int DROPDOWN_SetUpMode (DROPDOWN_Handle hObj, int OnOff);
int DROPDOWN_SetUserData (DROPDOWN_Handle hObj, const void * pSrc, int NumBytes);







void DROPDOWN_GetSkinFlexProps (DROPDOWN_SKINFLEX_PROPS * pProps, int Index);
void DROPDOWN_SetSkinClassic (DROPDOWN_Handle hObj);
void DROPDOWN_SetSkin (DROPDOWN_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
int DROPDOWN_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void DROPDOWN_SetSkinFlexProps (const DROPDOWN_SKINFLEX_PROPS * pProps, int Index);
void DROPDOWN_SetDefaultSkinClassic(void);
WIDGET_DRAW_ITEM_FUNC * DROPDOWN_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
# 194 "../Middlewares/ST/STemWin/inc/DROPDOWN.h"
GUI_COLOR DROPDOWN_GetDefaultBkColor (int Index);
GUI_COLOR DROPDOWN_GetDefaultColor (int Index);
const GUI_FONT * DROPDOWN_GetDefaultFont (void);
GUI_COLOR DROPDOWN_GetDefaultScrollbarColor(int Index);
void DROPDOWN_SetDefaultFont (const GUI_FONT * pFont);
GUI_COLOR DROPDOWN_SetDefaultBkColor (int Index, GUI_COLOR Color);
GUI_COLOR DROPDOWN_SetDefaultColor (int Index, GUI_COLOR Color);
GUI_COLOR DROPDOWN_SetDefaultScrollbarColor(int Index, GUI_COLOR Color);
# 63 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/EDIT.h" 1
# 128 "../Middlewares/ST/STemWin/inc/EDIT.h"
typedef signed long EDIT_Handle;
typedef void tEDIT_AddKeyEx (EDIT_Handle hObj, int Key);
typedef void tEDIT_UpdateBuffer(EDIT_Handle hObj);





EDIT_Handle EDIT_Create (int x0, int y0, int xSize, int ySize, int Id, int MaxLen, int Flags);
EDIT_Handle EDIT_CreateAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, int MaxLen);
EDIT_Handle EDIT_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int MaxLen);
EDIT_Handle EDIT_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int MaxLen, int NumExtraBytes);
EDIT_Handle EDIT_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 149 "../Middlewares/ST/STemWin/inc/EDIT.h"
void EDIT_Callback(WM_MESSAGE * pMsg);







void EDIT_SetDefaultBkColor (unsigned int Index, GUI_COLOR Color);
void EDIT_SetDefaultFont (const GUI_FONT * pFont);
void EDIT_SetDefaultTextAlign(int Align);
void EDIT_SetDefaultTextColor(unsigned int Index, GUI_COLOR Color);
# 169 "../Middlewares/ST/STemWin/inc/EDIT.h"
GUI_COLOR EDIT_GetDefaultBkColor(unsigned int Index);
const GUI_FONT * EDIT_GetDefaultFont(void);
int EDIT_GetDefaultTextAlign(void);
GUI_COLOR EDIT_GetDefaultTextColor(unsigned int Index);



void EDIT_AddKey (EDIT_Handle hObj, int Key);
void EDIT_EnableBlink (EDIT_Handle hObj, int Period, int OnOff);
GUI_COLOR EDIT_GetBkColor (EDIT_Handle hObj, unsigned int Index);
void EDIT_SetBkColor (EDIT_Handle hObj, unsigned int Index, GUI_COLOR color);
void EDIT_SetCursorAtChar (EDIT_Handle hObj, int Pos);
void EDIT_SetCursorAtPixel (EDIT_Handle hObj, int xPos);
void EDIT_SetFont (EDIT_Handle hObj, const GUI_FONT * pFont);
int EDIT_SetInsertMode (EDIT_Handle hObj, int OnOff);
void EDIT_SetMaxLen (EDIT_Handle hObj, int MaxLen);
void EDIT_SetpfAddKeyEx (EDIT_Handle hObj, tEDIT_AddKeyEx * pfAddKeyEx);
void EDIT_SetpfUpdateBuffer(EDIT_Handle hObj, tEDIT_UpdateBuffer * pfUpdateBuffer);
void EDIT_SetText (EDIT_Handle hObj, const char * s);
void EDIT_SetTextAlign (EDIT_Handle hObj, int Align);
GUI_COLOR EDIT_GetTextColor(EDIT_Handle hObj, unsigned int Index);
void EDIT_SetTextColor (EDIT_Handle hObj, unsigned int Index, GUI_COLOR Color);
void EDIT_SetSel (EDIT_Handle hObj, int FirstChar, int LastChar);
int EDIT_SetUserData (EDIT_Handle hObj, const void * pSrc, int NumBytes);
int EDIT_EnableInversion (EDIT_Handle hObj, int OnOff);



int EDIT_GetCursorCharPos (EDIT_Handle hObj);
void EDIT_GetCursorPixelPos (EDIT_Handle hObj, int * pxPos, int * pyPos);
float EDIT_GetFloatValue (EDIT_Handle hObj);
const GUI_FONT * EDIT_GetFont(EDIT_Handle hObj);
int EDIT_GetNumChars (EDIT_Handle hObj);
void EDIT_GetText (EDIT_Handle hObj, char * sDest, int MaxLen);
signed long EDIT_GetValue (EDIT_Handle hObj);
void EDIT_SetFloatValue (EDIT_Handle hObj, float Value);
int EDIT_GetUserData (EDIT_Handle hObj, void * pDest, int NumBytes);
void EDIT_SetValue (EDIT_Handle hObj, signed long Value);
# 217 "../Middlewares/ST/STemWin/inc/EDIT.h"
void EDIT_SetHexMode (EDIT_Handle hEdit, unsigned long Value, unsigned long Min, unsigned long Max);
void EDIT_SetBinMode (EDIT_Handle hEdit, unsigned long Value, unsigned long Min, unsigned long Max);
void EDIT_SetDecMode (EDIT_Handle hEdit, signed long Value, signed long Min, signed long Max, int Shift, unsigned char Flags);
void EDIT_SetFloatMode(EDIT_Handle hEdit, float Value, float Min, float Max, int Shift, unsigned char Flags);
void EDIT_SetTextMode (EDIT_Handle hEdit);
void EDIT_SetUlongMode(EDIT_Handle hEdit, unsigned long Value, unsigned long Min, unsigned long Max);

unsigned long GUI_EditHex (unsigned long Value, unsigned long Min, unsigned long Max, int Len, int xSize);
unsigned long GUI_EditBin (unsigned long Value, unsigned long Min, unsigned long Max, int Len, int xSize);
signed long GUI_EditDec (signed long Value, signed long Min, signed long Max, int Len, int xSize, int Shift, unsigned char Flags);
float GUI_EditFloat (float Value, float Min, float Max, int Len, int xSize, int Shift, unsigned char Flags);
void GUI_EditString (char * pString, int Len, int xSize);
# 64 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/FRAMEWIN.h" 1
# 133 "../Middlewares/ST/STemWin/inc/FRAMEWIN.h"
typedef signed long FRAMEWIN_Handle;

typedef struct {
  GUI_COLOR aColorFrame[3];
  GUI_COLOR aColorTitle[2];
  int Radius;
  int SpaceX;
  int BorderSizeL;
  int BorderSizeR;
  int BorderSizeT;
  int BorderSizeB;
} FRAMEWIN_SKINFLEX_PROPS;







FRAMEWIN_Handle FRAMEWIN_Create (const char * pTitle, WM_CALLBACK * cb, int Flags, int x0, int y0, int xSize, int ySize);
FRAMEWIN_Handle FRAMEWIN_CreateAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, const char * pText, WM_CALLBACK * cb, int Flags);
FRAMEWIN_Handle FRAMEWIN_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, const char * pTitle, WM_CALLBACK * cb);
FRAMEWIN_Handle FRAMEWIN_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, const char * pTitle, WM_CALLBACK * cb, int NumExtraBytes);
FRAMEWIN_Handle FRAMEWIN_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 165 "../Middlewares/ST/STemWin/inc/FRAMEWIN.h"
void FRAMEWIN_Callback(WM_MESSAGE * pMsg);







GUI_HWIN FRAMEWIN_AddButton (FRAMEWIN_Handle hObj, int Flags, int Off, int Id);
GUI_HWIN FRAMEWIN_AddCloseButton(FRAMEWIN_Handle hObj, int Flags, int Off);
GUI_HWIN FRAMEWIN_AddMaxButton (FRAMEWIN_Handle hObj, int Flags, int Off);
void FRAMEWIN_AddMenu (FRAMEWIN_Handle hObj, GUI_HWIN hMenu);
GUI_HWIN FRAMEWIN_AddMinButton (FRAMEWIN_Handle hObj, int Flags, int Off);
void FRAMEWIN_Minimize (FRAMEWIN_Handle hObj);
void FRAMEWIN_Maximize (FRAMEWIN_Handle hObj);
void FRAMEWIN_Restore (FRAMEWIN_Handle hObj);
void FRAMEWIN_SetActive (FRAMEWIN_Handle hObj, int State);
void FRAMEWIN_SetBarColor (FRAMEWIN_Handle hObj, unsigned Index, GUI_COLOR Color);
void FRAMEWIN_SetBorderSize (FRAMEWIN_Handle hObj, unsigned Size);
void FRAMEWIN_SetClientColor(FRAMEWIN_Handle hObj, GUI_COLOR Color);
void FRAMEWIN_SetFont (FRAMEWIN_Handle hObj, const GUI_FONT * pFont);
void FRAMEWIN_SetMoveable (FRAMEWIN_Handle hObj, int State);
void FRAMEWIN_SetOwnerDraw (FRAMEWIN_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawItem);
void FRAMEWIN_SetResizeable (FRAMEWIN_Handle hObj, int State);
void FRAMEWIN_SetText (FRAMEWIN_Handle hObj, const char* s);
void FRAMEWIN_SetTextAlign (FRAMEWIN_Handle hObj, int Align);
void FRAMEWIN_SetTextColor (FRAMEWIN_Handle hObj, GUI_COLOR Color);
void FRAMEWIN_SetTextColorEx(FRAMEWIN_Handle hObj, unsigned Index, GUI_COLOR Color);
void FRAMEWIN_SetTitleVis (FRAMEWIN_Handle hObj, int Show);
int FRAMEWIN_SetTitleHeight(FRAMEWIN_Handle hObj, int Height);
int FRAMEWIN_SetUserData (FRAMEWIN_Handle hObj, const void * pSrc, int NumBytes);







void FRAMEWIN_GetSkinFlexProps (FRAMEWIN_SKINFLEX_PROPS * pProps, int Index);
void FRAMEWIN_SetSkinClassic (FRAMEWIN_Handle hObj);
void FRAMEWIN_SetSkin (FRAMEWIN_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
int FRAMEWIN_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void FRAMEWIN_SetSkinFlexProps (const FRAMEWIN_SKINFLEX_PROPS * pProps, int Index);
void FRAMEWIN_SetDefaultSkinClassic(void);
WIDGET_DRAW_ITEM_FUNC * FRAMEWIN_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
# 219 "../Middlewares/ST/STemWin/inc/FRAMEWIN.h"
const GUI_FONT * FRAMEWIN_GetFont(FRAMEWIN_Handle hObj);

int FRAMEWIN_GetActive (FRAMEWIN_Handle hObj);
int FRAMEWIN_GetTitleHeight (FRAMEWIN_Handle hObj);
GUI_COLOR FRAMEWIN_GetBarColor (FRAMEWIN_Handle hObj, unsigned Index);
int FRAMEWIN_GetBorderSize (FRAMEWIN_Handle hObj);
int FRAMEWIN_GetBorderSizeEx(FRAMEWIN_Handle hObj, unsigned Edge);
void FRAMEWIN_GetText (FRAMEWIN_Handle hObj, char * pBuffer, int MaxLen);
int FRAMEWIN_GetTextAlign (FRAMEWIN_Handle hObj);
int FRAMEWIN_GetUserData (FRAMEWIN_Handle hObj, void * pDest, int NumBytes);
int FRAMEWIN_IsMinimized (FRAMEWIN_Handle hObj);
int FRAMEWIN_IsMaximized (FRAMEWIN_Handle hObj);







GUI_COLOR FRAMEWIN_GetDefaultBarColor (unsigned Index);
int FRAMEWIN_GetDefaultBorderSize (void);
int FRAMEWIN_GetDefaultTitleHeight(void);
GUI_COLOR FRAMEWIN_GetDefaultClientColor(void);
const GUI_FONT * FRAMEWIN_GetDefaultFont (void);
GUI_COLOR FRAMEWIN_GetDefaultTextColor (unsigned Index);
int FRAMEWIN_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void FRAMEWIN_SetDefaultBarColor (unsigned Index, GUI_COLOR Color);
void FRAMEWIN_SetDefaultBorderSize (int DefaultBorderSize);
void FRAMEWIN_SetDefaultTitleHeight(int DefaultTitleHeight);
void FRAMEWIN_SetDefaultClientColor(GUI_COLOR Color);
void FRAMEWIN_SetDefaultFont (const GUI_FONT * pFont);
int FRAMEWIN_SetDefaultTextAlign (int TextAlign);
void FRAMEWIN_SetDefaultTextColor (unsigned Index, GUI_COLOR Color);
# 65 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/GRAPH.h" 1
# 109 "../Middlewares/ST/STemWin/inc/GRAPH.h"
typedef signed long GRAPH_Handle;
typedef signed long GRAPH_DATA_Handle;
typedef signed long GRAPH_SCALE_Handle;
# 120 "../Middlewares/ST/STemWin/inc/GRAPH.h"
GRAPH_Handle GRAPH_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
GRAPH_Handle GRAPH_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
GRAPH_Handle GRAPH_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);

GRAPH_DATA_Handle GRAPH_DATA_XY_Create(GUI_COLOR Color, unsigned MaxNumItems, const GUI_POINT * pData, unsigned NumItems);
GRAPH_DATA_Handle GRAPH_DATA_YT_Create(GUI_COLOR Color, unsigned MaxNumItems, const signed short * pData, unsigned NumItems);
GRAPH_SCALE_Handle GRAPH_SCALE_Create (int Pos, int TextAlign, unsigned Flags, unsigned TickDist);
# 135 "../Middlewares/ST/STemWin/inc/GRAPH.h"
void GRAPH_Callback(WM_MESSAGE * pMsg);







void GRAPH_AttachData (GRAPH_Handle hObj, GRAPH_DATA_Handle hData);
void GRAPH_AttachScale (GRAPH_Handle hObj, GRAPH_SCALE_Handle hScale);
void GRAPH_DetachData (GRAPH_Handle hObj, GRAPH_DATA_Handle hData);
void GRAPH_DetachScale (GRAPH_Handle hObj, GRAPH_SCALE_Handle hScale);
signed long GRAPH_GetScrollValue (GRAPH_Handle hObj, unsigned char Coord);
int GRAPH_GetUserData (GRAPH_Handle hObj, void * pDest, int NumBytes);
void GRAPH_SetAutoScrollbar (GRAPH_Handle hObj, unsigned char Coord, unsigned char OnOff);
void GRAPH_SetBorder (GRAPH_Handle hObj, unsigned BorderL, unsigned BorderT, unsigned BorderR, unsigned BorderB);
GUI_COLOR GRAPH_SetColor (GRAPH_Handle hObj, GUI_COLOR Color, unsigned Index);
unsigned GRAPH_SetGridFixedX (GRAPH_Handle hObj, unsigned OnOff);
unsigned GRAPH_SetGridOffY (GRAPH_Handle hObj, unsigned Value);
unsigned GRAPH_SetGridVis (GRAPH_Handle hObj, unsigned OnOff);
unsigned GRAPH_SetGridDistX (GRAPH_Handle hObj, unsigned Value);
unsigned GRAPH_SetGridDistY (GRAPH_Handle hObj, unsigned Value);
unsigned char GRAPH_SetLineStyleH (GRAPH_Handle hObj, unsigned char Value);
unsigned char GRAPH_SetLineStyleV (GRAPH_Handle hObj, unsigned char Value);
void GRAPH_SetLineStyle (GRAPH_Handle hObj, unsigned char Value);
void GRAPH_SetScrollValue (GRAPH_Handle hObj, unsigned char Coord, unsigned long Value);
unsigned GRAPH_SetVSizeX (GRAPH_Handle hObj, unsigned Value);
unsigned GRAPH_SetVSizeY (GRAPH_Handle hObj, unsigned Value);
int GRAPH_SetUserData (GRAPH_Handle hObj, const void * pSrc, int NumBytes);
void GRAPH_SetUserDraw (GRAPH_Handle hObj, void (* pOwnerDraw)(GUI_HWIN, int));

void GRAPH_DATA_YT_AddValue (GRAPH_DATA_Handle hDataObj, signed short Value);
void GRAPH_DATA_YT_Clear (GRAPH_DATA_Handle hDataObj);
void GRAPH_DATA_YT_Delete (GRAPH_DATA_Handle hDataObj);
int GRAPH_DATA_YT_GetValue (GRAPH_DATA_Handle hDataObj, signed short * pValue, unsigned long Index);

void GRAPH_DATA_YT_SetAlign (GRAPH_DATA_Handle hDataObj, int Align);
void GRAPH_DATA_YT_SetOffY (GRAPH_DATA_Handle hDataObj, int Off);
void GRAPH_DATA_YT_MirrorX (GRAPH_DATA_Handle hDataObj, int OnOff);

void GRAPH_DATA_XY_AddPoint (GRAPH_DATA_Handle hDataObj, GUI_POINT * pPoint);
void GRAPH_DATA_XY_Clear (GRAPH_DATA_Handle hDataObj);
void GRAPH_DATA_XY_Delete (GRAPH_DATA_Handle hDataObj);
unsigned GRAPH_DATA_XY_GetLineVis (GRAPH_DATA_Handle hDataObj);
int GRAPH_DATA_XY_GetPoint (GRAPH_DATA_Handle hDataObj, GUI_POINT * pPoint, unsigned long Index);
unsigned GRAPH_DATA_XY_GetPointVis (GRAPH_DATA_Handle hDataObj);
void GRAPH_DATA_XY_SetLineStyle (GRAPH_DATA_Handle hDataObj, unsigned char LineStyle);
unsigned GRAPH_DATA_XY_SetLineVis (GRAPH_DATA_Handle hDataObj, unsigned OnOff);
void GRAPH_DATA_XY_SetOffX (GRAPH_DATA_Handle hDataObj, int Off);
void GRAPH_DATA_XY_SetOffY (GRAPH_DATA_Handle hDataObj, int Off);
void GRAPH_DATA_XY_SetPenSize (GRAPH_DATA_Handle hDataObj, unsigned char PenSize);
void GRAPH_DATA_XY_SetPointSize (GRAPH_DATA_Handle hDataObj, unsigned PointSize);
unsigned GRAPH_DATA_XY_SetPointVis (GRAPH_DATA_Handle hDataObj, unsigned OnOff);
void GRAPH_DATA_XY_SetOwnerDraw (GRAPH_DATA_Handle hDataObj, WIDGET_DRAW_ITEM_FUNC * pOwnerDraw);

void GRAPH_SCALE_Delete (GRAPH_SCALE_Handle hScaleObj);
float GRAPH_SCALE_SetFactor (GRAPH_SCALE_Handle hScaleObj, float Factor);
const GUI_FONT * GRAPH_SCALE_SetFont (GRAPH_SCALE_Handle hScaleObj, const GUI_FONT * pFont);
int GRAPH_SCALE_SetNumDecs (GRAPH_SCALE_Handle hScaleObj, int NumDecs);
int GRAPH_SCALE_SetOff (GRAPH_SCALE_Handle hScaleObj, int Off);
int GRAPH_SCALE_SetPos (GRAPH_SCALE_Handle hScaleObj, int Pos);
GUI_COLOR GRAPH_SCALE_SetTextColor(GRAPH_SCALE_Handle hScaleObj, GUI_COLOR Color);
unsigned GRAPH_SCALE_SetTickDist (GRAPH_SCALE_Handle hScaleObj, unsigned Value);
# 66 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/HEADER.h" 1
# 73 "../Middlewares/ST/STemWin/inc/HEADER.h"
typedef signed long HEADER_Handle;

typedef struct {
  GUI_COLOR aColorFrame[2];
  GUI_COLOR aColorUpper[2];
  GUI_COLOR aColorLower[2];
  GUI_COLOR ColorArrow;
} HEADER_SKINFLEX_PROPS;
# 89 "../Middlewares/ST/STemWin/inc/HEADER.h"
HEADER_Handle HEADER_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, int SpecialFlags);
HEADER_Handle HEADER_CreateAttached(GUI_HWIN hParent, int Id, int SpecialFlags);
HEADER_Handle HEADER_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
HEADER_Handle HEADER_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
HEADER_Handle HEADER_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 102 "../Middlewares/ST/STemWin/inc/HEADER.h"
void HEADER_Callback(WM_MESSAGE * pMsg);
# 111 "../Middlewares/ST/STemWin/inc/HEADER.h"
GUI_COLOR HEADER_SetDefaultArrowColor(GUI_COLOR Color);
GUI_COLOR HEADER_SetDefaultBkColor (GUI_COLOR Color);
const GUI_CURSOR * HEADER_SetDefaultCursor (const GUI_CURSOR * pCursor);
const GUI_FONT * HEADER_SetDefaultFont (const GUI_FONT * pFont);
int HEADER_SetDefaultBorderH (int Spacing);
int HEADER_SetDefaultBorderV (int Spacing);
GUI_COLOR HEADER_SetDefaultTextColor (GUI_COLOR Color);


GUI_COLOR HEADER_GetDefaultArrowColor(void);
GUI_COLOR HEADER_GetDefaultBkColor (void);
const GUI_CURSOR * HEADER_GetDefaultCursor (void);
const GUI_FONT * HEADER_GetDefaultFont (void);
int HEADER_GetDefaultBorderH (void);
int HEADER_GetDefaultBorderV (void);
GUI_COLOR HEADER_GetDefaultTextColor (void);







void HEADER_AddItem (HEADER_Handle hObj, int Width, const char * s, int Align);
void HEADER_DeleteItem (HEADER_Handle hObj, unsigned Index);
GUI_COLOR HEADER_GetArrowColor (HEADER_Handle hObj);
GUI_COLOR HEADER_GetBkColor (HEADER_Handle hObj);
int HEADER_GetHeight (HEADER_Handle hObj);
int HEADER_GetItemWidth (HEADER_Handle hObj, unsigned int Index);
int HEADER_GetNumItems (HEADER_Handle hObj);
int HEADER_GetSel (HEADER_Handle hObj);
GUI_COLOR HEADER_GetTextColor (HEADER_Handle hObj);
int HEADER_GetUserData (HEADER_Handle hObj, void * pDest, int NumBytes);
void HEADER_SetArrowColor (HEADER_Handle hObj, GUI_COLOR Color);
void HEADER_SetBitmap (HEADER_Handle hObj, unsigned int Index, const GUI_BITMAP * pBitmap);
void HEADER_SetBitmapEx (HEADER_Handle hObj, unsigned int Index, const GUI_BITMAP * pBitmap, int x, int y);
void HEADER_SetBkColor (HEADER_Handle hObj, GUI_COLOR Color);
void HEADER_SetBMP (HEADER_Handle hObj, unsigned int Index, const void * pBitmap);
void HEADER_SetBMPEx (HEADER_Handle hObj, unsigned int Index, const void * pBitmap, int x, int y);
void HEADER_SetDirIndicator (HEADER_Handle hObj, int Column, int Reverse);
void HEADER_SetDragLimit (HEADER_Handle hObj, unsigned DragLimit);
unsigned HEADER_SetFixed (HEADER_Handle hObj, unsigned Fixed);
void HEADER_SetFont (HEADER_Handle hObj, const GUI_FONT * pFont);
void HEADER_SetHeight (HEADER_Handle hObj, int Height);
void HEADER_SetTextAlign (HEADER_Handle hObj, unsigned int Index, int Align);
void HEADER_SetItemText (HEADER_Handle hObj, unsigned int Index, const char * s);
void HEADER_SetItemWidth (HEADER_Handle hObj, unsigned int Index, int Width);
void HEADER_SetScrollPos (HEADER_Handle hObj, int ScrollPos);
void HEADER_SetStreamedBitmap (HEADER_Handle hObj, unsigned int Index, const GUI_BITMAP_STREAM * pBitmap);
void HEADER_SetStreamedBitmapEx(HEADER_Handle hObj, unsigned int Index, const GUI_BITMAP_STREAM * pBitmap, int x, int y);
void HEADER_SetTextColor (HEADER_Handle hObj, GUI_COLOR Color);
int HEADER_SetUserData (HEADER_Handle hObj, const void * pSrc, int NumBytes);







void HEADER_GetSkinFlexProps (HEADER_SKINFLEX_PROPS * pProps, int Index);
void HEADER_SetSkinClassic (HEADER_Handle hObj);
void HEADER_SetSkin (HEADER_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
int HEADER_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void HEADER_SetSkinFlexProps (const HEADER_SKINFLEX_PROPS * pProps, int Index);
void HEADER_SetDefaultSkinClassic(void);
WIDGET_DRAW_ITEM_FUNC * HEADER_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
# 67 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/ICONVIEW.h" 1
# 106 "../Middlewares/ST/STemWin/inc/ICONVIEW.h"
typedef signed long ICONVIEW_Handle;







ICONVIEW_Handle ICONVIEW_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int xSizeItems, int ySizeItems);
ICONVIEW_Handle ICONVIEW_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int xSizeItems, int ySizeItems, int NumExtraBytes);
ICONVIEW_Handle ICONVIEW_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);

int ICONVIEW_AddBitmapItem (ICONVIEW_Handle hObj, const GUI_BITMAP * pBitmap, const char * pText);
int ICONVIEW_AddBMPItem (ICONVIEW_Handle hObj, const unsigned char * pBMP, const char * pText);
int ICONVIEW_AddBMPItemEx (ICONVIEW_Handle hObj, const void * pBMP, GUI_GET_DATA_FUNC * pfGetData, const char * pText);
int ICONVIEW_AddStreamedBitmapItem (ICONVIEW_Handle hObj, const void * pStreamedBitmap, const char * pText);
void ICONVIEW_DeleteItem (ICONVIEW_Handle hObj, unsigned Index);

unsigned long ICONVIEW_GetItemUserData (ICONVIEW_Handle hObj, int Index);
int ICONVIEW_GetNumItems (ICONVIEW_Handle hObj);
int ICONVIEW_GetItemText (ICONVIEW_Handle hObj, int Index, char * pBuffer, int MaxSize);
int ICONVIEW_GetSel (ICONVIEW_Handle hObj);
int ICONVIEW_GetUserData (ICONVIEW_Handle hObj, void * pDest, int NumBytes);
GUI_BITMAP * ICONVIEW_GetItemBitmap (ICONVIEW_Handle hObj, int ItemIndex);
int ICONVIEW_InsertBitmapItem (ICONVIEW_Handle hObj, const GUI_BITMAP * pBitmap, const char * pText, int Index);
int ICONVIEW_InsertBMPItem (ICONVIEW_Handle hObj, const unsigned char * pBMP, const char * pText, int Index);
int ICONVIEW_InsertBMPItemEx (ICONVIEW_Handle hObj, const void * pBMP, GUI_GET_DATA_FUNC * pfGetData, const char * pText, int Index);
int ICONVIEW_InsertStreamedBitmapItem(ICONVIEW_Handle hObj, const void * pStreamedBitmap, const char * pText, int Index);
int ICONVIEW_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
int ICONVIEW_SetBitmapItem (ICONVIEW_Handle hObj, int Index, const GUI_BITMAP * pBitmap);
void ICONVIEW_SetBkColor (ICONVIEW_Handle hObj, int Index, GUI_COLOR Color);
int ICONVIEW_SetBMPItem (ICONVIEW_Handle hObj, const unsigned char * pBMP, int Index);
int ICONVIEW_SetBMPItemEx (ICONVIEW_Handle hObj, const void * pBMP, GUI_GET_DATA_FUNC * pfGetData, int Index);
void ICONVIEW_SetFont (ICONVIEW_Handle hObj, const GUI_FONT * pFont);
void ICONVIEW_SetFrame (ICONVIEW_Handle hObj, int Coord, int Value);
void ICONVIEW_SetItemText (ICONVIEW_Handle hObj, int Index, const char * pText);
void ICONVIEW_SetItemUserData (ICONVIEW_Handle hObj, int Index, unsigned long UserData);
void ICONVIEW_SetOwnerDraw (ICONVIEW_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawItem);
void ICONVIEW_SetSel (ICONVIEW_Handle hObj, int Sel);
void ICONVIEW_SetSpace (ICONVIEW_Handle hObj, int Coord, int Value);
int ICONVIEW_SetStreamedBitmapItem (ICONVIEW_Handle hObj, int Index, const void * pStreamedBitmap);
void ICONVIEW_SetIconAlign (ICONVIEW_Handle hObj, int IconAlign);
void ICONVIEW_SetTextAlign (ICONVIEW_Handle hObj, int TextAlign);
void ICONVIEW_SetTextColor (ICONVIEW_Handle hObj, int Index, GUI_COLOR Color);
int ICONVIEW_SetUserData (ICONVIEW_Handle hObj, const void * pSrc, int NumBytes);
void ICONVIEW_SetWrapMode (ICONVIEW_Handle hObj, GUI_WRAPMODE WrapMode);

void ICONVIEW_Callback (WM_MESSAGE * pMsg);
# 68 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/IMAGE.h" 1
# 84 "../Middlewares/ST/STemWin/inc/IMAGE.h"
typedef signed long IMAGE_Handle;







IMAGE_Handle IMAGE_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
IMAGE_Handle IMAGE_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
IMAGE_Handle IMAGE_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);

void IMAGE_Callback(WM_MESSAGE * pMsg);







int IMAGE_GetUserData(IMAGE_Handle hObj, void * pDest, int NumBytes);
void IMAGE_SetBitmap (IMAGE_Handle hWin, const GUI_BITMAP * pBitmap);
void IMAGE_SetBMP (IMAGE_Handle hObj, const void * pData, unsigned long FileSize);
void IMAGE_SetBMPEx (IMAGE_Handle hObj, GUI_GET_DATA_FUNC * pfGetData, void * pVoid);
void IMAGE_SetDTA (IMAGE_Handle hObj, const void * pData, unsigned long FileSize);
void IMAGE_SetDTAEx (IMAGE_Handle hObj, GUI_GET_DATA_FUNC * pfGetData, void * pVoid);
void IMAGE_SetGIF (IMAGE_Handle hObj, const void * pData, unsigned long FileSize);
void IMAGE_SetGIFEx (IMAGE_Handle hObj, GUI_GET_DATA_FUNC * pfGetData, void * pVoid);
void IMAGE_SetJPEG (IMAGE_Handle hObj, const void * pData, unsigned long FileSize);
void IMAGE_SetJPEGEx (IMAGE_Handle hObj, GUI_GET_DATA_FUNC * pfGetData, void * pVoid);
void IMAGE_SetPNG (IMAGE_Handle hObj, const void * pData, unsigned long FileSize);
void IMAGE_SetPNGEx (IMAGE_Handle hObj, GUI_GET_DATA_FUNC * pfGetData, void * pVoid);
int IMAGE_SetUserData(IMAGE_Handle hObj, const void * pSrc, int NumBytes);
# 69 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2

# 1 "../Middlewares/ST/STemWin/inc/LISTVIEW.h" 1
# 98 "../Middlewares/ST/STemWin/inc/LISTVIEW.h"
typedef signed long LISTVIEW_Handle;







LISTVIEW_Handle LISTVIEW_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, int SpecialFlags);
LISTVIEW_Handle LISTVIEW_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
LISTVIEW_Handle LISTVIEW_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
LISTVIEW_Handle LISTVIEW_CreateAttached(GUI_HWIN hParent, int Id, int SpecialFlags);
LISTVIEW_Handle LISTVIEW_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 119 "../Middlewares/ST/STemWin/inc/LISTVIEW.h"
void LISTVIEW_Callback(WM_MESSAGE * pMsg);







int LISTVIEW_AddColumn (LISTVIEW_Handle hObj, int Width, const char * s, int Align);
int LISTVIEW_AddRow (LISTVIEW_Handle hObj, const GUI_ConstString * ppText);
int LISTVIEW_CompareText (const void * p0, const void * p1);
int LISTVIEW_CompareDec (const void * p0, const void * p1);
void LISTVIEW_DecSel (LISTVIEW_Handle hObj);
void LISTVIEW_DeleteAllRows (LISTVIEW_Handle hObj);
void LISTVIEW_DeleteColumn (LISTVIEW_Handle hObj, unsigned Index);
void LISTVIEW_DeleteRow (LISTVIEW_Handle hObj, unsigned Index);
void LISTVIEW_DeleteRowSorted (LISTVIEW_Handle hObj, int Row);
void LISTVIEW_DisableRow (LISTVIEW_Handle hObj, unsigned Row);
void LISTVIEW_DisableSort (LISTVIEW_Handle hObj);
void LISTVIEW_EnableCellSelect (LISTVIEW_Handle hObj, unsigned OnOff);
void LISTVIEW_EnableRow (LISTVIEW_Handle hObj, unsigned Row);
void LISTVIEW_EnableSort (LISTVIEW_Handle hObj);
GUI_COLOR LISTVIEW_GetBkColor (LISTVIEW_Handle hObj, unsigned Index);
const GUI_FONT * LISTVIEW_GetFont (LISTVIEW_Handle hObj);
HEADER_Handle LISTVIEW_GetHeader (LISTVIEW_Handle hObj);
void LISTVIEW_GetItemRect (LISTVIEW_Handle hObj, unsigned long Col, unsigned long Row, GUI_RECT * pRect);
void LISTVIEW_GetItemText (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, char * pBuffer, unsigned MaxSize);
unsigned LISTVIEW_GetItemTextLen (LISTVIEW_Handle hObj, unsigned Column, unsigned Row);
void LISTVIEW_GetItemTextSorted (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, char * pBuffer, unsigned MaxSize);
unsigned LISTVIEW_GetLBorder (LISTVIEW_Handle hObj);
unsigned LISTVIEW_GetNumColumns (LISTVIEW_Handle hObj);
unsigned LISTVIEW_GetNumRows (LISTVIEW_Handle hObj);
unsigned LISTVIEW_GetRBorder (LISTVIEW_Handle hObj);
int LISTVIEW_GetSel (LISTVIEW_Handle hObj);
int LISTVIEW_GetSelCol (LISTVIEW_Handle hObj);
int LISTVIEW_GetSelUnsorted (LISTVIEW_Handle hObj);
int LISTVIEW_GetTextAlign (LISTVIEW_Handle hObj, unsigned ColIndex);
GUI_COLOR LISTVIEW_GetTextColor (LISTVIEW_Handle hObj, unsigned Index);
int LISTVIEW_GetUserData (LISTVIEW_Handle hObj, void * pDest, int NumBytes);
unsigned long LISTVIEW_GetUserDataRow (LISTVIEW_Handle hObj, unsigned Row);
GUI_WRAPMODE LISTVIEW_GetWrapMode (LISTVIEW_Handle hObj);
void LISTVIEW_IncSel (LISTVIEW_Handle hObj);
int LISTVIEW_InsertRow (LISTVIEW_Handle hObj, unsigned Index, const GUI_ConstString * ppText);
int LISTVIEW_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
unsigned LISTVIEW_RowIsDisabled (LISTVIEW_Handle hObj, unsigned Row);
void LISTVIEW_SetAutoScrollH (LISTVIEW_Handle hObj, int OnOff);
void LISTVIEW_SetAutoScrollV (LISTVIEW_Handle hObj, int OnOff);
void LISTVIEW_SetItemBitmap (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, int xOff, int yOff, const GUI_BITMAP * pBitmap);
void LISTVIEW_SetBkColor (LISTVIEW_Handle hObj, unsigned int Index, GUI_COLOR Color);
void LISTVIEW_SetColumnWidth (LISTVIEW_Handle hObj, unsigned int Index, int Width);
void LISTVIEW_SetCompareFunc (LISTVIEW_Handle hObj, unsigned Column, int (* fpCompare)(const void * p0, const void * p1));
unsigned LISTVIEW_SetFixed (LISTVIEW_Handle hObj, unsigned Fixed);
void LISTVIEW_SetFont (LISTVIEW_Handle hObj, const GUI_FONT * pFont);
int LISTVIEW_SetGridVis (LISTVIEW_Handle hObj, int Show);
void LISTVIEW_SetHeaderHeight (LISTVIEW_Handle hObj, unsigned HeaderHeight);
void LISTVIEW_SetItemBkColor (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, unsigned int Index, GUI_COLOR Color);
void LISTVIEW_SetItemText (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, const char * s);
void LISTVIEW_SetItemTextColor (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, unsigned int Index, GUI_COLOR Color);
void LISTVIEW_SetItemTextSorted (LISTVIEW_Handle hObj, unsigned Column, unsigned Row, const char * pText);
void LISTVIEW_SetLBorder (LISTVIEW_Handle hObj, unsigned BorderSize);
void LISTVIEW_SetOwnerDraw (LISTVIEW_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawItem);
void LISTVIEW_SetRBorder (LISTVIEW_Handle hObj, unsigned BorderSize);
unsigned LISTVIEW_SetRowHeight (LISTVIEW_Handle hObj, unsigned RowHeight);
void LISTVIEW_SetSel (LISTVIEW_Handle hObj, int Sel);
void LISTVIEW_SetSelCol (LISTVIEW_Handle hObj, int NewCol);
void LISTVIEW_SetSelUnsorted (LISTVIEW_Handle hObj, int Sel);
unsigned LISTVIEW_SetSort (LISTVIEW_Handle hObj, unsigned Column, unsigned Reverse);
void LISTVIEW_SetTextAlign (LISTVIEW_Handle hObj, unsigned int Index, int Align);
void LISTVIEW_SetTextColor (LISTVIEW_Handle hObj, unsigned int Index, GUI_COLOR Color);
int LISTVIEW_SetUserData (LISTVIEW_Handle hObj, const void * pSrc, int NumBytes);
void LISTVIEW_SetUserDataRow (LISTVIEW_Handle hObj, unsigned Row, unsigned long UserData);
void LISTVIEW_SetWrapMode (LISTVIEW_Handle hObj, GUI_WRAPMODE WrapMode);
# 199 "../Middlewares/ST/STemWin/inc/LISTVIEW.h"
GUI_COLOR LISTVIEW_SetDefaultBkColor (unsigned Index, GUI_COLOR Color);
const GUI_FONT * LISTVIEW_SetDefaultFont (const GUI_FONT * pFont);
GUI_COLOR LISTVIEW_SetDefaultGridColor(GUI_COLOR Color);
GUI_COLOR LISTVIEW_SetDefaultTextColor(unsigned Index, GUI_COLOR Color);
# 71 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/LISTWHEEL.h" 1
# 81 "../Middlewares/ST/STemWin/inc/LISTWHEEL.h"
typedef signed long LISTWHEEL_Handle;
# 95 "../Middlewares/ST/STemWin/inc/LISTWHEEL.h"
LISTWHEEL_Handle LISTWHEEL_Create (const GUI_ConstString * ppText, int x0, int y0, int xSize, int ySize, int Flags);
LISTWHEEL_Handle LISTWHEEL_CreateAsChild (const GUI_ConstString * ppText, GUI_HWIN hWinParent, int x0, int y0, int xSize, int ySize, int Flags);
LISTWHEEL_Handle LISTWHEEL_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
LISTWHEEL_Handle LISTWHEEL_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent,
                                          int WinFlags, int ExFlags, int Id, const GUI_ConstString * ppText);
LISTWHEEL_Handle LISTWHEEL_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent,
                                          int WinFlags, int ExFlags, int Id, const GUI_ConstString * ppText, int NumExtraBytes);
# 110 "../Middlewares/ST/STemWin/inc/LISTWHEEL.h"
void LISTWHEEL_Callback(WM_MESSAGE * pMsg);







void LISTWHEEL_AddString (LISTWHEEL_Handle hObj, const char * s);
void * LISTWHEEL_GetItemData (LISTWHEEL_Handle hObj, unsigned Index);
void LISTWHEEL_GetItemText (LISTWHEEL_Handle hObj, unsigned Index, char * pBuffer, int MaxSize);
int LISTWHEEL_GetItemFromPos (LISTWHEEL_Handle hObj, int yPos);
int LISTWHEEL_GetLBorder (LISTWHEEL_Handle hObj);
unsigned LISTWHEEL_GetLineHeight (LISTWHEEL_Handle hObj);
int LISTWHEEL_GetNumItems (LISTWHEEL_Handle hObj);
int LISTWHEEL_GetPos (LISTWHEEL_Handle hObj);
int LISTWHEEL_GetRBorder (LISTWHEEL_Handle hObj);
int LISTWHEEL_GetSel (LISTWHEEL_Handle hObj);
int LISTWHEEL_GetSnapPosition(LISTWHEEL_Handle hObj);
int LISTWHEEL_GetTextAlign (LISTWHEEL_Handle hObj);
int LISTWHEEL_GetUserData (LISTWHEEL_Handle hObj, void * pDest, int NumBytes);
int LISTWHEEL_IsMoving (LISTWHEEL_Handle hObj);
void LISTWHEEL_MoveToPos (LISTWHEEL_Handle hObj, unsigned int Index);
int LISTWHEEL_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void LISTWHEEL_SetBkColor (LISTWHEEL_Handle hObj, unsigned int Index, GUI_COLOR Color);
void LISTWHEEL_SetDeceleration(LISTWHEEL_Handle hObj, unsigned Deceleration);
void LISTWHEEL_SetFont (LISTWHEEL_Handle hObj, const GUI_FONT * pFont);
void LISTWHEEL_SetItemData (LISTWHEEL_Handle hObj, unsigned Index, void * pData);
void LISTWHEEL_SetLBorder (LISTWHEEL_Handle hObj, unsigned BorderSize);
void LISTWHEEL_SetLineHeight (LISTWHEEL_Handle hObj, unsigned LineHeight);
void LISTWHEEL_SetOwnerDraw (LISTWHEEL_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfOwnerDraw);
void LISTWHEEL_SetPos (LISTWHEEL_Handle hObj, unsigned int Index);
void LISTWHEEL_SetRBorder (LISTWHEEL_Handle hObj, unsigned BorderSize);
void LISTWHEEL_SetSel (LISTWHEEL_Handle hObj, int Sel);
void LISTWHEEL_SetSnapPosition(LISTWHEEL_Handle hObj, int SnapPosition);
void LISTWHEEL_SetText (LISTWHEEL_Handle hObj, const GUI_ConstString * ppText);
void LISTWHEEL_SetTextAlign (LISTWHEEL_Handle hObj, int Align);
void LISTWHEEL_SetTextColor (LISTWHEEL_Handle hObj, unsigned int Index, GUI_COLOR Color);
void LISTWHEEL_SetTimerPeriod (LISTWHEEL_Handle hObj, int TimerPeriod);
int LISTWHEEL_SetUserData (LISTWHEEL_Handle hObj, const void * pSrc, int NumBytes);
void LISTWHEEL_SetVelocity (LISTWHEEL_Handle hObj, int Velocity);

const GUI_FONT * LISTWHEEL_GetFont(LISTWHEEL_Handle hObj);
# 72 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/MENU.h" 1
# 141 "../Middlewares/ST/STemWin/inc/MENU.h"
typedef signed long MENU_Handle;

typedef struct {



  GUI_COLOR aBkColorH[2];
  GUI_COLOR BkColorV;
  GUI_COLOR FrameColorH;
  GUI_COLOR FrameColorV;



  GUI_COLOR aSelColorH[2];
  GUI_COLOR aSelColorV[2];
  GUI_COLOR FrameColorSelH;
  GUI_COLOR FrameColorSelV;



  GUI_COLOR aSepColorH[2];
  GUI_COLOR aSepColorV[2];



  GUI_COLOR ArrowColor;



  GUI_COLOR TextColor;
} MENU_SKINFLEX_PROPS;





typedef struct {
  unsigned short MsgType;
  unsigned short ItemId;
} MENU_MSG_DATA;





typedef struct {
  const char * pText;
  unsigned short Id;
  unsigned short Flags;
  MENU_Handle hSubmenu;
} MENU_ITEM_DATA;







MENU_Handle MENU_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
MENU_Handle MENU_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
MENU_Handle MENU_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
# 210 "../Middlewares/ST/STemWin/inc/MENU.h"
void MENU_Callback(WM_MESSAGE * pMsg);







void MENU_AddItem (MENU_Handle hObj, const MENU_ITEM_DATA * pItemData);
void MENU_Attach (MENU_Handle hObj, GUI_HWIN hDestWin, int x, int y, int xSize, int ySize, int Flags);
void MENU_DeleteItem (MENU_Handle hObj, unsigned short ItemId);
void MENU_DisableItem (MENU_Handle hObj, unsigned short ItemId);
void MENU_EnableItem (MENU_Handle hObj, unsigned short ItemId);
void MENU_GetItem (MENU_Handle hObj, unsigned short ItemId, MENU_ITEM_DATA * pItemData);
void MENU_GetItemText (MENU_Handle hObj, unsigned short ItemId, char * pBuffer, unsigned BufferSize);
unsigned MENU_GetNumItems (MENU_Handle hObj);
GUI_HWIN MENU_GetOwner (MENU_Handle hObj);
int MENU_GetUserData (MENU_Handle hObj, void * pDest, int NumBytes);
void MENU_InsertItem (MENU_Handle hObj, unsigned short ItemId, const MENU_ITEM_DATA * pItemData);
void MENU_Popup (MENU_Handle hObj, GUI_HWIN hDestWin, int x, int y, int xSize, int ySize, int Flags);
void MENU_SetBkColor (MENU_Handle hObj, unsigned ColorIndex, GUI_COLOR Color);
void MENU_SetBorderSize(MENU_Handle hObj, unsigned BorderIndex, unsigned char BorderSize);
void MENU_SetFont (MENU_Handle hObj, const GUI_FONT * pFont);
void MENU_SetItem (MENU_Handle hObj, unsigned short ItemId, const MENU_ITEM_DATA * pItemData);
void MENU_SetOwner (MENU_Handle hObj, GUI_HWIN hOwner);
int MENU_SetSel (MENU_Handle hObj, int Sel);
void MENU_SetTextColor (MENU_Handle hObj, unsigned ColorIndex, GUI_COLOR Color);
int MENU_SetUserData (MENU_Handle hObj, const void * pSrc, int NumBytes);







GUI_COLOR MENU_GetDefaultTextColor (unsigned ColorIndex);
GUI_COLOR MENU_GetDefaultBkColor (unsigned ColorIndex);
unsigned char MENU_GetDefaultBorderSize (unsigned BorderIndex);
const WIDGET_EFFECT * MENU_GetDefaultEffect (void);
const GUI_FONT * MENU_GetDefaultFont (void);
void MENU_SetDefaultTextColor (unsigned ColorIndex, GUI_COLOR Color);
void MENU_SetDefaultBkColor (unsigned ColorIndex, GUI_COLOR Color);
void MENU_SetDefaultBorderSize (unsigned BorderIndex, unsigned char BorderSize);
void MENU_SetDefaultEffect (const WIDGET_EFFECT * pEffect);
void MENU_SetDefaultFont (const GUI_FONT * pFont);







int MENU_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void MENU_GetSkinFlexProps (MENU_SKINFLEX_PROPS * pProps, int Index);
WIDGET_DRAW_ITEM_FUNC * MENU_SetDefaultSkin (WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
void MENU_SetDefaultSkinClassic(void);
void MENU_SetSkinClassic (MENU_Handle hObj);
void MENU_SetSkin (MENU_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
void MENU_SetSkinFlexProps (const MENU_SKINFLEX_PROPS * pProps, int Index);
void MENU_SkinEnableArrow (MENU_Handle hObj, int OnOff);
# 73 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/MULTIEDIT.h" 1
# 91 "../Middlewares/ST/STemWin/inc/MULTIEDIT.h"
typedef signed long MULTIEDIT_HANDLE;







MULTIEDIT_HANDLE MULTIEDIT_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, int ExFlags, const char * pText, int MaxLen);
MULTIEDIT_HANDLE MULTIEDIT_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int BufferSize, const char * pText);
MULTIEDIT_HANDLE MULTIEDIT_CreateIndirect(const GUI_WIDGET_CREATE_INFO* pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
MULTIEDIT_HANDLE MULTIEDIT_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int BufferSize, const char * pText, int NumExtraBytes);
# 111 "../Middlewares/ST/STemWin/inc/MULTIEDIT.h"
void MULTIEDIT_Callback(WM_MESSAGE * pMsg);
# 120 "../Middlewares/ST/STemWin/inc/MULTIEDIT.h"
int MULTIEDIT_AddKey (MULTIEDIT_HANDLE hObj, unsigned short Key);
int MULTIEDIT_AddText (MULTIEDIT_HANDLE hObj, const char * s);
void MULTIEDIT_EnableBlink (MULTIEDIT_HANDLE hObj, int Period, int OnOff);
int MULTIEDIT_GetCursorCharPos (MULTIEDIT_HANDLE hObj);
void MULTIEDIT_GetCursorPixelPos(MULTIEDIT_HANDLE hObj, int * pxPos, int * pyPos);
void MULTIEDIT_GetPrompt (MULTIEDIT_HANDLE hObj, char* sDest, int MaxNumChars);
int MULTIEDIT_GetTextSize (MULTIEDIT_HANDLE hObj);
void MULTIEDIT_GetText (MULTIEDIT_HANDLE hObj, char* sDest, int MaxNumChars);
int MULTIEDIT_GetUserData (MULTIEDIT_HANDLE hObj, void * pDest, int NumBytes);
void MULTIEDIT_SetTextAlign (MULTIEDIT_HANDLE hObj, int Align);
void MULTIEDIT_SetAutoScrollH (MULTIEDIT_HANDLE hObj, int OnOff);
void MULTIEDIT_SetAutoScrollV (MULTIEDIT_HANDLE hObj, int OnOff);
void MULTIEDIT_SetBkColor (MULTIEDIT_HANDLE hObj, unsigned Index, GUI_COLOR color);
void MULTIEDIT_SetCursorCharPos (MULTIEDIT_HANDLE hObj, int x, int y);
void MULTIEDIT_SetCursorPixelPos(MULTIEDIT_HANDLE hObj, int x, int y);
void MULTIEDIT_SetCursorOffset (MULTIEDIT_HANDLE hObj, int Offset);
void MULTIEDIT_SetHBorder (MULTIEDIT_HANDLE hObj, unsigned HBorder);
void MULTIEDIT_SetFocusable (MULTIEDIT_HANDLE hObj, int State);
void MULTIEDIT_SetFont (MULTIEDIT_HANDLE hObj, const GUI_FONT * pFont);
void MULTIEDIT_SetInsertMode (MULTIEDIT_HANDLE hObj, int OnOff);
void MULTIEDIT_SetBufferSize (MULTIEDIT_HANDLE hObj, int BufferSize);
void MULTIEDIT_SetMaxNumChars (MULTIEDIT_HANDLE hObj, unsigned MaxNumChars);
void MULTIEDIT_SetPrompt (MULTIEDIT_HANDLE hObj, const char* sPrompt);
void MULTIEDIT_SetReadOnly (MULTIEDIT_HANDLE hObj, int OnOff);
void MULTIEDIT_SetPasswordMode (MULTIEDIT_HANDLE hObj, int OnOff);
void MULTIEDIT_SetText (MULTIEDIT_HANDLE hObj, const char* s);
void MULTIEDIT_SetTextColor (MULTIEDIT_HANDLE hObj, unsigned Index, GUI_COLOR color);
int MULTIEDIT_SetUserData (MULTIEDIT_HANDLE hObj, const void * pSrc, int NumBytes);
void MULTIEDIT_SetWrapNone (MULTIEDIT_HANDLE hObj);
void MULTIEDIT_SetWrapChar (MULTIEDIT_HANDLE hObj);
void MULTIEDIT_SetWrapWord (MULTIEDIT_HANDLE hObj);
# 74 "../Middlewares/ST/STemWin/inc\\DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/MULTIPAGE.h" 1
# 57 "../Middlewares/ST/STemWin/inc/MULTIPAGE.h"
# 1 "../Middlewares/ST/STemWin/inc/DIALOG.h" 1
# 58 "../Middlewares/ST/STemWin/inc/MULTIPAGE.h" 2
# 108 "../Middlewares/ST/STemWin/inc/MULTIPAGE.h"
typedef signed long MULTIPAGE_Handle;

typedef struct {
  GUI_COLOR BkColor;
  GUI_COLOR aBkUpper[2];
  GUI_COLOR aBkLower[2];
  GUI_COLOR FrameColor;
  GUI_COLOR TextColor;
} MULTIPAGE_SKINFLEX_PROPS;

typedef struct {
  unsigned char SelSideBorderInc;
  unsigned char SelTopBorderInc;
} MULTIPAGE_SKIN_PROPS;

typedef struct {

    tLCD_APIList * pRotation;

  unsigned Align;
  int Sel;
  unsigned short State;
  unsigned char FrameFlags;
  unsigned char PageStatus;
  GUI_DRAW_HANDLE * pDrawObj;
} MULTIPAGE_SKIN_INFO;







MULTIPAGE_Handle MULTIPAGE_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, int SpecialFlags);
MULTIPAGE_Handle MULTIPAGE_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
MULTIPAGE_Handle MULTIPAGE_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
MULTIPAGE_Handle MULTIPAGE_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 153 "../Middlewares/ST/STemWin/inc/MULTIPAGE.h"
void MULTIPAGE_Callback(WM_MESSAGE * pMsg);







void MULTIPAGE_AddEmptyPage (MULTIPAGE_Handle hObj, GUI_HWIN hWin ,const char * pText);
void MULTIPAGE_AddPage (MULTIPAGE_Handle hObj, GUI_HWIN hWin ,const char * pText);
GUI_HWIN MULTIPAGE_AttachWindow (MULTIPAGE_Handle hObj, unsigned Index, GUI_HWIN hWin);
void MULTIPAGE_DeletePage (MULTIPAGE_Handle hObj, unsigned Index, int Delete);
void MULTIPAGE_DisablePage (MULTIPAGE_Handle hObj, unsigned Index);
void MULTIPAGE_EnablePage (MULTIPAGE_Handle hObj, unsigned Index);
void MULTIPAGE_EnableScrollbar(MULTIPAGE_Handle hObj, unsigned OnOff);
const GUI_FONT * MULTIPAGE_GetFont (MULTIPAGE_Handle hObj);
int MULTIPAGE_GetSelection (MULTIPAGE_Handle hObj);
int MULTIPAGE_GetPageText (MULTIPAGE_Handle hObj, unsigned Index, char * pBuffer, int MaxLen);
int MULTIPAGE_GetUserData (MULTIPAGE_Handle hObj, void * pDest, int NumBytes);
GUI_HWIN MULTIPAGE_GetWindow (MULTIPAGE_Handle hObj, unsigned Index);
int MULTIPAGE_IsPageEnabled (MULTIPAGE_Handle hObj, unsigned Index);
void MULTIPAGE_SelectPage (MULTIPAGE_Handle hObj, unsigned Index);
void MULTIPAGE_SetAlign (MULTIPAGE_Handle hObj, unsigned Align);
int MULTIPAGE_SetBitmapEx (MULTIPAGE_Handle hObj, const GUI_BITMAP * pBitmap, int x, int y, int Index, int State);
int MULTIPAGE_SetBitmap (MULTIPAGE_Handle hObj, const GUI_BITMAP * pBitmap, int Index, int State);
void MULTIPAGE_SetBkColor (MULTIPAGE_Handle hObj, GUI_COLOR Color, unsigned Index);
void MULTIPAGE_SetFont (MULTIPAGE_Handle hObj, const GUI_FONT * pFont);
void MULTIPAGE_SetRotation (MULTIPAGE_Handle hObj, unsigned Rotation);
void MULTIPAGE_SetTabWidth (MULTIPAGE_Handle hObj, int Width, int Index);
void MULTIPAGE_SetTabHeight (MULTIPAGE_Handle hObj, int Height);
void MULTIPAGE_SetTextAlign (MULTIPAGE_Handle hObj, unsigned Align);
void MULTIPAGE_SetText (MULTIPAGE_Handle hObj, const char * pText, unsigned Index);
void MULTIPAGE_SetTextColor (MULTIPAGE_Handle hObj, GUI_COLOR Color, unsigned Index);
int MULTIPAGE_SetUserData (MULTIPAGE_Handle hObj, const void * pSrc, int NumBytes);







unsigned MULTIPAGE_GetDefaultAlign (void);
GUI_COLOR MULTIPAGE_GetDefaultBkColor (unsigned Index);
const GUI_FONT * MULTIPAGE_GetDefaultFont (void);
GUI_COLOR MULTIPAGE_GetDefaultTextColor (unsigned Index);

void MULTIPAGE_SetDefaultAlign (unsigned Align);
void MULTIPAGE_SetDefaultBkColor (GUI_COLOR Color, unsigned Index);
void MULTIPAGE_SetDefaultBorderSizeX(unsigned Size);
void MULTIPAGE_SetDefaultBorderSizeY(unsigned Size);
void MULTIPAGE_SetDefaultFont (const GUI_FONT * pFont);
void MULTIPAGE_SetDefaultTextColor (GUI_COLOR Color, unsigned Index);

void MULTIPAGE_SetEffectColor (unsigned Index, GUI_COLOR Color);
GUI_COLOR MULTIPAGE_GetEffectColor (unsigned Index);
int MULTIPAGE_GetNumEffectColors (void);







int MULTIPAGE_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void MULTIPAGE_GetSkinFlexProps (MULTIPAGE_SKINFLEX_PROPS * pProps, int Index);
WIDGET_DRAW_ITEM_FUNC * MULTIPAGE_SetDefaultSkin (WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
void MULTIPAGE_SetDefaultSkinClassic(void);
void MULTIPAGE_SetSkinClassic (MULTIPAGE_Handle hObj);
void MULTIPAGE_SetSkin (MULTIPAGE_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
void MULTIPAGE_SetSkinFlexProps (const MULTIPAGE_SKINFLEX_PROPS * pProps, int Index);
# 75 "../Middlewares/ST/STemWin/inc/DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/PROGBAR.h" 1
# 93 "../Middlewares/ST/STemWin/inc/PROGBAR.h"
typedef signed long PROGBAR_Handle;

typedef struct {
  GUI_COLOR aColorUpperL[2];
  GUI_COLOR aColorLowerL[2];
  GUI_COLOR aColorUpperR[2];
  GUI_COLOR aColorLowerR[2];
  GUI_COLOR ColorFrame;
  GUI_COLOR ColorText;
} PROGBAR_SKINFLEX_PROPS;

typedef struct {
  int IsVertical;
  int Index;
  const char * pText;
} PROGBAR_SKINFLEX_INFO;
# 117 "../Middlewares/ST/STemWin/inc/PROGBAR.h"
PROGBAR_Handle PROGBAR_Create (int x0, int y0, int xSize, int ySize, int Flags);
PROGBAR_Handle PROGBAR_CreateAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags);
PROGBAR_Handle PROGBAR_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
PROGBAR_Handle PROGBAR_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
PROGBAR_Handle PROGBAR_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 130 "../Middlewares/ST/STemWin/inc/PROGBAR.h"
void PROGBAR_Callback(WM_MESSAGE * pMsg);
# 139 "../Middlewares/ST/STemWin/inc/PROGBAR.h"
void PROGBAR_GetMinMax (PROGBAR_Handle hObj, int * pMin, int * pMax);
int PROGBAR_GetUserData (PROGBAR_Handle hObj, void * pDest, int NumBytes);
int PROGBAR_GetValue (PROGBAR_Handle hObj);
void PROGBAR_SetBarColor (PROGBAR_Handle hObj, unsigned int index, GUI_COLOR color);
void PROGBAR_SetFont (PROGBAR_Handle hObj, const GUI_FONT * pfont);
void PROGBAR_SetMinMax (PROGBAR_Handle hObj, int Min, int Max);
void PROGBAR_SetText (PROGBAR_Handle hObj, const char* s);
void PROGBAR_SetTextAlign(PROGBAR_Handle hObj, int Align);
void PROGBAR_SetTextColor(PROGBAR_Handle hObj, unsigned int index, GUI_COLOR color);
void PROGBAR_SetTextPos (PROGBAR_Handle hObj, int XOff, int YOff);
void PROGBAR_SetValue (PROGBAR_Handle hObj, int v);
int PROGBAR_SetUserData (PROGBAR_Handle hObj, const void * pSrc, int NumBytes);







void PROGBAR_GetSkinFlexProps (PROGBAR_SKINFLEX_PROPS * pProps, int Index);
void PROGBAR_SetSkinClassic (PROGBAR_Handle hObj);
void PROGBAR_SetSkin (PROGBAR_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
int PROGBAR_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void PROGBAR_SetSkinFlexProps (const PROGBAR_SKINFLEX_PROPS * pProps, int Index);
void PROGBAR_SetDefaultSkinClassic(void);
WIDGET_DRAW_ITEM_FUNC * PROGBAR_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
# 76 "../Middlewares/ST/STemWin/inc/DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/RADIO.h" 1
# 106 "../Middlewares/ST/STemWin/inc/RADIO.h"
typedef signed long RADIO_Handle;

typedef struct {
  GUI_COLOR aColorButton[4];
  int ButtonSize;
} RADIO_SKINFLEX_PROPS;
# 120 "../Middlewares/ST/STemWin/inc/RADIO.h"
RADIO_Handle RADIO_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, unsigned Para);
RADIO_Handle RADIO_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumItems, int Spacing);
RADIO_Handle RADIO_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumItems, int Spacing, int NumExtraBytes);
RADIO_Handle RADIO_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 132 "../Middlewares/ST/STemWin/inc/RADIO.h"
void RADIO_Callback(WM_MESSAGE * pMsg);
# 141 "../Middlewares/ST/STemWin/inc/RADIO.h"
void RADIO_SetDefaultFont (const GUI_FONT * pFont);
GUI_COLOR RADIO_SetDefaultFocusColor(GUI_COLOR Color);
void RADIO_SetDefaultImage (const GUI_BITMAP * pBitmap, unsigned int Index);
void RADIO_SetDefaultTextColor (GUI_COLOR TextColor);
const GUI_FONT * RADIO_GetDefaultFont (void);
GUI_COLOR RADIO_GetDefaultTextColor (void);
# 155 "../Middlewares/ST/STemWin/inc/RADIO.h"
void RADIO_AddValue (RADIO_Handle hObj, int Add);
void RADIO_Dec (RADIO_Handle hObj);
int RADIO_GetText (RADIO_Handle hObj, unsigned Index, char * pBuffer, int MaxLen);
int RADIO_GetUserData (RADIO_Handle hObj, void * pDest, int NumBytes);
void RADIO_Inc (RADIO_Handle hObj);
void RADIO_SetBkColor (RADIO_Handle hObj, GUI_COLOR Color);
GUI_COLOR RADIO_SetFocusColor(RADIO_Handle hObj, GUI_COLOR Color);
void RADIO_SetFont (RADIO_Handle hObj, const GUI_FONT * pFont);
void RADIO_SetGroupId (RADIO_Handle hObj, unsigned char GroupId);
void RADIO_SetImage (RADIO_Handle hObj, const GUI_BITMAP * pBitmap, unsigned int Index);
void RADIO_SetText (RADIO_Handle hObj, const char* pText, unsigned Index);
void RADIO_SetTextColor (RADIO_Handle hObj, GUI_COLOR Color);
void RADIO_SetValue (RADIO_Handle hObj, int v);
int RADIO_SetUserData (RADIO_Handle hObj, const void * pSrc, int NumBytes);

const GUI_BITMAP * RADIO_GetImage(RADIO_Handle hObj, unsigned int Index);







void RADIO_GetSkinFlexProps (RADIO_SKINFLEX_PROPS * pProps, int Index);
void RADIO_SetSkinClassic (RADIO_Handle hObj);
void RADIO_SetSkin (RADIO_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
int RADIO_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void RADIO_SetSkinFlexProps (const RADIO_SKINFLEX_PROPS * pProps, int Index);
void RADIO_SetDefaultSkinClassic(void);
WIDGET_DRAW_ITEM_FUNC * RADIO_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
# 194 "../Middlewares/ST/STemWin/inc/RADIO.h"
int RADIO_GetValue(RADIO_Handle hObj);
# 77 "../Middlewares/ST/STemWin/inc/DIALOG.h" 2

# 1 "../Middlewares/ST/STemWin/inc/SLIDER.h" 1
# 98 "../Middlewares/ST/STemWin/inc/SLIDER.h"
typedef signed long SLIDER_Handle;

typedef struct {
  GUI_COLOR aColorFrame[2];
  GUI_COLOR aColorInner[2];
  GUI_COLOR aColorShaft[3];
  GUI_COLOR ColorTick;
  GUI_COLOR ColorFocus;
  int TickSize;
  int ShaftSize;
} SLIDER_SKINFLEX_PROPS;

typedef struct {
  int Width;
  int NumTicks;
  int Size;
  int IsPressed;
  int IsVertical;
} SLIDER_SKINFLEX_INFO;







SLIDER_Handle SLIDER_Create (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int WinFlags, int SpecialFlags);
SLIDER_Handle SLIDER_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
SLIDER_Handle SLIDER_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
SLIDER_Handle SLIDER_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 136 "../Middlewares/ST/STemWin/inc/SLIDER.h"
void SLIDER_Callback(WM_MESSAGE * pMsg);







void SLIDER_Dec (SLIDER_Handle hObj);
void SLIDER_EnableFocusRect(SLIDER_Handle hObj, int OnOff);
GUI_COLOR SLIDER_GetBarColor (SLIDER_Handle hObj);
GUI_COLOR SLIDER_GetBkColor (SLIDER_Handle hObj);
unsigned char SLIDER_GetFlag (SLIDER_Handle hObj, unsigned char Flag);
GUI_COLOR SLIDER_GetFocusColor (SLIDER_Handle hObj);
void SLIDER_GetRange (SLIDER_Handle hObj, int * pMin, int * pMax);
GUI_COLOR SLIDER_GetTickColor (SLIDER_Handle hObj);
int SLIDER_GetUserData (SLIDER_Handle hObj, void * pDest, int NumBytes);
int SLIDER_GetValue (SLIDER_Handle hObj);
void SLIDER_Inc (SLIDER_Handle hObj);
void SLIDER_SetBarColor (SLIDER_Handle hObj, GUI_COLOR Color);
void SLIDER_SetBkColor (SLIDER_Handle hObj, GUI_COLOR Color);
GUI_COLOR SLIDER_SetFocusColor (SLIDER_Handle hObj, GUI_COLOR Color);
void SLIDER_SetNumTicks (SLIDER_Handle hObj, int NumTicks);
void SLIDER_SetRange (SLIDER_Handle hObj, int Min, int Max);
void SLIDER_SetTickColor (SLIDER_Handle hObj, GUI_COLOR Color);
int SLIDER_SetUserData (SLIDER_Handle hObj, const void * pSrc, int NumBytes);
void SLIDER_SetValue (SLIDER_Handle hObj, int v);
void SLIDER_SetWidth (SLIDER_Handle hObj, int Width);







void SLIDER_GetSkinFlexProps (SLIDER_SKINFLEX_PROPS * pProps, int Index);
void SLIDER_SetSkinClassic (SLIDER_Handle hObj);
void SLIDER_SetSkin (SLIDER_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
int SLIDER_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void SLIDER_SetSkinFlexProps (const SLIDER_SKINFLEX_PROPS * pProps, int Index);
void SLIDER_SetDefaultSkinClassic(void);
WIDGET_DRAW_ITEM_FUNC * SLIDER_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
# 187 "../Middlewares/ST/STemWin/inc/SLIDER.h"
GUI_COLOR SLIDER_GetDefaultBkColor (void);
GUI_COLOR SLIDER_GetDefaultBarColor (void);
GUI_COLOR SLIDER_GetDefaultFocusColor(void);
GUI_COLOR SLIDER_GetDefaultTickColor (void);
void SLIDER_SetDefaultBkColor (GUI_COLOR Color);
void SLIDER_SetDefaultBarColor (GUI_COLOR Color);
GUI_COLOR SLIDER_SetDefaultFocusColor(GUI_COLOR Color);
void SLIDER_SetDefaultTickColor (GUI_COLOR Color);
# 79 "../Middlewares/ST/STemWin/inc/DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/SPINBOX.h" 1
# 118 "../Middlewares/ST/STemWin/inc/SPINBOX.h"
typedef signed long SPINBOX_Handle;

typedef struct {
  GUI_COLOR aColorFrame[2];
  GUI_COLOR aColorUpper[2];
  GUI_COLOR aColorLower[2];
  GUI_COLOR ColorArrow;
  GUI_COLOR ColorBk;
  GUI_COLOR ColorText;
  GUI_COLOR ColorButtonFrame;
} SPINBOX_SKINFLEX_PROPS;
# 140 "../Middlewares/ST/STemWin/inc/SPINBOX.h"
SPINBOX_Handle SPINBOX_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int Id, int Min, int Max);
SPINBOX_Handle SPINBOX_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int Id, int Min, int Max, int NumExtraBytes);
SPINBOX_Handle SPINBOX_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);





void SPINBOX_Callback(WM_MESSAGE * pMsg);





void SPINBOX_EnableBlink (SPINBOX_Handle hObj, int Period, int OnOff);
GUI_COLOR SPINBOX_GetBkColor (SPINBOX_Handle hObj, unsigned int Index);
GUI_COLOR SPINBOX_GetButtonBkColor(SPINBOX_Handle hObj, unsigned int Index);
EDIT_Handle SPINBOX_GetEditHandle (SPINBOX_Handle hObj);
int SPINBOX_GetUserData (SPINBOX_Handle hObj, void * pDest, int NumBytes);
signed long SPINBOX_GetValue (SPINBOX_Handle hObj);
void SPINBOX_SetBkColor (SPINBOX_Handle hObj, unsigned int Index, GUI_COLOR Color);
void SPINBOX_SetButtonBkColor(SPINBOX_Handle hObj, unsigned int Index, GUI_COLOR Color);
void SPINBOX_SetButtonSize (SPINBOX_Handle hObj, unsigned ButtonSize);
void SPINBOX_SetEdge (SPINBOX_Handle hObj, unsigned char Edge);
void SPINBOX_SetEditMode (SPINBOX_Handle hObj, unsigned char EditMode);
void SPINBOX_SetFont (SPINBOX_Handle hObj, const GUI_FONT * pFont);
void SPINBOX_SetRange (SPINBOX_Handle hObj, signed long Min, signed long Max);
unsigned short SPINBOX_SetStep (SPINBOX_Handle hObj, unsigned short Step);
void SPINBOX_SetTextColor (SPINBOX_Handle hObj, unsigned int Index, GUI_COLOR Color);
int SPINBOX_SetUserData (SPINBOX_Handle hObj, const void * pSrc, int NumBytes);
void SPINBOX_SetValue (SPINBOX_Handle hObj, signed long Value);





unsigned short SPINBOX_GetDefaultButtonSize(void);
void SPINBOX_SetDefaultButtonSize(unsigned short ButtonSize);





void SPINBOX_GetSkinFlexProps (SPINBOX_SKINFLEX_PROPS * pProps, int Index);
void SPINBOX_SetSkinClassic (SPINBOX_Handle hObj);
void SPINBOX_SetSkin (SPINBOX_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
int SPINBOX_DrawSkinFlex (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void SPINBOX_SetSkinFlexProps (const SPINBOX_SKINFLEX_PROPS * pProps, int Index);
void SPINBOX_SetDefaultSkinClassic(void);
WIDGET_DRAW_ITEM_FUNC * SPINBOX_SetDefaultSkin(WIDGET_DRAW_ITEM_FUNC * pfDrawSkin);
# 80 "../Middlewares/ST/STemWin/inc/DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/SWIPELIST.h" 1
# 107 "../Middlewares/ST/STemWin/inc/SWIPELIST.h"
typedef signed long SWIPELIST_Handle;







SWIPELIST_Handle SWIPELIST_CreateAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags);
SWIPELIST_Handle SWIPELIST_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
SWIPELIST_Handle SWIPELIST_CreateIndirect (const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
SWIPELIST_Handle SWIPELIST_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
# 127 "../Middlewares/ST/STemWin/inc/SWIPELIST.h"
void SWIPELIST_Callback(WM_MESSAGE * pMsg);
# 137 "../Middlewares/ST/STemWin/inc/SWIPELIST.h"
int SWIPELIST_AddItem (SWIPELIST_Handle hObj, const char * sText, int ItemSize);
int SWIPELIST_AddItemText (SWIPELIST_Handle hObj, unsigned ItemIndex, const char * sText);
int SWIPELIST_AddSepItem (SWIPELIST_Handle hObj, const char * sText, int ItemSize);
void SWIPELIST_DeleteItem (SWIPELIST_Handle hObj, unsigned ItemIndex);

const GUI_BITMAP * SWIPELIST_GetBitmap (SWIPELIST_Handle hObj, unsigned ItemIndex);
int SWIPELIST_GetBitmapSpace (SWIPELIST_Handle hObj);
GUI_COLOR SWIPELIST_GetBkColor (SWIPELIST_Handle hObj, unsigned Index);
int SWIPELIST_GetBorderSize (SWIPELIST_Handle hObj, unsigned Index);
const GUI_FONT * SWIPELIST_GetFont (SWIPELIST_Handle hObj, unsigned Index);
int SWIPELIST_GetItemSize (SWIPELIST_Handle hObj, unsigned ItemIndex);
unsigned long SWIPELIST_GetItemUserData (SWIPELIST_Handle hObj, unsigned ItemIndex);
int SWIPELIST_GetNumItems (SWIPELIST_Handle hObj);
int SWIPELIST_GetNumText (SWIPELIST_Handle hObj, unsigned ItemIndex);
int SWIPELIST_GetReleasedItem (SWIPELIST_Handle hObj);
int SWIPELIST_GetScrollPos (SWIPELIST_Handle hObj);
int SWIPELIST_GetSelItem (SWIPELIST_Handle hObj);
GUI_COLOR SWIPELIST_GetSepColor (SWIPELIST_Handle hObj, unsigned ItemIndex);
int SWIPELIST_GetSepSize (SWIPELIST_Handle hObj, unsigned ItemIndex);
void SWIPELIST_GetText (SWIPELIST_Handle hObj, unsigned ItemIndex, unsigned TextIndex, char * pBuffer, int MaxSize);
int SWIPELIST_GetTextAlign (SWIPELIST_Handle hObj, unsigned ItemIndex);
GUI_COLOR SWIPELIST_GetTextColor (SWIPELIST_Handle hObj, unsigned Index);
int SWIPELIST_GetThreshold (SWIPELIST_Handle hObj);
int SWIPELIST_GetUserData (SWIPELIST_Handle hObj, void * pDest, int NumBytes);

int SWIPELIST_ItemAttachWindow (SWIPELIST_Handle hObj, unsigned ItemIndex, GUI_HWIN hWin, int x0, int y0);
void SWIPELIST_ItemDetachWindow (SWIPELIST_Handle hObj, GUI_HWIN hWin);
int SWIPELIST_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);

void SWIPELIST_SetAttachedWindowPos (SWIPELIST_Handle hObj, GUI_HWIN hWin, int x0, int y0);
void SWIPELIST_SetBitmap (SWIPELIST_Handle hObj, unsigned ItemIndex, int Align, const GUI_BITMAP * pBitmap);
void SWIPELIST_SetBitmapEx (SWIPELIST_Handle hObj, unsigned ItemIndex, int Align, const GUI_BITMAP * pBitmap, int x, int y);
void SWIPELIST_SetBitmapSpace (SWIPELIST_Handle hObj, unsigned Size);
void SWIPELIST_SetBkColor (SWIPELIST_Handle hObj, unsigned Index, GUI_COLOR Color);
void SWIPELIST_SetBorderSize (SWIPELIST_Handle hObj, unsigned Index, unsigned Size);
void SWIPELIST_SetFont (SWIPELIST_Handle hObj, unsigned Index, const GUI_FONT * pFont);
void SWIPELIST_SetItemSize (SWIPELIST_Handle hObj, unsigned ItemIndex, unsigned Size);
void SWIPELIST_SetItemUserData (SWIPELIST_Handle hObj, unsigned ItemIndex, unsigned long UserData);
void SWIPELIST_SetOwnerDraw (SWIPELIST_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawItem);
void SWIPELIST_SetScrollPos (SWIPELIST_Handle hObj, int Pos);
void SWIPELIST_SetScrollPosItem (SWIPELIST_Handle hObj, unsigned ItemIndex);
void SWIPELIST_SetSepColor (SWIPELIST_Handle hObj, unsigned ItemIndex, GUI_COLOR Color);
void SWIPELIST_SetSepSize (SWIPELIST_Handle hObj, unsigned ItemIndex, int Size);
void SWIPELIST_SetText (SWIPELIST_Handle hObj, unsigned ItemIndex, unsigned TextIndex, char * sText);
void SWIPELIST_SetTextAlign (SWIPELIST_Handle hObj, unsigned ItemIndex, int Align);
void SWIPELIST_SetTextColor (SWIPELIST_Handle hObj, unsigned Index, GUI_COLOR Color);
int SWIPELIST_SetThreshold (SWIPELIST_Handle hObj, int Threshold);
int SWIPELIST_SetUserData (SWIPELIST_Handle hObj, const void * pSrc, int NumBytes);







int SWIPELIST_GetDefaultBitmapSpace (void);
GUI_COLOR SWIPELIST_GetDefaultBkColor (unsigned Index);
int SWIPELIST_GetDefaultBorderSize (unsigned Index);
const GUI_FONT * SWIPELIST_GetDefaultFont (unsigned Index);
GUI_COLOR SWIPELIST_GetDefaultSepColor (void);
unsigned SWIPELIST_GetDefaultSepSize (void);
GUI_COLOR SWIPELIST_GetDefaultTextColor (unsigned Index);
int SWIPELIST_GetDefaultTextAlign (void);
int SWIPELIST_GetDefaultThreshold (void);

void SWIPELIST_SetDefaultBitmapSpace (unsigned Size);
void SWIPELIST_SetDefaultBkColor (unsigned Index, GUI_COLOR Color);
void SWIPELIST_SetDefaultBorderSize (unsigned Index, unsigned Size);
void SWIPELIST_SetDefaultFont (unsigned Index, const GUI_FONT * pFont);
void SWIPELIST_SetDefaultSepColor (GUI_COLOR Color);
void SWIPELIST_SetDefaultSepSize (unsigned Size);
void SWIPELIST_SetDefaultTextColor (unsigned Index, GUI_COLOR Color);
void SWIPELIST_SetDefaultTextAlign (int Align);
void SWIPELIST_SetDefaultThreshold (int Threshold);
# 81 "../Middlewares/ST/STemWin/inc/DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/TEXT.h" 1
# 94 "../Middlewares/ST/STemWin/inc/TEXT.h"
typedef signed long TEXT_Handle;







TEXT_Handle TEXT_Create (int x0, int y0, int xSize, int ySize, int Id, int Flags, const char * s, int Align);
TEXT_Handle TEXT_CreateAsChild (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int Id, int Flags, const char * s, int Align);
TEXT_Handle TEXT_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, const char * pText);
TEXT_Handle TEXT_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, const char * pText, int NumExtraBytes);
TEXT_Handle TEXT_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 115 "../Middlewares/ST/STemWin/inc/TEXT.h"
void TEXT_Callback(WM_MESSAGE * pMsg);
# 126 "../Middlewares/ST/STemWin/inc/TEXT.h"
GUI_COLOR TEXT_GetBkColor (TEXT_Handle hObj);
const GUI_FONT * TEXT_GetFont (TEXT_Handle hObj);
int TEXT_GetNumLines (TEXT_Handle hObj);
int TEXT_GetText (TEXT_Handle hObj, char * pDest, unsigned long BufferSize);
int TEXT_GetTextAlign(TEXT_Handle hObj);
GUI_COLOR TEXT_GetTextColor(TEXT_Handle hObj);
int TEXT_GetUserData (TEXT_Handle hObj, void * pDest, int NumBytes);
GUI_WRAPMODE TEXT_GetWrapMode (TEXT_Handle hObj);
void TEXT_SetBkColor (TEXT_Handle hObj, GUI_COLOR Color);
void TEXT_SetFont (TEXT_Handle hObj, const GUI_FONT * pFont);
int TEXT_SetText (TEXT_Handle hObj, const char * s);
void TEXT_SetTextAlign(TEXT_Handle hObj, int Align);
void TEXT_SetTextColor(TEXT_Handle hObj, GUI_COLOR Color);
int TEXT_SetUserData (TEXT_Handle hObj, const void * pSrc, int NumBytes);
void TEXT_SetWrapMode (TEXT_Handle hObj, GUI_WRAPMODE WrapMode);
# 149 "../Middlewares/ST/STemWin/inc/TEXT.h"
const GUI_FONT * TEXT_GetDefaultFont (void);
GUI_COLOR TEXT_GetDefaultTextColor(void);
GUI_WRAPMODE TEXT_GetDefaultWrapMode (void);
void TEXT_SetDefaultFont (const GUI_FONT * pFont);
void TEXT_SetDefaultTextColor(GUI_COLOR Color);
GUI_WRAPMODE TEXT_SetDefaultWrapMode (GUI_WRAPMODE WrapMode);
# 82 "../Middlewares/ST/STemWin/inc/DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/TREEVIEW.h" 1
# 122 "../Middlewares/ST/STemWin/inc/TREEVIEW.h"
typedef signed long TREEVIEW_Handle;
typedef signed long TREEVIEW_ITEM_Handle;

typedef struct {
  int IsNode;
  int IsExpanded;
  int HasLines;
  int HasRowSelect;
  int Level;
} TREEVIEW_ITEM_INFO;

typedef struct {
  GUI_COLOR ColorBk;
  GUI_COLOR ColorText;
  GUI_COLOR ColorTextBk;
  GUI_COLOR ColorLines;
  GUI_RECT rText;
  TREEVIEW_ITEM_Handle hItem;
  const GUI_FONT * pFont;
  char * pText;
  unsigned char NumLines;
  signed short ax0[3];
  signed short ay0[3];
  signed short ax1[3];
  signed short ay1[3];
  unsigned char NumConnectors;
  signed short axc[16];
  const GUI_BITMAP * pBmPM;
  const GUI_BITMAP * pBmOCL;
  signed short xPosPM, xPosOCL;
  unsigned char IndexPM;
  unsigned char IndexOCL;
} TREEVIEW_ITEM_DRAW_INFO;







TREEVIEW_Handle TREEVIEW_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id);
TREEVIEW_Handle TREEVIEW_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, int NumExtraBytes);
TREEVIEW_Handle TREEVIEW_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 173 "../Middlewares/ST/STemWin/inc/TREEVIEW.h"
void TREEVIEW_Callback(WM_MESSAGE * pMsg);







int TREEVIEW_AttachItem (TREEVIEW_Handle hObj, TREEVIEW_ITEM_Handle hItem, TREEVIEW_ITEM_Handle hItemAt, int Position);
void TREEVIEW_DecSel (TREEVIEW_Handle hObj);
TREEVIEW_ITEM_Handle TREEVIEW_GetItem (TREEVIEW_Handle hObj, TREEVIEW_ITEM_Handle hItem, int Flags);
TREEVIEW_ITEM_Handle TREEVIEW_GetSel (TREEVIEW_Handle hObj);
int TREEVIEW_GetUserData (TREEVIEW_Handle hObj, void * pDest, int NumBytes);
void TREEVIEW_IncSel (TREEVIEW_Handle hObj);
TREEVIEW_ITEM_Handle TREEVIEW_InsertItem (TREEVIEW_Handle hObj, int IsNode, TREEVIEW_ITEM_Handle hItemPrev, int Position, const char * s);
int TREEVIEW_OwnerDraw (const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
void TREEVIEW_ScrollToSel (TREEVIEW_Handle hObj);
void TREEVIEW_SetAutoScrollH (TREEVIEW_Handle hObj, int State);
void TREEVIEW_SetAutoScrollV (TREEVIEW_Handle hObj, int State);
void TREEVIEW_SetBitmapOffset(TREEVIEW_Handle hObj, int Index, int xOff, int yOff);
void TREEVIEW_SetBkColor (TREEVIEW_Handle hObj, int Index, GUI_COLOR Color);
void TREEVIEW_SetFont (TREEVIEW_Handle hObj, const GUI_FONT * pFont);
void TREEVIEW_SetHasLines (TREEVIEW_Handle hObj, int State);
void TREEVIEW_SetImage (TREEVIEW_Handle hObj, int Index, const GUI_BITMAP * pBitmap);
int TREEVIEW_SetIndent (TREEVIEW_Handle hObj, int Indent);
void TREEVIEW_SetLineColor (TREEVIEW_Handle hObj, int Index, GUI_COLOR Color);
void TREEVIEW_SetOwnerDraw (TREEVIEW_Handle hObj, WIDGET_DRAW_ITEM_FUNC * pfDrawItem);
void TREEVIEW_SetSel (TREEVIEW_Handle hObj, TREEVIEW_ITEM_Handle hItem);
void TREEVIEW_SetSelMode (TREEVIEW_Handle hObj, int Mode);
void TREEVIEW_SetTextColor (TREEVIEW_Handle hObj, int Index, GUI_COLOR Color);
int TREEVIEW_SetTextIndent (TREEVIEW_Handle hObj, int TextIndent);
int TREEVIEW_SetUserData (TREEVIEW_Handle hObj, const void * pSrc, int NumBytes);
# 213 "../Middlewares/ST/STemWin/inc/TREEVIEW.h"
void TREEVIEW_ITEM_Collapse (TREEVIEW_ITEM_Handle hItem);
void TREEVIEW_ITEM_CollapseAll(TREEVIEW_ITEM_Handle hItem);
TREEVIEW_ITEM_Handle TREEVIEW_ITEM_Create (int IsNode, const char * s, unsigned long UserData);
void TREEVIEW_ITEM_Delete (TREEVIEW_ITEM_Handle hItem);
void TREEVIEW_ITEM_Detach (TREEVIEW_ITEM_Handle hItem);
void TREEVIEW_ITEM_Expand (TREEVIEW_ITEM_Handle hItem);
void TREEVIEW_ITEM_ExpandAll (TREEVIEW_ITEM_Handle hItem);
void TREEVIEW_ITEM_GetInfo (TREEVIEW_ITEM_Handle hItem, TREEVIEW_ITEM_INFO * pInfo);
void TREEVIEW_ITEM_GetText (TREEVIEW_ITEM_Handle hItem, unsigned char * pBuffer, int MaxNumBytes);
unsigned long TREEVIEW_ITEM_GetUserData(TREEVIEW_ITEM_Handle hItem);
void TREEVIEW_ITEM_SetImage (TREEVIEW_ITEM_Handle hItem, int Index, const GUI_BITMAP * pBitmap);
TREEVIEW_ITEM_Handle TREEVIEW_ITEM_SetText (TREEVIEW_ITEM_Handle hItem, const char * s);
void TREEVIEW_ITEM_SetUserData(TREEVIEW_ITEM_Handle hItem, unsigned long UserData);







GUI_COLOR TREEVIEW_GetDefaultBkColor (int Index);
const GUI_FONT * TREEVIEW_GetDefaultFont (void);
GUI_COLOR TREEVIEW_GetDefaultLineColor(int Index);
GUI_COLOR TREEVIEW_GetDefaultTextColor(int Index);
void TREEVIEW_SetDefaultBkColor (int Index, GUI_COLOR Color);
void TREEVIEW_SetDefaultFont (const GUI_FONT * pFont);
void TREEVIEW_SetDefaultLineColor(int Index, GUI_COLOR Color);
void TREEVIEW_SetDefaultTextColor(int Index, GUI_COLOR Color);
# 83 "../Middlewares/ST/STemWin/inc/DIALOG.h" 2
# 1 "../Middlewares/ST/STemWin/inc/KNOB.h" 1
# 73 "../Middlewares/ST/STemWin/inc/KNOB.h"
typedef signed long KNOB_Handle;







KNOB_Handle KNOB_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int Id);
KNOB_Handle KNOB_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int Id, int NumExtraBytes);
KNOB_Handle KNOB_CreateIndirect(const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
# 92 "../Middlewares/ST/STemWin/inc/KNOB.h"
void KNOB_Callback(WM_MESSAGE * pMsg);







void KNOB_AddValue (KNOB_Handle hObj, signed long Value);
int KNOB_GetUserData(KNOB_Handle hObj, void * pDest, int NumBytes);
signed long KNOB_GetValue (KNOB_Handle hObj);
void KNOB_SetBkColor (KNOB_Handle hObj, GUI_COLOR Color);
void KNOB_SetBkDevice(KNOB_Handle hObj, GUI_MEMDEV_Handle hMemBk);
void KNOB_SetDevice (KNOB_Handle hObj, GUI_MEMDEV_Handle hMemSrc);
void KNOB_SetKeyValue(KNOB_Handle hObj, signed long KeyValue);
void KNOB_SetOffset (KNOB_Handle hObj, signed long Offset);
void KNOB_SetPeriod (KNOB_Handle hObj, signed long Period);
void KNOB_SetPos (KNOB_Handle hObj, signed long Pos);
void KNOB_SetRange (KNOB_Handle hObj, signed long MinRange, signed long MaxRange);
void KNOB_SetSnap (KNOB_Handle hObj, signed long Snap);
void KNOB_SetTickSize(KNOB_Handle hObj, signed long TickSize);
int KNOB_SetUserData(KNOB_Handle hObj, const void * pSrc, int NumBytes);
# 84 "../Middlewares/ST/STemWin/inc/DIALOG.h" 2
# 95 "../Middlewares/ST/STemWin/inc/DIALOG.h"
GUI_HWIN WINDOW_CreateEx (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, WM_CALLBACK * cb);
GUI_HWIN WINDOW_CreateUser (int x0, int y0, int xSize, int ySize, GUI_HWIN hParent, int WinFlags, int ExFlags, int Id, WM_CALLBACK * cb, int NumExtraBytes);
GUI_HWIN WINDOW_CreateIndirect (const GUI_WIDGET_CREATE_INFO * pCreateInfo, GUI_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
GUI_COLOR WINDOW_GetDefaultBkColor(void);
int WINDOW_GetUserData (GUI_HWIN hObj, void * pDest, int NumBytes);
void WINDOW_SetBkColor (GUI_HWIN hObj, GUI_COLOR Color);
void WINDOW_SetDefaultBkColor(GUI_COLOR Color);
int WINDOW_SetUserData (GUI_HWIN hObj, const void * pSrc, int NumBytes);

void WINDOW_Callback(WM_MESSAGE * pMsg);
# 25 "../Src/display.c" 2
# 1 "../Inc\\waveplayer.h" 1
# 60 "../Inc\\waveplayer.h"
typedef enum {
  AUDIO_STATE_IDLE = 0,
  AUDIO_STATE_PLAY,
  AUDIO_STATE_STOP,
  AUDIO_STATE_ERROR

}AUDIO_PLAYBACK_StateTypeDef;


typedef enum
{
  BUFFER_OFFSET_NONE = 0,
  BUFFER_OFFSET_HALF,
  BUFFER_OFFSET_FULL,

}BUFFER_StateTypeDef;


typedef struct
{
  uint8_t buff[8192];
  BUFFER_StateTypeDef state;
  uint32_t fptr;

}AUDIO_OUT_BufferTypeDef;


typedef enum
{
  BUFFER_EMPTY = 0,
  BUFFER_FULL

}WR_BUFFER_StateTypeDef;


typedef struct
{
  uint16_t pcm_buff[4*2304];
  uint32_t pcm_ptr;
  WR_BUFFER_StateTypeDef wr_state;
  uint32_t offset;
  uint32_t fptr;

}AUDIO_IN_BufferTypeDef;


typedef struct
{
 uint32_t ChunkID;
 uint32_t FileSize;
 uint32_t FileFormat;
 uint32_t SubChunk1ID;
 uint32_t SubChunk1Size;
 uint16_t AudioFormat;
 uint16_t NbrChannels;
 uint32_t SampleRate;
 uint32_t ByteRate;
 uint16_t BlockAlign;
 uint16_t BitPerSample;
 uint32_t SubChunk2ID;
 uint32_t SubChunk2Size;
 const uint8_t* file_name;

}WAVE_FormatTypeDef;


typedef enum
{
  AUDIO_ERROR_NONE = 0,
  AUDIO_ERROR_IO,
  AUDIO_ERROR_EOF,
  AUDIO_ERROR_INVALID_VALUE,

}AUDIO_ErrorTypeDef;


extern AUDIO_OUT_BufferTypeDef BufferCtl;






AUDIO_ErrorTypeDef AUDIO_PLAYER_Init(void);
AUDIO_ErrorTypeDef AUDIO_PLAYER_Play(const uint8_t* wave_file);
AUDIO_ErrorTypeDef AUDIO_PLAYER_Process(void);
AUDIO_ErrorTypeDef AUDIO_PLAYER_Stop(void);
# 26 "../Src/display.c" 2






BUTTON_Handle hBUTTON_Dnd;
BUTTON_Handle hBUTTON_Sos;
BUTTON_Handle hBUTTON_Maid;
KNOB_Handle hKNOB_Temperature;
GUI_HSPRITE SPRITE_DoorBell;

eActivDisplayTypeDef ActivDisplay;
# 52 "../Src/display.c"
volatile uint32_t display_timer;
volatile uint32_t display_knob_timer;
volatile uint32_t display_date_time_timer;
volatile uint32_t display_doorbell_animation_timer;
uint32_t display_flags;

uint8_t current_outdoor_temperature;
uint8_t display_buffer[32];
uint8_t btn_alarm_clock_state, btn_alarm_clock_old_state;
uint8_t btn_alarm_on_off_state, btn_alarm_on_off_old_state;
uint8_t btn_alarm_set_time_state, btn_alarm_set_time_old_state;
uint8_t btn_home_state, btn_home_old_state;
uint8_t btn_weather_state, btn_weather_old_state;
uint8_t btn_dnd_state, btn_dnd_old_state;
uint8_t btn_sos_state, btn_sos_old_state;
uint8_t btn_maid_state, btn_maid_old_state;
uint8_t btn_fan_mode_state, btn_fan_mode_old_state;
uint8_t btn_ctrl_mode_state, btn_ctrl_mode_old_state;
uint8_t alarm_hour, alarm_minute;

GUI_RECT Rect1 = {5, 65, 215, 115};
GUI_RECT Rect2 = {5, 110, 215, 160};
GUI_RECT Rect3 = {5, 155, 215, 205};


GUI_RECT ForecastFrame[8] = {
 { 70, 28, 455, 58},
 { 5, 70, 65, 265},
 { 70, 70, 130, 265},
 {135, 70, 195, 265},
 {200, 70, 260, 265},
 {265, 70, 325, 265},
 {330, 70, 390, 265},
 {395, 70, 455, 265}
};

const double Rad2Deg = 180.0 / (double)3.14159265358979f;
const double Deg2Rad = (double)3.14159265358979f / 180.0;
static const GUI_FONT * pFont23pBold = &GUI_Font23S_AA4;
static const GUI_FONT * pFont32pBold = &GUI_Font32S_AA4;
static const GUI_FONT * pFont23p = &GUI_Font23SL_AA4;
static const GUI_FONT * pFont32p = &GUI_Font32SL_AA4;

static const GUI_COLOR _aGradient[] = {
  0x00BC944C, 0x00BC944C, 0x00BB944C, 0x00BA944C, 0x00BA944C, 0x00B9944C, 0x00B9944C, 0x00B8944C, 0x00B7944C, 0x00B7944C, 0x00B6944C, 0x00B5944C, 0x00B5944C, 0x00B4944C, 0x00B3944C, 0x00B3944C, 0x00B2944C, 0x00B1944C, 0x00B0944C, 0x00AF944C, 0x00AE944C,
  0x00AE944C, 0x00AD944C, 0x00AC944C, 0x00AB944C, 0x00AA944C, 0x00A9944C, 0x00A8944C, 0x00A7944C, 0x00A6944C, 0x00A5944C, 0x00A4944C, 0x00A3944C, 0x00A2944C, 0x00A1944C, 0x00A0944C, 0x009F944C, 0x009E944C, 0x009D944C, 0x009C944C, 0x009B944C,
  0x009A944C, 0x0099944C, 0x0098944C, 0x0097944C, 0x0096944C, 0x0094944C, 0x0093944C, 0x0092944C, 0x0091944C, 0x0090944C, 0x008F944C, 0x008E944C, 0x008C944C, 0x008B944C, 0x008A944C, 0x0089944C, 0x0088944C, 0x0087944C, 0x0085944C, 0x0084944C,
  0x0083944C, 0x0082944C, 0x0081944C, 0x007F944C, 0x007E944C, 0x007D944C, 0x007C944C, 0x007B944C, 0x0079944C, 0x0078944C, 0x0077944C, 0x0076944C, 0x0075944C, 0x0074944C, 0x0072944C, 0x0071944C, 0x0070944C, 0x006F944C, 0x006E944C, 0x006D944C,
  0x006B944C, 0x006A944C, 0x0069944C, 0x0068944C, 0x0067944C, 0x0066944C, 0x0065944C, 0x0063944C, 0x0062944C, 0x0061944C, 0x0060944C, 0x005F944C, 0x005E944C, 0x005D944C, 0x005C944C, 0x005B944C, 0x005A944C, 0x0059944C, 0x0058944C, 0x0057944C,
  0x0056944C, 0x0055944C, 0x0054944C, 0x0053944C, 0x0052944C, 0x0051944C, 0x0050944C, 0x004F944C, 0x004E944C, 0x004D944C, 0x004C944C, 0x004C944C, 0x004B944C, 0x004A944C, 0x0049944C, 0x0048944C, 0x0047944C, 0x0047944C, 0x0046944C, 0x0045944C,
  0x0044944C, 0x0044944C, 0x0043944C, 0x0042944C, 0x0042944C, 0x0041944C, 0x0041944C, 0x0040944C, 0x003F944D, 0x003F944D, 0x003E944E, 0x003E944F, 0x003D934F, 0x003D9350, 0x003C9351, 0x003C9352, 0x003B9352, 0x003B9353, 0x003A9354, 0x003A9355,
  0x00399256, 0x00399256, 0x00399257, 0x00389258, 0x00389259, 0x0037925A, 0x0037915B, 0x0037915C, 0x0036915D, 0x0036915E, 0x0035915F, 0x00359160, 0x00359061, 0x00349062, 0x00349063, 0x00349064, 0x00339066, 0x00338F67, 0x00338F68, 0x00338F69,
  0x00328F6A, 0x00328F6B, 0x00328E6D, 0x00328E6E, 0x00318E6F, 0x00318E70, 0x00318D71, 0x00318D73, 0x00308D74, 0x00308D75, 0x00308D77, 0x00308C78, 0x00308C79, 0x002F8C7A, 0x002F8C7C, 0x002F8B7D, 0x002F8B7E, 0x002F8B80, 0x002E8B81, 0x002E8A82,
  0x002E8A84, 0x002E8A85, 0x002E8A86, 0x002E8988, 0x002E8989, 0x002D898A, 0x002D898C, 0x002D888D, 0x002D888F, 0x002D8890, 0x002D8891, 0x002D8893, 0x002D8794, 0x002D8795, 0x002C8797, 0x002C8798, 0x002C869A, 0x002C869B, 0x002C869C, 0x002C869E,
  0x002C859F, 0x002C85A0, 0x002C85A2, 0x002C85A3, 0x002C84A4, 0x002C84A6, 0x002C84A7, 0x002C84A8, 0x002B83AA, 0x002B83AB, 0x002B83AC, 0x002B83AD, 0x002B82AF, 0x002B82B0, 0x002B82B1, 0x002B82B3, 0x002B82B4, 0x002B81B5, 0x002B81B6, 0x002B81B7,
  0x002B81B9, 0x002B80BA, 0x002B80BB, 0x002B80BC, 0x002B80BD, 0x002B80BE, 0x002B7FC0, 0x002B7FC1, 0x002B7FC2, 0x002B7FC3, 0x002A7FC4, 0x002A7EC5, 0x002A7EC6, 0x002A7EC7, 0x002A7EC8, 0x002A7EC9, 0x002A7ECA, 0x002A7DCB, 0x002A7DCC, 0x002A7DCD,
  0x002A7DCE, 0x002A7DCE, 0x002A7DCF, 0x002A7CD0, 0x002A7CD1, 0x002A7CD2, 0x002A7CD2, 0x002A7CD3, 0x002A7CD4, 0x00297CD5, 0x00297CD5, 0x00297BD6, 0x00297BD7, 0x00297BD7, 0x00297BD8

};


static char * _apMinute[] = {
 "00", "01", "02", "03", "04", "05", "06", "07", "08", "09",
 "10", "11", "12", "13", "14", "15", "16", "17", "18", "19",
 "20", "21", "22", "23", "24", "25", "26", "27", "28", "29",
 "30", "31", "32", "33", "34", "35", "36", "37", "38", "39",
 "40", "41", "42", "43", "44", "45", "46", "47", "48", "49",
 "50", "51", "52", "53", "54", "55", "56", "57", "58", "59",
};

static char * _apHour[] = {
 "00", "01", "02", "03", "04", "05", "06", "07", "08", "09",
 "10", "11", "12", "13", "14", "15", "16", "17", "18", "19",
 "20", "21", "22", "23"
};

static char * _apDays[] = {
 "0", "MON", "TUE", "WED", "THU", "FRE", "SAT", "SUN"
};



static void PID_Hook(GUI_PID_STATE * pState);
static void DISPLAY_DateTime(void);
static void DISPLAY_Knob(void);
static void DISPLAY_RoomTemperature(void);



void DISPLAY_Init(void)
{
 GUI_Initialized = 0;
 GUI_Init();
 GUI_PID_SetHook(PID_Hook);
 WM_MULTIBUF_Enable(1);
 LCD_SetVisEx(0, 1);
 LCD_SetVisEx(1, 1);
 GUI_SelectLayer(0);
 GUI_Clear();
 GUI_DrawBitmap(&bmbckgnd_thermostat, 0, 0);
 hBUTTON_Dnd = BUTTON_Create( 5, 65, 210, 45, 0x803, (1UL << 1));
 hBUTTON_Sos = BUTTON_Create( 5, 110, 210, 45, 0x804, (1UL << 1));
 hBUTTON_Maid = BUTTON_Create( 5, 155, 210, 45, 0x805, (1UL << 1));
 GUI_Exec();
 GUI_SelectLayer(1);
 GUI_SetBkColor(0xFF000000);
 GUI_Clear();
 GUI_DrawBitmap(&bmknob, 249, 52);
 GUI_SetColor(0x00FFFFFF);
 GUI_FillRectEx(&Rect1);
 GUI_SetColor((0xaa7d67));
 GUI_AA_FillRoundedRect(Rect1.x0 + 1, Rect1.y0 + 1, Rect1.x1 - 1, Rect1.y1 - 1, 8);
 Rect1.x0 += 5;
 GUI_SetFont(pFont23pBold);
 GUI_SetTextMode((1<<1));
 GUI_SetColor((0x00d6d3));
 GUI_DispStringInRect("Do Not Disturb", &Rect1, (3<<2) | (2<<0));
 Rect1.x0 -= 5;
 GUI_SetColor(0x00FFFFFF);
 GUI_FillRectEx(&Rect2);
 GUI_SetColor((0xaa7d67));
 GUI_AA_FillRoundedRect(Rect2.x0 + 1, Rect2.y0 + 1, Rect2.x1 - 1, Rect2.y1 - 1, 8);
 Rect2.x0 += 5;
 GUI_SetFont(pFont23pBold);
 GUI_SetTextMode((1<<1));
 GUI_SetColor((0x00d6d3));
 GUI_DispStringInRect("SOS Reset", &Rect2, (3<<2) | (2<<0));
 Rect2.x0 -= 5;
 GUI_SetColor(0x00FFFFFF);
 GUI_FillRectEx(&Rect3);
 GUI_SetColor((0xaa7d67));
 GUI_AA_FillRoundedRect(Rect3.x0 + 1, Rect3.y0 + 1, Rect3.x1 - 1, Rect3.y1 - 1, 8);
 Rect3.x0 += 5;
 GUI_SetFont(pFont23pBold);
 GUI_SetTextMode((1<<1));
 GUI_SetColor((0x00d6d3));
 GUI_DispStringInRect("Call Maid", &Rect3, (3<<2) | (2<<0));
 Rect3.x0 -= 5;
 ActivDisplay = DISPLAY_THERMOSTAT;
 DISPLAY_DateTime();
 DISPLAY_Knob();
 GUI_Initialized = 1;
 GUI_SelectLayer(0);
}


void DISPLAY_Service(void)
{
 uint8_t i;
 static uint8_t fl = 0;
 static uint8_t audio_cnt = 0;



 if((display_timer == 0))
 {
  (display_timer = 33);
  GUI_Exec();
 }
 else
 {
  return;
 }

 if((display_date_time_timer == 0))
 {
  (display_date_time_timer = 60000);
  GUI_MULTIBUF_BeginEx(1);
  DISPLAY_DateTime();
  GUI_MULTIBUF_EndEx(1);
 }

 if(((display_flags & (1 << 2)) != 0))
 {
  (display_flags &= (~ (1 << 2)));
  GUI_MULTIBUF_BeginEx(1);
  DISPLAY_RoomTemperature();
  GUI_MULTIBUF_EndEx(1);
 }

 if(((display_flags & (1 << 9)) != 0))
 {
  (display_flags &= (~ (1 << 9)));
  GUI_MULTIBUF_BeginEx(1);
  DISPLAY_Knob();
  GUI_MULTIBUF_EndEx(1);
 }

 if(((display_flags & (1 << 0)) != 0) && (!((display_flags & (1 << 3)) != 0)) && (!((display_flags & (1 << 4)) != 0)))
 {
  (display_flags |= (1 << 3));
  GUI_SelectLayer(1);
  GUI_MULTIBUF_BeginEx(1);
  GUI_SetColor(0x00FF0000);
  GUI_FillCircle(336, 139, 56);
  SPRITE_DoorBell = GUI_SPRITE_CreateAnim(&apbmdoor_bell_anim[1], 275, 85, 100,0, 9);
  (display_doorbell_animation_timer = 4321);
  GUI_MULTIBUF_EndEx(1);
  GUI_SelectLayer(0);
 }
 else if(!((display_flags & (1 << 0)) != 0) && (((display_flags & (1 << 3)) != 0)) && ((display_doorbell_animation_timer == 0)))
 {
  GUI_MULTIBUF_BeginEx(1);
  (display_flags &= (~ (1 << 3)));
  GUI_SPRITE_StopAnim(SPRITE_DoorBell);
  GUI_SPRITE_Delete(SPRITE_DoorBell);
  DISPLAY_Knob();
  GUI_MULTIBUF_EndEx(1);
 }



 if(ActivDisplay == DISPLAY_THERMOSTAT)
 {
  if(BUTTON_IsPressed(hBUTTON_Dnd) && !btn_dnd_old_state)
  {
   btn_dnd_old_state = 1;

   if(btn_dnd_state == 0)
   {
    btn_dnd_state = 1;
    GUI_SelectLayer(1);
    GUI_MULTIBUF_BeginEx(1);
    GUI_SetColor(0x00FFFFFF);
    GUI_FillRectEx(&Rect1);
    GUI_SetColor(0x000000FF);
    GUI_AA_FillRoundedRect(Rect1.x0 + 1, Rect1.y0 + 1, Rect1.x1 - 1, Rect1.y1 - 1, 8);
    Rect1.x0 += 5;
    GUI_SetFont(pFont32pBold);
    GUI_SetTextMode((1<<1));
    GUI_SetColor(0x00FFFFFF);
    GUI_DispStringInRect("Do Not Disturb", &Rect1, (3<<2) | (2<<0));
    Rect1.x0 -= 5;
    GUI_MULTIBUF_EndEx(1);
    GUI_SelectLayer(0);
    (display_flags |= (1 << 4));
    if(((display_flags & (1 << 6)) != 0)) BUTTON_SetPressed(hBUTTON_Maid, 1);
   }
   else if(btn_dnd_state == 1)
   {
    btn_dnd_state = 0;
    GUI_SelectLayer(1);
    GUI_MULTIBUF_BeginEx(1);
    GUI_SetColor(0x00FFFFFF);
    GUI_FillRectEx(&Rect1);
    GUI_SetColor((0xaa7d67));
    GUI_AA_FillRoundedRect(Rect1.x0 + 1, Rect1.y0 + 1, Rect1.x1 - 1, Rect1.y1 - 1, 8);
    Rect1.x0 += 5;
    GUI_SetFont(pFont23pBold);
    GUI_SetTextMode((1<<1));
    GUI_SetColor((0x00d6d3));
    GUI_DispStringInRect("Do Not Disturb", &Rect1, (3<<2) | (2<<0));
    Rect1.x0 -= 5;
    GUI_MULTIBUF_EndEx(1);
    GUI_SelectLayer(0);
    (display_flags &= (~ (1 << 4)));
   }

  }
  else if(!BUTTON_IsPressed(hBUTTON_Dnd) && btn_dnd_old_state) btn_dnd_old_state = 0;

  if(BUTTON_IsPressed(hBUTTON_Sos) && !btn_sos_old_state && ((display_flags & (1 << 5)) != 0))
  {
   btn_sos_old_state = 1;

   if(btn_sos_state == 1)
   {
    btn_sos_state = 0;
    GUI_SelectLayer(1);
    GUI_MULTIBUF_BeginEx(1);
    GUI_SetColor(0x00FFFFFF);
    GUI_FillRectEx(&Rect2);
    GUI_SetColor((0xaa7d67));
    GUI_AA_FillRoundedRect(Rect2.x0 + 1, Rect2.y0 + 1, Rect2.x1 - 1, Rect2.y1 - 1, 8);
    Rect2.x0 += 5;
    GUI_SetFont(pFont23pBold);
    GUI_SetTextMode((1<<1));
    GUI_SetColor((0x00d6d3));
    GUI_DispStringInRect("SOS Reset", &Rect2, (3<<2) | (2<<0));
    Rect2.x0 -= 5;
    GUI_MULTIBUF_EndEx(1);
    GUI_SelectLayer(0);
    (display_flags &= (~ (1 << 5)));
   }
  }
  if(!BUTTON_IsPressed(hBUTTON_Sos) && btn_sos_old_state) btn_sos_old_state = 0;

  if(BUTTON_IsPressed(hBUTTON_Maid) && !btn_maid_old_state)
  {
   btn_maid_old_state = 1;

   if(btn_maid_state == 0)
   {
    btn_maid_state = 1;
    GUI_SelectLayer(1);
    GUI_MULTIBUF_BeginEx(1);
    GUI_SetColor(0x00FFFFFF);
    GUI_FillRectEx(&Rect3);
    GUI_SetColor(0x0000FF00);
    GUI_AA_FillRoundedRect(Rect3.x0 + 1, Rect3.y0 + 1, Rect3.x1 - 1, Rect3.y1 - 1, 8);
    Rect3.x0 += 5;
    GUI_SetFont(pFont32pBold);
    GUI_SetTextMode((1<<1));
    GUI_SetColor(0x00FFFFFF);
    GUI_DispStringInRect("Call Maid", &Rect3, (3<<2) | (2<<0));
    Rect3.x0 -= 5;
    GUI_MULTIBUF_EndEx(1);
    GUI_SelectLayer(0);
    (display_flags |= (1 << 6));
    if(((display_flags & (1 << 4)) != 0)) BUTTON_SetPressed(hBUTTON_Dnd, 1);
   }
   else if(btn_maid_state == 1)
   {
    btn_maid_state = 0;
    GUI_SelectLayer(1);
    GUI_MULTIBUF_BeginEx(1);
    GUI_SetColor(0x00FFFFFF);
    GUI_FillRectEx(&Rect3);
    GUI_SetColor((0xaa7d67));
    GUI_AA_FillRoundedRect(Rect3.x0 + 1, Rect3.y0 + 1, Rect3.x1 - 1, Rect3.y1 - 1, 8);
    Rect3.x0 += 5;
    GUI_SetFont(pFont23pBold);
    GUI_SetTextMode((1<<1));
    GUI_SetColor((0x00d6d3));
    GUI_DispStringInRect("Call Maid", &Rect3, (3<<2) | (2<<0));
    Rect3.x0 -= 5;
    GUI_MULTIBUF_EndEx(1);
    GUI_SelectLayer(0);
    (display_flags &= (~ (1 << 6)));
   }
  }
  else if(!BUTTON_IsPressed(hBUTTON_Maid) && btn_maid_old_state) btn_maid_old_state = 0;
 }
}


static void PID_Hook(GUI_PID_STATE * pState)
{
 double x0,x1;
 double y0,y1;
 double angle;

 if(ActivDisplay == DISPLAY_THERMOSTAT)
 {
  if ((pState->x >= 250) &&
   (pState->y >= 40) &&
   (pState->x < (250 + 200)) &&
   (pState->y < (40 + 160)))
  {
   pState->Layer = 1;
   x0 = 336;
   y0 = 139;
   x1 = pState->x;
   y1 = pState->y;
   angle = atan2(y0 -y1, x0 - x1) * Rad2Deg;

   if(angle < 0)
   {
    if(x1 > x0) angle = 180;
    else angle = 0;
   }

   Thermostat_1.set_temperature = 140 + (uint16_t) angle;
   if(Thermostat_1.set_temperature < 140) Thermostat_1.set_temperature = 140;
   else if(Thermostat_1.set_temperature > 320) Thermostat_1.set_temperature = 320;
   (display_flags |= (1 << 9));
  }
 }
}


static void DISPLAY_Knob(void)
{
 int index;
 GUI_COLOR color;

 if(ActivDisplay == DISPLAY_THERMOSTAT)
 {
  GUI_SelectLayer(1);
  index = (((Thermostat_1.set_temperature / 10)- (140 / 10)) * ((sizeof(_aGradient) / sizeof(_aGradient[0])) - 1))
    / ((320 / 10) - (140 / 10));
  color = _aGradient[index];
  GUI_SetColor(color);
  GUI_FillCircle(336, 139, 56);
  GUI_SetColor(0x00FFFFFF);
  GUI_SetTextAlign((1<<0) | (3<<2));
  GUI_SetTextMode((1<<1));
  GUI_GotoXY(335, 150);
  GUI_SetFont(pFont32pBold);
  GUI_DispDecSpace((Thermostat_1.set_temperature / 10), 2);
  GUI_DispString("°C");
  GUI_GotoXY(300, 115);
  GUI_SetFont(pFont32p);
  GUI_DispString("Setup");
  GUI_GotoXY(370, 20);
  GUI_SelectLayer(0);
 }
}

static void DISPLAY_RoomTemperature(void)
{
 if(ActivDisplay == DISPLAY_THERMOSTAT)
 {
  GUI_SelectLayer(1);
  GUI_SetBkColor(0xFF000000);
  GUI_ClearRect(320,5,480,40);
  GUI_GotoXY(370, 20);
  GUI_SetFont(&GUI_Font20_1);
  GUI_SetColor(0x0000FFFF);
  GUI_SetTextMode((1<<1));
  GUI_SetTextAlign((1<<0)|(3<<2));
  GUI_DispString("INDOOR:");
  GUI_GotoXY(400, 20);
  GUI_SetFont(&GUI_Font32_1);
  GUI_SetColor(0x0000FFFF);
  GUI_SetTextMode((1<<1));
  GUI_SetTextAlign((0)|(3<<2));
  if(Thermostat_1.actual_temperature & 0x8000) GUI_DispString("-");
  GUI_DispDecSpace(((Thermostat_1.actual_temperature & 0x0fff) / 10), 2);
  GUI_DispString("°C");
  GUI_SelectLayer(0);
 }
}

static void DISPLAY_DateTime(void)
{
 uint8_t buff_bcnt;

 HAL_RTC_GetTime(&hrtc, &time, 0x00000001U);
 HAL_RTC_GetDate(&hrtc, &date, 0x00000001U);
 ClearBuffer(display_buffer, sizeof(display_buffer));
 GUI_SelectLayer(1);

 if(ActivDisplay == DISPLAY_THERMOSTAT)
 {
  GUI_ClearRect(65, 5, 245, 60);
  GUI_ClearRect(5, 230, 245, 270);
  GUI_SetFont(&GUI_Font32_1);
  GUI_SetColor(0x0000FFFF);
  GUI_SetTextMode((1<<1));
  GUI_SetTextAlign((0)|(3<<2));

  switch (date.WeekDay)
  {
   case 1:
    GUI_DispStringAt("MON", 5, 240);
    break;

   case 2:
    GUI_DispStringAt("TUE", 5, 240);
    break;

   case 3:
    GUI_DispStringAt("WED", 5, 240);
    break;

   case 4:
    GUI_DispStringAt("THU", 5, 240);
    break;

   case 5:
    GUI_DispStringAt("FRI", 5, 240);
    break;

   case 6:
    GUI_DispStringAt("SAT", 5, 240);
    break;

   case 7:
    GUI_DispStringAt("SUN", 5, 240);
    break;

   default:
    date.WeekDay = 7;
    GUI_DispStringAt("SUN", 5, 240);
    break;
  }

  buff_bcnt = 0;
  display_buffer[buff_bcnt++] = (date.Date >> 4) + 48;
  display_buffer[buff_bcnt++] = (date.Date & 0x0f) + 48;
  display_buffer[buff_bcnt++] = '.';
  display_buffer[buff_bcnt++] = (date.Month >> 4) + 48;
  display_buffer[buff_bcnt++] = (date.Month & 0x0f) + 48;
  display_buffer[buff_bcnt++] = '.';
  display_buffer[buff_bcnt++] = '2';
  display_buffer[buff_bcnt++] = '0';
  display_buffer[buff_bcnt++] = (date.Year >> 4) + 48;
  display_buffer[buff_bcnt++] = (date.Year & 0x0f) + 48;
  GUI_SetFont(&GUI_Font32_1);
  GUI_SetColor(0x0000FFFF);
  GUI_SetTextMode((1<<1));
  GUI_SetTextAlign((1<<0)|(3<<2));
  GUI_GotoXY(220, 240);
  GUI_DispString((const char *)display_buffer);
  ClearBuffer(display_buffer, sizeof(display_buffer));
  buff_bcnt = 0;
  display_buffer[buff_bcnt++] = (time.Hours >> 4) + 48;
  display_buffer[buff_bcnt++] = (time.Hours & 0x0f) + 48;
  display_buffer[buff_bcnt++] = ':';
  display_buffer[buff_bcnt++] = (time.Minutes >> 4) + 48;
  display_buffer[buff_bcnt++] = (time.Minutes & 0x0f) + 48;
  GUI_SetFont(&GUI_Font32_1);
  GUI_SetColor(0x0000FFFF);
  GUI_SetTextMode((1<<1));
  GUI_SetTextAlign((1<<0));
  GUI_GotoXY(220, 20);
  GUI_DispString((const char *)display_buffer);
 }

 GUI_SelectLayer(0);
}


void BUTTON_SetNewState(uint16_t button_id, BUTTON_StateTypeDef new_state)
{
 switch(button_id)
 {
  case 0x803:
  {
   if(new_state == RELEASED)
   {
    btn_dnd_state = 0;
    GUI_SelectLayer(1);
    GUI_MULTIBUF_BeginEx(1);
    GUI_SetColor(0x00FFFFFF);
    GUI_FillRectEx(&Rect1);
    GUI_SetColor((0xaa7d67));
    GUI_AA_FillRoundedRect(Rect1.x0 + 1, Rect1.y0 + 1, Rect1.x1 - 1, Rect1.y1 - 1, 8);
    Rect1.x0 += 5;
    GUI_SetFont(pFont23pBold);
    GUI_SetTextMode((1<<1));
    GUI_SetColor((0x00d6d3));
    GUI_DispStringInRect("Do Not Disturb", &Rect1, (3<<2) | (2<<0));
    Rect1.x0 -= 5;
    GUI_MULTIBUF_EndEx(1);
    GUI_SelectLayer(0);
    (display_flags &= (~ (1 << 4)));
   }
   else if(new_state == PRESSED)
   {
    btn_dnd_state = 1;
    GUI_SelectLayer(1);
    GUI_MULTIBUF_BeginEx(1);
    GUI_SetColor(0x00FFFFFF);
    GUI_FillRectEx(&Rect1);
    GUI_SetColor(0x000000FF);
    GUI_AA_FillRoundedRect(Rect1.x0 + 1, Rect1.y0 + 1, Rect1.x1 - 1, Rect1.y1 - 1, 8);
    Rect1.x0 += 5;
    GUI_SetFont(pFont32pBold);
    GUI_SetTextMode((1<<1));
    GUI_SetColor(0x00FFFFFF);
    GUI_DispStringInRect("Do Not Disturb", &Rect1, (3<<2) | (2<<0));
    Rect1.x0 -= 5;
    GUI_MULTIBUF_EndEx(1);
    GUI_SelectLayer(0);
    (display_flags |= (1 << 4));
   }
   break;
  }


  case 0x804:
  {
   if(new_state == RELEASED)
   {
    btn_sos_state = 0;
    GUI_SelectLayer(1);
    GUI_MULTIBUF_BeginEx(1);
    GUI_SetColor(0x00FFFFFF);
    GUI_FillRectEx(&Rect2);
    GUI_SetColor((0xaa7d67));
    GUI_AA_FillRoundedRect(Rect2.x0 + 1, Rect2.y0 + 1, Rect2.x1 - 1, Rect2.y1 - 1, 8);
    Rect2.x0 += 5;
    GUI_SetFont(pFont23pBold);
    GUI_SetTextMode((1<<1));
    GUI_SetColor((0x00d6d3));
    GUI_DispStringInRect("SOS Reset", &Rect2, (3<<2) | (2<<0));
    Rect2.x0 -= 5;
    GUI_MULTIBUF_EndEx(1);
    GUI_SelectLayer(0);
    (display_flags &= (~ (1 << 5)));
   }
   else if(new_state == PRESSED)
   {
    btn_sos_state = 1;
    GUI_SelectLayer(1);
    GUI_MULTIBUF_BeginEx(1);
    GUI_SetColor(0x00FFFFFF);
    GUI_FillRectEx(&Rect2);
    GUI_SetColor(0x000000FF);
    GUI_AA_FillRoundedRect(Rect2.x0 + 1, Rect2.y0 + 1, Rect2.x1 - 1, Rect2.y1 - 1, 8);
    Rect2.x0 += 5;
    GUI_SetFont(pFont32pBold);
    GUI_SetTextMode((1<<1));
    GUI_SetColor(0x00FFFFFF);
    GUI_DispStringInRect("SOS Reset", &Rect2, (3<<2) | (2<<0));
    Rect2.x0 -= 5;
    GUI_MULTIBUF_EndEx(1);
    GUI_SelectLayer(0);
    (display_flags |= (1 << 5));
   }
   break;
  }


  case 0x805:
  {
   if(new_state == RELEASED)
   {
    btn_maid_state = 0;
    GUI_SelectLayer(1);
    GUI_MULTIBUF_BeginEx(1);
    GUI_SetColor(0x00FFFFFF);
    GUI_FillRectEx(&Rect3);
    GUI_SetColor((0xaa7d67));
    GUI_AA_FillRoundedRect(Rect3.x0 + 1, Rect3.y0 + 1, Rect3.x1 - 1, Rect3.y1 - 1, 8);
    Rect3.x0 += 5;
    GUI_SetFont(pFont23pBold);
    GUI_SetTextMode((1<<1));
    GUI_SetColor((0x00d6d3));
    GUI_DispStringInRect("Call Maid", &Rect3, (3<<2) | (2<<0));
    Rect3.x0 -= 5;
    GUI_MULTIBUF_EndEx(1);
    GUI_SelectLayer(0);
    (display_flags &= (~ (1 << 6)));
   }
   else if(new_state == PRESSED)
   {
    btn_maid_state = 1;
    GUI_SelectLayer(1);
    GUI_MULTIBUF_BeginEx(1);
    GUI_SetColor(0x00FFFFFF);
    GUI_FillRectEx(&Rect3);
    GUI_SetColor(0x0000FF00);
    GUI_AA_FillRoundedRect(Rect3.x0 + 1, Rect3.y0 + 1, Rect3.x1 - 1, Rect3.y1 - 1, 8);
    Rect3.x0 += 5;
    GUI_SetFont(pFont32pBold);
    GUI_SetTextMode((1<<1));
    GUI_SetColor(0x00FFFFFF);
    GUI_DispStringInRect("Call Maid", &Rect3, (3<<2) | (2<<0));
    Rect3.x0 -= 5;
    GUI_MULTIBUF_EndEx(1);
    GUI_SelectLayer(0);
    (display_flags |= (1 << 6));
   }
   break;
  }
 }
}


BUTTON_StateTypeDef BUTTON_GetState(uint16_t button_id)
{
 switch(button_id)
 {
  case 0x803:
   return (btn_dnd_state);

  case 0x804:
   return (btn_sos_state);

  case 0x805:
   return (btn_maid_state);
 }
 return(2);
}
