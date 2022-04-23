/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * C_TDDAS_Beamscan2D_FarField_terminate.c
 *
 * Code generation for function 'C_TDDAS_Beamscan2D_FarField_terminate'
 *
 */

/* Include files */
#include "C_TDDAS_Beamscan2D_FarField_terminate.h"
#include "C_TDDAS_Beamscan2D_FarField_data.h"
#include "C_TDDAS_Beamscan2D_FarField_mexutil.h"
#include "_coder_C_TDDAS_Beamscan2D_FarField_mex.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void C_TDDAS_Beamscan2D_FarField_atexit(void)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

void C_TDDAS_Beamscan2D_FarField_terminate(void)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  st.tls = emlrtRootTLSGlobal;
  emlrtFreeThreadStackData(&st);
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (C_TDDAS_Beamscan2D_FarField_terminate.c) */
