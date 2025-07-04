/*
 * File: ACC_SWC.c
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

#include "ACC_SWC.h"
#include "rtwtypes.h"
#include <math.h>
#include "Rte_Type.h"

/* Named constants for Chart: '<S2>/Chart' */
#define ACC_SWC_CALL_EVENT             (-1)
#define ACC_SWC_IN_Fault               ((uint8)1U)
#define ACC_SWC_IN_Init                ((uint8)2U)
#define ACC_SWC_IN_Wait                ((uint8)3U)
#define ACC_SWC_event_ClearEvent       (0)
#define ACC_SWC_event_FaultEvent       (1)

/* PublicStructure Variables for Internal Data */
ARID_DEF_ACC_SWC_T ACC_SWC_ARID_DEF;   /* '<S2>/Chart' */

/* Forward declaration for local functions */
static void ACC_SWC_Fault_Detection_Sysytem(void);

/* Function for Chart: '<S2>/Chart' */
static void ACC_SWC_Fault_Detection_Sysytem(void)
{
  switch (ACC_SWC_ARID_DEF.is_Fault_Detection_Sysytem) {
   case ACC_SWC_IN_Fault:
    ACC_SWC_ARID_DEF.Fault = true;
    if (ACC_SWC_ARID_DEF.sfEvent == ACC_SWC_event_ClearEvent) {
      ACC_SWC_ARID_DEF.is_Fault_Detection_Sysytem = ACC_SWC_IN_Init;
      ACC_SWC_ARID_DEF.Fault = false;
    }
    break;

   case ACC_SWC_IN_Init:
    ACC_SWC_ARID_DEF.Fault = false;
    if (ACC_SWC_ARID_DEF.sfEvent == ACC_SWC_event_FaultEvent) {
      ACC_SWC_ARID_DEF.is_Fault_Detection_Sysytem = ACC_SWC_IN_Wait;
      ACC_SWC_ARID_DEF.temporalCounter_i1 = 0U;
    }
    break;

   case ACC_SWC_IN_Wait:
    if (ACC_SWC_ARID_DEF.sfEvent == ACC_SWC_event_ClearEvent) {
      ACC_SWC_ARID_DEF.is_Fault_Detection_Sysytem = ACC_SWC_IN_Init;
      ACC_SWC_ARID_DEF.Fault = false;
    } else if (ACC_SWC_ARID_DEF.temporalCounter_i1 >= 400U) {
      ACC_SWC_ARID_DEF.is_Fault_Detection_Sysytem = ACC_SWC_IN_Fault;
      ACC_SWC_ARID_DEF.Fault = true;
    }
    break;
  }
}

