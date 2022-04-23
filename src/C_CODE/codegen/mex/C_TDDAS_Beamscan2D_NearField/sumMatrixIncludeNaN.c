/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * sumMatrixIncludeNaN.c
 *
 * Code generation for function 'sumMatrixIncludeNaN'
 *
 */

/* Include files */
#include "sumMatrixIncludeNaN.h"
#include "rt_nonfinite.h"

/* Function Definitions */
real_T sumColumnB(const real_T x[1600])
{
  real_T b_y;
  real_T y;
  int32_T k;
  y = x[0];
  for (k = 0; k < 1023; k++) {
    y += x[k + 1];
  }
  b_y = x[1024];
  for (k = 0; k < 575; k++) {
    b_y += x[k + 1025];
  }
  y += b_y;
  return y;
}

/* End of code generation (sumMatrixIncludeNaN.c) */
