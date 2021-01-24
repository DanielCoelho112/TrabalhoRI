% Trabalho 6 - Cinemática direta e inversa de um manipulador FANUC
% Daniel Coelho       nºmec.84949
% Miguel Pina         nºmec.80203

% ------------------------------------------------------------------------
% ----------- 1.Cinemática diferencial de ummanipulador RR planar --------
% ------------------------------------------------------------------------

%% Ex1
close all
clear
clc
addpath('functions')

% ---------
% Janela apenas para mostrar os resultados obtidos nas alíneas
hF=figure; set(hF,...
               'color',[1 1 1],...
               'Position', [675 20 675 675],...
               'Name','Ex1')
title('Simulação diferencial de um manipulador RR planar')
xlabel('X'); ylabel('Y'); zlabel('Z')
axis([-8 8 -8 8])


hold on; grid on


%Definição dos comprimentos dos elos
L1=3;
L2=3;
L=[L1,L2];

% variavel que irá armazenar a informaçoes dos plots
h=[];

%juntas correspondentes á posição inicial do manipulador
thetas=[pi/4,-pi/2];

%representação da posição inicial do manipulador
[Ponto,h]=draw_links_jac(thetas,L,h);


%Parte interativa


 inputs = inputdlg({'Número de iterações','Raio da Circunferência (0.1<r<5)'},'Inputs',...
                       [1 50; 1 50]); 
 erro=false;
                   
               
                   
%   Se carregar em 'Cancel' ou fechar a janela, programa acaba
    if isempty(inputs)
        erro=true;
        r=0;
    else
        erro=false;
        
    end

    
    if erro==false
 % Converte os inputs para números
      ni = str2double(inputs{1});
     if isempty(inputs{1}) % Se não for colocado valor, assume-se 1000
         ni = 1000;
    elseif isnan(ni) % Se for letra, frase, etc..., não é válido
         erro = true;
     end
    r = str2double(inputs{2});
    if isempty(inputs{2})
        r = 2;
    elseif isnan(r) 
        erro = true;
    elseif r<0.1 || r>5
        erro = true; 
    end
    end
                
                
if erro==false
%vetor que tem os angulos todos para fazer o circulo
t=linspace(0,2*pi,ni);
for i=1:ni
    %dx=-rsin(t)dt
    %dy=rcos(t)dt
     
    %vetor que tem a variação do deslocamento do ponto
    dr=[-r*sin(t(i))*(2*pi/ni)
        r*cos(t(i))*(2*pi/ni)];
       
      %Jacobiana inversa correspondente aos angulos atuais
     J1=inv_jac(thetas,L);
     
     %determinação da variaçao dos angulos das juntas para termos a
     %variação do ponto pretendida
     dthetas=J1*dr;
     
     %calculo dos novos angulos
     thetas=[thetas(1)+dthetas(1) thetas(2)+dthetas(2)];
     
     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jac(thetas,L,h);
     
     %representação dos pontos por onde o manupulador passa
     plot(Ponto(1),Ponto(2),'ro','MarkerSize',0.5)
     
     pause(0.01)
     
end

else
    if r<0.1 || r>5
        errordlg('A condição do raio não foi respeitada')
    else
    errordlg('O input deve ser um número')
    
    end
end


pause(2)

%% Ex.Extra2
close all
clear
clc
addpath('functions')

% ---------
% Janela apenas para mostrar os resultados obtidos nas alíneas
hF=figure; set(hF,...
               'color',[1 1 1],...
               'Position', [0 20 675 675],...
               'Name','Ex1')
title('Simulação diferencial de um manipulador 3D de 2 elos')
xlabel('X'); ylabel('Y'); zlabel('Z')
axis([-10 10 -10 10 -10 10])
view(3)


hold on; grid on


%Definição dos comprimentos dos elos
L1=3;
L2=3;
L=[L1,L2];

% variavel que irá armazenar a informaçoes dos plots
h=[];

%juntas correspondentes á posição inicial do manipulador
thetas=[pi/2,0];

%representação da posição inicial do manipulador
[~,h]=draw_links_jacExtra(thetas,L,h);

r = 3;
ni = 400;

