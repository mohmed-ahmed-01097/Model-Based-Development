/* This file contains stub implementations of the AUTOSAR RTE functions.
   The stub implementations can be used for testing the generated code in
   Simulink, for example, in SIL/PIL simulations of the component under
   test. Note that this file should be replaced with an appropriate RTE
   file when deploying the generated code outside of Simulink.

   This file is generated for:
   Atomic software component:  "ACC_SWC"
   ARXML schema: "R20-11"
   File generated on: "04-Jul-2025 00:19:52"  */

#ifndef Rte_Type_h
#define Rte_Type_h
#include "rtwtypes.h"
#include "Std_Types.h"

/* AUTOSAR RTE Status Types */
#ifndef RTE_E_OK
#define RTE_E_OK                       (0x00)
#endif

#ifndef RTE_E_LOST_DATA
#define RTE_E_LOST_DATA                (0x40)
#endif

#ifndef RTE_E_LIMIT
#define RTE_E_LIMIT                    (0x82)
#endif

#ifndef E2E_E_OK
#define E2E_E_OK                       (0x00)
#endif

#ifndef E2EPW_STATUS_OK
#define E2EPW_STATUS_OK                (0x00)
#endif

#ifndef E2EPW_STATUS_OKSOMELOST
#define E2EPW_STATUS_OKSOMELOST        (0x20)
#endif

/* AUTOSAR Implementation data types, specific to software component */
/* AUTOSAR Void Pointer Types */
typedef void* NvM_DstPtrType;

/* AUTOSAR Enumeration Types */
typedef sint32 ACC_Mode;

#ifndef Accelerate
#define Accelerate                     (0)
#endif

#ifndef Decelerate
#define Decelerate                     (1)
#endif

#ifndef Stop
#define Stop                           (2)
#endif

#ifndef Do_Nothing
#define Do_Nothing                     (3)
#endif

typedef void* Rte_Instance;

#endif
