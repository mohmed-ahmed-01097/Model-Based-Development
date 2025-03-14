/* This file contains stub implementations of the AUTOSAR RTE functions.
   The stub implementations can be used for testing the generated code in
   Simulink, for example, in SIL/PIL simulations of the component under
   test. Note that this file should be replaced with an appropriate RTE
   file when deploying the generated code outside of Simulink.

   This file is generated for:
   Atomic software component:  "LCA"
   ARXML schema: "R20-11"
   File generated on: "14-Mar-2025 00:36:11"  */

#define MEMMAP_ERROR

/* START_SEC Symbols */
#ifdef LCA_START_SEC_CODE
#undef LCA_START_SEC_CODE
#undef MEMMAP_ERROR
#elif defined( LCA_START_SEC_CONST)
#undef LCA_START_SEC_CONST
#undef MEMMAP_ERROR
#elif defined( LCA_START_SEC_VAR)
#undef LCA_START_SEC_VAR
#undef MEMMAP_ERROR
#endif

/* STOP_SEC symbols */
#ifdef LCA_STOP_SEC_CODE
#undef LCA_STOP_SEC_CODE
#undef MEMMAP_ERROR
#elif defined( LCA_STOP_SEC_CONST)
#undef LCA_STOP_SEC_CONST
#undef MEMMAP_ERROR
#elif defined( LCA_STOP_SEC_VAR)
#undef LCA_STOP_SEC_VAR
#undef MEMMAP_ERROR

/* Error out if none of the expected Memory Section keywords are defined */
#ifdef MEMMAP_ERROR
#error "LCA_MemMap.h wrong pragma command"
#endif
#endif
