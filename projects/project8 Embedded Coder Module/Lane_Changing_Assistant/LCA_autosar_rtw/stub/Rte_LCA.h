/* This file contains stub implementations of the AUTOSAR RTE functions.
   The stub implementations can be used for testing the generated code in
   Simulink, for example, in SIL/PIL simulations of the component under
   test. Note that this file should be replaced with an appropriate RTE
   file when deploying the generated code outside of Simulink.

   This file is generated for:
   Atomic software component:  "LCA"
   ARXML schema: "R20-11"
   File generated on: "14-Mar-2025 00:36:11"  */

#ifndef Rte_LCA_h
#define Rte_LCA_h
#include "Rte_Type.h"
#include "Compiler.h"

/* Data access functions */
#define Rte_DRead_RPortIn_Highway_Input_Signal Rte_DRead_LCA_RPortIn_Highway_Input_Signal

UInt8 Rte_DRead_RPortIn_Highway_Input_Signal(void);

#define Rte_DRead_RPortIn_Enable_Display Rte_DRead_LCA_RPortIn_Enable_Display

UInt8 Rte_DRead_RPortIn_Enable_Display(void);

#define Rte_DRead_RPortIn_Input_Switch Rte_DRead_LCA_RPortIn_Input_Switch

UInt8 Rte_DRead_RPortIn_Input_Switch(void);

#define Rte_DRead_RPortIn_Lane_Input_Signal Rte_DRead_LCA_RPortIn_Lane_Input_Signal

UInt8 Rte_DRead_RPortIn_Lane_Input_Signal(void);

#define Rte_Write_PPortOut_Display_Mode_1 Rte_Write_LCA_PPortOut_Display_Mode_1

Std_ReturnType Rte_Write_PPortOut_Display_Mode_1(UInt8 u);

#define Rte_Invalidate_PPortOut_Display_Mode_1 Rte_Invalidate_LCA_PPortOut_Display_Mode_1

Std_ReturnType Rte_Invalidate_PPortOut_Display_Mode_1(void);

#define Rte_Write_PPortOut_Display_Mode_2 Rte_Write_LCA_PPortOut_Display_Mode_2

Std_ReturnType Rte_Write_PPortOut_Display_Mode_2(UInt8 u);

#define Rte_Invalidate_PPortOut_Display_Mode_2 Rte_Invalidate_LCA_PPortOut_Display_Mode_2

Std_ReturnType Rte_Invalidate_PPortOut_Display_Mode_2(void);

#define Rte_Write_PPortOut_Display_Mode_3 Rte_Write_LCA_PPortOut_Display_Mode_3

Std_ReturnType Rte_Write_PPortOut_Display_Mode_3(UInt8 u);

#define Rte_Invalidate_PPortOut_Display_Mode_3 Rte_Invalidate_LCA_PPortOut_Display_Mode_3

Std_ReturnType Rte_Invalidate_PPortOut_Display_Mode_3(void);

#define Rte_Write_PPortOut_Display_Mode_4 Rte_Write_LCA_PPortOut_Display_Mode_4

Std_ReturnType Rte_Write_PPortOut_Display_Mode_4(UInt8 u);

#define Rte_Invalidate_PPortOut_Display_Mode_4 Rte_Invalidate_LCA_PPortOut_Display_Mode_4

Std_ReturnType Rte_Invalidate_PPortOut_Display_Mode_4(void);

/* Entry point functions */
extern FUNC(void, LCA_CODE) LCA_Init(void);
extern FUNC(void, LCA_CODE) LCA_Step(void);

#endif
