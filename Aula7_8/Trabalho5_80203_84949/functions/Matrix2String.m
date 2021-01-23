function MatrixString = Matrix2String(m)
     a=[];
     s = ' ';
    for i1=1:size(m,1)
        for i2=1:size(m,2) 
            if m(i1,i2)<0
                a=[a,s,s,num2str(m(i1,i2))];
            else
                a=[a,s,s,s,s,num2str(m(i1,i2))];
            end
        end
    end
    a(1) = '[';
    a = [s,a,s,s,s,']'];
    MatrixString = sprintf(a);
    
end