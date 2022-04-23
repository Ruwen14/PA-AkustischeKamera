/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * C_TDDAS_Beamscan2D_NearField.c
 *
 * Code generation for function 'C_TDDAS_Beamscan2D_NearField'
 *
 */

/* Include files */
#include "C_TDDAS_Beamscan2D_NearField.h"
#include "C_TDDAS_Beamscan2D_NearField_data.h"
#include "C_TDDAS_Beamscan2D_NearField_mexutil.h"
#include "C_TDDAS_Beamscan2D_NearField_types.h"
#include "rt_nonfinite.h"
#include "sumMatrixIncludeNaN.h"
#include "mwmathutil.h"
#include <string.h>

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = {
    14,                             /* lineNo */
    "C_TDDAS_Beamscan2D_NearField", /* fcnName */
    "C:\\Users\\ru121koh\\Desktop\\PA-akustische-kamera\\src\\C_CODE\\C_TDDAS_"
    "Beamscan2D_NearField.m" /* pathName */
};

static emlrtDCInfo emlrtDCI = {
    16,                             /* lineNo */
    27,                             /* colNo */
    "C_TDDAS_Beamscan2D_NearField", /* fName */
    "C:\\Users\\ru121koh\\Desktop\\PA-akustische-kamera\\src\\C_CODE\\C_TDDAS_"
    "Beamscan2D_NearField.m", /* pName */
    1                         /* checkKind */
};

static emlrtBCInfo emlrtBCI = {
    1,                              /* iFirst */
    1600,                           /* iLast */
    16,                             /* lineNo */
    27,                             /* colNo */
    "Mat",                          /* aName */
    "C_TDDAS_Beamscan2D_NearField", /* fName */
    "C:\\Users\\ru121koh\\Desktop\\PA-akustische-kamera\\src\\C_CODE\\C_TDDAS_"
    "Beamscan2D_NearField.m", /* pName */
    0                         /* checkKind */
};

static emlrtDCInfo b_emlrtDCI = {
    18,                             /* lineNo */
    25,                             /* colNo */
    "C_TDDAS_Beamscan2D_NearField", /* fName */
    "C:\\Users\\ru121koh\\Desktop\\PA-akustische-kamera\\src\\C_CODE\\C_TDDAS_"
    "Beamscan2D_NearField.m", /* pName */
    1                         /* checkKind */
};

static emlrtBCInfo b_emlrtBCI = {
    1,                              /* iFirst */
    1600,                           /* iLast */
    18,                             /* lineNo */
    25,                             /* colNo */
    "Mat",                          /* aName */
    "C_TDDAS_Beamscan2D_NearField", /* fName */
    "C:\\Users\\ru121koh\\Desktop\\PA-akustische-kamera\\src\\C_CODE\\C_TDDAS_"
    "Beamscan2D_NearField.m", /* pName */
    0                         /* checkKind */
};

static emlrtRTEInfo emlrtRTEI = {
    31,          /* lineNo */
    48,          /* colNo */
    "circshift", /* fName */
    "C:\\Program "
    "Files\\MATLAB\\R2021b\\toolbox\\eml\\lib\\matlab\\elmat\\circshift.m" /* pName
                                                                            */
};

/* Function Declarations */
static int32_T div_nde_s32(int32_T numerator);

/* Function Definitions */
static int32_T div_nde_s32(int32_T numerator)
{
  return numerator / 1600;
}

