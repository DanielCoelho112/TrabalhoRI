% Trabalho 4 - Cinemática direta
% Daniel Coelho       nºmec.84949
% Miguel Pina         nºmec.80203

% ------------------------------------------------------------------------
% ------ 1.Transformações geométricas de um processo de manipulação ------
% ------------------------------------------------------------------------
%% Ex1 alínea a)
% Feito num documento PowerPoint à parte

%% Ex1 alínea b)
% Função para calcular a matriz de transformação associada a cada um dos
% elos criada num script à parte (TransLink.m)

%% Ex1 alínea c)
close all
clear 
clc
addpath('functions')

syms L [1 4]
syms theta [1 4]

T_elo1 = TransLink(0,0,0,L1);
T_elo2 = TransLink(theta1,pi/2,L2,0);
T_elo3 = TransLink(theta2,0,L3,0);
T_elo4 = TransLink(theta3 + pi/2,pi/2,0,0);
T_elo5 = TransLink(theta4,0,0,L4);

% Simplification of all links
% T_elo1 = SimplifyLink(T_elo1,L1);
% T_elo2 = SimplifyLink(T_elo2,L2,theta1);
% T_elo3 = SimplifyLink(T_elo3,L3,theta2);
% T_elo4 = SimplifyLink(T_elo4,theta3);
% T_elo5 = SimplifyLink(T_elo5,L4,theta4);


BTW = T_elo1 * T_elo2 * T_elo3 * T_elo4 * T_elo5;

BTW_simplified = simplify(BTW);
disp('Exercício 1. alínea c)')
disp('BTW simplificado:')
disp(' ')
disp(BTW_simplified)

%% Ex1 alíneas d),e),f) e g)
clear
addpath('functions')

% Ex1 alínea d)
[L1, L2, L3, L4] = deal(4, 6, 5, 1);
[theta1, theta2, theta3, theta4] = deal(0);

T_elo1 = TransLink(0,0,0,L1);
T_elo2 = TransLink(theta1,pi/2,L2,0);
T_elo3 = TransLink(theta2,0,L3,0);
T_elo4 = TransLink(theta3 + pi/2,pi/2,0,0);
T_elo5 = TransLink(theta4,0,0,L4);

BTW = T_elo1 * T_elo2 * T_elo3 * T_elo4 * T_elo5;
p0 = [0 0 0 1]';

pw = BTW*p0;

phi_4 = rad2deg(atan2(BTW(3,2),BTW(3,3)));
theta_4 = rad2deg(asin(-BTW(3,1)));
psi_4 = rad2deg(atan2(BTW(2,1),BTW(1,1)));

r = round([pw(1:3) ; phi_4 ; theta_4 ; psi_4],3);

% Janela apenas para mostrar os resultados obtidos nas alíneas
hF=figure; set(hF,'color',[1 1 1],'Position', [0 20 675 675])
hA=axes; set(hA,'color',[1 1 1],'visible','off')

text(-0.16,1.08,'Exercício 1.c)',...
     'FontSize',13,...
     'FontWeight','bold')
text(-0.16,1.04,strcat('A alínea c) deste exercício pode-se ver na janela de comandos'),...
     'FontSize',11)

text(-0.16,0.98,'Exercício 1.d)',...
     'FontSize',13,...
     'FontWeight','bold')
text(-0.16,0.93,strcat('r_{W_{0}} = [ x_{w} y_{w} z_{w}  \theta_{4x}  \theta_{4y}  \theta_{4z} ]^{T} =  ' , mat2str(r') , '^{T}'),...
     'FontSize',12)


% Ex1 alínea e)
BTS = round(trans3(0,10,0)*rotz(-pi/2),3);

text(-0.16,0.83,'Exercício 1.e)',...
     'FontSize',13,...
     'FontWeight','bold')
text(-0.16,0.78,strcat('^{B}T_{S}= '),...
     'FontSize',12)
 
BTS_str = Matrix2String(BTS);
text(-0.16,0.66,strcat(BTS_str),...
     'FontSize',12)
 

% Ex1 alínea f)
STG = trans3(0,1.5,0)*trans3(0,0,1);

text(-0.16,0.51,'Exercício 1.f)',...
     'FontSize',13,...
     'FontWeight','bold')
text(-0.16,0.45,strcat('^{S}T_{G} = '),...
     'FontSize',12)

STG_str = Matrix2String(STG);
text(-0.16,0.34,strcat(STG_str),...
     'FontSize',12)
 

% Ex1 alínea g)
% Pela teoria dos grafos:
% trans_B_W * trans_W_G = trans_B_S * trans_S_G

WTG = round(BTW^(-1) * BTS * STG,3);

p1 = WTG * [0,0,0,1]';

text(-0.16,0.18,'Exercício 1.g)',...
     'FontSize',13,...
     'FontWeight','bold')

text(-0.16,0.12,strcat('^{W}T_{G} = '),...
     'FontSize',12)
 
WTG_str = Matrix2String(WTG);
text(-0.16,0.02,strcat(WTG_str),...
     'FontSize',12)
 
pause(6)
%% -----------------------------------------------------------------------
%  ---------------- 2.Simulação do processo de manipulação ---------------
%  -----------------------------------------------------------------------
% Ex2 alínea a)
addpath('functions')
figure('Position', [675 20 675 675])

eixos;


%Pi sao os pontos do ref na base

theta1=0;
theta2=0;
theta3=0;
theta4=0;


L1=4;
L2=6;
L3=5;
L4=1;

DH = [0 0 0 L1
    theta1 pi/2 L2 0
    theta2 0 L3 0
    theta3+pi/2 pi/2 0 0
    theta4 0 0 L4];
    

%Calcular as transformações de todos os elo usando uma hiper-matriz

for i=1:size(DH,1)
    B_T_W_matriz(:,:,i) = TransLink(DH(i,1),DH(i,2),DH(i,3),DH(i,4));
end


subplot(2,1,1)
axis equal; xlabel('x'); ylabel('y'); zlabel('z'); grid on
title('Ex.2a - Modelo do Manipulador')
hold on;view(3) ;

h = desenhar_eixos(Pi,B_T_W_matriz);


%Calcular os pontos onde estao os ref

pontos_elos = points_links(B_T_W_matriz);

%Desenhar manipulador com recurso a linhas grossas
h=[];


draw_links(pontos_elos,h);

 pause(2);

%% Ex2 alínea b)
addpath('functions')
% Espaço cartesiano obtido no exercício 1.d):
% rw0 = [xw yw zw thetax thetay thetaz]' = [12 0 4 135 -90 45]'

% Espaço cartesiano para o exercício 2.a):
% Comprimentos dos elos
[L1, L2, L3, L4] = deal(4, 6, 5, 1);

% Matriz DH inicial
DH_matrix = [0     0     0     L1
             0     pi/2  L2    0 
             0     0     L3    0 
             pi/2  pi/2  0     0 
             0     0     0     L4 ];

% Hipermatriz de transformação
Hiper_DH = TransLinks(DH_matrix);

% Obtenção do BTW
BTW_2 = GetBTW(DH_matrix);

% Obtenção da origem de cada um dos referenciais
Ref_Origins = RefOrigins(Hiper_DH);

xyz_W = Ref_Origins(:,end); 

phi_4a = rad2deg(atan2(BTW_2(3,2),BTW_2(3,3))); % thetax  
theta_4a = rad2deg(asin(-BTW_2(3,1))); % thetay
psi_4a = rad2deg(atan2(BTW_2(2,1),BTW_2(1,1))); % thetaz

