/*
 * File: ACC.c
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

#include "ACC.h"
#include "rtwtypes.h"
#include <math.h>

/* Named constants for Chart: '<S2>/Chart' */
#define IN_ACC_OFF_MODE                ((uint8_T)1U)
#define IN_ACC_ON_MODE                 ((uint8_T)2U)
#define IN_ACC_STANDBY_MODE            ((uint8_T)3U)
#define IN_Lead_Vehicle_Detected_Follow ((uint8_T)1U)
#define IN_Lead_Vehicle_Detected_Resume ((uint8_T)2U)
#define IN_Lead_Vehicle_Not_Detected   ((uint8_T)3U)
#define IN_Lead_Vehicle_Not_Detected_Re ((uint8_T)4U)
#define IN_Lead_Vehicle_Speed_Equal_Set ((uint8_T)5U)
#define IN_Lead_Vehicle_Speed_Less_Than ((uint8_T)6U)
#define IN_NO_ACTIVE_CHILD             ((uint8_T)0U)

/* Block signals and states (default storage) */
DW rtDW;

/* Real-time model */
static RT_MODEL rtM_;
RT_MODEL *const rtM = &rtM_;

/* Exported data definition */

/* Definition for custom storage class: ExportToFile */
uint8_T Out_Acceleration_Mode;         /* '<S2>/Chart' */
uint8_T Out_Drive_Vehicle_Speed;       /* '<S3>/Divide' */
uint8_T Out_Lead_Vehicle_Detected;     /* '<S1>/Data Type Conversion' */
uint8_T Out_Lead_Vehicle_Speed;        /* '<S4>/Divide' */
extern real_T rt_roundd_snf(real_T u);
real_T rt_roundd_snf(real_T u)
{
  real_T y;
  if (fabs(u) < 4.503599627370496E+15) {
    if (u >= 0.5) {
      y = floor(u + 0.5);
    } else if (u > -0.5) {
      y = u * 0.0;
    } else {
      y = ceil(u - 0.5);
    }
  } else {
    y = u;
  }

  return y;
}