void C_TDDAS_Beamscan2D_NearField(const emlrtStack *sp,
                                  const real_T MicSignals[25600],
                                  const real_T ezAngles[25],
                                  const real_T azAngles[32],
                                  const real_T SteeringMatrix[12800],
                                  real_T SpatialResponseMatrix[800])
{
  jmp_buf emlrtJBEnviron;
  jmp_buf *volatile emlrtJBStack;
  C_TDDAS_Beamscan2D_NearFieldTLS *c_C_TDDAS_Beamscan2D_NearFieldT;
  emlrtStack b_st;
  emlrtStack st;
  real_T a[1600];
  real_T a__1[800];
  real_T d;
  int32_T azAngleIdx;
  int32_T ezAngleIdx;
  int32_T i;
  int32_T k;
  int32_T xj;
  int32_T xoffset;
  boolean_T emlrtHadParallelError = false;
  boolean_T pok;
  (void)ezAngles;
  (void)azAngles;
  c_C_TDDAS_Beamscan2D_NearFieldT = emlrtGetThreadStackData();
  emlrtEnterParallelRegion((emlrtCTX)sp, omp_in_parallel());
  emlrtPushJmpBuf((emlrtCTX)sp, &emlrtJBStack);
#pragma omp parallel num_threads(emlrtAllocRegionTLSs(                         \
    sp->tls, omp_in_parallel(), omp_get_max_threads(),                         \
    omp_get_num_procs())) private(c_C_TDDAS_Beamscan2D_NearFieldT,             \
                                  emlrtJBEnviron, b_st, ezAngleIdx, i, a, d,   \
                                  pok, xoffset, a__1, xj, k)                   \
    firstprivate(st, emlrtHadParallelError)
  {
    if (setjmp(emlrtJBEnviron) == 0) {

      st.prev = sp;
      st.tls = emlrtAllocTLS((emlrtCTX)sp, omp_get_thread_num());
      st.site = NULL;
      emlrtSetJmpBuf(&st, &emlrtJBEnviron);
      b_st.prev = &st;
      b_st.tls = st.tls;
      c_C_TDDAS_Beamscan2D_NearFieldT = emlrtGetThreadStackData();
    } else {
      emlrtHadParallelError = true;
    }
#pragma omp for nowait
    for (azAngleIdx = 0; azAngleIdx < 32; azAngleIdx++) {
      if (emlrtHadParallelError)
        continue;
      if (setjmp(emlrtJBEnviron) == 0) {

        for (ezAngleIdx = 0; ezAngleIdx < 25; ezAngleIdx++) {
          memcpy(&c_C_TDDAS_Beamscan2D_NearFieldT->f0.Mat[0], &MicSignals[0],
                 25600U * sizeof(real_T));
          for (i = 0; i < 16; i++) {
            d = SteeringMatrix[(ezAngleIdx + 25 * azAngleIdx) + 800 * i];
            if (!(d == 0.0)) {
              b_st.site = &emlrtRSI;
              pok = true;
              if (((int32_T)d != d) || (d == -2.147483648E+9)) {
                pok = false;
              }
              if (!pok) {
                emlrtErrorWithMessageIdR2018a(
                    &b_st, &emlrtRTEI,
                    "Coder:toolbox:circshift_InvalidShiftType",
                    "Coder:toolbox:circshift_InvalidShiftType", 6, 4, 5,
                    "int32", 4, 5, "int32");
              }
              if (d < 0.0) {
                xoffset = (int32_T)-d;
                pok = false;
              } else {
                xoffset = (int32_T)d;
                pok = true;
              }
              if (xoffset > 1600) {
                xoffset -= div_nde_s32(xoffset) * 1600;
              }
              if (xoffset > 800) {
                xoffset = 1600 - xoffset;
                pok = !pok;
              }
              memcpy(&a[0], &c_C_TDDAS_Beamscan2D_NearFieldT->f0.Mat[i * 1600],
                     1600U * sizeof(real_T));
              memset(&a__1[0], 0, 800U * sizeof(real_T));
              if (xoffset > 0) {
                if (pok) {
                  if (0 <= xoffset - 1) {
                    memcpy(&a__1[0],
                           &c_C_TDDAS_Beamscan2D_NearFieldT->f0
                                .Mat[(i * 1600 - xoffset) + 1600],
                           xoffset * sizeof(real_T));
                  }
                  xj = xoffset + 1;
                  for (k = 1600; k >= xj; k--) {
                    a[k - 1] = a[(k - xoffset) - 1];
                  }
                  if (0 <= xoffset - 1) {
                    memcpy(&a[0], &a__1[0], xoffset * sizeof(real_T));
                  }
                } else {
                  if (0 <= xoffset - 1) {
                    memcpy(&a__1[0],
                           &c_C_TDDAS_Beamscan2D_NearFieldT->f0.Mat[i * 1600],
                           xoffset * sizeof(real_T));
                  }
                  xj = 1599 - xoffset;
                  for (k = 0; k <= xj; k++) {
                    a[k] = a[k + xoffset];
                  }
                  for (k = 0; k < xoffset; k++) {
                    a[(k - xoffset) + 1600] = a__1[k];
                  }
                }
              }
              memcpy(&c_C_TDDAS_Beamscan2D_NearFieldT->f0.Mat[i * 1600], &a[0],
                     1600U * sizeof(real_T));
              if (d > 0.0) {
                if (1.0 > d) {
                  xoffset = 0;
                } else {
                  if (d != (int32_T)muDoubleScalarFloor(d)) {
                    emlrtIntegerCheckR2012b(d, &emlrtDCI, &st);
                  }
                  if (((int32_T)d < 1) || ((int32_T)d > 1600)) {
                    emlrtDynamicBoundsCheckR2012b((int32_T)d, 1, 1600,
                                                  &emlrtBCI, &st);
                  }
                  xoffset = (int32_T)d;
                }
                if (0 <= xoffset - 1) {
                  memset(&c_C_TDDAS_Beamscan2D_NearFieldT->f0.Mat[i * 1600], 0,
                         xoffset * sizeof(real_T));
                }
              } else {
                if ((d + 1600.0) + 1.0 > 1600.0) {
                  xj = -1;
                  xoffset = -1;
                } else {
                  if ((d + 1600.0) + 1.0 !=
                      (int32_T)muDoubleScalarFloor((d + 1600.0) + 1.0)) {
                    emlrtIntegerCheckR2012b((d + 1600.0) + 1.0, &b_emlrtDCI,
                                            &st);
                  }
                  if (((int32_T)((d + 1600.0) + 1.0) < 1) ||
                      ((int32_T)((d + 1600.0) + 1.0) > 1600)) {
                    emlrtDynamicBoundsCheckR2012b((int32_T)((d + 1600.0) + 1.0),
                                                  1, 1600, &b_emlrtBCI, &st);
                  }
                  xj = (int32_T)((d + 1600.0) + 1.0) - 2;
                  xoffset = 1599;
                }
                xoffset -= xj;
                if (0 <= xoffset - 1) {
                  memset(&c_C_TDDAS_Beamscan2D_NearFieldT->f0
                              .Mat[(i * 1600 + xj) + 1],
                         0, ((xoffset + xj) - xj) * sizeof(real_T));
                }
              }
            }
            if (*emlrtBreakCheckR2012bFlagVar != 0) {
              emlrtBreakCheckR2012b(&st);
            }
          }
          memcpy(&a[0], &c_C_TDDAS_Beamscan2D_NearFieldT->f0.Mat[0],
                 1600U * sizeof(real_T));
          for (k = 0; k < 15; k++) {
            xoffset = (k + 1) * 1600;
            for (xj = 0; xj < 1600; xj++) {
              a[xj] += c_C_TDDAS_Beamscan2D_NearFieldT->f0.Mat[xoffset + xj];
            }
          }
          for (k = 0; k < 1600; k++) {
            d = muDoubleScalarAbs(a[k]);
            a[k] = d * d;
          }
          SpatialResponseMatrix[ezAngleIdx + 25 * azAngleIdx] = sumColumnB(a);
          if (*emlrtBreakCheckR2012bFlagVar != 0) {
            emlrtBreakCheckR2012b(&st);
          }
        }
        if (*emlrtBreakCheckR2012bFlagVar != 0) {
          emlrtBreakCheckR2012b(&st);
        }
      } else {
        emlrtHadParallelError = true;
      }
    }
  }
  emlrtPopJmpBuf((emlrtCTX)sp, &emlrtJBStack);
  emlrtExitParallelRegion((emlrtCTX)sp, omp_in_parallel());
}

emlrtCTX emlrtGetRootTLSGlobal(void)
{
  return emlrtRootTLSGlobal;
}

void emlrtLockerFunction(EmlrtLockeeFunction aLockee, emlrtConstCTX aTLS,
                         void *aData)
{
  omp_set_lock(&emlrtLockGlobal);
  emlrtCallLockeeFunction(aLockee, aTLS, aData);
  omp_unset_lock(&emlrtLockGlobal);
}

/* End of code generation (C_TDDAS_Beamscan2D_NearField.c) */