r_2a = [xyz_W ; phi_4a ; theta_4a ; psi_4a];
disp('Exercício 2. alínea b)')
disp('Espaço cartesiano obtido:')
disp(' ')
disp(r_2a)
disp('Como é possível verificar, obteve-se o mesmo espaço cartesiano que em 1.d)')


%% Ex2 alinea c)
addpath('functions')
subplot(2,1,2)
axis equal; xlabel('x'); ylabel('y'); zlabel('z'); grid on
title('Ex.2c - Manipulador Completo')
hold on;view(3);


h=[];
draw_links(pontos_elos,h);


%Agora vamos desenhar o gripper

h2=[];
h2=draw_gripper(B_T_W_matriz,h2);


pause(2);


%% Ex2 alinea d)
addpath('functions')

figure('Position', [0 20 675 675])
axis([-15 15 -15 15 -15 15]); xlabel('x'); ylabel('y'); zlabel('z')
title('Ex.2d - Espaço de juntas [45 45 0 90]')

 hold on;grid on; axis square,view(3)


eixos;


h=[];
h2=[];

for i=linspace(0,1,100)

theta1=pi/4*i;
theta2=pi/4*i;
theta3=0;
theta4=pi/2*i;


L1=4;
L2=6;
L3=5;
L4=1;

DH = [0 0 0 L1
    theta1 pi/2 L2 0
    theta2 0 L3 0
    theta3+pi/2 pi/2 0 0
    theta4 0 0 L4];
    


%Calcular as transformações de todos os elo usando uma hiper-matriz

for j=1:size(DH,1)
    B_T_W_matriz(:,:,j) = TransLink(DH(j,1),DH(j,2),DH(j,3),DH(j,4));
end



%Calcular os pontos onde estao os ref

pontos_elos = points_links(B_T_W_matriz);

%Desenhar manipulador com recurso a linhas grossas

h=draw_links(pontos_elos,h);

h2=draw_gripper(B_T_W_matriz,h2);

if i==0
    pause(1)
end


pause(0.01)

end

pause(2)




%% Ex2 alinea e)
addpath('functions')

figure('Position', [675 20 675 675])
axis([-15 15 -15 15 -15 15]); xlabel('x'); ylabel('y'); zlabel('z')
title('Ex.2e - Manipulador com a mesa')

hold on; grid on; axis square,view(3)


theta1=0;
theta2=0;
theta3=0;
theta4=0;


L1=4;
L2=6;
L3=5;
L4=1;

DH = [0 0 0 L1
    theta1 pi/2 L2 0
    theta2 0 L3 0
    theta3+pi/2 pi/2 0 0
    theta4 0 0 L4];
    


%Calcular as transformações de todos os elo usando uma hiper-matriz

for i=1:size(DH,1)
    B_T_W_matriz(:,:,i) = TransLink(DH(i,1),DH(i,2),DH(i,3),DH(i,4));
end



%Calcular os pontos onde estao os ref

pontos_elos = points_links(B_T_W_matriz);

%Desenhar manipulador com recurso a linhas grossas

h=[];h2=[];

h=draw_links(pontos_elos,h);

h2=draw_gripper(B_T_W_matriz,h2);

draw_tables(0,0)


pause(2)




%% Ex2 alinea f)
addpath('functions')

figure('Position', [0 20 675 675])
axis([-15 15 -15 15 -15 15]); xlabel('x'); ylabel('y'); zlabel('z')
title('Ex.2f - Manipulador a movimentar o objeto')

hold on; grid on; axis square,view(3)

h=[];
h1=[];
h2=[];
h3=[];

draw_tables(1,0)

for i=linspace(0,1,100)

theta1=0;
theta2=0;
theta3=0 - i*(pi/2);
theta4=0;


L1=4;
L2=6;
L3=5;
L4=1;

DH = [0 0 0 L1
    theta1 pi/2 L2 0
    theta2 0 L3 0
    theta3+pi/2 pi/2 0 0
    theta4 0 0 L4];
    


%Calcular as transformações de todos os elo usando uma hiper-matriz


for j=1:size(DH,1)
    B_T_W_matriz(:,:,j) = TransLink(DH(j,1),DH(j,2),DH(j,3),DH(j,4));
end


%Coordenadas Objeto

h3=draw_object(B_T_W_matriz,h3,0);


pontos_elos = points_links(B_T_W_matriz);


h2=draw_links(pontos_elos,h2);


h=draw_gripper(B_T_W_matriz,h);


if i==0
    pause(1)
end

pause(0.01)

end


for i=linspace(0,1,100)

theta1=0;
theta2=0 + (pi/2)*i;
theta3=-pi/2;
theta4=0;


L1=4;
L2=6;
L3=5;
L4=1;

DH = [0 0 0 L1
    theta1 pi/2 L2 0
    theta2 0 L3 0
    theta3+pi/2 pi/2 0 0
    theta4 0 0 L4];
    


%Calcular as transformações de todos os elo usando uma hiper-matriz

for i=1:size(DH,1)
    B_T_W_matriz(:,:,i) = TransLink(DH(i,1),DH(i,2),DH(i,3),DH(i,4));
end


%Coordenadas Objeto

h3=draw_object(B_T_W_matriz,h3,1);


pontos_elos = points_links(B_T_W_matriz);


h2=draw_links(pontos_elos,h2);





h=draw_gripper(B_T_W_matriz,h);



pause(0.01)

end

for i=linspace(0,1,100)

theta1=0 + (pi)*i;
theta2=pi/2;
theta3=-pi/2;
theta4=0;


L1=4;
L2=6;
L3=5;
L4=1;

DH = [0 0 0 L1
    theta1 pi/2 L2 0
    theta2 0 L3 0
    theta3+pi/2 pi/2 0 0
    theta4 0 0 L4];
    


%Calcular as transformações de todos os elo usando uma hiper-matriz

for i=1:size(DH,1)
    B_T_W_matriz(:,:,i) = TransLink(DH(i,1),DH(i,2),DH(i,3),DH(i,4));
end


%Coordenadas Objeto

h3=draw_object(B_T_W_matriz,h3,1);


pontos_elos = points_links(B_T_W_matriz);


h2=draw_links(pontos_elos,h2);




h=draw_gripper(B_T_W_matriz,h);



pause(0.01)

end

for i=linspace(0,1,100)

theta1=pi;
theta2=pi/2 - (pi/2)*i;
theta3=-pi/2;
theta4=0;


L1=4;
L2=6;
L3=5;
L4=1;

DH = [0 0 0 L1
    theta1 pi/2 L2 0
    theta2 0 L3 0
    theta3+pi/2 pi/2 0 0
    theta4 0 0 L4];
    


%Calcular as transformações de todos os elo usando uma hiper-matriz

for i=1:size(DH,1)
    B_T_W_matriz(:,:,i) = TransLink(DH(i,1),DH(i,2),DH(i,3),DH(i,4));
end


%Coordenadas Objeto

h3=draw_object(B_T_W_matriz,h3,1);


pontos_elos = points_links(B_T_W_matriz);


h2=draw_links(pontos_elos,h2);
h=draw_gripper(B_T_W_matriz,h);



pause(0.01)

end


for i=linspace(0,1,100)

theta1=pi;
theta2=pi/2*i;
theta3=-pi/2;
theta4=0;


L1=4;
L2=6;
L3=5;
L4=1;

DH = [0 0 0 L1
    theta1 pi/2 L2 0
    theta2 0 L3 0
    theta3+pi/2 pi/2 0 0
    theta4 0 0 L4];
    


