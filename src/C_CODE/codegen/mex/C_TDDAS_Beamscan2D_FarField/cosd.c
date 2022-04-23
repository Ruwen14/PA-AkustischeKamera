/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * cosd.c
 *
 * Code generation for function 'cosd'
 *
 */

/* Include files */
#include "cosd.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"

/* Function Definitions */
void b_cosd(real_T *x)
{
  real_T absx;
  int8_T n;
  if (muDoubleScalarIsInf(*x) || muDoubleScalarIsNaN(*x)) {
    *x = rtNaN;
  } else {
    *x = muDoubleScalarRem(*x, 360.0);
    absx = muDoubleScalarAbs(*x);
    if (absx > 180.0) {
      if (*x > 0.0) {
        *x -= 360.0;
      } else {
        *x += 360.0;
      }
      absx = muDoubleScalarAbs(*x);
    }
    if (absx <= 45.0) {
      *x *= 0.017453292519943295;
      n = 0;
    } else if (absx <= 135.0) {
      if (*x > 0.0) {
        *x = 0.017453292519943295 * (*x - 90.0);
        n = 1;
      } else {
        *x = 0.017453292519943295 * (*x + 90.0);
        n = -1;
      }
    } else if (*x > 0.0) {
      *x = 0.017453292519943295 * (*x - 180.0);
      n = 2;
    } else {
      *x = 0.017453292519943295 * (*x + 180.0);
      n = -2;
    }
    if (n == 0) {
      *x = muDoubleScalarCos(*x);
    } else if (n == 1) {
      *x = -muDoubleScalarSin(*x);
    } else if (n == -1) {
      *x = muDoubleScalarSin(*x);
    } else {
      *x = -muDoubleScalarCos(*x);
    }
  }
}

/* End of code generation (cosd.c) */
