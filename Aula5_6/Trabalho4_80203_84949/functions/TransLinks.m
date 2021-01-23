function [TGlob]=TransLinks(DH)
% Hipermatriz de transformação
    TGlob = NaN(4,4,size(DH,1));
    for i=1:size(DH,1)
        TGlob(:,:,i)=TransLink(DH(i,1),DH(i,2),DH(i,3),DH(i,4));
    end
end