%Calcular as transformações de todos os elo usando uma hiper-matriz

for i=1:size(DH,1)
    B_T_W_matriz(:,:,i) = TransLink(DH(i,1),DH(i,2),DH(i,3),DH(i,4));
end


%Coordenadas Objeto

h3=draw_object(B_T_W_matriz,h3,2);


pontos_elos = points_links(B_T_W_matriz);


h2=draw_links(pontos_elos,h2);





h=draw_gripper(B_T_W_matriz,h);



pause(0.01)

end

pause(2)


%% Ex2 alinea g)
addpath('functions')

figure('Position', [675 20 675 675])
axis([-15 15 -15 15 -15 15]); xlabel('x'); ylabel('y'); zlabel('z')
title('Ex.2g - Movimentar o manipulador até ao objeto apartir do espaço de juntas do Ex.2d')

hold on; grid on; axis square,view(3)

hold on; grid on; axis square,view(3)

h=[];
h1=[];
h2=[];
h3=[];

draw_tables(1,0)

for i=linspace(0,1,150)

theta1=pi/4 - (pi/4)*i;
theta2=pi/4 - (pi/4)*i;
theta3=0 - (pi/2)*i;
theta4=pi/2 - (pi/2)*i;


L1=4;
L2=6;
L3=5;
L4=1;

DH = [0 0 0 L1
    theta1 pi/2 L2 0
    theta2 0 L3 0
    theta3+pi/2 pi/2 0 0
    theta4 0 0 L4];
    


%Calcular as transformações de todos os elo usando uma hiper-matriz

for j=1:size(DH,1)
    B_T_W_matriz(:,:,j) = TransLink(DH(j,1),DH(j,2),DH(j,3),DH(j,4));
end


%Coordenadas Objeto

h3=draw_object(B_T_W_matriz,h3,0);


pontos_elos = points_links(B_T_W_matriz);


h2=draw_links(pontos_elos,h2);



h=draw_gripper(B_T_W_matriz,h);

if i==0
    pause(1)
end

pause(0.01)

end


pause(2)

%% Extra
addpath('functions')

figure('Position', [0 20 675 675])
axis([-15 15 -15 15 -15 15]); xlabel('x'); ylabel('y'); zlabel('z')
title('Ex.Extra Robots em série para transporte de objetos')

hold on; grid on; axis square,view(3)

pontos_manipulador;
draw_tables(1,1);


%Aqui, procede-se aos calculos dos movimentos nao usando a matriz de cada
%elo


ang2=-pi;
ang3=0;
ang4=-pi/2;
ang5=0;

p_elo1 = trans3(0,0,-10)* p_elo1_o;

p_elo2 = trans3(0,0,-10)* trans3(0,0,4)*roty(pi/2)* rotx(ang2) * p_elo2_o;

p_elo3 = trans3(0,0,-10) * trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3) * p_elo3_o;

p_elo4 = trans3(0,0,-10)* trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3) * trans3(0,0,5) *roty(ang4)  * p_elo4_o;

p_elo5 = trans3(0,0,-10) *trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3) * trans3(0,0,5) *roty(ang4) *trans3(0,0,1) * rotz(ang5)  * p_elo5_o;

P1=desenhar_robot3(p_elo1,p_elo2,p_elo3,p_elo4,p_elo5);

%para chegar ao objeto tem de ser [0,0,pi/2,0]

ang2=0;
ang3=0;
ang4=0;
ang5=0;

p_elo1 =  p_elo1_o;

p_elo2 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2) * p_elo2_o;

p_elo3 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3) * p_elo3_o;

p_elo4 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3) * trans3(0,0,5) *roty(ang4)  * p_elo4_o;

p_elo5 = trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3) * trans3(0,0,5) *roty(ang4) *trans3(0,0,1) * rotz(ang5)  * p_elo5_o;

P=desenhar_robot3(p_elo1,p_elo2,p_elo3,p_elo4,p_elo5);


ang2=0;
ang3=-pi/4;
ang4=pi/2;
ang5=0;
for i=linspace(0,1,100)

p_elo1 =  p_elo1_o;

p_elo2 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2) * p_elo2_o;

p_elo3 =   trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3*i) * p_elo3_o;

p_elo4 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3*i) * trans3(0,0,5) *roty(ang4*i)  * p_elo4_o;

p_elo5 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3*i) * trans3(0,0,5) *roty(ang4*i) *trans3(0,0,1) * rotz(ang5)  * p_elo5_o;


atualizar_robot3(P,p_elo1_o,p_elo2,p_elo3,p_elo4,p_elo5);

pause(0.001)

end


ang2=0;
ang3=-pi/4;
ang3b=pi/4;
ang4=pi/2;
ang5=0;

for i=linspace(0,1,100)

p_elo1 =  p_elo1_o;

p_elo2 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2) * p_elo2_o;

p_elo3 =   trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b*i) * p_elo3_o;

p_elo4 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b*i) * trans3(0,0,5) *roty(ang4)  * p_elo4_o;

p_elo5 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b*i) * trans3(0,0,5) *roty(ang4) *trans3(0,0,1) * rotz(ang5)  * p_elo5_o;


%devia ter criado o objeto noutra posição,quando ele chega ao ponto final
%ja chega rodado, dai ser preciso andar -0.5 em x



atualizar_robot3(P,p_elo1_o,p_elo2,p_elo3,p_elo4,p_elo5);

pause(0.001)

end


ang2=0;
ang3=-pi/4;
ang3b=pi/4;
ang3c=-pi/2;
ang4=pi/2;
ang5=0;

for i=linspace(0,1,100)

p_elo1 =  p_elo1_o;

p_elo2 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2) * p_elo2_o;

p_elo3 =   trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b)*roty(ang3c*i) * p_elo3_o;

p_elo4 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b)*roty(ang3c*i) * trans3(0,0,5) *roty(ang4)  * p_elo4_o;

p_elo5 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b) *roty(ang3c*i)* trans3(0,0,5) *roty(ang4) *trans3(0,0,1) * rotz(ang5)  * p_elo5_o;




pontos_obj = trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b) *roty(ang3c*i)* trans3(0,0,5) *roty(ang4) *trans3(0,0,1)*trans3(-0.5,0,0) * rotz(ang5) * p_obj_o;

obj_face_1=[pontos_obj(:,2) pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,3)];
obj_face_2=[pontos_obj(:,5) pontos_obj(:,6) pontos_obj(:,8) pontos_obj(:,7)];
obj_face_3=[pontos_obj(:,2) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,5)];
obj_face_4=[pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,8) pontos_obj(:,6)];
obj_face_5=[pontos_obj(:,1) pontos_obj(:,2) pontos_obj(:,5) pontos_obj(:,6)];
obj_face_6=[pontos_obj(:,4) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,8)];



 set( F1_obj, 'XData', obj_face_1(1,:), 'YData', obj_face_1(2,:), 'ZData',obj_face_1(3,:));
 set(F2_obj, 'XData', obj_face_2(1,:), 'YData', obj_face_2(2,:),'ZData',obj_face_2(3,:));
 set( F3_obj, 'XData', obj_face_3(1,:), 'YData', obj_face_3(2,:),'ZData',obj_face_3(3,:));
 set( F4_obj, 'XData', obj_face_4(1,:), 'YData', obj_face_4(2,:),'ZData',obj_face_4(3,:));
 set( F5_obj, 'XData', obj_face_5(1,:), 'YData', obj_face_5(2,:),'ZData',obj_face_5(3,:));
 set( F6_obj, 'XData', obj_face_6(1,:), 'YData', obj_face_6(2,:),'ZData',obj_face_6(3,:));