t=linspace(0,2*pi,ni);
for i=1:ni
    %vetor que tem a variação do deslocamento do ponto
    dr=[-r*sin(t(i))
        r*cos(t(i))
        0];

     %Jacobiana inversa correspondente aos angulos atuais
     J1=inv_jacExtra(thetas,L);

     %determinação da variaçao dos angulos das juntas para termos a
     %variação do ponto pretendida
     dthetas=J1*dr;

     %calculo dos novos angulos
     thetas=[thetas(1)+dthetas(1) thetas(2)+dthetas(2)];

     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jacExtra(thetas,L,h);

     %representação dos pontos por onde o manupulador passa
     plot3(Ponto(1),Ponto(2),Ponto(3),'ro','MarkerSize',1)

     pause(0.005)

end

hold on

%juntas correspondentes á posição inicial do manipulador
thetas=[pi/2,0];
r = 3;
ni = 400;

t=linspace(0,2*pi,ni);
for i=1:ni
    %vetor que tem a variação do deslocamento do ponto
    dr=[r*sin(t(i))
        r*cos(t(i))
        -r*sin(t(i))];

     %Jacobiana inversa correspondente aos angulos atuais
     J1=inv_jacExtra(thetas,L);

     %determinação da variaçao dos angulos das juntas para termos a
     %variação do ponto pretendida
     
     dthetas=J1*dr;

     %calculo dos novos angulos
     thetas=[thetas(1)+dthetas(1) thetas(2)+dthetas(2)];

     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jacExtra(thetas,L,h);

     %representação dos pontos por onde o manupulador passa
     plot3(Ponto(1),Ponto(2),Ponto(3),'bo','MarkerSize',1)

     pause(0.005)

end


hold on

%juntas correspondentes á posição inicial do manipulador
thetas=[pi/2,0];
r = 3;
ni = 400;

t=linspace(0,2*pi,ni);
for i=1:ni
    %vetor que tem a variação do deslocamento do ponto
    dr=[-r*sin(t(i))
        r*cos(t(i))
        -r*sin(t(i))];

     %Jacobiana inversa correspondente aos angulos atuais
     J1=inv_jacExtra(thetas,L);

     %determinação da variaçao dos angulos das juntas para termos a
     %variação do ponto pretendida
     
     dthetas=J1*dr;

     %calculo dos novos angulos
     thetas=[thetas(1)+dthetas(1) thetas(2)+dthetas(2)];

     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jacExtra(thetas,L,h);

     %representação dos pontos por onde o manupulador passa
     plot3(Ponto(1),Ponto(2),Ponto(3),'bo','MarkerSize',1)

     pause(0.005)

end





pause(3)









%% Ex2-Extra 2.2
clear
clc
addpath('functions')


% ---------
% Janela apenas para mostrar os resultados obtidos nas alíneas
hP=figure; set(hP,...
               'color',[1 1 1],...
               'Position', [675 20 675 675],...
               'Name','Ex.Extra')
title('Guess the logo')
axis([-8 8 -8 8])


hold on; grid off


set(gca,'XTick',[], 'YTick', [])

%Definição dos comprimentos dos elos
L1=3;
L2=3;
L=[L1,L2];

% variavel que irá armazenar a informaçoes dos plots
h=[];

%juntas correspondentes á posição inicial do manipulador
thetas=[pi/4,-pi/2];

%representação da posição inicial do manipulador
[Ponto,h]=draw_links_jac(thetas,L,h);


%Parte interativa
r=3;
ni=1000;

  t=linspace(0,2*pi,ni);  
for i=1:ni
    
 
    %dx=-rsin(t)dt
    %dy=rcos(t)dt
     
    %vetor que tem a variação do deslocamento do ponto
    dr=[-r*sin(t(i))*(2*pi/ni)
        r*cos(t(i))*(2*pi/ni)];
       
      %Jacobiana inversa correspondente aos angulos atuais
     J1=inv_jac(thetas,L);
     
     %determinação da variaçao dos angulos das juntas para termos a
     %variação do ponto pretendida
     dthetas=J1*dr;
     
     %calculo dos novos angulos
     thetas=[thetas(1)+dthetas(1) thetas(2)+dthetas(2)];
     
     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jac(thetas,L,h);
     
     if t(i)>pi/3 && t(i)<=2.6180
     %representação dos pontos por onde o manupulador passa
     plot(Ponto(1),Ponto(2),'ro','MarkerSize',2)
     elseif t(i)>2.6180 && t(i)<=3.6652
         plot(Ponto(1),Ponto(2),'yo','MarkerSize',2)
     elseif t(i)>3.6652 && t(i)<=5.7596
         plot(Ponto(1),Ponto(2),'go','MarkerSize',2)
     elseif t(i)>5.7596
         plot(Ponto(1),Ponto(2),'bo','MarkerSize',2)
     end
     
     pause(0.001)
     
     
     
