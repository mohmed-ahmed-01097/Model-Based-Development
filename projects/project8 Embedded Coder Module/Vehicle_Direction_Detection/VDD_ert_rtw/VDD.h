/*
 * File: VDD.h
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

#ifndef RTW_HEADER_VDD_h_
#define RTW_HEADER_VDD_h_
#ifndef VDD_COMMON_INCLUDES_
#define VDD_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                 /* VDD_COMMON_INCLUDES_ */

/* Imported (extern) block signals */
extern int16_T SteeringWheel_YawDegreeInput;
                                     /* '<Root>/SteeringWheel_YawDegreeInput' */
extern boolean_T CameraInput_RoadSign; /* '<Root>/CameraInput_RoadSign' */

/* Model entry point functions */
extern void VDD_initialize(void);
extern void VDD_step(void);

/* Exported data declaration */

/* Const memory section */
/* Declaration for custom storage class: Const */
extern const int16_T LeftTurn_RoadSign;/* Referenced by: '<S2>/Constant1' */
extern const int16_T Left_Turn_AngularLimit;/* Referenced by:
                                             * '<S1>/Constant2'
                                             * '<S4>/Constant'
                                             */
extern const int16_T RightTurn_RoadSign;/* Referenced by: '<S2>/Constant' */
extern const int16_T Right_Turn_AngularLimit;/* Referenced by:
                                              * '<S1>/Constant'
                                              * '<S3>/Constant'
                                              */
extern const int16_T Straight_Drive_Steering_Angle;/* Referenced by: '<S5>/Constant' */
extern const int16_T Straight_RoadSign;/* Referenced by: '<S2>/Constant2' */

/* Declaration for custom storage class: ExportToFile */
extern boolean_T Vehicle_Direction_Indicator;/* '<S2>/AND2' */

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
 * '<Root>' : 'VDD'
 * '<S1>'   : 'VDD/Subsystem'
 * '<S2>'   : 'VDD/Subsystem1'
 * '<S3>'   : 'VDD/Subsystem/If Action Subsystem'
 * '<S4>'   : 'VDD/Subsystem/If Action Subsystem1'
 * '<S5>'   : 'VDD/Subsystem/If Action Subsystem2'
 */
#endif                                 /* RTW_HEADER_VDD_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
