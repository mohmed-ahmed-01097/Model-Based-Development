/*
 * File: ACC.h
 *
 * Code generated for Simulink model 'ACC'.
 *
 * Model version                  : 1.11
 * Simulink Coder version         : 9.8 (R2022b) 13-May-2022
 * C/C++ source code generated on : Wed Mar 12 02:33:29 2025
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex-M
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. RAM efficiency
 * Validation result: Not run
 */

#ifndef RTW_HEADER_ACC_h_
#define RTW_HEADER_ACC_h_
#ifndef ACC_COMMON_INCLUDES_
#define ACC_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                 /* ACC_COMMON_INCLUDES_ */

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

/* Forward declaration for rtModel */
typedef struct tag_RTM RT_MODEL;

/* Block signals and states (default storage) for system '<Root>' */
typedef struct {
  uint8_T is_c3_ACC;                   /* '<S2>/Chart' */
  uint8_T is_ACC_ON_MODE;              /* '<S2>/Chart' */
  uint8_T is_active_c3_ACC;            /* '<S2>/Chart' */
} DW;

/* Real-time Model Data Structure */
struct tag_RTM {
  const char_T * volatile errorStatus;
};

/* Imported (extern) block signals */
extern uint8_T In_Camera_Input_Lead_Vehicle;
                                     /* '<Root>/In_Camera_Input_Lead_Vehicle' */
extern uint8_T In_Radar_Input_Lead_Vehicle;
                                      /* '<Root>/In_Radar_Input_Lead_Vehicle' */
extern uint8_T In_Camera_Input_Drive_Vehicle;
                                    /* '<Root>/In_Camera_Input_Drive_Vehicle' */
extern uint8_T In_Radar_Input_Drive_Vehicle;
                                     /* '<Root>/In_Radar_Input_Drive_Vehicle' */
extern boolean_T In_Cruise_Switch;     /* '<Root>/In_Cruise_Switch' */
extern boolean_T In_Set_Switch;        /* '<Root>/In_Set_Switch' */
extern uint8_T In_Set_Speed;           /* '<Root>/In_Set_Speed' */
extern uint8_T In_Time_Gap;            /* '<Root>/In_Time_Gap' */
extern uint8_T In_Set_Gap;             /* '<Root>/In_Set_Gap' */

/* Block signals and states (default storage) */
extern DW rtDW;

/* Model entry point functions */
extern void ACC_initialize(void);
extern void ACC_step(void);

/* Real-time Model object */
extern RT_MODEL *const rtM;

/* Exported data declaration */

/* Declaration for custom storage class: ExportToFile */
extern uint8_T Out_Acceleration_Mode;  /* '<S2>/Chart' */
extern uint8_T Out_Drive_Vehicle_Speed;/* '<S3>/Divide' */
extern uint8_T Out_Lead_Vehicle_Detected;/* '<S1>/Data Type Conversion' */
extern uint8_T Out_Lead_Vehicle_Speed; /* '<S4>/Divide' */

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
 * '<Root>' : 'ACC'
 * '<S1>'   : 'ACC/Subsystem'
 * '<S2>'   : 'ACC/computeACCMode'
 * '<S3>'   : 'ACC/computeDriveVehicle'
 * '<S4>'   : 'ACC/computeLeadVehicleSpeed'
 * '<S5>'   : 'ACC/Subsystem/Compare To Constant'
 * '<S6>'   : 'ACC/computeACCMode/Chart'
 */
#endif                                 /* RTW_HEADER_ACC_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
