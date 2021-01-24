function Orig = RefOrigins(Hiper_DH)
    Orig=zeros(3,1);
    I=eye(4);

    for k=1:size(Hiper_DH,3)
        I=I*Hiper_DH(:,:,k);
        Orig(1:3,k+1)=I(1:3,4);
    end
    
end