atualizar_robot3(P,p_elo1_o,p_elo2,p_elo3,p_elo4,p_elo5);

pause(0.001)

end


ang2=pi;
ang3=-pi/4;
ang3b=pi/4;
ang3c=-pi/2;
ang4=pi/2;
ang5=0;

for i=linspace(0,1,100)

p_elo1 =  p_elo1_o;

p_elo2 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2*i) * p_elo2_o;

p_elo3 =   trans3(0,0,4)*roty(pi/2)* rotx(ang2*i)*trans3(0,0,6) * roty(ang3)* roty(ang3b)*roty(ang3c) * p_elo3_o;

p_elo4 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2*i)*trans3(0,0,6) * roty(ang3)* roty(ang3b)*roty(ang3c) * trans3(0,0,5) *roty(ang4)  * p_elo4_o;

p_elo5 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2*i)*trans3(0,0,6) * roty(ang3)* roty(ang3b) *roty(ang3c)* trans3(0,0,5) *roty(ang4) *trans3(0,0,1) * rotz(ang5)  * p_elo5_o;




pontos_obj = trans3(0,0,4)*roty(pi/2)* rotx(ang2*i)*trans3(0,0,6) * roty(ang3)* roty(ang3b) *roty(ang3c)* trans3(0,0,5) *roty(ang4) *trans3(0,0,1)*trans3(-0.5,0,0) * rotz(ang5) * p_obj_o;

obj_face_1=[pontos_obj(:,2) pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,3)];
obj_face_2=[pontos_obj(:,5) pontos_obj(:,6) pontos_obj(:,8) pontos_obj(:,7)];
obj_face_3=[pontos_obj(:,2) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,5)];
obj_face_4=[pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,8) pontos_obj(:,6)];
obj_face_5=[pontos_obj(:,1) pontos_obj(:,2) pontos_obj(:,5) pontos_obj(:,6)];
obj_face_6=[pontos_obj(:,4) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,8)];



 set( F1_obj, 'XData', obj_face_1(1,:), 'YData', obj_face_1(2,:), 'ZData',obj_face_1(3,:));
 set(F2_obj, 'XData', obj_face_2(1,:), 'YData', obj_face_2(2,:),'ZData',obj_face_2(3,:));
 set( F3_obj, 'XData', obj_face_3(1,:), 'YData', obj_face_3(2,:),'ZData',obj_face_3(3,:));
 set( F4_obj, 'XData', obj_face_4(1,:), 'YData', obj_face_4(2,:),'ZData',obj_face_4(3,:));
 set( F5_obj, 'XData', obj_face_5(1,:), 'YData', obj_face_5(2,:),'ZData',obj_face_5(3,:));
 set( F6_obj, 'XData', obj_face_6(1,:), 'YData', obj_face_6(2,:),'ZData',obj_face_6(3,:));


atualizar_robot3(P,p_elo1_o,p_elo2,p_elo3,p_elo4,p_elo5);

pause(0.001)

end


ang2=pi;
ang3=-pi/4;
ang3b=pi/4;
ang3c=-pi/2;
ang3d=pi/2;
ang4=pi/2;
ang5=0;

for i=linspace(0,1,100)

p_elo1 =  p_elo1_o;

p_elo2 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2) * p_elo2_o;

p_elo3 =   trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b)*roty(ang3c)*roty(ang3d*i) * p_elo3_o;

p_elo4 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b)*roty(ang3c)*roty(ang3d*i) * trans3(0,0,5) *roty(ang4)  * p_elo4_o;

p_elo5 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b) *roty(ang3c)*roty(ang3d*i)* trans3(0,0,5) *roty(ang4) *trans3(0,0,1) * rotz(ang5)  * p_elo5_o;




pontos_obj = trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b) *roty(ang3c)*roty(ang3d*i)* trans3(0,0,5) *roty(ang4) *trans3(0,0,1)*trans3(-0.5,0,0) * rotz(ang5) * p_obj_o;

obj_face_1=[pontos_obj(:,2) pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,3)];
obj_face_2=[pontos_obj(:,5) pontos_obj(:,6) pontos_obj(:,8) pontos_obj(:,7)];
obj_face_3=[pontos_obj(:,2) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,5)];
obj_face_4=[pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,8) pontos_obj(:,6)];
obj_face_5=[pontos_obj(:,1) pontos_obj(:,2) pontos_obj(:,5) pontos_obj(:,6)];
obj_face_6=[pontos_obj(:,4) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,8)];



 set( F1_obj, 'XData', obj_face_1(1,:), 'YData', obj_face_1(2,:), 'ZData',obj_face_1(3,:));
 set(F2_obj, 'XData', obj_face_2(1,:), 'YData', obj_face_2(2,:),'ZData',obj_face_2(3,:));
 set( F3_obj, 'XData', obj_face_3(1,:), 'YData', obj_face_3(2,:),'ZData',obj_face_3(3,:));
 set( F4_obj, 'XData', obj_face_4(1,:), 'YData', obj_face_4(2,:),'ZData',obj_face_4(3,:));
 set( F5_obj, 'XData', obj_face_5(1,:), 'YData', obj_face_5(2,:),'ZData',obj_face_5(3,:));
 set( F6_obj, 'XData', obj_face_6(1,:), 'YData', obj_face_6(2,:),'ZData',obj_face_6(3,:));


atualizar_robot3(P,p_elo1_o,p_elo2,p_elo3,p_elo4,p_elo5);

pause(0.001)

end


ang2=pi;
ang3=-pi/4;
ang3b=pi/4;
ang3c=-pi/2;
ang3d=pi/2;
ang4=pi/2;
ang5=0;

for i=linspace(0,1,100)



pontos_obj = trans3(0,0,-6.5*i) * trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b) *roty(ang3c)*roty(ang3d)* trans3(0,0,5) *roty(ang4) *trans3(0,0,1)*trans3(-0.5,0,0) * rotz(ang5) * p_obj_o;

obj_face_1=[pontos_obj(:,2) pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,3)];
obj_face_2=[pontos_obj(:,5) pontos_obj(:,6) pontos_obj(:,8) pontos_obj(:,7)];
obj_face_3=[pontos_obj(:,2) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,5)];
obj_face_4=[pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,8) pontos_obj(:,6)];
obj_face_5=[pontos_obj(:,1) pontos_obj(:,2) pontos_obj(:,5) pontos_obj(:,6)];
obj_face_6=[pontos_obj(:,4) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,8)];



 set( F1_obj, 'XData', obj_face_1(1,:), 'YData', obj_face_1(2,:), 'ZData',obj_face_1(3,:));
 set(F2_obj, 'XData', obj_face_2(1,:), 'YData', obj_face_2(2,:),'ZData',obj_face_2(3,:));
 set( F3_obj, 'XData', obj_face_3(1,:), 'YData', obj_face_3(2,:),'ZData',obj_face_3(3,:));
 set( F4_obj, 'XData', obj_face_4(1,:), 'YData', obj_face_4(2,:),'ZData',obj_face_4(3,:));
 set( F5_obj, 'XData', obj_face_5(1,:), 'YData', obj_face_5(2,:),'ZData',obj_face_5(3,:));
 set( F6_obj, 'XData', obj_face_6(1,:), 'YData', obj_face_6(2,:),'ZData',obj_face_6(3,:));



