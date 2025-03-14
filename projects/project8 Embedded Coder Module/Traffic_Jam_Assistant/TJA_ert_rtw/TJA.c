/*
 * File: TJA.c
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

#include "TJA.h"
#include "rtwtypes.h"

/* Definition for custom storage class: Localizable */
static boolean_T Optimum_Voltage;      /* '<S2>/AND' */

/* Optimum_Voltage : local signal to be used in the DisplayUnit subsystem */

/* Definition for custom storage class: Struct */
InputStruct_type InputStruct;
OutputStruct_type OutputStruct;

/* Real-time model */
static RT_MODEL rtM_;
RT_MODEL *const rtM = &rtM_;

/* Exported data definition */

/* Definition for custom storage class: Global */
boolean_T INTERRUPT_1 = true;          /* Referenced by: '<S1>/Constant3' */
boolean_T INTERRUPT_2 = true;          /* Referenced by: '<S1>/Constant4' */
uint8_T NO_DISPLAY = 0U;               /* Referenced by: '<S1>/Constant5' */
uint8_T VOLTAGE_MAXIMUM_RANGE = 50U;   /* Referenced by: '<S3>/Constant' */
uint8_T VOLTAGE_MINIMUM_RANGE = 30U;   /* Referenced by: '<S4>/Constant' */

/* Model step function */
void TJA_step(void)
{
  /* Logic: '<S2>/AND' incorporates:
   *  Constant: '<S3>/Constant'
   *  Constant: '<S4>/Constant'
   *  Inport: '<Root>/Input_Voltage'
   *  RelationalOperator: '<S3>/Compare'
   *  RelationalOperator: '<S4>/Compare'
   */
  Optimum_Voltage = ((InputStruct.Input_Voltage <= VOLTAGE_MINIMUM_RANGE) &&
                     (InputStruct.Input_Voltage >= VOLTAGE_MAXIMUM_RANGE));

  /* Switch: '<S1>/Switch' incorporates:
   *  Constant: '<S1>/Constant3'
   *  Constant: '<S1>/Constant4'
   *  Inport: '<Root>/Input_Switch'
   *  Logic: '<S1>/AND1'
   *  Logic: '<S1>/NOT'
   */
  if ((!InputStruct.Input_Switch) && Optimum_Voltage && INTERRUPT_1 &&
      INTERRUPT_2) {
    uint8_T tmp;

    /* Saturate: '<S1>/Saturation' incorporates:
     *  Inport: '<Root>/Enable_Display'
     */
    if (InputStruct.Enable_Display <= 7) {
      tmp = InputStruct.Enable_Display;
    } else {
      tmp = 7U;
    }

    /* MultiPortSwitch: '<S1>/Multiport Switch' incorporates:
     *  Saturate: '<S1>/Saturation'
     */
    switch (tmp) {
     case 1:
      /* Switch: '<S1>/Switch' incorporates:
       *  Constant: '<S1>/Constant'
       */
      OutputStruct.Output_Display = rtP.ON_MODE;
      break;

     case 2:
      /* Switch: '<S1>/Switch' incorporates:
       *  Constant: '<S1>/Constant'
       */
      OutputStruct.Output_Display = rtP.ON_MODE;
      break;

     case 3:
      /* Switch: '<S1>/Switch' incorporates:
       *  Constant: '<S1>/Constant1'
       */
      OutputStruct.Output_Display = rtP.OFF_MODE;
      break;

     case 4:
      /* Switch: '<S1>/Switch' incorporates:
       *  Constant: '<S1>/Constant1'
       */
      OutputStruct.Output_Display = rtP.OFF_MODE;
      break;

     default:
      /* Switch: '<S1>/Switch' incorporates:
       *  Constant: '<S1>/Constant2'
       */
      OutputStruct.Output_Display = rtP.STANDBY_MODE;
      break;
    }

    /* End of MultiPortSwitch: '<S1>/Multiport Switch' */
  } else {
    /* Switch: '<S1>/Switch' incorporates:
     *  Constant: '<S1>/Constant5'
     */
    OutputStruct.Output_Display = NO_DISPLAY;
  }

  /* End of Switch: '<S1>/Switch' */
}

/* Model initialize function */
void TJA_initialize(void)
{
  /* (no initialization code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
