/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * C_TDDAS_Beamscan2D_FarField.c
 *
 * Code generation for function 'C_TDDAS_Beamscan2D_FarField'
 *
 */

/* Include files */
#include "C_TDDAS_Beamscan2D_FarField.h"
#include "C_TDDAS_Beamscan2D_FarField_data.h"
#include "C_TDDAS_Beamscan2D_FarField_mexutil.h"
#include "C_TDDAS_Beamscan2D_FarField_types.h"
#include "cosd.h"
#include "rt_nonfinite.h"
#include "sind.h"
#include "sumMatrixIncludeNaN.h"
#include "mwmathutil.h"
#include <string.h>

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = {
    20,                            /* lineNo */
    "C_TDDAS_Beamscan2D_FarField", /* fcnName */
    "C:\\Users\\ru121koh\\Desktop\\PA-akustische-kamera\\src\\C_CODE\\C_TDDAS_"
    "Beamscan2D_FarField.m" /* pathName */
};

static emlrtDCInfo emlrtDCI = {
    22,                            /* lineNo */
    27,                            /* colNo */
    "C_TDDAS_Beamscan2D_FarField", /* fName */
    "C:\\Users\\ru121koh\\Desktop\\PA-akustische-kamera\\src\\C_CODE\\C_TDDAS_"
    "Beamscan2D_FarField.m", /* pName */
    1                        /* checkKind */
};

static emlrtBCInfo emlrtBCI = {
    1,                             /* iFirst */
    1600,                          /* iLast */
    22,                            /* lineNo */
    27,                            /* colNo */
    "Mat",                         /* aName */
    "C_TDDAS_Beamscan2D_FarField", /* fName */
    "C:\\Users\\ru121koh\\Desktop\\PA-akustische-kamera\\src\\C_CODE\\C_TDDAS_"
    "Beamscan2D_FarField.m", /* pName */
    0                        /* checkKind */
};

static emlrtDCInfo b_emlrtDCI = {
    24,                            /* lineNo */
    25,                            /* colNo */
    "C_TDDAS_Beamscan2D_FarField", /* fName */
    "C:\\Users\\ru121koh\\Desktop\\PA-akustische-kamera\\src\\C_CODE\\C_TDDAS_"
    "Beamscan2D_FarField.m", /* pName */
    1                        /* checkKind */
};

