/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * C_TDDAS_Beamscan2D_NearField_mexutil.c
 *
 * Code generation for function 'C_TDDAS_Beamscan2D_NearField_mexutil'
 *
 */

/* Include files */
#include "C_TDDAS_Beamscan2D_NearField_mexutil.h"
#include "C_TDDAS_Beamscan2D_NearField_types.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static C_TDDAS_Beamscan2D_NearFieldTLS *b_C_TDDAS_Beamscan2D_NearFieldT;
#pragma omp threadprivate(b_C_TDDAS_Beamscan2D_NearFieldT)

/* Function Definitions */
void emlrtFreeThreadStackData(const emlrtStack *sp)
{
  jmp_buf *volatile b_emlrtJBStack;
  jmp_buf *volatile emlrtJBStack;
  int32_T b;
  int32_T i;
  b = omp_get_max_threads();
  emlrtEnterParallelRegion((emlrtCTX)sp, omp_in_parallel());
  emlrtPushJmpBuf((emlrtCTX)sp, &emlrtJBStack);
  emlrtEnterParallelRegion((emlrtCTX)sp, omp_in_parallel());
  emlrtPushJmpBuf((emlrtCTX)sp, &b_emlrtJBStack);
#pragma omp parallel for schedule(static) num_threads(emlrtAllocRegionTLSs(    \
    sp->tls, omp_in_parallel(), omp_get_max_threads(), omp_get_num_procs()))

  for (i = 1; i <= b; i++) {
    free(b_C_TDDAS_Beamscan2D_NearFieldT);
  }
  emlrtPopJmpBuf((emlrtCTX)sp, &b_emlrtJBStack);
  emlrtExitParallelRegion((emlrtCTX)sp, omp_in_parallel());
  emlrtPopJmpBuf((emlrtCTX)sp, &emlrtJBStack);
  emlrtExitParallelRegion((emlrtCTX)sp, omp_in_parallel());
}

C_TDDAS_Beamscan2D_NearFieldTLS *emlrtGetThreadStackData(void)
{
  return b_C_TDDAS_Beamscan2D_NearFieldT;
}

void emlrtInitThreadStackData(const emlrtStack *sp)
{
  jmp_buf *volatile b_emlrtJBStack;
  jmp_buf *volatile emlrtJBStack;
  int32_T b;
  int32_T i;
  b = omp_get_max_threads();
  emlrtEnterParallelRegion((emlrtCTX)sp, omp_in_parallel());
  emlrtPushJmpBuf((emlrtCTX)sp, &emlrtJBStack);
  emlrtEnterParallelRegion((emlrtCTX)sp, omp_in_parallel());
  emlrtPushJmpBuf((emlrtCTX)sp, &b_emlrtJBStack);
#pragma omp parallel for schedule(static) num_threads(emlrtAllocRegionTLSs(    \
    sp->tls, omp_in_parallel(), omp_get_max_threads(), omp_get_num_procs()))

  for (i = 1; i <= b; i++) {
    b_C_TDDAS_Beamscan2D_NearFieldT = (C_TDDAS_Beamscan2D_NearFieldTLS *)malloc(
        (size_t)1U * sizeof(C_TDDAS_Beamscan2D_NearFieldTLS));
  }
  emlrtPopJmpBuf((emlrtCTX)sp, &b_emlrtJBStack);
  emlrtExitParallelRegion((emlrtCTX)sp, omp_in_parallel());
  emlrtPopJmpBuf((emlrtCTX)sp, &emlrtJBStack);
  emlrtExitParallelRegion((emlrtCTX)sp, omp_in_parallel());
}

/* End of code generation (C_TDDAS_Beamscan2D_NearField_mexutil.c) */
