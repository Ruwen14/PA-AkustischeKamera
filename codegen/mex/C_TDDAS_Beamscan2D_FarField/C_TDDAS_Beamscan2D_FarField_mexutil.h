/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * C_TDDAS_Beamscan2D_FarField_mexutil.h
 *
 * Code generation for function 'C_TDDAS_Beamscan2D_FarField_mexutil'
 *
 */

#pragma once

/* Include files */
#include "C_TDDAS_Beamscan2D_FarField_types.h"
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include "omp.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
void emlrtFreeThreadStackData(const emlrtStack *sp);

C_TDDAS_Beamscan2D_FarFieldTLS *emlrtGetThreadStackData(void);

void emlrtInitThreadStackData(const emlrtStack *sp);

/* End of code generation (C_TDDAS_Beamscan2D_FarField_mexutil.h) */