pause(0.001)

end



%inclusao de novo robot

ang2=-pi;
ang3=0;
ang3b=0;
ang3c=0;
ang3d=0;
ang4=-pi/2;
ang4b=pi/2;
ang5=0;


for i=linspace(0,1,100)

p_elo1 = trans3(0,0,-10)* p_elo1_o;

p_elo2 = trans3(0,0,-10)* trans3(0,0,4)*roty(pi/2)* rotx(ang2) * p_elo2_o;

p_elo3 = trans3(0,0,-10) * trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3) * p_elo3_o;

p_elo4 = trans3(0,0,-10)* trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3) * trans3(0,0,5) *roty(ang4)*roty(ang4b*i)  * p_elo4_o;

p_elo5 = trans3(0,0,-10) *trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3) * trans3(0,0,5) *roty(ang4) *roty(ang4b*i)  *trans3(0,0,1) * rotz(ang5)  * p_elo5_o;


pontos_obj = trans3(0,0,-10) * trans3(0,0,4)*roty(pi/2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b) *roty(ang3c)*roty(ang3d)* trans3(0,0,5)*roty(ang4)*roty(ang4b*i) *trans3(0,0,1)*trans3(-0.5,0,0) * rotz(ang5) * p_obj_o;

obj_face_1=[pontos_obj(:,2) pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,3)];
obj_face_2=[pontos_obj(:,5) pontos_obj(:,6) pontos_obj(:,8) pontos_obj(:,7)];
obj_face_3=[pontos_obj(:,2) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,5)];
obj_face_4=[pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,8) pontos_obj(:,6)];
obj_face_5=[pontos_obj(:,1) pontos_obj(:,2) pontos_obj(:,5) pontos_obj(:,6)];
obj_face_6=[pontos_obj(:,4) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,8)];



 set( F1_obj, 'XData', obj_face_1(1,:), 'YData', obj_face_1(2,:), 'ZData',obj_face_1(3,:));
 set( F2_obj, 'XData', obj_face_2(1,:), 'YData', obj_face_2(2,:),'ZData',obj_face_2(3,:));
 set( F3_obj, 'XData', obj_face_3(1,:), 'YData', obj_face_3(2,:),'ZData',obj_face_3(3,:));
 set( F4_obj, 'XData', obj_face_4(1,:), 'YData', obj_face_4(2,:),'ZData',obj_face_4(3,:));
 set( F5_obj, 'XData', obj_face_5(1,:), 'YData', obj_face_5(2,:),'ZData',obj_face_5(3,:));
 set( F6_obj, 'XData', obj_face_6(1,:), 'YData', obj_face_6(2,:),'ZData',obj_face_6(3,:));


atualizar_robot3(P1,p_elo1,p_elo2,p_elo3,p_elo4,p_elo5);

pause(0.001)

end





for i=linspace(0,1,100)
ang2=-pi;
ang2b=pi;
ang3=0;
ang3b=0;
ang3c=0;
ang3d=0;
ang4=-pi/2;
ang4b=pi/2;
ang5=0;

p_elo1 = trans3(0,0,-10)* p_elo1_o;

p_elo2 = trans3(0,0,-10)* trans3(0,0,4)*roty(pi/2)* rotx(ang2)* rotx(ang2*i) * p_elo2_o;

p_elo3 = trans3(0,0,-10) * trans3(0,0,4)*roty(pi/2)* rotx(ang2)* rotx(ang2*i)*trans3(0,0,6) * roty(ang3) * p_elo3_o;

p_elo4 = trans3(0,0,-10)* trans3(0,0,4)*roty(pi/2)* rotx(ang2)* rotx(ang2*i)*trans3(0,0,6) * roty(ang3) * trans3(0,0,5) *roty(ang4)*roty(ang4b)  * p_elo4_o;

p_elo5 = trans3(0,0,-10) *trans3(0,0,4)*roty(pi/2)* rotx(ang2)* rotx(ang2*i)*trans3(0,0,6) * roty(ang3) * trans3(0,0,5) *roty(ang4) *roty(ang4b)  *trans3(0,0,1) * rotz(ang5)  * p_elo5_o;


pontos_obj = trans3(0,0,-10) * trans3(0,0,4)*roty(pi/2)* rotx(ang2)* rotx(ang2*i)*trans3(0,0,6) * roty(ang3)* roty(ang3b) *roty(ang3c)*roty(ang3d)* trans3(0,0,5)*roty(ang4)*roty(ang4b) *trans3(0,0,1)*trans3(-0.5,0,0) * rotz(ang5) * p_obj_o;

obj_face_1=[pontos_obj(:,2) pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,3)];
obj_face_2=[pontos_obj(:,5) pontos_obj(:,6) pontos_obj(:,8) pontos_obj(:,7)];
obj_face_3=[pontos_obj(:,2) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,5)];
obj_face_4=[pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,8) pontos_obj(:,6)];
obj_face_5=[pontos_obj(:,1) pontos_obj(:,2) pontos_obj(:,5) pontos_obj(:,6)];
obj_face_6=[pontos_obj(:,4) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,8)];



 set( F1_obj, 'XData', obj_face_1(1,:), 'YData', obj_face_1(2,:), 'ZData',obj_face_1(3,:));
 set( F2_obj, 'XData', obj_face_2(1,:), 'YData', obj_face_2(2,:),'ZData',obj_face_2(3,:));
 set( F3_obj, 'XData', obj_face_3(1,:), 'YData', obj_face_3(2,:),'ZData',obj_face_3(3,:));
 set( F4_obj, 'XData', obj_face_4(1,:), 'YData', obj_face_4(2,:),'ZData',obj_face_4(3,:));
 set( F5_obj, 'XData', obj_face_5(1,:), 'YData', obj_face_5(2,:),'ZData',obj_face_5(3,:));
 set( F6_obj, 'XData', obj_face_6(1,:), 'YData', obj_face_6(2,:),'ZData',obj_face_6(3,:));


atualizar_robot3(P1,p_elo1,p_elo2,p_elo3,p_elo4,p_elo5);




%atualizar o robot de cima para voltar a posição inicial

ang2=pi;
ang2b=pi;
ang3=-pi/4;
ang3b=pi/4;
ang3c=-pi/2;
ang3d=pi/2;
ang4=pi/2;
ang4b=-pi/2;
ang5=0;


p_elo1 =  p_elo1_o;

p_elo2 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2)*rotx(ang2b*i) * p_elo2_o;

p_elo3 =   trans3(0,0,4)*roty(pi/2)* rotx(ang2)*rotx(ang2b*i)*trans3(0,0,6) * roty(ang3)* roty(ang3b)*roty(ang3c)*roty(ang3d) * p_elo3_o;

p_elo4 =  trans3(0,0,4)*roty(pi/2)* rotx(ang2)*rotx(ang2b*i)*trans3(0,0,6) * roty(ang3)* roty(ang3b)*roty(ang3c)*roty(ang3d) * trans3(0,0,5) *roty(ang4)*roty(ang4b*i)  * p_elo4_o;

p_elo5 =  trans3(0,0,4)*roty(pi/2)*rotx(ang2)*rotx(ang2b*i)*trans3(0,0,6) * roty(ang3)* roty(ang3b) *roty(ang3c)*roty(ang3d)* trans3(0,0,5) *roty(ang4) *roty(ang4b*i)*trans3(0,0,1) * rotz(ang5)  * p_elo5_o;

