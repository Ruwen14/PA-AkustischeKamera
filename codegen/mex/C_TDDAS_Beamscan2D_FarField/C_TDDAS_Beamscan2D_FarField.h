/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * C_TDDAS_Beamscan2D_FarField.h
 *
 * Code generation for function 'C_TDDAS_Beamscan2D_FarField'
 *
 */

#pragma once

/* Include files */
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include "omp.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
void C_TDDAS_Beamscan2D_FarField(const emlrtStack *sp,
                                 const real_T MicSignals[25600],
                                 const real_T GridPos[48],
                                 const real_T ezAngles[25],
                                 const real_T azAngles[32],
                                 real_T SpatialResponseMatrix[800]);

emlrtCTX emlrtGetRootTLSGlobal(void);

void emlrtLockerFunction(EmlrtLockeeFunction aLockee, emlrtConstCTX aTLS,
                         void *aData);

/* End of code generation (C_TDDAS_Beamscan2D_FarField.h) */
