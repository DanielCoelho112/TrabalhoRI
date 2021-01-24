function [Link_S] = SimplifyLink(Link,param1,param2,param3,param4)
    
    Given_1 = exist('param1','var');
    Given_2 = exist('param2','var');
    Given_3 = exist('param3','var');
    Given_4 = exist('param4','var');

    for i=1:4
        for j=1:4
            if Given_1 && Given_2 && Given_3 && Given_4
                has_sym = has(Link(i,j),param1) | has(Link(i,j),param2) |...
                          has(Link(i,j),param3) | has(Link(i,j),param4);
                      
            elseif Given_1 && Given_2 && Given_3
                has_sym = has(Link(i,j),param1) | has(Link(i,j),param2) |...
                          has(Link(i,j),param3);
                      
            elseif Given_1 && Given_2
                has_sym = has(Link(i,j),param1) | has(Link(i,j),param2);
                
            elseif Given_1
                has_sym = has(Link(i,j),param1);
                      
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