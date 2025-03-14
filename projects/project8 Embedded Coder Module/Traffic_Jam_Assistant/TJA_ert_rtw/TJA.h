/*
 * File: TJA.h
 *
 * Code generated for Simulink model 'TJA'.
 *
 * Model version                  : 1.12
 * Simulink Coder version         : 9.8 (R2022b) 13-May-2022
 * C/C++ source code generated on : Tue Mar 11 10:10:20 2025
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex-M
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. RAM efficiency
 * Validation result: Not run
 */

#ifndef RTW_HEADER_TJA_h_
#define RTW_HEADER_TJA_h_
#ifndef TJA_COMMON_INCLUDES_
#define TJA_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_continuous.h"
#endif                                 /* TJA_COMMON_INCLUDES_ */

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

/* Forward declaration for rtModel */
typedef struct tag_RTM RT_MODEL;

/* Parameters (default storage) */
struct P_ {
  uint8_T OFF_MODE;                    /* Variable: OFF_MODE
                                        * Referenced by: '<S1>/Constant1'
                                        */
  uint8_T ON_MODE;                     /* Variable: ON_MODE
                                        * Referenced by: '<S1>/Constant'
                                        */
  uint8_T STANDBY_MODE;                /* Variable: STANDBY_MODE
                                        * Referenced by: '<S1>/Constant2'
                                        */
};

/* Parameters (default storage) */
typedef struct P_ P;

/* Type definition for custom storage class: Struct */
typedef struct InputStruct_tag {
  boolean_T Input_Switch;              /* '<Root>/Input_Switch' */
  uint8_T Enable_Display;              /* '<Root>/Enable_Display' */
  uint8_T Input_Voltage;               /* '<Root>/Input_Voltage' */
} InputStruct_type;

typedef struct OutputStruct_tag {
  uint8_T Output_Display;              /* '<S1>/Switch' */
} OutputStruct_type;

/* Real-time Model Data Structure */
struct tag_RTM {
  const char_T * volatile errorStatus;
};

/* Block parameters (default storage) */
extern P rtP;

/* Model entry point functions */
extern void TJA_initialize(void);
extern void TJA_step(void);

/* Declaration for custom storage class: Struct */
extern InputStruct_type InputStruct;
extern OutputStruct_type OutputStruct;

/* Real-time Model object */
extern RT_MODEL *const rtM;

/* Exported data declaration */

/* Declaration for custom storage class: Global */
extern boolean_T INTERRUPT_1;          /* Referenced by: '<S1>/Constant3' */
extern boolean_T INTERRUPT_2;          /* Referenced by: '<S1>/Constant4' */
extern uint8_T NO_DISPLAY;             /* Referenced by: '<S1>/Constant5' */
extern uint8_T VOLTAGE_MAXIMUM_RANGE;  /* Referenced by: '<S3>/Constant' */
extern uint8_T VOLTAGE_MINIMUM_RANGE;  /* Referenced by: '<S4>/Constant' */

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
 * '<Root>' : 'TJA'
 * '<S1>'   : 'TJA/DisplayUnit'
 * '<S2>'   : 'TJA/Subsystem'
 * '<S3>'   : 'TJA/Subsystem/Compare To Constant1'
 * '<S4>'   : 'TJA/Subsystem/Compare To Constant2'
 */
#endif                                 /* RTW_HEADER_TJA_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
