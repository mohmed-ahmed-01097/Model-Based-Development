classdef (Enumeration) APP_enuMode < Simulink.IntEnumType
    enumeration 
        Normal(1)
        DowngradedSensor1(2)
        DowngradedSensor2(3)
        Failure(4)
    end
end