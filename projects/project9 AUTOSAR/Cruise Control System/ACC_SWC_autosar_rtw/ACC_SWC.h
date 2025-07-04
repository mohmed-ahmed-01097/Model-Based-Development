/*
 * File: ACC_SWC.h
 *
 * Code generated for Simulink model 'ACC_SWC'.
 *
 * Model version                  : 1.3
 * Simulink Coder version         : 9.8 (R2022b) 13-May-2022
 * C/C++ source code generated on : Fri Jul  4 00:18:15 2025
 *
 * Target selection: autosar.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex-M
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_ACC_SWC_h_
#define RTW_HEADER_ACC_SWC_h_
#ifndef ACC_SWC_COMMON_INCLUDES_
#define ACC_SWC_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "Rte_ACC_SWC.h"
#endif                                 /* ACC_SWC_COMMON_INCLUDES_ */

#include <stddef.h>
#include "ACC_SWC_types.h"
#include "Rte_Type.h"

/* PublicStructure Variables for Internal Data, for system '<Root>' */
typedef struct {
  float32 Acceleration;                /* '<S2>/Chart' */
  float32 SafeDistance;                /* '<S2>/Chart' */
  sint32 sfEvent;                      /* '<S2>/Chart' */
  ACC_Mode Mode;                       /* '<S2>/Chart' */
  uint16 temporalCounter_i1;           /* '<S2>/Chart' */
  uint8 ACC_TimeGap;                   /* '<Root>/Data Store Memory' */
  uint8 ACC_DefaultDistance;           /* '<Root>/Data Store Memory1' */
  uint8 ACC_threshold;                 /* '<Root>/Data Store Memory2' */
  uint8 is_Fault_Detection_Sysytem;    /* '<S2>/Chart' */
  uint8 is_active_c3_ACC_SWC;          /* '<S2>/Chart' */
  uint8 is_active_Regular_System;      /* '<S2>/Chart' */
  uint8 is_active_CruiseControl_Activat;/* '<S2>/Chart' */
  uint8 is_active_Distance_Measurement;/* '<S2>/Chart' */
  uint8 is_active_CruiseControl_Operati;/* '<S2>/Chart' */
  uint8 is_active_Fault_Detection_Sysyt;/* '<S2>/Chart' */
  boolean Fault;                       /* '<S2>/Chart' */
  boolean ACC_Activation;              /* '<S2>/Chart' */
} ARID_DEF_ACC_SWC_T;

/* PublicStructure Variables for Internal Data */
extern ARID_DEF_ACC_SWC_T ACC_SWC_ARID_DEF;/* '<S2>/Chart' */

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'ACC_SWC'
 * '<S1>'   : 'ACC_SWC/ACC_Init'
 * '<S2>'   : 'ACC_SWC/ACC_Runnable'
 * '<S3>'   : 'ACC_SWC/ACC_Init/NvM_Read'
 * '<S4>'   : 'ACC_SWC/ACC_Runnable/Chart'
 */

/*-
 * Requirements for '<Root>': ACC_SWC

 */
#endif                                 /* RTW_HEADER_ACC_SWC_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
