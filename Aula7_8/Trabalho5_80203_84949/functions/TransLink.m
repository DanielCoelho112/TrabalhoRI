function [T]=TransLink(theta,alpha,l,d)
% Matriz de transformação associada a cada elo
    T=rotz(theta)*trans3(l,0,0)*trans3(0,0,d)*rotx(alpha);

end