end



r=3;
ni=1000;

%ACABAR A CIRCUNFERENCIA AZUL

  t=linspace(0,2*pi,ni);  
for i=1:ni
    
 
    %dx=-rsin(t)dt
    %dy=rcos(t)dt
     
    %vetor que tem a variação do deslocamento do ponto
    dr=[-r*sin(t(i))*(2*pi/ni)
        r*cos(t(i))*(2*pi/ni)];
       
      %Jacobiana inversa correspondente aos angulos atuais
     J1=inv_jac(thetas,L);
     
     %determinação da variaçao dos angulos das juntas para termos a
     %variação do ponto pretendida
     dthetas=J1*dr;
     
     %calculo dos novos angulos
     thetas=[thetas(1)+dthetas(1) thetas(2)+dthetas(2)];
     
     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jac(thetas,L,h);
     
     if t(i)<pi/20
     %representação dos pontos por onde o manupulador passa
     plot(Ponto(1),Ponto(2),'bo','MarkerSize',2)
     else
         break
     end
     pause(0.001)
     
end




%VOLTAR PARA O INICIO DA CIRCUNFERENCIA AZUL

r=3;
ni=100;


  t=linspace(0,-2*pi,ni);  
for i=1:ni
    
 
    theta1=thetas(1)*(1-i/100) + 7.0673*i/100 ;
    theta2=thetas(2)*(1-i/100) -1.5593*i/100 ;
    thetas=[theta1,theta2];
     
     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jac(thetas,L,h);
     
     if abs(t(i))<pi/10
     %representação dos pontos por onde o manupulador passa

     else
         break
     end
     pause(0.001)
     
end



for i=1:90
    
    
    %dx=-rsin(t)dt
    %dy=rcos(t)dt
     
    %vetor que tem a variação do deslocamento do ponto
    dr=[-0.01
        0];
       
      %Jacobiana inversa correspondente aos angulos atuais
     J1=inv_jac(thetas,L);
     
     %determinação da variaçao dos angulos das juntas para termos a
     %variação do ponto pretendida
     dthetas=J1*dr;
     
     %calculo dos novos angulos
     thetas=[thetas(1)+dthetas(1) thetas(2)+dthetas(2)];
     
     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jac(thetas,L,h);
     
     
     %representação dos pontos por onde o manupulador passa
     %plot(Ponto(1),Ponto(2),'bo','MarkerSize',2)
  
    pause(0.001)
     
end




r=2.1;
ni=1000;

  t=linspace(pi/20,2*pi+pi/20,ni);  
for i=1:ni
    
    
   
    
    %dx=-rsin(t)dt
    %dy=rcos(t)dt
     
    %vetor que tem a variação do deslocamento do ponto
    dr=[-r*sin(t(i))*(2*pi/ni)
        r*cos(t(i))*(2*pi/ni)];
       
      %Jacobiana inversa correspondente aos angulos atuais
     J1=inv_jac(thetas,L);
     
     %determinação da variaçao dos angulos das juntas para termos a
     %variação do ponto pretendida
     dthetas=J1*dr;
     
     %calculo dos novos angulos
     thetas=[thetas(1)+dthetas(1) thetas(2)+dthetas(2)];
     
     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jac(thetas,L,h);
     
     if t(i)>pi/3 
     %representação dos pontos por onde o manupulador passa
     plot(Ponto(1),Ponto(2),'ro','MarkerSize',2)
     end
     
     
      if t(i)>pi/3 && t(i)<=2.6180
     %representação dos pontos por onde o manupulador passa
     plot(Ponto(1),Ponto(2),'ro','MarkerSize',2)
     elseif t(i)>2.6180 && t(i)<=3.6652
         plot(Ponto(1),Ponto(2),'yo','MarkerSize',2)
     elseif t(i)>3.6652 && t(i)<=5.7596
         plot(Ponto(1),Ponto(2),'go','MarkerSize',2)
     elseif t(i)>5.7596 && t(i)<(2*pi-pi/13)
         plot(Ponto(1),Ponto(2),'bo','MarkerSize',2)
      elseif t(i)>(2*pi-pi/13)
          break
     end
     

     pause(0.001)
     

end



