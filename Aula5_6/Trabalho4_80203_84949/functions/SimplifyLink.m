function [Link_S] = SimplifyLink(Link,L,theta)
    
    L_Given = exist('L','var');
    Theta_Given = exist('theta','var');

    for i=1:4
        for j=1:4
            if L_Given && Theta_Given
                has_sym = has(Link(i,j),L) | has(Link(i,j),theta);
            elseif L_Given
                has_sym = has(Link(i,j),L);
            elseif Theta_Given
                has_sym = has(Link(i,j),theta);
            end

            if has_sym
                [C,S] = coeffs(Link(i,j));
                C=round(C);
                Link(i,j) = C * S;
            else
                Link(i,j) = round(Link(i,j));

            end
        end
    end
    Link_S = Link;
    
end