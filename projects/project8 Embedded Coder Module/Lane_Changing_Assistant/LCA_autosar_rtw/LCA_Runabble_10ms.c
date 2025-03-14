/*
 * File: LCA_Runabble_10ms.c
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

#include "rtwtypes.h"
#include "LCA_Runabble_10ms.h"
#include "LCA.h"

/* Exported data definition */

/* Definition for custom storage class: Localizable */
static uint8 Highway_Display_Mode_1;   /* '<S3>/Chart' */
static uint8 Highway_Display_Mode_2;   /* '<S3>/Chart' */
static uint8 Highway_Display_Mode_3;   /* '<S3>/Chart' */
static uint8 Highway_Display_Mode_4;   /* '<S3>/Chart' */
static uint8 Lane_Display_Mode_1;      /* '<S4>/Chart' */
static uint8 Lane_Display_Mode_2;      /* '<S4>/Chart' */
static uint8 Lane_Display_Mode_3;      /* '<S4>/Chart' */
static uint8 Lane_Display_Mode_4;      /* '<S4>/Chart' */

/* Forward declaration for local functions */
static void TT_Logic(uint8 rtu_Highway_Input_Signal, uint8 rtu_Enable_Display,
                     uint8 rtu_Input_Switch);
static void TT_Logic_f(uint8 rtu_Enable_Display, uint8 rtu_Input_Switch, uint8
  rtu_Lane_Input_Signal);

/* Function for Chart: '<S3>/Chart' */
static void TT_Logic(uint8 rtu_Highway_Input_Signal, uint8 rtu_Enable_Display,
                     uint8 rtu_Input_Switch)
{
  /* Chart: '<S3>/Chart' */
  if ((boolean)((sint32)(((rtu_Highway_Input_Signal == 1ULL) ? ((sint32)1) :
                          ((sint32)0)) & ((rtu_Input_Switch != 0ULL) ? ((sint32)
          1) : ((sint32)0))))) {
    if (rtu_Enable_Display != 0ULL) {
      Highway_Display_Mode_1 = 213U;
      Highway_Display_Mode_2 = 183U;
      Highway_Display_Mode_3 = 9U;
      Highway_Display_Mode_4 = 94U;
    } else {
      Highway_Display_Mode_1 = 232U;
      Highway_Display_Mode_2 = 183U;
      Highway_Display_Mode_3 = 41U;
      Highway_Display_Mode_4 = 94U;
    }
  }

  /* End of Chart: '<S3>/Chart' */
}

/* Function for Chart: '<S4>/Chart' */
static void TT_Logic_f(uint8 rtu_Enable_Display, uint8 rtu_Input_Switch, uint8
  rtu_Lane_Input_Signal)
{
  /* Chart: '<S4>/Chart' */
  if ((boolean)((sint32)(((rtu_Lane_Input_Signal == 6ULL) ? ((sint32)1) :
                          ((sint32)0)) & ((rtu_Input_Switch != 0ULL) ? ((sint32)
          1) : ((sint32)0))))) {
    if (rtu_Enable_Display != 0ULL) {
      /*    */
      Lane_Display_Mode_1 = 127U;
      Lane_Display_Mode_2 = 248U;
      Lane_Display_Mode_3 = 186U;
      Lane_Display_Mode_4 = 84U;
    } else {
      /*    */
      Lane_Display_Mode_1 = 132U;
      Lane_Display_Mode_2 = 185U;
      Lane_Display_Mode_3 = 54U;
      Lane_Display_Mode_4 = 67U;
    }
  } else {
    /*    */
  }

  /* End of Chart: '<S4>/Chart' */
}

/* Output and update for atomic system: '<Root>/LCA_Runabble_10ms' */
void LCA_Runabble_10ms(uint8 rtu_Highway_Input_Signal, uint8 rtu_Enable_Display,
  uint8 rtu_Input_Switch, uint8 rtu_Lane_Input_Signal)
{
  /* Chart: '<S3>/Chart' */
  if ((uint32)rtARID_DEF.is_active_c2_LCA == 0U) {
    rtARID_DEF.is_active_c2_LCA = 1U;
    TT_Logic(rtu_Highway_Input_Signal, rtu_Enable_Display, rtu_Input_Switch);
  } else {
    TT_Logic(rtu_Highway_Input_Signal, rtu_Enable_Display, rtu_Input_Switch);
  }

  /* End of Chart: '<S3>/Chart' */

  /* Chart: '<S4>/Chart' */
  if ((uint32)rtARID_DEF.is_active_c4_LCA == 0U) {
    rtARID_DEF.is_active_c4_LCA = 1U;
    TT_Logic_f(rtu_Enable_Display, rtu_Input_Switch, rtu_Lane_Input_Signal);
  } else {
    TT_Logic_f(rtu_Enable_Display, rtu_Input_Switch, rtu_Lane_Input_Signal);
  }

  /* End of Chart: '<S4>/Chart' */

  /* Switch: '<S2>/Switch' incorporates:
   *  DataTypeConversion: '<S2>/Cast To Boolean'
   *  Switch: '<S2>/Switch1'
   *  Switch: '<S2>/Switch2'
   *  Switch: '<S2>/Switch3'
   */
  if (rtu_Highway_Input_Signal != 0ULL) {
    /* Switch: '<S2>/Switch' */
    rtARID_DEF.Display_Mode_1 = Highway_Display_Mode_1;

    /* Switch: '<S2>/Switch1' */
    rtARID_DEF.Display_Mode_2 = Highway_Display_Mode_2;

    /* Switch: '<S2>/Switch2' */
    rtARID_DEF.Display_Mode_3 = Highway_Display_Mode_3;

    /* Switch: '<S2>/Switch3' */
    rtARID_DEF.Display_Mode_4 = Highway_Display_Mode_4;
  } else {
    /* Switch: '<S2>/Switch' */
    rtARID_DEF.Display_Mode_1 = Lane_Display_Mode_1;

    /* Switch: '<S2>/Switch1' */
    rtARID_DEF.Display_Mode_2 = Lane_Display_Mode_2;

    /* Switch: '<S2>/Switch2' */
    rtARID_DEF.Display_Mode_3 = Lane_Display_Mode_3;

    /* Switch: '<S2>/Switch3' */
    rtARID_DEF.Display_Mode_4 = Lane_Display_Mode_4;
  }

  /* End of Switch: '<S2>/Switch' */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