for i=1:200
    
    
    %dx=-rsin(t)dt
    %dy=rcos(t)dt
     
    %vetor que tem a variação do deslocamento do ponto
    dr=[-0.01
        0];
       
      %Jacobiana inversa correspondente aos angulos atuais
     J1=inv_jac(thetas,L);
     
     %determinação da variaçao dos angulos das juntas para termos a
     %variação do ponto pretendida
     dthetas=J1*dr;
     
     %calculo dos novos angulos
     thetas=[thetas(1)+dthetas(1) thetas(2)+dthetas(2)];
     
     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jac(thetas,L,h);
     
     
     %representação dos pontos por onde o manupulador passa
     plot(Ponto(1),Ponto(2),'bo','MarkerSize',2)
  
    pause(0.001)
     
end




for i=1:95
    
    
    %dx=-rsin(t)dt
    %dy=rcos(t)dt
     
    %vetor que tem a variação do deslocamento do ponto
    dr=[0
        0.01];
       
      %Jacobiana inversa correspondente aos angulos atuais
     J1=inv_jac(thetas,L);
     
     %determinação da variaçao dos angulos das juntas para termos a
     %variação do ponto pretendida
     dthetas=J1*dr;
     
     %calculo dos novos angulos
     thetas=[thetas(1)+dthetas(1) thetas(2)+dthetas(2)];
     
     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jac(thetas,L,h);
     
     
     %representação dos pontos por onde o manupulador passa
     plot(Ponto(1),Ponto(2),'bo','MarkerSize',2)
  
    pause(0.001)
     
end



for i=1:290
    
    
    %dx=-rsin(t)dt
    %dy=rcos(t)dt
     
    %vetor que tem a variação do deslocamento do ponto
    dr=[0.01
        0];
       
      %Jacobiana inversa correspondente aos angulos atuais
     J1=inv_jac(thetas,L);
     
     %determinação da variaçao dos angulos das juntas para termos a
     %variação do ponto pretendida
     dthetas=J1*dr;
     
     %calculo dos novos angulos
     thetas=[thetas(1)+dthetas(1) thetas(2)+dthetas(2)];
     
     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jac(thetas,L,h);
     
     
     %representação dos pontos por onde o manupulador passa
     plot(Ponto(1),Ponto(2),'bo','MarkerSize',2)
  
    pause(0.0001)
     
end


for i=1:21
    
    
    
    %dx=-rsin(t)dt
    %dy=rcos(t)dt
     
    %vetor que tem a variação do deslocamento do ponto
    dr=[-0.09
        0.066];
       
      %Jacobiana inversa correspondente aos angulos atuais
     J1=inv_jac(thetas,L);
     
     %determinação da variaçao dos angulos das juntas para termos a
     %variação do ponto pretendida
     dthetas=J1*dr;
     
     %calculo dos novos angulos
     thetas=[thetas(1)+dthetas(1) thetas(2)+dthetas(2)];
     
     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jac(thetas,L,h);
     
     
     %representação dos pontos por onde o manupulador passa
     %plot(Ponto(1),Ponto(2),'bo','MarkerSize',2)
  
    pause(0.001)
     
end



for i=1:35
    
    
    
    %dx=-rsin(t)dt
    %dy=rcos(t)dt
     
    %vetor que tem a variação do deslocamento do ponto
    dr=[0.011
        0.02];
       
      %Jacobiana inversa correspondente aos angulos atuais
     J1=inv_jac(thetas,L);
     
     %determinação da variaçao dos angulos das juntas para termos a
     %variação do ponto pretendida
     dthetas=J1*dr;
     
     %calculo dos novos angulos
     thetas=[thetas(1)+dthetas(1) thetas(2)+dthetas(2)];
     
     %representação do manipulador na nova posição
     [Ponto,h]=draw_links_jac(thetas,L,h);
     
     
     %representação dos pontos por onde o manupulador passa
     plot(Ponto(1),Ponto(2),'ro','MarkerSize',2)
  
     pause(0.001)
     
     
end

pause(2)

%Meter nova figura com o simbolo da google, e eliminar manipulador

clear_links_jac(thetas,L,h);



hL=figure; set(hL,...
               'color',[1 1 1],...
               'Position', [0 20 675 675])
           
           title('Google')

           
           axes('Color','none','XColor','none')

grid off



img=imread('google.PNG');

zImage = [0 0; 0 0];   % The x data for the image corners
yImage = [-4 4; -4 4];             % The y data for the image corners
xImage = [9 9; 0 0];   % The z data for the image corners
surf(xImage,yImage,zImage,...    % Plot the surface
     'CData',img,...
     'FaceColor','texturemap')
 view(0,-90)  % XY
camroll(90) 
set(gca,'XTick',[], 'YTick', [])

pause(2)
