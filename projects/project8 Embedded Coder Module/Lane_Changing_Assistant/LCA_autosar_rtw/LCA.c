/*
 * File: LCA.c
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

#include "LCA.h"
#include "LCA_Runabble_10ms.h"

/* PublicStructure Variables for Internal Data */
ARID_DEF rtARID_DEF;

/* Model step function */
void LCA_Step(void)
{
  /* SignalConversion generated from: '<Root>/Bus Element In2' */
  rtARID_DEF.TmpSignalConversionAtRPortIn_Hi =
    Rte_DRead_RPortIn_Highway_Input_Signal();

  /* SignalConversion generated from: '<Root>/Bus Element In4' */
  rtARID_DEF.TmpSignalConversionAtRPortIn_In = Rte_DRead_RPortIn_Input_Switch();

  /* SignalConversion generated from: '<Root>/Bus Element In3' */
  rtARID_DEF.TmpSignalConversionAtRPortIn_En = Rte_DRead_RPortIn_Enable_Display();

  /* Outputs for Atomic SubSystem: '<Root>/LCA_Runabble_10ms' */

  /* Inport generated from: '<Root>/Bus Element In5' */
  LCA_Runabble_10ms(rtARID_DEF.TmpSignalConversionAtRPortIn_Hi,
                    rtARID_DEF.TmpSignalConversionAtRPortIn_En,
                    rtARID_DEF.TmpSignalConversionAtRPortIn_In,
                    Rte_DRead_RPortIn_Lane_Input_Signal());

  /* End of Outputs for SubSystem: '<Root>/LCA_Runabble_10ms' */

  /* Outport generated from: '<Root>/Bus Element Out2' incorporates:
   *  Switch: '<S2>/Switch'
   */
  (void)Rte_Write_PPortOut_Display_Mode_1(rtARID_DEF.Display_Mode_1);

  /* Outport generated from: '<Root>/Bus Element Out3' incorporates:
   *  Switch: '<S2>/Switch1'
   */
  (void)Rte_Write_PPortOut_Display_Mode_2(rtARID_DEF.Display_Mode_2);

  /* Outport generated from: '<Root>/Bus Element Out4' incorporates:
   *  Switch: '<S2>/Switch2'
   */
  (void)Rte_Write_PPortOut_Display_Mode_3(rtARID_DEF.Display_Mode_3);

  /* Outport generated from: '<Root>/Bus Element Out5' incorporates:
   *  Switch: '<S2>/Switch3'
   */
  (void)Rte_Write_PPortOut_Display_Mode_4(rtARID_DEF.Display_Mode_4);
}

/* Model initialize function */
void LCA_Init(void)
{
  /* (no initialization code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
