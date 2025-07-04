/* This file contains stub implementations of the AUTOSAR RTE functions.
   The stub implementations can be used for testing the generated code in
   Simulink, for example, in SIL/PIL simulations of the component under
   test. Note that this file should be replaced with an appropriate RTE
   file when deploying the generated code outside of Simulink.

   This file is generated for:
   Atomic software component:  "ACC_SWC"
   ARXML schema: "R20-11"
   File generated on: "04-Jul-2025 00:19:52"  */

#define MEMMAP_ERROR

/* START_SEC Symbols */
#ifdef ACC_SWC_START_SEC_CODE
#undef ACC_SWC_START_SEC_CODE
#undef MEMMAP_ERROR
#elif defined( ACC_SWC_START_SEC_CONST)
#undef ACC_SWC_START_SEC_CONST
#undef MEMMAP_ERROR
#elif defined( ACC_SWC_START_SEC_VAR)
#undef ACC_SWC_START_SEC_VAR
#undef MEMMAP_ERROR
#endif

/* STOP_SEC symbols */
#ifdef ACC_SWC_STOP_SEC_CODE
#undef ACC_SWC_STOP_SEC_CODE
#undef MEMMAP_ERROR
#elif defined( ACC_SWC_STOP_SEC_CONST)
#undef ACC_SWC_STOP_SEC_CONST
#undef MEMMAP_ERROR
#elif defined( ACC_SWC_STOP_SEC_VAR)
#undef ACC_SWC_STOP_SEC_VAR
#undef MEMMAP_ERROR

/* Error out if none of the expected Memory Section keywords are defined */
#ifdef MEMMAP_ERROR
#error "ACC_SWC_MemMap.h wrong pragma command"
#endif
#endif