atualizar_robot3(P,p_elo1_o,p_elo2,p_elo3,p_elo4,p_elo5);

pause(0.001)

end




ang2=-pi;
ang2b=pi;
ang3=0;
ang3b=0;
ang3c=0;
ang3d=0;
ang4=-pi/2;
ang4b=pi/2;
ang4c=pi/2;
ang5=0;


for i=linspace(0,1,100)

p_elo1 = trans3(0,0,-10)* p_elo1_o;

p_elo2 = trans3(0,0,-10)* trans3(0,0,4)*roty(pi/2)* rotx(ang2)* rotx(ang2) * p_elo2_o;

p_elo3 = trans3(0,0,-10) * trans3(0,0,4)*roty(pi/2)* rotx(ang2)* rotx(ang2)*trans3(0,0,6) * roty(ang3) * p_elo3_o;

p_elo4 = trans3(0,0,-10)* trans3(0,0,4)*roty(pi/2)* rotx(ang2)* rotx(ang2)*trans3(0,0,6) * roty(ang3) * trans3(0,0,5) *roty(ang4)*roty(ang4b)*roty(ang4c*i)  * p_elo4_o;

p_elo5 = trans3(0,0,-10) *trans3(0,0,4)*roty(pi/2)* rotx(ang2)* rotx(ang2)*trans3(0,0,6) * roty(ang3) * trans3(0,0,5) *roty(ang4) *roty(ang4b)*roty(ang4c*i)  *trans3(0,0,1) * rotz(ang5)  * p_elo5_o;


pontos_obj = trans3(0,0,-10) * trans3(0,0,4)*roty(pi/2)* rotx(ang2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b) *roty(ang3c)*roty(ang3d)* trans3(0,0,5)*roty(ang4)*roty(ang4b)*roty(ang4c*i) *trans3(0,0,1)*trans3(-0.5,0,0) * rotz(ang5) * p_obj_o;

obj_face_1=[pontos_obj(:,2) pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,3)];
obj_face_2=[pontos_obj(:,5) pontos_obj(:,6) pontos_obj(:,8) pontos_obj(:,7)];
obj_face_3=[pontos_obj(:,2) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,5)];
obj_face_4=[pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,8) pontos_obj(:,6)];
obj_face_5=[pontos_obj(:,1) pontos_obj(:,2) pontos_obj(:,5) pontos_obj(:,6)];
obj_face_6=[pontos_obj(:,4) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,8)];



 set( F1_obj, 'XData', obj_face_1(1,:), 'YData', obj_face_1(2,:), 'ZData',obj_face_1(3,:));
 set( F2_obj, 'XData', obj_face_2(1,:), 'YData', obj_face_2(2,:),'ZData',obj_face_2(3,:));
 set( F3_obj, 'XData', obj_face_3(1,:), 'YData', obj_face_3(2,:),'ZData',obj_face_3(3,:));
 set( F4_obj, 'XData', obj_face_4(1,:), 'YData', obj_face_4(2,:),'ZData',obj_face_4(3,:));
 set( F5_obj, 'XData', obj_face_5(1,:), 'YData', obj_face_5(2,:),'ZData',obj_face_5(3,:));
 set( F6_obj, 'XData', obj_face_6(1,:), 'YData', obj_face_6(2,:),'ZData',obj_face_6(3,:));


atualizar_robot3(P1,p_elo1,p_elo2,p_elo3,p_elo4,p_elo5);

pause(0.001)

end


for i=linspace(0,1,100)



pontos_obj = trans3(0,-3*i,0)*trans3(0,0,-10) * trans3(0,0,4)*roty(pi/2)* rotx(ang2)* rotx(ang2)*trans3(0,0,6) * roty(ang3)* roty(ang3b) *roty(ang3c)*roty(ang3d)* trans3(0,0,5)*roty(ang4)*roty(ang4b)*roty(ang4c) *trans3(0,0,1)*trans3(-0.5,0,0) * rotz(ang5) * p_obj_o;

obj_face_1=[pontos_obj(:,2) pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,3)];
obj_face_2=[pontos_obj(:,5) pontos_obj(:,6) pontos_obj(:,8) pontos_obj(:,7)];
obj_face_3=[pontos_obj(:,2) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,5)];
obj_face_4=[pontos_obj(:,1) pontos_obj(:,4) pontos_obj(:,8) pontos_obj(:,6)];
obj_face_5=[pontos_obj(:,1) pontos_obj(:,2) pontos_obj(:,5) pontos_obj(:,6)];
obj_face_6=[pontos_obj(:,4) pontos_obj(:,3) pontos_obj(:,7) pontos_obj(:,8)];



 set( F1_obj, 'XData', obj_face_1(1,:), 'YData', obj_face_1(2,:), 'ZData',obj_face_1(3,:));
 set( F2_obj, 'XData', obj_face_2(1,:), 'YData', obj_face_2(2,:),'ZData',obj_face_2(3,:));
 set( F3_obj, 'XData', obj_face_3(1,:), 'YData', obj_face_3(2,:),'ZData',obj_face_3(3,:));
 set( F4_obj, 'XData', obj_face_4(1,:), 'YData', obj_face_4(2,:),'ZData',obj_face_4(3,:));
 set( F5_obj, 'XData', obj_face_5(1,:), 'YData', obj_face_5(2,:),'ZData',obj_face_5(3,:));
 set( F6_obj, 'XData', obj_face_6(1,:), 'YData', obj_face_6(2,:),'ZData',obj_face_6(3,:));

pause(0.001)

end


%% 2º Exercício extra
addpath('functions')
clear


figure('Renderer','painters', 'Position', [675 20 675 675])
title('Ex.Extra 2 - Gioconda, de Manipulador Da Vinci')
xlabel('X'); ylabel('Y'); zlabel('Z')
axis ([-12.5 12.506 -14 14 -8.02 11])
view(-107.5,50)
% view(-65,15)
hold on

% Posiciona o pincel na mesa
P_Brush = trans3(0,7,-1.05)*rotx(-pi/2)*Brush();
h3 = DrawBrush(P_Brush);


img = imread('monalisa.jpg');     % Descarregar monalisa
img2 = imread('palete3.jpg');


P_planobranco = [   -12.5   14   -8.01   
                     12.5   14   -8.01
                     12.5  -14   -8.01
                    -12.5  -14   -8.01
                    -12.5   14   -8
                     12.5   14   -8
                     12.5  -14   -8 
                    -12.5  -14   -8 ];
               
P_telabranca = [   12.504     4    9   
                   12.504    -4    9   
                   12.504    -4    0   
                   12.504     4    0   
                   12.503     4    9   
                   12.503    -4    9   
                   12.503    -4    0   
                   12.503     4    0 ];

P_trasmoldura = [  12.505     4    9   
                   12.505    -4    9   
                   12.505    -4    0   
                   12.505     4    0   
                   12.504     4    9   
                   12.504    -4    9   
                   12.504    -4    0   
                   12.504     4    0 ];

P_moldura1 = [  12.5    5    10   
                12.5    4    9   
                12.5    4    0   
                12.5    5   -1   
                12      5    10   
                12.5    4    9   
                12.5    4    0   
                12      5   -1 ];
            
P_moldura2 = [  12.5   -4   9   
                12.5   -5   10   
                12.5   -5   -1   
                12.5   -4   0   
                12.5   -4   9   
                12     -5   10   
                12     -5   -1    
                12.5   -4   0 ];
            
