function DrawRefs(Hiper_DH, Ref_0)
    hold on;
    view(3)
    
%   Desenha o referencial inicial
    Ref_0X = Ref_0(1,:); Ref_0Y = Ref_0(2,:); Ref_0Z = Ref_0(3,:);
    fill3(Ref_0X(1:38), Ref_0Y(1:38), Ref_0Z(1:38), 'r', Ref_0X(39:end), Ref_0Y(39:end), Ref_0Z(39:end), 'r');
    hold on
    
%   Grava em células de arrays matrizes identidade (elemento neutro)
    I = eye(4);
    link_ID = cell(1,size(Hiper_DH,3));
    for k=1:size(Hiper_DH,3)
        link_ID{k} = I;
    end
    
%   Aplica a transformação e desenha os referenciais restantes
    Ref = cell(1,size(Hiper_DH,3)); 
    for k1=1:(size(Hiper_DH,3))
        link_ID{k1} = Hiper_DH(:,:,k1);
        Ref{k1}=Ref_0;
        for k2=size(link_ID,2):-1:1
            Ref{k1} = link_ID{k2}*Ref{k1};
        end
        Ref_X = Ref{k1}(1,:); Ref_Y = Ref{k1}(2,:); Ref_Z = Ref{k1}(3,:);
        
        color = rand(1,3);
        fill3(Ref_X(1:38), Ref_Y(1:38), Ref_Z(1:38), color, Ref_X(39:end), Ref_Y(39:end), Ref_Z(39:end), color);

        hold on
    end
end