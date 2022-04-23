/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * C_TDDAS_Beamscan2D_NearField_initialize.c
 *
 * Code generation for function 'C_TDDAS_Beamscan2D_NearField_initialize'
 *
 */

/* Include files */
#include "C_TDDAS_Beamscan2D_NearField_initialize.h"
#include "C_TDDAS_Beamscan2D_NearField_data.h"
#include "C_TDDAS_Beamscan2D_NearField_mexutil.h"
#include "_coder_C_TDDAS_Beamscan2D_NearField_mex.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void C_TDDAS_Beamscan2D_NearField_initialize(void)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  mex_InitInfAndNan();
  mexFunctionCreateRootTLS();
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, NULL);
  emlrtEnterRtStackR2012b(&st);
  emlrtInitThreadStackData(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (C_TDDAS_Beamscan2D_NearField_initialize.c) */
