classdef ACC_Mode < Simulink.IntEnumType
   enumeration
      Accelerate (0)
      Decelerate (1)
      Stop       (2)
      Do_Nothing (3)
      Failure (4)
   end
  methods (Static)
    %% Tell codegen which header to include for this enum
    function header = getHeaderFile
      header = 'Rte_Type.h';
    end
  end
end