/* Model step function */
void ACC_SWC_Step(void)
{
  float32 Divide;
  float32 tmp;

  /* Product: '<S2>/Divide' incorporates:
   *  Constant: '<S2>/Constant'
   *  DataStoreRead: '<S2>/Data Store Read'
   *  DataTypeConversion: '<S2>/Data Type Conversion'
   */
  Divide = (float32)ACC_SWC_ARID_DEF.ACC_TimeGap / 10.0F;

  /* Chart: '<S2>/Chart' incorporates:
   *  Constant: '<S2>/Constant1'
   *  DataStoreRead: '<S2>/Data Store Read1'
   *  DataStoreRead: '<S2>/Data Store Read2'
   *  DataTypeConversion: '<S2>/Data Type Conversion1'
   *  DataTypeConversion: '<S2>/Data Type Conversion2'
   *  Inport: '<Root>/CruiseSw'
   *  Inport: '<Root>/Ego_Velocity'
   *  Inport: '<Root>/RelativeDistance'
   *  Inport: '<Root>/RelativeVelocity'
   *  Inport: '<Root>/SetPoint'
   *  Inport: '<Root>/StartStopSw'
   *  Product: '<S2>/Divide1'
   */
  if (ACC_SWC_ARID_DEF.temporalCounter_i1 < 511U) {
    ACC_SWC_ARID_DEF.temporalCounter_i1++;
  }

  ACC_SWC_ARID_DEF.sfEvent = ACC_SWC_CALL_EVENT;
  if (ACC_SWC_ARID_DEF.is_active_c3_ACC_SWC == 0U) {
    ACC_SWC_ARID_DEF.is_active_c3_ACC_SWC = 1U;
    ACC_SWC_ARID_DEF.is_active_Regular_System = 1U;
    ACC_SWC_ARID_DEF.is_active_CruiseControl_Activat = 1U;
    ACC_SWC_ARID_DEF.is_active_Distance_Measurement = 1U;
    ACC_SWC_ARID_DEF.SafeDistance = Divide *
      Rte_IRead_ACC_SWC_Step_Ego_Velocity_Ego_Velocity() + (float32)
      ACC_SWC_ARID_DEF.ACC_DefaultDistance;
    ACC_SWC_ARID_DEF.is_active_CruiseControl_Operati = 1U;
    ACC_SWC_ARID_DEF.is_active_Fault_Detection_Sysyt = 1U;
    ACC_SWC_ARID_DEF.is_Fault_Detection_Sysytem = ACC_SWC_IN_Init;
    ACC_SWC_ARID_DEF.Fault = false;
  } else {
    if (ACC_SWC_ARID_DEF.is_active_Regular_System != 0U) {
      if (ACC_SWC_ARID_DEF.is_active_CruiseControl_Activat != 0U) {
        if (Rte_IRead_ACC_SWC_Step_StartStopSw_StartStopSw() &&
            (!Rte_IRead_ACC_SWC_Step_CruiseSw_CruiseSw())) {
          ACC_SWC_ARID_DEF.ACC_Activation = false;
          ACC_SWC_ARID_DEF.Acceleration = 0.0F;
          ACC_SWC_ARID_DEF.Mode = Do_Nothing;
        } else {
          ACC_SWC_ARID_DEF.ACC_Activation = true;
        }
      }

      if (ACC_SWC_ARID_DEF.is_active_Distance_Measurement != 0U) {
        ACC_SWC_ARID_DEF.SafeDistance = Divide *
          Rte_IRead_ACC_SWC_Step_Ego_Velocity_Ego_Velocity() + (float32)
          ACC_SWC_ARID_DEF.ACC_DefaultDistance;
        if (Rte_IRead_ACC_SWC_Step_RelativeDistance_RelativeDistance() >=
            ACC_SWC_ARID_DEF.SafeDistance) {
          ACC_SWC_ARID_DEF.sfEvent = ACC_SWC_event_ClearEvent;
          if (ACC_SWC_ARID_DEF.is_active_Fault_Detection_Sysyt != 0U) {
            ACC_SWC_Fault_Detection_Sysytem();
          }

          ACC_SWC_ARID_DEF.sfEvent = -1;
        } else {
          ACC_SWC_ARID_DEF.sfEvent = ACC_SWC_event_FaultEvent;
          if (ACC_SWC_ARID_DEF.is_active_Fault_Detection_Sysyt != 0U) {
            ACC_SWC_Fault_Detection_Sysytem();
          }

          ACC_SWC_ARID_DEF.sfEvent = -1;
        }
      }

      if (ACC_SWC_ARID_DEF.is_active_CruiseControl_Operati != 0U) {
        if (ACC_SWC_ARID_DEF.ACC_Activation) {
          Divide = Rte_IRead_ACC_SWC_Step_RelativeDistance_RelativeDistance();
          if (Divide - ACC_SWC_ARID_DEF.SafeDistance >=
              ACC_SWC_ARID_DEF.ACC_DefaultDistance) {
            Divide = Rte_IRead_ACC_SWC_Step_SetPoint_SetPoint();
            tmp = Rte_IRead_ACC_SWC_Step_Ego_Velocity_Ego_Velocity();
            ACC_SWC_ARID_DEF.Acceleration = Divide - tmp;
            if ((float32)fabs(ACC_SWC_ARID_DEF.Acceleration) <= (float32)
                ACC_SWC_ARID_DEF.ACC_threshold / 10000.0F) {
              ACC_SWC_ARID_DEF.Mode = Do_Nothing;
              ACC_SWC_ARID_DEF.Acceleration = 0.0F;
            } else if (Divide > tmp) {
              ACC_SWC_ARID_DEF.Mode = Accelerate;
            } else {
              ACC_SWC_ARID_DEF.Mode = Decelerate;
            }
          } else {
            ACC_SWC_ARID_DEF.Mode = Decelerate;
            ACC_SWC_ARID_DEF.Acceleration =
              (((Rte_IRead_ACC_SWC_Step_RelativeVelocity_RelativeVelocity() +
                 Divide) - ACC_SWC_ARID_DEF.SafeDistance) - (float32)
               ACC_SWC_ARID_DEF.ACC_DefaultDistance) * 0.1F;
          }
        } else {
          ACC_SWC_ARID_DEF.Mode = Stop;
        }
      }
    }

    if (ACC_SWC_ARID_DEF.is_active_Fault_Detection_Sysyt != 0U) {
      ACC_SWC_Fault_Detection_Sysytem();
    }
  }

  /* End of Chart: '<S2>/Chart' */

  /* Outport: '<Root>/Fault' */
  Rte_IWrite_ACC_SWC_Step_Fault_Fault(ACC_SWC_ARID_DEF.Fault);

  /* Outport: '<Root>/Mode' */
  Rte_IWrite_ACC_SWC_Step_Mode_Mode(ACC_SWC_ARID_DEF.Mode);

  /* Outport: '<Root>/Acceleration' */
  Rte_IWrite_ACC_SWC_Step_Acceleration_Acceleration
    (ACC_SWC_ARID_DEF.Acceleration);

  /* Outport: '<Root>/SafeDistance' */
  Rte_IWrite_ACC_SWC_Step_SafeDistance_SafeDistance
    (ACC_SWC_ARID_DEF.SafeDistance);
}

/* Model initialize function */
void ACC_SWC_Init(void)
{
  /* SystemInitialize for Chart: '<S2>/Chart' */
  ACC_SWC_ARID_DEF.sfEvent = ACC_SWC_CALL_EVENT;

  /* Outputs for Atomic SubSystem: '<Root>/ACC_Init' */
  /* FunctionCaller: '<S3>/NvMServiceCaller' */
  Rte_Call_ACC_TimeGap_NvMService_ReadBlock(&ACC_SWC_ARID_DEF.ACC_TimeGap);

  /* FunctionCaller: '<S3>/NvMServiceCaller1' */
  Rte_Call_ACC_DefaultDistance_NvMService_ReadBlock
    (&ACC_SWC_ARID_DEF.ACC_DefaultDistance);

  /* FunctionCaller: '<S3>/NvMServiceCaller2' */
  Rte_Call_ACC_threshold_ID_NvMService_ReadBlock(&ACC_SWC_ARID_DEF.ACC_threshold);

  /* End of Outputs for SubSystem: '<Root>/ACC_Init' */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
