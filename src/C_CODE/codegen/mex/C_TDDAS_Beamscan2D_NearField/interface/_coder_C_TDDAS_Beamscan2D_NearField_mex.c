/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_C_TDDAS_Beamscan2D_NearField_mex.c
 *
 * Code generation for function '_coder_C_TDDAS_Beamscan2D_NearField_mex'
 *
 */

/* Include files */
#include "_coder_C_TDDAS_Beamscan2D_NearField_mex.h"
#include "C_TDDAS_Beamscan2D_NearField.h"
#include "C_TDDAS_Beamscan2D_NearField_data.h"
#include "C_TDDAS_Beamscan2D_NearField_initialize.h"
#include "C_TDDAS_Beamscan2D_NearField_terminate.h"
#include "_coder_C_TDDAS_Beamscan2D_NearField_api.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void C_TDDAS_Beamscan2D_NearField_mexFunction(int32_T nlhs, mxArray *plhs[1],
                                              int32_T nrhs,
                                              const mxArray *prhs[4])
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  const mxArray *outputs;
  st.tls = emlrtRootTLSGlobal;
  /* Check for proper number of arguments. */
  if (nrhs != 4) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 4, 4,
                        28, "C_TDDAS_Beamscan2D_NearField");
  }
  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 28,
                        "C_TDDAS_Beamscan2D_NearField");
  }
  /* Call the function. */
  c_C_TDDAS_Beamscan2D_NearField_(prhs, &outputs);
  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, &plhs[0], &outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  static jmp_buf emlrtJBEnviron;
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  mexAtExit(&C_TDDAS_Beamscan2D_NearField_atexit);
  emlrtLoadLibrary(
      (const char_T *)"C:\\ProgramData\\MATLAB\\SupportPackages\\R2021b\\3P."
                      "instrset\\mingw_w64.instrset\\bin\\libgomp-1.dll");
  /* Initialize the memory manager. */
  omp_init_lock(&emlrtLockGlobal);
  omp_init_nest_lock(&C_TDDAS_Beamscan2D_NearField_nestLockGlobal);
  /* Module initialization. */
  C_TDDAS_Beamscan2D_NearField_initialize();
  st.tls = emlrtRootTLSGlobal;
  emlrtSetJmpBuf(&st, &emlrtJBEnviron);
  if (setjmp(emlrtJBEnviron) == 0) {
    /* Dispatch the entry-point. */
    C_TDDAS_Beamscan2D_NearField_mexFunction(nlhs, plhs, nrhs, prhs);
    /* Module termination. */
    C_TDDAS_Beamscan2D_NearField_terminate();
    omp_destroy_lock(&emlrtLockGlobal);
    omp_destroy_nest_lock(&C_TDDAS_Beamscan2D_NearField_nestLockGlobal);
  } else {
    omp_destroy_lock(&emlrtLockGlobal);
    omp_destroy_nest_lock(&C_TDDAS_Beamscan2D_NearField_nestLockGlobal);
    emlrtReportParallelRunTimeError(&st);
  }
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLSR2021a(&emlrtRootTLSGlobal, &emlrtContextGlobal,
                           &emlrtLockerFunction, omp_get_num_procs(), NULL);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_C_TDDAS_Beamscan2D_NearField_mex.c) */