P_moldura3 = [  12       5   10   
                12      -5   10   
                12.5    -4    9   
                12.5     4    9   
                12.5     5   10   
                12.5    -5   10   
                12.5    -4    9    
                12.5     4    9 ];
            
P_moldura4 = [  12.5      4     0   
                12.5     -4     0  
                12.5     -5    -1   
                12.5      5    -1   
                12.5      4     0   
                12.5     -4     0  
                12       -5    -1   
                12        5    -1 ];

P_chao = [  -12.5   14   -8   
             12.5   14   -8
             12.5  -14   -8
            -12.5  -14   -8
            -12.5   14   -7.99
             12.5   14   -7.99
             12.5  -14   -7.99 
            -12.5  -14   -7.99 ];

P_mesa = [  -5   10   -1.5   
             5   10   -1.5
             5  -10   -1.5
            -5  -10   -1.5
            -5   10    -1.05 
             5   10    -1.05
             5  -10    -1.05
            -5  -10    -1.05 ];
        
P_suporte = [  -1   1   -1   
                1   1   -1
                1  -1   -1
               -1  -1   -1
               -1   1    0 
                1   1    0
                1  -1    0 
               -1  -1    0 ];
        
P_perna1 = [ -5   9   -7.98   
             -4   9   -7.98
             -4   8   -7.98
             -5   8   -7.98
             -5   9   -1.5   
             -4   9   -1.5
             -4   8   -1.5
             -5   8   -1.5  ];

       
% Homogeneização dos pontos
P_perna1 = [P_perna1 ones(size(P_perna1,1),1)];

P_perna1 = P_perna1';
P_perna2 = trans3(0,-17,0)*P_perna1;
P_perna3 = trans3(9,-17,0)*P_perna1;
P_perna4 =trans3(9,0,0)*P_perna1;

                       
F_patches = [  1   2   3   4
               5   6   7   8
               1   2   6   5
               1   5   8   4
               3   7   8   4
               2   6   7   3 ];
           