static emlrtBCInfo b_emlrtBCI = {
    1,                             /* iFirst */
    1600,                          /* iLast */
    24,                            /* lineNo */
    25,                            /* colNo */
    "Mat",                         /* aName */
    "C_TDDAS_Beamscan2D_FarField", /* fName */
    "C:\\Users\\ru121koh\\Desktop\\PA-akustische-kamera\\src\\C_CODE\\C_TDDAS_"
    "Beamscan2D_FarField.m", /* pName */
    0                        /* checkKind */
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

void C_TDDAS_Beamscan2D_FarField(const emlrtStack *sp,
                                 const real_T MicSignals[25600],
                                 const real_T GridPos[48],
                                 const real_T ezAngles[25],
                                 const real_T azAngles[32],
                                 real_T SpatialResponseMatrix[800])
{
  jmp_buf emlrtJBEnviron;
  jmp_buf *volatile emlrtJBStack;
  C_TDDAS_Beamscan2D_FarFieldTLS *d_C_TDDAS_Beamscan2D_FarFieldTL;
  emlrtStack b_st;
  emlrtStack st;
  real_T a[1600];
  real_T a__1[800];
  real_T tau[16];
  real_T d;
  real_T d1;
  real_T d2;
  real_T d3;
  real_T d4;
  real_T d5;
  int32_T azAngleIdx;
  int32_T b_i;
  int32_T ezAngleIdx;
  int32_T i;
  int32_T k;
  int32_T ns;
  int32_T xoffset;
  boolean_T emlrtHadParallelError = false;
  boolean_T pok;
  d_C_TDDAS_Beamscan2D_FarFieldTL = emlrtGetThreadStackData();
  emlrtEnterParallelRegion((emlrtCTX)sp, omp_in_parallel());
  emlrtPushJmpBuf((emlrtCTX)sp, &emlrtJBStack);
#pragma omp parallel num_threads(emlrtAllocRegionTLSs(                         \
    sp->tls, omp_in_parallel(), omp_get_max_threads(),                         \
    omp_get_num_procs())) private(d_C_TDDAS_Beamscan2D_FarFieldTL, tau,        \
                                  emlrtJBEnviron, b_st, d, ezAngleIdx, d1, d2, \
                                  d3, d4, d5, k, i, a, pok, xoffset, ns, a__1, \
                                  b_i) firstprivate(st, emlrtHadParallelError)
  {
    if (setjmp(emlrtJBEnviron) == 0) {

      st.prev = sp;
      st.tls = emlrtAllocTLS((emlrtCTX)sp, omp_get_thread_num());
      st.site = NULL;
      emlrtSetJmpBuf(&st, &emlrtJBEnviron);
      b_st.prev = &st;
      b_st.tls = st.tls;
      d_C_TDDAS_Beamscan2D_FarFieldTL = emlrtGetThreadStackData();
    } else {
      emlrtHadParallelError = true;
    }
#pragma omp for nowait
    for (azAngleIdx = 0; azAngleIdx < 32; azAngleIdx++) {
      if (emlrtHadParallelError)
        continue;
      if (setjmp(emlrtJBEnviron) == 0) {

        d = azAngles[azAngleIdx];
        for (ezAngleIdx = 0; ezAngleIdx < 25; ezAngleIdx++) {
          d1 = ezAngles[ezAngleIdx];
          d2 = d1;
          b_cosd(&d2);
          d3 = d;
          b_cosd(&d3);
          d4 = d1;
          b_cosd(&d4);
          d5 = d;
          b_sind(&d5);
          b_sind(&d1);
          d2 = -d2 * d3;
          d3 = -d4 * d5;
          for (k = 0; k < 16; k++) {
            tau[k] = muDoubleScalarRound(
                -(((GridPos[k] * d2 + GridPos[k + 16] * d3) +
                   GridPos[k + 32] * -d1) /
                  340.0) *
                48000.0);
          }
          memcpy(&d_C_TDDAS_Beamscan2D_FarFieldTL->f0.Mat[0], &MicSignals[0],
                 25600U * sizeof(real_T));
          for (i = 0; i < 16; i++) {
            d1 = tau[i];
            if (!(d1 == 0.0)) {
              b_st.site = &emlrtRSI;
              pok = true;
              xoffset = (int32_T)d1;
              if (((int32_T)d1 != d1) || ((int32_T)d1 == MIN_int32_T)) {
                pok = false;
              }
              if (!pok) {
                emlrtErrorWithMessageIdR2018a(
                    &b_st, &emlrtRTEI,
                    "Coder:toolbox:circshift_InvalidShiftType",
                    "Coder:toolbox:circshift_InvalidShiftType", 6, 4, 5,
                    "int32", 4, 5, "int32");
              }
              if (d1 < 0.0) {
                ns = (int32_T)-d1;
                pok = false;
              } else {
                ns = (int32_T)d1;
                pok = true;
              }
              if (ns > 1600) {
                ns -= div_nde_s32(ns) * 1600;
              }
              if (ns > 800) {
                ns = 1600 - ns;
                pok = !pok;
              }
              memcpy(&a[0], &d_C_TDDAS_Beamscan2D_FarFieldTL->f0.Mat[i * 1600],
                     1600U * sizeof(real_T));
              memset(&a__1[0], 0, 800U * sizeof(real_T));
              if (ns > 0) {
                if (pok) {
                  if (0 <= ns - 1) {
                    memcpy(&a__1[0],
                           &d_C_TDDAS_Beamscan2D_FarFieldTL->f0
                                .Mat[(i * 1600 - ns) + 1600],
                           ns * sizeof(real_T));
                  }
                  b_i = ns + 1;
                  for (k = 1600; k >= b_i; k--) {
                    a[k - 1] = a[(k - ns) - 1];
                  }
                  if (0 <= ns - 1) {
                    memcpy(&a[0], &a__1[0], ns * sizeof(real_T));
                  }
                } else {
                  if (0 <= ns - 1) {
                    memcpy(&a__1[0],
                           &d_C_TDDAS_Beamscan2D_FarFieldTL->f0.Mat[i * 1600],
                           ns * sizeof(real_T));
                  }
                  b_i = 1599 - ns;
                  for (k = 0; k <= b_i; k++) {
                    a[k] = a[k + ns];
                  }
                  for (k = 0; k < ns; k++) {
                    a[(k - ns) + 1600] = a__1[k];
                  }
                }
              }
              memcpy(&d_C_TDDAS_Beamscan2D_FarFieldTL->f0.Mat[i * 1600], &a[0],
                     1600U * sizeof(real_T));
              d2 = tau[i];
              if (d2 > 0.0) {
                if (d2 != (int32_T)d2) {
                  emlrtIntegerCheckR2012b(d2, &emlrtDCI, &st);
                }
                if (((int32_T)d1 < 1) || ((int32_T)d1 > 1600)) {
                  emlrtDynamicBoundsCheckR2012b((int32_T)d2, 1, 1600, &emlrtBCI,
                                                &st);
                }
                if (0 <= xoffset - 1) {
                  memset(&d_C_TDDAS_Beamscan2D_FarFieldTL->f0.Mat[i * 1600], 0,
                         xoffset * sizeof(real_T));
                }
              } else {
                if ((d2 + 1600.0) + 1.0 > 1600.0) {
                  b_i = -1;
                  xoffset = -1;
                } else {
                  if ((d2 + 1600.0) + 1.0 != (int32_T)((d2 + 1600.0) + 1.0)) {
                    emlrtIntegerCheckR2012b((d2 + 1600.0) + 1.0, &b_emlrtDCI,
                                            &st);
                  }
                  if (((int32_T)((d2 + 1600.0) + 1.0) < 1) ||
                      ((int32_T)((d2 + 1600.0) + 1.0) > 1600)) {
                    emlrtDynamicBoundsCheckR2012b(
                        (int32_T)((d2 + 1600.0) + 1.0), 1, 1600, &b_emlrtBCI,
                        &st);
                  }
                  b_i = (int32_T)((d2 + 1600.0) + 1.0) - 2;
                  xoffset = 1599;
                }
                xoffset -= b_i;
                if (0 <= xoffset - 1) {
                  memset(&d_C_TDDAS_Beamscan2D_FarFieldTL->f0
                              .Mat[(i * 1600 + b_i) + 1],
                         0, ((xoffset + b_i) - b_i) * sizeof(real_T));
                }
              }
            }
            if (*emlrtBreakCheckR2012bFlagVar != 0) {
              emlrtBreakCheckR2012b(&st);
            }
          }
          memcpy(&a[0], &d_C_TDDAS_Beamscan2D_FarFieldTL->f0.Mat[0],
                 1600U * sizeof(real_T));
          for (k = 0; k < 15; k++) {
            xoffset = (k + 1) * 1600;
            for (ns = 0; ns < 1600; ns++) {
              a[ns] += d_C_TDDAS_Beamscan2D_FarFieldTL->f0.Mat[xoffset + ns];
            }
          }
          for (k = 0; k < 1600; k++) {
            d1 = muDoubleScalarAbs(a[k]);
            a[k] = d1 * d1;
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

/* End of code generation (C_TDDAS_Beamscan2D_FarField.c) */
