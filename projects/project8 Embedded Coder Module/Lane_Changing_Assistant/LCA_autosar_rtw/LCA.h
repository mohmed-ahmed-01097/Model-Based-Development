/*
 * File: LCA.h
 *
 * Code generated for Simulink model 'LCA'.
 *
 * Model version                  : 1.72
 * Simulink Coder version         : 9.8 (R2022b) 13-May-2022
 * C/C++ source code generated on : Fri Mar 14 00:35:58 2025
 *
 * Target selection: autosar.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex-M
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. RAM efficiency
 *    3. ROM efficiency
 *    4. MISRA C:2012 guidelines
 * Validation result: Not run
 */

#ifndef RTW_HEADER_LCA_h_
#define RTW_HEADER_LCA_h_
#ifndef LCA_COMMON_INCLUDES_
#define LCA_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "Rte_LCA.h"
#endif                                 /* LCA_COMMON_INCLUDES_ */

#include "LCA_types.h"

/* PublicStructure Variables for Internal Data, for system '<Root>' */
typedef struct {
  uint8 TmpSignalConversionAtRPortIn_Hi;
  uint8 TmpSignalConversionAtRPortIn_In;
  uint8 TmpSignalConversionAtRPortIn_En;
  uint8 Display_Mode_1;                /* '<S2>/Switch' */
  uint8 Display_Mode_2;                /* '<S2>/Switch1' */
  uint8 Display_Mode_3;                /* '<S2>/Switch2' */
  uint8 Display_Mode_4;                /* '<S2>/Switch3' */
  uint8 is_active_c4_LCA;              /* '<S4>/Chart' */
  uint8 is_active_c2_LCA;              /* '<S3>/Chart' */
} ARID_DEF;

/* PublicStructure Variables for Internal Data */
extern ARID_DEF rtARID_DEF;

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
 * '<Root>' : 'LCA'
 * '<S1>'   : 'LCA/LCA_Runabble_10ms'
 * '<S2>'   : 'LCA/LCA_Runabble_10ms/Display_Mode'
 * '<S3>'   : 'LCA/LCA_Runabble_10ms/Highway_Display_Mode'
 * '<S4>'   : 'LCA/LCA_Runabble_10ms/Lane_Display_Mode'
 * '<S5>'   : 'LCA/LCA_Runabble_10ms/Highway_Display_Mode/Chart'
 * '<S6>'   : 'LCA/LCA_Runabble_10ms/Lane_Display_Mode/Chart'
 */

/*-
 * Requirements for '<Root>': LCA

 */
#endif                                 /* RTW_HEADER_LCA_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
