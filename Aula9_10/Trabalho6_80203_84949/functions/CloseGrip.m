function P_g = CloseGrip()
    P_g = [-0.3  0  0.3  -0.3  -0.3  -0.3  0.3  0.3  0.3 
                                zeros(1,9)
             0    0   0      0     0.5     1     0     0.5   1
                                ones(1,9)                         ];
end