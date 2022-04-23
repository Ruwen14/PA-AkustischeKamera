/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_C_TDDAS_Beamscan2D_FarField_api.c
 *
 * Code generation for function '_coder_C_TDDAS_Beamscan2D_FarField_api'
 *
 */

/* Include files */
#include "_coder_C_TDDAS_Beamscan2D_FarField_api.h"
#include "C_TDDAS_Beamscan2D_FarField.h"
#include "C_TDDAS_Beamscan2D_FarField_data.h"
#include "rt_nonfinite.h"

/* Function Declarations */
static real_T (*b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[25600];

static real_T (*c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *GridPos,
                                   const char_T *identifier))[48];

static real_T (*d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[48];

static real_T (*e_emlrt_marshallIn(const emlrtStack *sp,
                                   const mxArray *ezAngles,
                                   const char_T *identifier))[25];

static real_T (*emlrt_marshallIn(const emlrtStack *sp,
                                 const mxArray *MicSignals,
                                 const char_T *identifier))[25600];

static const mxArray *emlrt_marshallOut(const real_T u[800]);

static real_T (*f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[25];

static real_T (*g_emlrt_marshallIn(const emlrtStack *sp,
                                   const mxArray *azAngles,
                                   const char_T *identifier))[32];

static real_T (*h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[32];

static real_T (*i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[25600];

static real_T (*j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[48];

static real_T (*k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[25];

static real_T (*l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[32];

/* Function Definitions */
static real_T (*b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[25600]
{
  real_T(*y)[25600];
  y = i_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *GridPos,
                                   const char_T *identifier))[48]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[48];
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = d_emlrt_marshallIn(sp, emlrtAlias(GridPos), &thisId);
  emlrtDestroyArray(&GridPos);
  return y;
}

static real_T (*d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[48]
{
  real_T(*y)[48];
  y = j_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*e_emlrt_marshallIn(const emlrtStack *sp,
                                   const mxArray *ezAngles,
                                   const char_T *identifier))[25]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[25];
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = f_emlrt_marshallIn(sp, emlrtAlias(ezAngles), &thisId);
  emlrtDestroyArray(&ezAngles);
  return y;
}

static real_T (*emlrt_marshallIn(const emlrtStack *sp,
                                 const mxArray *MicSignals,
                                 const char_T *identifier))[25600]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[25600];
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(sp, emlrtAlias(MicSignals), &thisId);
  emlrtDestroyArray(&MicSignals);
  return y;
}

static const mxArray *emlrt_marshallOut(const real_T u[800])
{
  static const int32_T iv[2] = {0, 0};
  static const int32_T iv1[2] = {25, 32};
  const mxArray *m;
  const mxArray *y;
  y = NULL;
  m = emlrtCreateNumericArray(2, (const void *)&iv[0], mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m, &iv1[0], 2);
  emlrtAssign(&y, m);
  return y;
}

static real_T (*f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[25]
{
  real_T(*y)[25];
  y = k_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*g_emlrt_marshallIn(const emlrtStack *sp,
                                   const mxArray *azAngles,
                                   const char_T *identifier))[32]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[32];
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = h_emlrt_marshallIn(sp, emlrtAlias(azAngles), &thisId);
  emlrtDestroyArray(&azAngles);
  return y;
}

static real_T (*h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[32]
{
  real_T(*y)[32];
  y = l_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[25600]
{
  static const int32_T dims[2] = {1600, 16};
  real_T(*ret)[25600];
  emlrtCheckBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                          false, 2U, (void *)&dims[0]);
  ret = (real_T(*)[25600])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[48]
{
  static const int32_T dims[2] = {16, 3};
  real_T(*ret)[48];
  emlrtCheckBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                          false, 2U, (void *)&dims[0]);
  ret = (real_T(*)[48])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[25]
{
  static const int32_T dims[2] = {1, 25};
  real_T(*ret)[25];
  emlrtCheckBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                          false, 2U, (void *)&dims[0]);
  ret = (real_T(*)[25])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[32]
{
  static const int32_T dims[2] = {1, 32};
  real_T(*ret)[32];
  emlrtCheckBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                          false, 2U, (void *)&dims[0]);
  ret = (real_T(*)[32])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

void C_TDDAS_Beamscan2D_FarField_api(const mxArray *const prhs[4],
                                     const mxArray **plhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  real_T(*MicSignals)[25600];
  real_T(*SpatialResponseMatrix)[800];
  real_T(*GridPos)[48];
  real_T(*azAngles)[32];
  real_T(*ezAngles)[25];
  st.tls = emlrtRootTLSGlobal;
  SpatialResponseMatrix = (real_T(*)[800])mxMalloc(sizeof(real_T[800]));
  /* Marshall function inputs */
  MicSignals = emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "MicSignals");
  GridPos = c_emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "GridPos");
  ezAngles = e_emlrt_marshallIn(&st, emlrtAlias(prhs[2]), "ezAngles");
  azAngles = g_emlrt_marshallIn(&st, emlrtAlias(prhs[3]), "azAngles");
  /* Invoke the target function */
  C_TDDAS_Beamscan2D_FarField(&st, *MicSignals, *GridPos, *ezAngles, *azAngles,
                              *SpatialResponseMatrix);
  /* Marshall function outputs */
  *plhs = emlrt_marshallOut(*SpatialResponseMatrix);
}

/* End of code generation (_coder_C_TDDAS_Beamscan2D_FarField_api.c) */