tela_branca = patch('Vertices',P_telabranca,'Faces',F_patches,'Facecolor','#ffffff');       
atras_da_moldura = patch('Vertices',P_trasmoldura,'Faces',F_patches,'Facecolor','#e0e094');       
moldura1 = patch('Vertices',P_moldura1,'Faces',F_patches,'Facecolor','#996633');
moldura2 = patch('Vertices',P_moldura2,'Faces',F_patches,'Facecolor','#996633');
moldura3 = patch('Vertices',P_moldura3,'Faces',F_patches,'Facecolor','#996633');
moldura4 = patch('Vertices',P_moldura4,'Faces',F_patches,'Facecolor','#996633');
chao = patch('Vertices',P_chao,'Faces',F_patches,'Facecolor','#996633');
planobranco = patch('Vertices',P_planobranco,'Faces',F_patches,'Facecolor','#ffffff');
mesa = patch('Vertices',P_mesa,'Faces',F_patches,'Facecolor','#663300');
suporte = patch('Vertices',P_suporte,'Faces',F_patches,'Facecolor','#737373');
perna1 = patch('Vertices',P_perna1(1:3,:)','Faces',F_patches,'Facecolor','#663300');
perna2 = patch('Vertices',P_perna2(1:3,:)','Faces',F_patches,'Facecolor','#663300');
perna3 = patch('Vertices',P_perna3(1:3,:)','Faces',F_patches,'Facecolor','#663300');
perna4 = patch('Vertices',P_perna4(1:3,:)','Faces',F_patches,'Facecolor','#663300');

x = [12.506 12.506]; y = [14 14]; z = [-8 11];
line(x,y,z,'Color','black','LineStyle','-','LineWidth',1)
x = [12.506 12.506]; y = [-14 -14]; z = [-8 11];
line(x,y,z,'Color','black','LineStyle','-','LineWidth',1)

% Comprimentos dos elos
[L1, L2, L3, L4] = deal(4, 6, 5, 1);

 
xImage = [-5 -1.5; -5 -1.5];   % The x data for the image corners
yImage = [10 10; 7 7];             % The y data for the image corners
zImage = [-0.99 -0.99; -0.99 -0.99];   % The z data for the image corners
surf(xImage,yImage,zImage,...    % Plot the surface
     'CData',img2,...
     'FaceColor','texturemap');


% Posição Inicial do manipulador
[theta1, theta2, theta3, theta4] = deal(0, pi/2, -pi/2, pi/2);

% Matriz DH inicial
DH_matrix = [  0            0          0         L1
               theta1         pi/2       L2        0 
               theta2         0          L3        0 
               theta3 + pi/2  pi/2       0         0 
               theta4         0          0         L4 ];

% Hipermatriz de transformação
Hiper_DH = TransLinks(DH_matrix);

% Obtenção da origem de cada um dos referenciais
Ref_Origins = RefOrigins(Hiper_DH);
    
btw_d = GetBTW(DH_matrix);
PGripper = btw_d*OpenGrip();
    
h1 = DrawLinks(Ref_Origins);
h2 = DrawGrip(PGripper);

 

% Posicionamento para pegar no pincel
theta_1 = linspace(theta1,theta1+pi/2,100);
theta_2 = linspace(theta2,theta2-pi,100);
theta_3 = linspace(theta3,theta3+pi,100);
theta_4 = linspace(theta4,theta4+0,100);
pause(0.2)
for i=1:100
    theta1 = theta_1(i);
    theta2 = theta_2(i);
    theta3 = theta_3(i);
    theta4 = theta_4(i);
    
    % Matriz DH inicial
    DH_matrix = [  0            0          0         L1
                 theta1         pi/2       L2        0 
                 theta2         0          L3        0 
                 theta3 + pi/2  pi/2       0         0 
                 theta4         0          0         L4 ];

    % Hipermatriz de transformação
    Hiper_DH = TransLinks(DH_matrix);

    % Obtenção da origem de cada um dos referenciais
    Ref_Origins = RefOrigins(Hiper_DH);
    
    btw_d = GetBTW(DH_matrix);
    PGripper = btw_d*OpenGrip();
    
    h1 = DrawLinks(Ref_Origins,h1);
    h2 = DrawGrip(PGripper, h2);


    pause(0.05)
end
pause(1.5)

PGripper = btw_d*CloseGrip();
h2 = DrawGrip(PGripper, h2);

pause(1)
% view(-107.5,10)
% Sobe com o pincel
theta_1 = linspace(theta1,theta1+pi/8,100);
theta_2 = linspace(theta2,theta2+pi/2,100);
theta_3 = linspace(theta3,theta3,100);
theta_4 = linspace(theta4,theta4,100);
pause(0.2)
for i=1:100
    theta1 = theta_1(i);
    theta2 = theta_2(i);
    theta3 = theta_3(i);
    theta4 = theta_4(i);
    
    % Matriz DH inicial
    DH_matrix = [  0            0          0         L1
                 theta1         pi/2       L2        0 
                 theta2         0          L3        0 
                 theta3 + pi/2  pi/2       0         0 
                 theta4         0          0         L4 ];

    % Hipermatriz de transformação
    Hiper_DH = TransLinks(DH_matrix);

    % Obtenção da origem de cada um dos referenciais
    Ref_Origins = RefOrigins(Hiper_DH);
    
    btw_d = GetBTW(DH_matrix);
    PGripper = btw_d*CloseGrip();
    P_Brush = btw_d*Brush();
    
    h1 = DrawLinks(Ref_Origins,h1);
    h2 = DrawGrip(PGripper, h2);
    h3 = DrawBrush(P_Brush,h3);

    pause(0.01)
end


% Molha o pincel na palete de tinta
theta_1 = linspace(theta1,theta1,100);
theta_2 = linspace(theta2,theta2-pi/6,100);
theta_3 = linspace(theta3,theta3-pi,100);
theta_4 = linspace(theta4,theta4,100);
pause(0.2)
for i=1:100
    theta1 = theta_1(i);
    theta2 = theta_2(i);
    theta3 = theta_3(i);
    theta4 = theta_4(i);
    
    % Matriz DH inicial
    DH_matrix = [  0            0          0         L1
                 theta1         pi/2       L2        0 
                 theta2         0          L3        0 
                 theta3 + pi/2  pi/2       0         0 
                 theta4         0          0         L4 ];

    % Hipermatriz de transformação
    Hiper_DH = TransLinks(DH_matrix);

    % Obtenção da origem de cada um dos referenciais
    Ref_Origins = RefOrigins(Hiper_DH);
    
    btw_d = GetBTW(DH_matrix);
    PGripper = btw_d*CloseGrip();
    P_Brush = btw_d*Brush();
    
    h1 = DrawLinks(Ref_Origins,h1);
    h2 = DrawGrip(PGripper, h2);
    h3 = DrawBrush(P_Brush,h3);

    pause(0.01)
end
pause(0.5)

% Vai para a tela branca para começar a pintar
theta_1 = linspace(theta1,theta1-pi/2-pi/8,100);
theta_2 = linspace(theta2,theta2+pi/6+pi/3-pi/8,100);
theta_3 = linspace(theta3,theta3-pi/4+pi/3,100);
theta_4 = linspace(theta4,theta4,100);
pause(0.2)
for i=1:100
    theta1 = theta_1(i);
    theta2 = theta_2(i);
    theta3 = theta_3(i);
    theta4 = theta_4(i);
    
    % Matriz DH inicial
    DH_matrix = [  0            0          0         L1
                 theta1         pi/2       L2        0 
                 theta2         0          L3        0 
                 theta3 + pi/2  pi/2       0         0 
                 theta4         0          0         L4 ];

    % Hipermatriz de transformação
    Hiper_DH = TransLinks(DH_matrix);

    % Obtenção da origem de cada um dos referenciais
    Ref_Origins = RefOrigins(Hiper_DH);
    
    btw_d = GetBTW(DH_matrix);
    PGripper = btw_d*CloseGrip();
    P_Brush = btw_d*Brush();
    
    h1 = DrawLinks(Ref_Origins,h1);
    h2 = DrawGrip(PGripper, h2);
    h3 = DrawBrush(P_Brush,h3);

    pause(0.01)
end


% Começa a pintar
theta_1 = linspace(theta1,theta1-pi/12,100);
theta_2 = linspace(theta2,theta2,100);
theta_3 = linspace(theta3,theta3+pi/12,100);
theta_4 = linspace(theta4,theta4,100);
pause(0.2)

for i=1:100
    theta1 = theta_1(i);
    theta2 = theta_2(i);
    theta3 = theta_3(i);
    theta4 = theta_4(i);
    
    % Matriz DH inicial
    DH_matrix = [  0            0          0         L1
                 theta1         pi/2       L2        0 
                 theta2         0          L3        0 
                 theta3 + pi/2  pi/2       0         0 
                 theta4         0          0         L4 ];

    % Hipermatriz de transformação
    Hiper_DH = TransLinks(DH_matrix);

    % Obtenção da origem de cada um dos referenciais
    Ref_Origins = RefOrigins(Hiper_DH);
    
    btw_d = GetBTW(DH_matrix);
    PGripper = btw_d*CloseGrip();
    P_Brush = btw_d*Brush();

    h1 = DrawLinks(Ref_Origins,h1);
    hold on
    h2 = DrawGrip(PGripper, h2);
    hold on
    h3 = DrawBrush(P_Brush,h3);
    hold on
    
    Pincel_x = [P_Brush(1,24) P_Brush(1,25)];
    Pincel_y = [P_Brush(2,24) P_Brush(2,25)];
    Pincel_z = [P_Brush(3,24) P_Brush(3,25)];
    linha_pintada(:,:,i) = plot3(Pincel_x,Pincel_y,Pincel_z,'Color','black','LineStyle','-','LineWidth',3);
    hold on

    pause(0.01)
end
pause(1)

delete(linha_pintada)
view(90,270) % Vista xy


t = text(0, -10, -8.02, "4 anos mais tarde...", 'FontSize',30);
pause(1)
delete(t)
view(-60,50)

% Começa a pintar
theta_1 = linspace(theta1,theta1+7*pi/12,100);
theta_2 = linspace(theta2,theta2-pi/2-pi/3+pi/8,100);
theta_3 = linspace(theta3,theta3+pi+pi/4-pi/3-pi/12,100);
theta_4 = linspace(theta4,theta4,100);


xImage = [12.5 12.5; 12.5 12.5];   % The x data for the image corners
yImage = [-4 4; -4 4];             % The y data for the image corners
zImage = [9 9; 0 0];   % The z data for the image corners
surf(xImage,yImage,zImage,...    % Plot the surface
     'CData',img,...
     'FaceColor','texturemap')
for i=1:100
    theta1 = theta_1(i);
    theta2 = theta_2(i);
    theta3 = theta_3(i);
    theta4 = theta_4(i);
    
    % Matriz DH inicial
    DH_matrix = [  0            0          0         L1
                 theta1         pi/2       L2        0 
                 theta2         0          L3        0 
                 theta3 + pi/2  pi/2       0         0 
                 theta4         0          0         L4 ];

    % Hipermatriz de transformação
    Hiper_DH = TransLinks(DH_matrix);

    % Obtenção da origem de cada um dos referenciais
    Ref_Origins = RefOrigins(Hiper_DH);
    
    btw_d = GetBTW(DH_matrix);
    PGripper = btw_d*CloseGrip();
    P_Brush = btw_d*Brush();

    h1 = DrawLinks(Ref_Origins,h1);
    h2 = DrawGrip(PGripper, h2);
    h3 = DrawBrush(P_Brush,h3);

    pause(0.01)
end

pause(1)
% Abre as garras
PGripper = btw_d*OpenGrip();
h2 = DrawGrip(PGripper, h2);

pause(1)

theta_1 = linspace(theta1,theta1,100);
theta_2 = linspace(theta2,theta2+pi/2,100);
theta_3 = linspace(theta3,theta3-pi/2,100);
theta_4 = linspace(theta4,theta4+pi/2,100);

for i=1:100
    theta1 = theta_1(i);
    theta2 = theta_2(i);
    theta3 = theta_3(i);
    theta4 = theta_4(i);
    
    % Matriz DH inicial
    DH_matrix = [  0            0          0         L1
                 theta1         pi/2       L2        0 
                 theta2         0          L3        0 
                 theta3 + pi/2  pi/2       0         0 
                 theta4         0          0         L4 ];

    % Hipermatriz de transformação
    Hiper_DH = TransLinks(DH_matrix);

    % Obtenção da origem de cada um dos referenciais
    Ref_Origins = RefOrigins(Hiper_DH);
    
    btw_d = GetBTW(DH_matrix);
    PGripper = btw_d*OpenGrip();

    h1 = DrawLinks(Ref_Origins,h1);
    h2 = DrawGrip(PGripper, h2);

    pause(0.01)
end
pause(1.5)
% Animação para mostrar o quadro:
x=85;
for i=-60:5:290
    x=x-1;
    view(i,x)
    pause(0.08)
end
