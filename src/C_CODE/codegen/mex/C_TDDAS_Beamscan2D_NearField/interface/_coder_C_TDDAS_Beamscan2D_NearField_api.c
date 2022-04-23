/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_C_TDDAS_Beamscan2D_NearField_api.c
 *
 * Code generation for function '_coder_C_TDDAS_Beamscan2D_NearField_api'
 *
 */

/* Include files */
#include "_coder_C_TDDAS_Beamscan2D_NearField_api.h"
#include "C_TDDAS_Beamscan2D_NearField.h"
#include "C_TDDAS_Beamscan2D_NearField_data.h"
#include "rt_nonfinite.h"

/* Function Declarations */
static real_T (*b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[25600];

static real_T (*c_emlrt_marshallIn(const emlrtStack *sp,
                                   const mxArray *ezAngles,
                                   const char_T *identifier))[49];

static real_T (*d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[49];

static real_T (*e_emlrt_marshallIn(const emlrtStack *sp,
                                   const mxArray *azAngles,
                                   const char_T *identifier))[63];

static real_T (*emlrt_marshallIn(const emlrtStack *sp,
                                 const mxArray *MicSignals,
                                 const char_T *identifier))[25600];

static const mxArray *emlrt_marshallOut(const real_T u[3087]);

static real_T (*f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[63];

static real_T (*g_emlrt_marshallIn(const emlrtStack *sp,
                                   const mxArray *SteeringMatrix,
                                   const char_T *identifier))[49392];

static real_T (*h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[49392];

static real_T (*i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[25600];

static real_T (*j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[49];

static real_T (*k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[63];

static real_T (*l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[49392];

/* Function Definitions */
static real_T (*b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[25600]
{
  real_T(*y)[25600];
  y = i_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*c_emlrt_marshallIn(const emlrtStack *sp,
                                   const mxArray *ezAngles,
                                   const char_T *identifier))[49]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[49];
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = d_emlrt_marshallIn(sp, emlrtAlias(ezAngles), &thisId);
  emlrtDestroyArray(&ezAngles);
  return y;
}

static real_T (*d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[49]
{
  real_T(*y)[49];
  y = j_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*e_emlrt_marshallIn(const emlrtStack *sp,
                                   const mxArray *azAngles,
                                   const char_T *identifier))[63]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[63];
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = f_emlrt_marshallIn(sp, emlrtAlias(azAngles), &thisId);
  emlrtDestroyArray(&azAngles);
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

static const mxArray *emlrt_marshallOut(const real_T u[3087])
{
  static const int32_T iv[2] = {0, 0};
  static const int32_T iv1[2] = {49, 63};
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
                                   const emlrtMsgIdentifier *parentId))[63]
{
  real_T(*y)[63];
  y = k_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*g_emlrt_marshallIn(const emlrtStack *sp,
                                   const mxArray *SteeringMatrix,
                                   const char_T *identifier))[49392]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[49392];
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = h_emlrt_marshallIn(sp, emlrtAlias(SteeringMatrix), &thisId);
  emlrtDestroyArray(&SteeringMatrix);
  return y;
}

static real_T (*h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[49392]
{
  real_T(*y)[49392];
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
                                   const emlrtMsgIdentifier *msgId))[49]
{
  static const int32_T dims[2] = {1, 49};
  real_T(*ret)[49];
  emlrtCheckBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                          false, 2U, (void *)&dims[0]);
  ret = (real_T(*)[49])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[63]
{
  static const int32_T dims[2] = {1, 63};
  real_T(*ret)[63];
  emlrtCheckBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                          false, 2U, (void *)&dims[0]);
  ret = (real_T(*)[63])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[49392]
{
  static const int32_T dims[3] = {49, 63, 16};
  real_T(*ret)[49392];
  emlrtCheckBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                          false, 3U, (void *)&dims[0]);
  ret = (real_T(*)[49392])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

void c_C_TDDAS_Beamscan2D_NearField_(const mxArray *const prhs[4],
                                     const mxArray **plhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  real_T(*SteeringMatrix)[49392];
  real_T(*MicSignals)[25600];
  real_T(*SpatialResponseMatrix)[3087];
  real_T(*azAngles)[63];
  real_T(*ezAngles)[49];
  st.tls = emlrtRootTLSGlobal;
  SpatialResponseMatrix = (real_T(*)[3087])mxMalloc(sizeof(real_T[3087]));
  /* Marshall function inputs */
  MicSignals = emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "MicSignals");
  ezAngles = c_emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "ezAngles");
  azAngles = e_emlrt_marshallIn(&st, emlrtAlias(prhs[2]), "azAngles");
  SteeringMatrix =
      g_emlrt_marshallIn(&st, emlrtAlias(prhs[3]), "SteeringMatrix");
  /* Invoke the target function */
  C_TDDAS_Beamscan2D_NearField(&st, *MicSignals, *ezAngles, *azAngles,
                               *SteeringMatrix, *SpatialResponseMatrix);
  /* Marshall function outputs */
  *plhs = emlrt_marshallOut(*SpatialResponseMatrix);
}

/* End of code generation (_coder_C_TDDAS_Beamscan2D_NearField_api.c) */
