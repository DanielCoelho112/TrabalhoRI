function BTW = GetBTW(DH)
    Hip_DH = TransLinks(DH);
    BTW=1;
    for k=1:size(Hip_DH,3)
        BTW = BTW*Hip_DH(:,:,k);
    end
end