/* Model step function */
void ACC_step(void)
{
  /* Product: '<S4>/Divide' incorporates:
   *  Constant: '<S4>/Constant'
   *  Inport: '<Root>/In_Camera_Input_Lead_Vehicle'
   *  Inport: '<Root>/In_Radar_Input_Lead_Vehicle'
   *  Sum: '<S4>/Sum'
   */
  Out_Lead_Vehicle_Speed = (uint8_T)rt_roundd_snf((real_T)(uint8_T)((uint32_T)
    In_Camera_Input_Lead_Vehicle + In_Radar_Input_Lead_Vehicle) / 2.0);

  /* Product: '<S3>/Divide' incorporates:
   *  Constant: '<S3>/Constant'
   *  Inport: '<Root>/In_Camera_Input_Drive_Vehicle'
   *  Inport: '<Root>/In_Radar_Input_Drive_Vehicle'
   *  Sum: '<S3>/Sum'
   */
  Out_Drive_Vehicle_Speed = (uint8_T)rt_roundd_snf((real_T)(uint8_T)((uint32_T)
    In_Camera_Input_Drive_Vehicle + In_Radar_Input_Drive_Vehicle) / 2.0);

  /* DataTypeConversion: '<S1>/Data Type Conversion' incorporates:
   *  RelationalOperator: '<S1>/Relational Operator'
   */
  Out_Lead_Vehicle_Detected = (uint8_T)(Out_Lead_Vehicle_Speed <=
    Out_Drive_Vehicle_Speed);

  /* Chart: '<S2>/Chart' incorporates:
   *  Inport: '<Root>/In_Cruise_Switch'
   *  Inport: '<Root>/In_Set_Gap'
   *  Inport: '<Root>/In_Set_Speed'
   *  Inport: '<Root>/In_Set_Switch'
   *  Inport: '<Root>/In_Time_Gap'
   */
  if (rtDW.is_active_c3_ACC == 0U) {
    rtDW.is_active_c3_ACC = 1U;
    rtDW.is_c3_ACC = IN_ACC_OFF_MODE;
    Out_Acceleration_Mode = 0U;
  } else {
    switch (rtDW.is_c3_ACC) {
     case IN_ACC_OFF_MODE:
      Out_Acceleration_Mode = 0U;
      if (In_Cruise_Switch) {
        rtDW.is_c3_ACC = IN_ACC_STANDBY_MODE;
        Out_Acceleration_Mode = 1U;
      }
      break;

     case IN_ACC_ON_MODE:
      {
        if (!In_Cruise_Switch) {
          rtDW.is_ACC_ON_MODE = IN_NO_ACTIVE_CHILD;
          rtDW.is_c3_ACC = IN_ACC_OFF_MODE;
          Out_Acceleration_Mode = 0U;
        } else {
          switch (rtDW.is_ACC_ON_MODE) {
           case IN_Lead_Vehicle_Detected_Follow:
            Out_Acceleration_Mode = 2U;
            if (Out_Lead_Vehicle_Detected == 0) {
              rtDW.is_ACC_ON_MODE = IN_Lead_Vehicle_Not_Detected;
              Out_Acceleration_Mode = 1U;
            } else if ((Out_Lead_Vehicle_Speed < In_Set_Speed) || (In_Time_Gap <
                        In_Set_Gap)) {
              rtDW.is_ACC_ON_MODE = IN_Lead_Vehicle_Speed_Less_Than;
              Out_Acceleration_Mode = 4U;
            }
            break;

           case IN_Lead_Vehicle_Detected_Resume:
            Out_Acceleration_Mode = 3U;
            if ((Out_Drive_Vehicle_Speed == In_Set_Speed) &&
                (Out_Lead_Vehicle_Speed >= In_Set_Speed) && (In_Time_Gap >=
                 In_Set_Gap)) {
              rtDW.is_ACC_ON_MODE = IN_Lead_Vehicle_Detected_Follow;
              Out_Acceleration_Mode = 2U;
            } else if (Out_Lead_Vehicle_Detected == 0) {
              rtDW.is_ACC_ON_MODE = IN_Lead_Vehicle_Not_Detected_Re;
              Out_Acceleration_Mode = 1U;
            } else if ((Out_Drive_Vehicle_Speed < In_Set_Speed) &&
                       (Out_Lead_Vehicle_Speed > Out_Drive_Vehicle_Speed) &&
                       (In_Time_Gap >= In_Set_Gap)) {
              rtDW.is_ACC_ON_MODE = IN_Lead_Vehicle_Speed_Equal_Set;
              Out_Acceleration_Mode = 5U;
            }
            break;

           case IN_Lead_Vehicle_Not_Detected:
            Out_Acceleration_Mode = 1U;
            if ((Out_Lead_Vehicle_Detected == 1) && (Out_Drive_Vehicle_Speed ==
                 In_Set_Speed) && (Out_Lead_Vehicle_Speed >= In_Set_Speed) &&
                (In_Time_Gap >= In_Set_Gap)) {
              rtDW.is_ACC_ON_MODE = IN_Lead_Vehicle_Detected_Follow;
              Out_Acceleration_Mode = 2U;
            } else if (((Out_Lead_Vehicle_Detected == 1) &&
                        (Out_Lead_Vehicle_Speed < In_Set_Speed)) || (In_Time_Gap
                        < In_Set_Gap)) {
              rtDW.is_ACC_ON_MODE = IN_Lead_Vehicle_Speed_Less_Than;
              Out_Acceleration_Mode = 4U;
            }
            break;

           case IN_Lead_Vehicle_Not_Detected_Re:
            Out_Acceleration_Mode = 1U;
            break;

           case IN_Lead_Vehicle_Speed_Equal_Set:
            Out_Acceleration_Mode = 5U;
            if ((Out_Lead_Vehicle_Detected == 0) || (Out_Drive_Vehicle_Speed <=
                 In_Set_Speed)) {
              rtDW.is_ACC_ON_MODE = IN_Lead_Vehicle_Not_Detected_Re;
              Out_Acceleration_Mode = 1U;
            } else if (((Out_Drive_Vehicle_Speed < In_Set_Speed) &&
                        (Out_Lead_Vehicle_Speed > Out_Drive_Vehicle_Speed)) ||
                       (In_Time_Gap >= In_Set_Gap)) {
              rtDW.is_ACC_ON_MODE = IN_Lead_Vehicle_Detected_Resume;
              Out_Acceleration_Mode = 3U;
            } else if (((Out_Lead_Vehicle_Speed < In_Set_Speed) &&
                        (Out_Lead_Vehicle_Speed < Out_Drive_Vehicle_Speed)) ||
                       ((int32_T)rt_roundd_snf(0.75 * (real_T)In_Set_Gap) ==
                        In_Time_Gap)) {
              rtDW.is_ACC_ON_MODE = IN_Lead_Vehicle_Speed_Less_Than;
              Out_Acceleration_Mode = 4U;
            }
            break;

           default:
            {
              /* case IN_Lead_Vehicle_Speed_Less_Than_Set_Speed: */
              Out_Acceleration_Mode = 4U;
              if ((Out_Lead_Vehicle_Detected == 0) && (Out_Drive_Vehicle_Speed ==
                   In_Set_Speed)) {
                rtDW.is_ACC_ON_MODE = IN_Lead_Vehicle_Not_Detected;
                Out_Acceleration_Mode = 1U;
              } else {
                int32_T tmp;
                uint8_T tmp_0;
                tmp = (int32_T)rt_roundd_snf(1.25 * (real_T)In_Set_Gap);
                if (tmp < 256) {
                  tmp_0 = (uint8_T)tmp;
                } else {
                  tmp_0 = MAX_uint8_T;
                }

                if (((uint8_T)(int32_T)rt_roundd_snf((real_T)
                      Out_Lead_Vehicle_Speed * 1.25) >= Out_Drive_Vehicle_Speed)
                    && ((int32_T)rt_roundd_snf((real_T)Out_Lead_Vehicle_Speed *
                      0.75) <= Out_Drive_Vehicle_Speed) &&
                    (Out_Drive_Vehicle_Speed < In_Set_Speed) && (In_Time_Gap <=
                     tmp_0) && (In_Time_Gap >= (int32_T)rt_roundd_snf(0.75 *
                      (real_T)In_Set_Gap))) {
                  rtDW.is_ACC_ON_MODE = IN_Lead_Vehicle_Speed_Equal_Set;
                  Out_Acceleration_Mode = 5U;
                }
              }
            }
            break;
          }
        }
      }
      break;

     default:
      /* case IN_ACC_STANDBY_MODE: */
      if (!In_Set_Switch) {
        rtDW.is_c3_ACC = IN_ACC_OFF_MODE;
        Out_Acceleration_Mode = 0U;
      } else {
        rtDW.is_c3_ACC = IN_ACC_ON_MODE;
        rtDW.is_ACC_ON_MODE = IN_Lead_Vehicle_Detected_Follow;
        Out_Acceleration_Mode = 2U;
      }
      break;
    }
  }

  /* End of Chart: '<S2>/Chart' */
}

/* Model initialize function */
void ACC_initialize(void)
{
  /* (no initialization code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
