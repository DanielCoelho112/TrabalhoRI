function OTG = GetOTG(DH)
    Hip_DH = TransLinks(DH);
    OTG=1;
    for k=1:size(Hip_DH,3)
        OTG = OTG*Hip_DH(:,:,k);
    end
end