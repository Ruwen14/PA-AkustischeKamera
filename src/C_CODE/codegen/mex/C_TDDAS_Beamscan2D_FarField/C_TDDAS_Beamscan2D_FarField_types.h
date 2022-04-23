/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * C_TDDAS_Beamscan2D_FarField_types.h
 *
 * Code generation for function 'C_TDDAS_Beamscan2D_FarField'
 *
 */

#pragma once

/* Include files */
#include "rtwtypes.h"
#include "emlrt.h"

/* Type Definitions */
#ifndef typedef_b_C_TDDAS_Beamscan2D_FarField
#define typedef_b_C_TDDAS_Beamscan2D_FarField
typedef struct {
  real_T Mat[25600];
} b_C_TDDAS_Beamscan2D_FarField;
#endif /* typedef_b_C_TDDAS_Beamscan2D_FarField */

#ifndef typedef_C_TDDAS_Beamscan2D_FarFieldTLS
#define typedef_C_TDDAS_Beamscan2D_FarFieldTLS
typedef struct {
  b_C_TDDAS_Beamscan2D_FarField f0;
} C_TDDAS_Beamscan2D_FarFieldTLS;
#endif /* typedef_C_TDDAS_Beamscan2D_FarFieldTLS */

/* End of code generation (C_TDDAS_Beamscan2D_FarField_types.h) */
