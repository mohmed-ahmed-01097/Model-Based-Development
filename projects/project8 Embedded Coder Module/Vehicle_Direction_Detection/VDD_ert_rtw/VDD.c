/*
 * File: VDD.c
 *
 * Code generated for Simulink model 'VDD'.
 *
 * Model version                  : 1.3
 * Simulink Coder version         : 9.8 (R2022b) 13-May-2022
 * C/C++ source code generated on : Tue Mar 11 14:26:51 2025
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex-M
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. RAM efficiency
 * Validation result: Not run
 */

#include "VDD.h"
#include "rtwtypes.h"

/* Definition for custom storage class: Localizable */
static int16_T Vehicle_Turn_Status;    /* '<S1>/Merge' */

/* Exported data definition */

/* Const memory section */
/* Definition for custom storage class: Const */
const int16_T LeftTurn_RoadSign = -120;/* Referenced by: '<S2>/Constant1' */
const int16_T Left_Turn_AngularLimit = -120;/* Referenced by:
                                             * '<S1>/Constant2'
                                             * '<S4>/Constant'
                                             */
const int16_T RightTurn_RoadSign = 30; /* Referenced by: '<S2>/Constant' */
const int16_T Right_Turn_AngularLimit = 30;/* Referenced by:
                                            * '<S1>/Constant'
                                            * '<S3>/Constant'
                                            */
const int16_T Straight_Drive_Steering_Angle = 0;/* Referenced by: '<S5>/Constant' */
const int16_T Straight_RoadSign = 0;   /* Referenced by: '<S2>/Constant2' */

/* Definition for custom storage class: ExportToFile */
boolean_T Vehicle_Direction_Indicator; /* '<S2>/AND2' */

/* Model step function */
void VDD_step(void)
{
  /* If: '<S1>/If' incorporates:
   *  Constant: '<S1>/Constant'
   *  Constant: '<S1>/Constant2'
   *  Inport: '<Root>/SteeringWheel_YawDegreeInput'
   */
  if (SteeringWheel_YawDegreeInput > Right_Turn_AngularLimit) {
    /* Outputs for IfAction SubSystem: '<S1>/If Action Subsystem' incorporates:
     *  ActionPort: '<S3>/Action Port'
     */
    /* Merge: '<S1>/Merge' incorporates:
     *  Constant: '<S3>/Constant'
     *  SignalConversion generated from: '<S3>/Out1'
     */
    Vehicle_Turn_Status = Right_Turn_AngularLimit;

    /* End of Outputs for SubSystem: '<S1>/If Action Subsystem' */
  } else if (SteeringWheel_YawDegreeInput < Left_Turn_AngularLimit) {
    /* Outputs for IfAction SubSystem: '<S1>/If Action Subsystem1' incorporates:
     *  ActionPort: '<S4>/Action Port'
     */
    /* Merge: '<S1>/Merge' incorporates:
     *  Constant: '<S4>/Constant'
     *  SignalConversion generated from: '<S4>/Out1'
     */
    Vehicle_Turn_Status = Left_Turn_AngularLimit;

    /* End of Outputs for SubSystem: '<S1>/If Action Subsystem1' */
  } else {
    /* Outputs for IfAction SubSystem: '<S1>/If Action Subsystem2' incorporates:
     *  ActionPort: '<S5>/Action Port'
     */
    /* Merge: '<S1>/Merge' incorporates:
     *  Constant: '<S5>/Constant'
     *  SignalConversion generated from: '<S5>/Out1'
     */
    Vehicle_Turn_Status = Straight_Drive_Steering_Angle;

    /* End of Outputs for SubSystem: '<S1>/If Action Subsystem2' */
  }

  /* End of If: '<S1>/If' */

  /* Logic: '<S2>/AND2' incorporates:
   *  Constant: '<S2>/Constant'
   *  Constant: '<S2>/Constant1'
   *  Constant: '<S2>/Constant2'
   *  Inport: '<Root>/CameraInput_RoadSign'
   *  Logic: '<S2>/AND1'
   *  RelationalOperator: '<S2>/Relational Operator'
   *  RelationalOperator: '<S2>/Relational Operator1'
   *  RelationalOperator: '<S2>/Relational Operator2'
   */
  Vehicle_Direction_Indicator = (((Vehicle_Turn_Status == RightTurn_RoadSign) ||
    (Vehicle_Turn_Status == LeftTurn_RoadSign) || (Vehicle_Turn_Status ==
    Straight_RoadSign)) && CameraInput_RoadSign);
}

/* Model initialize function */
void VDD_initialize(void)
{
  /* (no initialization code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
