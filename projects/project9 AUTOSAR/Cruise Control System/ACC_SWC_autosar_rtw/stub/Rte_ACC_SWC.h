/* This file contains stub implementations of the AUTOSAR RTE functions.
   The stub implementations can be used for testing the generated code in
   Simulink, for example, in SIL/PIL simulations of the component under
   test. Note that this file should be replaced with an appropriate RTE
   file when deploying the generated code outside of Simulink.

   This file is generated for:
   Atomic software component:  "ACC_SWC"
   ARXML schema: "R20-11"
   File generated on: "04-Jul-2025 00:19:51"  */

#ifndef Rte_ACC_SWC_h
#define Rte_ACC_SWC_h
#include "Rte_Type.h"
#include "Compiler.h"

/* Data access functions */
#define Rte_IRead_ACC_SWC_Step_CruiseSw_CruiseSw Rte_IRead_ACC_SWC_ACC_SWC_Step_CruiseSw_CruiseSw

boolean Rte_IRead_ACC_SWC_Step_CruiseSw_CruiseSw(void);

#define Rte_IRead_ACC_SWC_Step_Ego_Velocity_Ego_Velocity Rte_IRead_ACC_SWC_ACC_SWC_Step_Ego_Velocity_Ego_Velocity

float32 Rte_IRead_ACC_SWC_Step_Ego_Velocity_Ego_Velocity(void);

#define Rte_IRead_ACC_SWC_Step_RelativeDistance_RelativeDistance Rte_IRead_ACC_SWC_ACC_SWC_Step_RelativeDistance_RelativeDistance

float32 Rte_IRead_ACC_SWC_Step_RelativeDistance_RelativeDistance(void);

#define Rte_IRead_ACC_SWC_Step_RelativeVelocity_RelativeVelocity Rte_IRead_ACC_SWC_ACC_SWC_Step_RelativeVelocity_RelativeVelocity

float32 Rte_IRead_ACC_SWC_Step_RelativeVelocity_RelativeVelocity(void);

#define Rte_IRead_ACC_SWC_Step_SetPoint_SetPoint Rte_IRead_ACC_SWC_ACC_SWC_Step_SetPoint_SetPoint

float32 Rte_IRead_ACC_SWC_Step_SetPoint_SetPoint(void);

#define Rte_IRead_ACC_SWC_Step_StartStopSw_StartStopSw Rte_IRead_ACC_SWC_ACC_SWC_Step_StartStopSw_StartStopSw

boolean Rte_IRead_ACC_SWC_Step_StartStopSw_StartStopSw(void);

#define Rte_IWrite_ACC_SWC_Step_Fault_Fault Rte_IWrite_ACC_SWC_ACC_SWC_Step_Fault_Fault

void Rte_IWrite_ACC_SWC_Step_Fault_Fault(boolean u);

#define Rte_IWriteRef_ACC_SWC_Step_Fault_Fault Rte_IWriteRef_ACC_SWC_ACC_SWC_Step_Fault_Fault

boolean* Rte_IWriteRef_ACC_SWC_Step_Fault_Fault(void);

#define Rte_IWrite_ACC_SWC_Step_Mode_Mode Rte_IWrite_ACC_SWC_ACC_SWC_Step_Mode_Mode

void Rte_IWrite_ACC_SWC_Step_Mode_Mode(ACC_Mode u);

#define Rte_IWriteRef_ACC_SWC_Step_Mode_Mode Rte_IWriteRef_ACC_SWC_ACC_SWC_Step_Mode_Mode

ACC_Mode* Rte_IWriteRef_ACC_SWC_Step_Mode_Mode(void);

#define Rte_IWrite_ACC_SWC_Step_Acceleration_Acceleration Rte_IWrite_ACC_SWC_ACC_SWC_Step_Acceleration_Acceleration

void Rte_IWrite_ACC_SWC_Step_Acceleration_Acceleration(float32 u);

#define Rte_IWriteRef_ACC_SWC_Step_Acceleration_Acceleration Rte_IWriteRef_ACC_SWC_ACC_SWC_Step_Acceleration_Acceleration

float32* Rte_IWriteRef_ACC_SWC_Step_Acceleration_Acceleration(void);

#define Rte_IWrite_ACC_SWC_Step_SafeDistance_SafeDistance Rte_IWrite_ACC_SWC_ACC_SWC_Step_SafeDistance_SafeDistance

void Rte_IWrite_ACC_SWC_Step_SafeDistance_SafeDistance(float32 u);

#define Rte_IWriteRef_ACC_SWC_Step_SafeDistance_SafeDistance Rte_IWriteRef_ACC_SWC_ACC_SWC_Step_SafeDistance_SafeDistance

float32* Rte_IWriteRef_ACC_SWC_Step_SafeDistance_SafeDistance(void);

/* Entry point functions */
extern FUNC(void, ACC_SWC_CODE) ACC_SWC_Init(void);
extern FUNC(void, ACC_SWC_CODE) ACC_SWC_Step(void);

/* Server operation call points */
#define Rte_Call_ACC_DefaultDistance_NvMService_ReadBlock Rte_Call_ACC_SWC_ACC_DefaultDistance_NvMService_ReadBlock

Std_ReturnType Rte_Call_ACC_DefaultDistance_NvMService_ReadBlock(void* DstPtr);

#define Rte_Call_ACC_TimeGap_NvMService_ReadBlock Rte_Call_ACC_SWC_ACC_TimeGap_NvMService_ReadBlock

Std_ReturnType Rte_Call_ACC_TimeGap_NvMService_ReadBlock(void* DstPtr);

#define Rte_Call_ACC_threshold_ID_NvMService_ReadBlock Rte_Call_ACC_SWC_ACC_threshold_ID_NvMService_ReadBlock

Std_ReturnType Rte_Call_ACC_threshold_ID_NvMService_ReadBlock(void* DstPtr);

#endif
