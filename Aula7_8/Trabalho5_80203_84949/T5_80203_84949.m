% Trabalho 5 - Cinemática direta e inversa de um manipulador FANUC
% Daniel Coelho       nºmec.84949
% Miguel Pina         nºmec.80203

% ------------------------------------------------------------------------
% ----------- 1.Identificação da cinemática direta e simulação -----------
% ------------------------------------------------------------------------
%% Ex1 alínea a)
% Feito num documento PowerPoint à parte

%% Ex1 alínea b)
clear
clc
addpath('functions')

% Espaços de juntas e cartesiano para a alínea b)
[theta1, theta2, theta3, theta4, theta5, theta6] = deal(0);
[DH, r_0] = Joint2Cart(theta1,theta2,theta3,theta4,theta5,theta6);

% Janela apenas para mostrar os resultados obtidos nas alíneas
hF=figure; set(hF,...
               'color',[1 1 1],...
               'Position', [0 20 675 675],...
               'Name','Folha de Resultados do exercício 1.b)')
hA=axes; set(hA,...
             'color',[1 1 1],...
             'visible','off')

% alínea b) na folha de cálculo   
text(-0.16,1.05,'Exercício 1.b)',...
     'FontSize',20,...
     'FontWeight','bold')
text(-0.12,0.95,strcat('- Espaço de juntas q_{0}:'),...
     'FontSize',18)
text(-0.07,0.86,strcat('q_{0} = [ \theta_{1} \theta_{2} \theta_{3} \theta_{4} \theta_{5} \theta_{6} ]^{T} =  ' , Matrix2String([0 0 0 0 0 0]) , '^{T}'),...
     'FontSize',14)
text(-0.12,0.70,strcat('- Espaço cartesiano r_{0} associado a q_{0}:'),...
     'FontSize',18)
text(-0.07,0.61,strcat('r_{0} = [ x_{t} y_{t} z_{t}  \phi  \theta  \psi ]^{T} =  ' , Matrix2String(r_0) , '^{T}'),...
     'FontSize',14)
 
 
% Modelação
% ---------
% Janela apenas para mostrar os resultados obtidos nas alíneas
hF=figure; set(hF,...
               'color',[1 1 1],...
               'Position', [675 20 675 675],...
               'Name','Modelação do exercício 1.b)')
title('b) Representação do modelo do manipulador')
xlabel('X'); ylabel('Y'); zlabel('Z')
axis equal
view(3)
hold on; grid on

% Hipermatriz de transformação
  Hiper_DH = TransLinks(DH);
   
% Desenha os elos
   [~]=drawLinks(Hiper_DH);
   
% Desenha Gripper
  otg = GetOTG(DH);
  PGripper = 50*OpenGrip();
  PGripper(end,1:end)=1;
  PGripper = otg*PGripper;
  [~] = DrawGrip(PGripper);
  
  
%Desenhar os eixos
  eixos;
  desenhar_eixos(Pi,Hiper_DH);


pause(3)

%% Ex1 alínea c)
clear
clc
addpath('functions')

% Espaços de juntas e cartesiano para a alínea c)
[theta1, theta2, theta3, theta4, theta5, theta6] = deal(35, 0, -40, 0, 50, 0);
[DH, r_1] = Joint2Cart(theta1,theta2,theta3,theta4,theta5,theta6);

% Janela apenas para mostrar os resultados obtidos nas alíneas
hF=figure; set(hF,...
               'color',[1 1 1],...
               'Position', [0 20 675 675],...
               'Name','Folha de Resultados do exercício 1.c)')
hA=axes; set(hA,...
             'color',[1 1 1],...
             'visible','off')
         
 % alínea c) na folha de cálculo   
text(-0.16,1.05,'Exercício 1.c)',...
     'FontSize',20,...
     'FontWeight','bold')
text(-0.12,0.95,strcat('- Espaço de juntas q_{1}:'),...
     'FontSize',18)
text(-0.07,0.86,strcat('q_{1} = [ \theta_{1} \theta_{2} \theta_{3} \theta_{4} \theta_{5} \theta_{6} ]^{T} =  ' , Matrix2String([35, 0, -40, 0, 50, 0]) , '^{T}'),...
     'FontSize',14)
text(-0.12,0.70,strcat('- Espaço cartesiano r_{1} associado a q_{1}:'),...
     'FontSize',18)
text(-0.07,0.61,strcat('r_{1} = [ x_{t} y_{t} z_{t}  \phi  \theta  \psi ]^{T} =  ' , Matrix2String(r_1) , '^{T}'),...
     'FontSize',14)
 
% Modelação
% ---------
% Janela apenas para mostrar os resultados obtidos nas alíneas
hF=figure; set(hF,...
               'color',[1 1 1],...
               'Position', [675 20 675 675],...
               'Name','Modelação do exercício 1.c)')
title('c) Representação do modelo do manipulador')
xlabel('X'); ylabel('Y'); zlabel('Z')
axis equal
view(3)
hold on; grid on

% Hipermatriz de transformação
  Hiper_DH = TransLinks(DH);
   
% Desenha os elos
   [~]=drawLinks(Hiper_DH);
   
% Desenha Gripper
  otg = GetOTG(DH);
  PGripper = 50*OpenGrip();
  PGripper(end,1:end)=1;
  PGripper = otg*PGripper;
  [~] = DrawGrip(PGripper);
 
pause(3)

%% Ex1 alínea d)
clear
clc
addpath('functions')

% Espaços de juntas e cartesiano para a alínea d)
[theta1, theta2, theta3, theta4, theta5, theta6] = deal(35, -40, 0, 0, 50, 0);
[DH, r_2] = Joint2Cart(theta1,theta2,theta3,theta4,theta5,theta6);

% Janela apenas para mostrar os resultados obtidos nas alíneas
hF=figure; set(hF,...
               'color',[1 1 1],...
               'Position', [0 20 675 675],...
               'Name','Folha de Resultados do exercício 1.d)')
hA=axes; set(hA,...
             'color',[1 1 1],...
             'visible','off')

 % alínea d) na folha de cálculo   
text(-0.16,1.05,'Exercício 1.d)',...
     'FontSize',20,...
     'FontWeight','bold')
text(-0.12,0.95,strcat('- Espaço de juntas q_{2}:'),...
     'FontSize',18)
text(-0.07,0.86,strcat('q_{2} = [ \theta_{1} \theta_{2} \theta_{3} \theta_{4} \theta_{5} \theta_{6} ]^{T} =  ' , Matrix2String([35, -40, 0, 0, 50, 0]) , '^{T}'),...
     'FontSize',14)
text(-0.12,0.70,strcat('- Espaço cartesiano r_{2} associado a q_{2}:'),...
     'FontSize',18)
text(-0.07,0.61,strcat('r_{2} = [ x_{t} y_{t} z_{t}  \phi  \theta  \psi ]^{T} =  ' , Matrix2String(r_2) , '^{T}'),...
     'FontSize',14)
 
 
% Modelação
% ---------
% Janela apenas para mostrar os resultados obtidos nas alíneas
hF=figure; set(hF,...
               'color',[1 1 1],...
               'Position', [675 20 675 675],...
               'Name','Modelação do exercício 1.d)')
title('d) Representação do modelo do manipulador')
xlabel('X'); ylabel('Y'); zlabel('Z')
axis equal
view(3)
hold on; grid on

% Hipermatriz de transformação
  Hiper_DH = TransLinks(DH);
   
% Desenha os elos
   [~]=drawLinks(Hiper_DH);
   
% Desenha Gripper
  otg = GetOTG(DH);
  PGripper = 50*OpenGrip();
  PGripper(end,1:end)=1;
  PGripper = otg*PGripper;
  [~] = DrawGrip(PGripper);
 
pause(3)
%% alínea e)
clear
clc
addpath('functions')

 % Espaços de juntas e cartesianos inicial e final para a alínea e)
[theta1, theta2, theta3, theta4, theta5, theta6] = deal(105, 60, -30, 120, -20, 40);
[DHi, r_i] = Joint2Cart(theta1,theta2,theta3,theta4,theta5,theta6);

[theta1, theta2, theta3, theta4, theta5, theta6] = deal(15, -30, -30, 20, -20, 165);
[DHf, r_f] = Joint2Cart(theta1,theta2,theta3,theta4,theta5,theta6);
 

% Janela apenas para mostrar os resultados obtidos nas alíneas
hF=figure; set(hF,...
               'color',[1 1 1],...
               'Position', [0 20 675 675],...
               'Name','Folha de Resultados do exercício 1.e)')
hA=axes; set(hA,...
             'color',[1 1 1],...
             'visible','off')

 % alínea e) na folha de cálculo   
text(-0.16,1.05,'Exercício 1.e)',...
     'FontSize',20,...
     'FontWeight','bold')
text(-0.12,0.95,strcat('- Espaços de juntas q_{i} e q_{f}:'),...
     'FontSize',18)
text(-0.07,0.85,strcat('q_{i} = [ \theta_{1} \theta_{2} \theta_{3} \theta_{4} \theta_{5} \theta_{6} ]^{T} =  ' , Matrix2String([105, 60, -30, 120, -20, 40]) , '^{T}'),...
     'FontSize',14)
text(-0.07,0.75,strcat('q_{f} = [ \theta_{1} \theta_{2} \theta_{3} \theta_{4} \theta_{5} \theta_{6} ]^{T} =  ' , Matrix2String([15, -30, -30, 20, -20, 165]) , '^{T}'),...
     'FontSize',14)
text(-0.12,0.55,strcat('- Espaços cartesianos r_{i} e r_{f} associados a q_{i} e q_{f}:'),...
     'FontSize',18)
text(-0.07,0.45,strcat('r_{i} = [ x_{t} y_{t} z_{t}  \phi  \theta  \psi ]^{T} =  ' , Matrix2String(r_i) , '^{T}'),...
     'FontSize',14)
text(-0.07,0.35,strcat('r_{f} = [ x_{t} y_{t} z_{t}  \phi  \theta  \psi ]^{T} =  ' , Matrix2String(r_f) , '^{T}'),...
     'FontSize',14)


% Modelação
% ---------
% Janela apenas para mostrar os resultados obtidos nas alíneas
hF=figure; set(hF,...
               'color',[1 1 1],...
               'Position', [675 20 675 675],...
               'Name','Modelação do exercício 1.e)')
title('e) Representação do movimento do manipulador')
xlabel('X'); ylabel('Y'); zlabel('Z')
axis equal
view(3)
hold on; grid on

% Hipermatriz de transformação
  Hiper_DHi = TransLinks(DHi);
   
% Desenha os elos
   h=drawLinks(Hiper_DHi);
 
  hold on
  
  % Desenha Gripper
  otg = GetOTG(DHi);
  PGripper = 50*OpenGrip();
  PGripper(end,1:end)=1;
  PGripper = otg*PGripper;
  h_g = DrawGrip(PGripper);
  
  hold on
  h1 = drawLinks(Hiper_DHi);
  hold on
  hg1 = DrawGrip(PGripper);
  hold on
  
  theta1 = linspace(105,15,100);
  theta2 = linspace(60,-30,100);
  theta3 = linspace(-30,-30,100);
  theta4 = linspace(120,20,100);
  theta5 = linspace(-20,-20,100);
  theta6 = linspace(40,165,100);
  
  for i=1:100
        
      theta_1 = theta1(i); 
      theta_2 = theta2(i);
      theta_3 = theta3(i);
      theta_4 = theta4(i);
      theta_5 = theta5(i);
      theta_6 = theta6(i);
      
      [DHf,~] = Joint2Cart(theta_1,theta_2,theta_3,theta_4,theta_5,theta_6);
      
      Hiper_DHf = TransLinks(DHf);
      hold on
      h2 = drawLinks(Hiper_DHf,h);
      
      otg = GetOTG(DHf);
      PGripper = 50*OpenGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      h_g = DrawGrip(PGripper,h_g);
      
      hold on
      
      pause(0.02)
  end
  
  
  
%% ------------------------------------------------------------------------
%  --------- 2. Identificaçãoo da cinemática inversa e simulação ----------
%  ------------------------------------------------------------------------

% Ex2 alínea a)

%--------------------------------------------------------------------------
%Feito num power point á parte
%Aqui está presente a forma de como se chegou ás soluções
%--------------------------------------------------------------------------

% clear all
% addpath('functions')
% 
% %Redundancias possiveis:
% 
% red_theta2=1;
% red_theta3=-1;
% red_theta5=1;
% 
% 
% syms n1 s1 a1 n2 s2 a2 n3 s3 a3
% syms PWx
% syms PWy
% syms PWz
% 
% La=0;
% syms Lb;syms Lc;syms Ld;syms Le;syms Lf;
% syms theta [1 6]
% 
% 
% % Matriz DH do FANUC
% DH_matrix = [theta1+pi/2 pi/2  0  La
%              pi/2        pi/2  0  Lb
%              theta2      pi    Lc 0 
%              theta3      pi/2  Ld 0 
%              0           pi    0  Le 
%              theta4      pi/2  0  0
%              theta5      -pi/2 0  0
%              theta6      pi    0  -Lf];
%          
% 
% 
% % Hipermatriz de transformação
%  Hiper_DH = TransLinks(DH_matrix);
%  
%  % Obtenção do BTW
%  BTW = GetBTW(DH_matrix);
% 
% 
% %CINEMATICA INVERSA
% 
% %Considerando apenas os 3 primeiros thetas
% %--------------------------------------------------------------------------
% 
% %Apenas vamos buscar as transformações que contenham os 3 primeiros thetas
% 
% T_1_5=1;
% for i=1:1:5
%     
%     T_1_5 = T_1_5 * Hiper_DH(:,:,i);
% end
% 
% 
% %É atraves de T_1_5 que vamos descobrir theta1,theta2,theta3
% 
% T_1_5=simplify(T_1_5);
% pwx=T_1_5(1,4);
% pwy=T_1_5(2,4);
% pwz=T_1_5(3,4);
% 
% %Calculo de theta1
% 
% theta1_sim = atan2(PWy,PWx);
% 
% %Calculo de theta3
% %--------------------------------------------------------------------------
% %por causa de numeros imaginarios, ele nao simplica sempre os expoentes

% %--------------------------------------------------------------------------
% %--------------------------------------------------------------------------
% %--------------------------------------------------------------------------
% %usando a equaçao transcendental
%  eq_theta3=simplify((sqrt(pwx^2+pwy^2)-Lb)^2+pwz^2,'IgnoreAnalyticConstraints', true);
%  a=2*Lc*Ld;
%  b=2*Lc*Le;
%  c1=(sqrt(PWx^2+PWy^2)-Lb)^2+PWz^2-Lc^2-Ld^2-Le^2;
%  
%  theta3_sim=2*atan2((b+red_theta3*sqrt(a^2+b^2-c1^2)),(a+c1));
% %--------------------------------------------------------------------------
% %--------------------------------------------------------------------------
% %--------------------------------------------------------------------------
% 
% % 
% % 
% % % instead of T1 * T2 * T3 * T4 * T5 = T_final ---->
% % %----> T2 * T3 * T4 * T5 = inv(T1) * T_final
% % 
% % syms r11 r12 r13 r21 r22 r23 r31 r32 r33 ppx ppy ppz
% % 
% %  T_final=[r11 r12 r12 ppx;r21 r22 r23 ppy;r31 r32 r33 ppz;0 0 0 1];
% % % 
% % % 
% %  T1=Hiper_DH(:,:,1);
% %  T2=Hiper_DH(:,:,2);
% %  T3=Hiper_DH(:,:,3);
% %  T4=Hiper_DH(:,:,4);
% %  T5=Hiper_DH(:,:,5);
% % % 
% % 
% %  simplify(T2*T3*T4*T5);
% %  b=ans(2,4);
% %  c=ans(3,4);
% %  simplify(b^2+(c-Lb)^2);
% %  %Lc^2 + 2*cos(theta3)*Lc*Ld + 2*sin(theta3)*Lc*Le + Ld^2 + Le^2
% % % 
% %  simplify(inv(T1)*T_final);
% %  b1=ans(2,4);
% %  c1=ans(3,4);
% %  simplify(b1^2+(c1-Lb)^2);
% %  %(ppx*cos(theta1) - Lb + ppy*sin(theta1))^2 + ppz^2
% % 
% % 
% %  %Juntando a equação anterior verificamos que temos uma equação que só
% %  %depende de theta3, possivel de ser solucionada com base numa equaçao
% %  %transcendente
% %  
% %  A=2*Lc*Ld;
% %  B=2*Lc*Le;
% %  C=(PWx*cos(theta1_sim) - Lb + PWy*sin(theta1_sim))^2 + PWz^2 - Lc^2 - Ld^2 - Le^2;
% % % 
% %  theta3_sim=2*atan2((B-red_theta3*sqrt(B^2+A^2-C^2)),A+C);
% % 
% 
% 
% %-----------------------------------------------------------------------------------------------
% %Calculo do theta2
% %Copiar eq do prof mas composta, a ele falta o Lb
% 
%  
% %Neste caso usa-se a equaçao normal. T1 * T2 * T3 * T4 * T5 = T_final
% 
% %sqrt(PWx^2+PWy^2) - Lb  --> cos(theta2), mas com sin(theta2) la pelo meio
% %PWz --> sin(theta2) , mas cos(theta2) la pelo meio
% 
% %Substituindo uma na outra conseguimos ter os 2 valores de forma
% %independente
% 
% %Usou-se umas constantes para nao tornar as equaçoes demasiado grandes
% 
% 
% 
% simplify(sqrt(pwx^2+pwy^2)-Lb,'IgnoreAnalyticConstraints', true);
% 
% 
% const1 = Lc + Ld*cos(theta3_sim) + Le*sin(theta3_sim);
% const2 = Le*cos(theta3_sim) - Ld*sin(theta3_sim);
% 
% cos_theta2_sim = ( const2 *(red_theta2 * sqrt(PWx^2+PWy^2) - Lb) + const1*PWz) / (const1^2+const2^2);
% 
% sin_theta2_sim = ( const1 * const2 *(red_theta2 * sqrt(PWx^2+PWy^2) - Lb) - const2^2*PWz)/(const2*const1^2 + const2^3);
% 
% theta2_sim = atan2(sin_theta2_sim,cos_theta2_sim);
% %------------------------------------------------------------------------------------
% %Considerando apenas os 3 ultimos thetas
% %--------------------------------------------------------------------------
% 
% 
% T_6_8=1;
% for i=6:1:8
%     
%     T_6_8 = T_6_8 * Hiper_DH(:,:,i);
% end
% 
% T_6_8;
% 
% 
% 
% nn1=T_6_8(1,1);
% nn2=T_6_8(2,1);
% nn3=T_6_8(3,1);
% ss1=T_6_8(1,2);
% ss2=T_6_8(2,2);
% ss3=T_6_8(3,2);
% aa1=T_6_8(1,3);
% aa2=T_6_8(2,3);
% aa3=T_6_8(3,3);
% 
% 
% %Calculo do theta5
% 
% %sin_theta5=simplify((red_theta5*sqrt(aa1^2+aa2^2)),'IgnoreAnalyticConstraints', true);
% sin_theta5=simplify((red_theta5*sqrt(nn3^2+ss3^2)),'IgnoreAnalyticConstraints', true);
% cos_theta5=-aa3;
% 
% theta5_sim=atan2(sin_theta5,cos_theta5);
% 
% %Calculo do theta4
% theta4_sim=atan2(aa2,aa1);
% 
% 
% %Calculo do theta6
% 
% theta6_sim=atan2(ss3,nn3);



%% Ex2 alínea b)
clc
clear all
addpath('functions')
% figure;

%Nesta alinea é pegar nas equaçoes finais anteriores e experimentar

red_theta2=1;
red_theta3=-1;
red_theta5=1;

red=[red_theta2,red_theta3,red_theta5];
        
                

PONTO1=[680.023 -0.020 460.001 -81.774 -89.994 -98.227];
%JUNTAS=[0 0 0 0 0 0]

PONTO5=[445.116 107.171 108.533 -169.968 40.546 -159.931];
%JUNTAS=[15.002 -30 -30 20 -20 165]

PONTO2=[526.013 368.339 177.570 -0.034 -80.003 -144.968];
%JUNTAS=[35 0 -40 0 50 0]

PONTO3=[338.189 236.811 452.391 0 -40 -144.991];
%JUNTAS=[35 -40 0 0 50 0]

PONTO4=[-223.537 948.563 19.427 147.751 67.644 -127.533];
%JUNTAS=[105 60 -30 120 -20 40]


 [theta1_1,theta2_1,theta3_1,theta4_1,theta5_1,theta6_1]=Cart2Joint(PONTO1,red_theta2,red_theta3,red_theta5);
 [theta1_2,theta2_2,theta3_2,theta4_2,theta5_2,theta6_2]=Cart2Joint(PONTO2,red_theta2,red_theta3,red_theta5);
 [theta1_3,theta2_3,theta3_3,theta4_3,theta5_3,theta6_3]=Cart2Joint(PONTO3,red_theta2,red_theta3,red_theta5);
 [theta1_4,theta2_4,theta3_4,theta4_4,theta5_4,theta6_4]=Cart2Joint(PONTO4,red_theta2,red_theta3,red_theta5);
 [theta1_5,theta2_5,theta3_5,theta4_5,theta5_5,theta6_5]=Cart2Joint(PONTO5,red_theta2,red_theta3,red_theta5);

screensize = get( groot, 'Screensize' );


% Janela apenas para mostrar os resultados obtidos nas alíneas

hF=figure; set(hF,...
               'color',[1 1 1],...
               'units','normalized','outerposition',[0 0 1 1],...
               'Name','Folha de Resultados do exercício 2.b)')
hA=axes; set(hA,...
             'color',[1 1 1],...
             'visible','off')

 % alínea b) na folha de cálculo   
text(-0.16,1.05,'Exercício 2.b)',...
     'FontSize',15,...
     'FontWeight','bold')
text(-0.12,1,strcat('- Espaços de Redundâncias = ' , Matrix2String(red)),...
     'FontSize',13)
 
 text(-0.12,0.90,strcat('Ex 1.b)'),...
     'FontSize',13,'FontWeight','bold')
 
text(-0.15,0.80,strcat('[ x_{t} y_{t} z_{t}  \phi  \theta  \psi ]^{T} =  ' , Matrix2String(PONTO1) , '^{T} \Rightarrow [ \theta_{1} \theta_{2} \theta_{3} \theta_{4} \theta_{5} \theta_{6} ]^{T} =  ' , Matrix2String([round(theta1_1,2), round(theta2_1,2), round(theta3_1,2),round(theta4_1,2),round(theta5_1,2),round(theta6_1,2)]) , '^{T}'),...
     'FontSize',14)
 
  text(-0.12,0.70,strcat('Ex 1.c)'),...
     'FontSize',13,'FontWeight','bold')
 
 text(-0.15,0.60,strcat('[ x_{t} y_{t} z_{t}  \phi  \theta  \psi ]^{T} =  ' , Matrix2String(PONTO2) , '^{T} \Rightarrow [ \theta_{1} \theta_{2} \theta_{3} \theta_{4} \theta_{5} \theta_{6} ]^{T} =  ' , Matrix2String([round(theta1_2,2), round(theta2_2,2), round(theta3_2,2),round(theta4_2,2),round(theta5_2,2),round(theta6_2,2)]) , '^{T}'),...
     'FontSize',14)
 
   text(-0.12,0.50,strcat('Ex 1.d)'),...
     'FontSize',13,'FontWeight','bold')
 
 text(-0.15,0.40,strcat('[ x_{t} y_{t} z_{t}  \phi  \theta  \psi ]^{T} =  ' , Matrix2String(PONTO3) , '^{T} \Rightarrow [ \theta_{1} \theta_{2} \theta_{3} \theta_{4} \theta_{5} \theta_{6} ]^{T} =  ' , Matrix2String([round(theta1_3,2), round(theta2_3,2), round(theta3_3,2),round(theta4_3,2),round(theta5_3,2),round(theta6_3,2)]) , '^{T}'),...
     'FontSize',14)
 
   text(-0.12,0.30,strcat('Ex 1.e)'),...
     'FontSize',13,'FontWeight','bold')
 
 text(-0.15,0.20,strcat('[ x_{t} y_{t} z_{t}  \phi  \theta  \psi ]^{T} =  ' , Matrix2String(PONTO4) , '^{T} \Rightarrow [ \theta_{1} \theta_{2} \theta_{3} \theta_{4} \theta_{5} \theta_{6} ]^{T} =  ' , Matrix2String([round(theta1_4,2), round(theta2_4,2), round(theta3_4,2),round(theta4_4,2),round(theta5_4,2),round(theta6_4,2)]) , '^{T}'),...
     'FontSize',14)
 
  text(-0.15,0.10,strcat('[ x_{t} y_{t} z_{t}  \phi  \theta  \psi ]^{T} =  ' , Matrix2String(PONTO5) , '^{T} \Rightarrow [ \theta_{1} \theta_{2} \theta_{3} \theta_{4} \theta_{5} \theta_{6} ]^{T} =  ' , Matrix2String([round(theta1_5,2), round(theta2_5,2), round(theta3_5,2),round(theta4_5,2),round(theta5_5,2),round(theta6_5,2)]) , '^{T}'),...
     'FontSize',14)
 
 
 
 
%  
% text(-0.07,0.85,strcat('q_{i} = [ \theta_{1} \theta_{2} \theta_{3} \theta_{4} \theta_{5} \theta_{6} ]^{T} =  ' , Matrix2String([105, 60, -30, 120, -20, 40]) , '^{T}'),...
%      'FontSize',14)
% text(-0.07,0.75,strcat('q_{f} = [ \theta_{1} \theta_{2} \theta_{3} \theta_{4} \theta_{5} \theta_{6} ]^{T} =  ' , Matrix2String([15, -30, -30, 20, -20, 165]) , '^{T}'),...
%      'FontSize',14)
% text(-0.12,0.55,strcat('- Espaços cartesianos r_{i} e r_{f} associados a q_{i} e q_{f}:'),...
%      'FontSize',18)
% 
% text(-0.07,0.35,strcat('r_{f} = [ x_{t} y_{t} z_{t}  \phi  \theta  \psi ]^{T} =  ' , Matrix2String(r_f) , '^{T}'),...
%      'FontSize',14)



pause(4)

%% Ex2 alinea c)
clear
clc
addpath('functions')

hF=figure('Renderer','painters', 'Position', [0 20 675 675]);
xlabel('X'); ylabel('Y'); zlabel('Z')
lighting phong %some nice lighting
% shading interp %remove grid and smoothen the surface color
axis equal %takes care of display in the right proportion
axis([-22 22 -15 32 0 30]) %give some more axis space (for the snow later)
axis equal off
% view(-37.5,30)
view(-120,28)
hold on
title('Ex.2.c) Pick and place')%self explaining

 [xr1,yr1,zr1] = deal(0,25,8); % Translação a aplicar sempre ao robô
 [xr2,yr2,zr2] = deal(0,2,8); % Translação a aplicar sempre ao robô


P_chao = [  -22   32    0   
             22   32    0
             22  -15    0
            -22  -15    0
            -22   32   0.01
             22   32   0.01
             22  -15   0.01 
            -22  -15   0.01 ];

F_patches = [  1   2   3   4
               5   6   7   8
               1   2   6   5
               1   5   8   4
               3   7   8   4
               2   6   7   3 ];
           
chao = patch('Vertices',P_chao,'Faces',F_patches,'Facecolor','#ccccff');

  
% Modelação
% =========
P_mesa1 = [  -15   30   5  
             -6    30   5
             -6    20   5
             -15   20   5
             -15   30   5.5 
             -6    30   5.5
             -6    20   5.5
             -15   20   5.5 ];
         
P_mesa2 = [  -5   18   5  
              4   18   5
              4    8   5
             -5    8   5
             -5   18   5.5 
              4   18   5.5
              4    8   5.5
             -5    8   5.5 ];
         
F_mesa = [     1   2   3   4
               5   6   7   8
               1   2   6   5
               1   5   8   4
               3   7   8   4
               2   6   7   3 ];
           
P_perna1_m1 = [ -6.5   30    0.05    
                -6     30    0.05
                -6    29.5   0.05
                -6.5  29.5   0.05
                -6.5   30    5   
                -6     30    5
                -6    29.5   5
                -6.5  29.5   5    ];

P_perna1_m1 = [P_perna1_m1 ones(size(P_perna1_m1,1),1)];

P_perna1_m1 = P_perna1_m1';
P_perna2_m1 = trans3(0,-9.5,0)*P_perna1_m1;
P_perna3_m1 = trans3(-8.5,-9.5,0)*P_perna1_m1;
P_perna4_m1 =trans3(-8.5,0,0)*P_perna1_m1;

P_perna1_m2 = trans3(10,-12,0)*P_perna1_m1;
P_perna2_m2 = trans3(0,-9.5,0)*P_perna1_m2;
P_perna3_m2 = trans3(-8.5,-9.5,0)*P_perna1_m2;
P_perna4_m2 =trans3(-8.5,0,0)*P_perna1_m2;


mesa1 = patch('Vertices',P_mesa1,'Faces',F_mesa,'Facecolor','#ffe680');
mesa2 = patch('Vertices',P_mesa2,'Faces',F_mesa,'Facecolor','#ffe680');

perna1_m1 = patch('Vertices',P_perna1_m1(1:3,:)','Faces',F_mesa,'Facecolor','#ffe680');
perna2_m1 = patch('Vertices',P_perna2_m1(1:3,:)','Faces',F_mesa,'Facecolor','#ffe680');
perna3_m1 = patch('Vertices',P_perna3_m1(1:3,:)','Faces',F_mesa,'Facecolor','#ffe680');
perna4_m1 = patch('Vertices',P_perna4_m1(1:3,:)','Faces',F_mesa,'Facecolor','#ffe680');
  
perna1_m2 = patch('Vertices',P_perna1_m2(1:3,:)','Faces',F_mesa,'Facecolor','#ffe680');
perna2_m2 = patch('Vertices',P_perna2_m2(1:3,:)','Faces',F_mesa,'Facecolor','#ffe680');
perna3_m2 = patch('Vertices',P_perna3_m2(1:3,:)','Faces',F_mesa,'Facecolor','#ffe680');
perna4_m2 = patch('Vertices',P_perna4_m2(1:3,:)','Faces',F_mesa,'Facecolor','#ffe680');
  

% Estante
% -------
P_perna1_e  = [ 14.9   -6.1    0.05    
                16.1   -6.1    0.05
                16.1   -4.9    0.05
                14.9   -4.9    0.05
                14.9   -6.1    4.99   
                16.1   -6.1    4.99
                16.1   -4.9    4.99
                14.9   -4.9    4.99    ];
            
            
P_perna1_e = [P_perna1_e ones(size(P_perna1_e,1),1)];

P_perna1_e = P_perna1_e';
P_perna2_e = trans3(0,-7,0)*P_perna1_e;
P_perna3_e = trans3(-32,-7,0)*P_perna1_e;
P_perna4_e =trans3(-32,0,0)*P_perna1_e;

perna1_e = patch('Vertices',P_perna1_e(1:3,:)','Faces',F_mesa,'Facecolor','#8c8c8c');
perna2_e = patch('Vertices',P_perna2_e(1:3,:)','Faces',F_mesa,'Facecolor','#8c8c8c');
perna3_e = patch('Vertices',P_perna3_e(1:3,:)','Faces',F_mesa,'Facecolor','#8c8c8c');
perna4_e = patch('Vertices',P_perna4_e(1:3,:)','Faces',F_mesa,'Facecolor','#8c8c8c');
  

P_perna1_e  = [ 14.9   -6.1    5.505  
                16.1   -6.1    5.505
                16.1   -4.9    5.505
                14.9   -4.9    5.505
                14.9   -6.1    20   
                16.1   -6.1    20
                16.1   -4.9    20
                14.9   -4.9    20    ];
            
            
P_perna1_e = [P_perna1_e ones(size(P_perna1_e,1),1)];

P_perna1_e = P_perna1_e';
P_perna2_e = trans3(0,-7,0)*P_perna1_e;
P_perna3_e = trans3(-32,-7,0)*P_perna1_e;
P_perna4_e =trans3(-32,0,0)*P_perna1_e;

perna1_e2 = patch('Vertices',P_perna1_e(1:3,:)','Faces',F_mesa,'Facecolor','#8c8c8c');
perna2_e2 = patch('Vertices',P_perna2_e(1:3,:)','Faces',F_mesa,'Facecolor','#8c8c8c');
perna3_e2 = patch('Vertices',P_perna3_e(1:3,:)','Faces',F_mesa,'Facecolor','#8c8c8c');
perna4_e2 = patch('Vertices',P_perna4_e(1:3,:)','Faces',F_mesa,'Facecolor','#8c8c8c');
  


P_base_e    = [ -17   -13    20.1    
                 16   -13    20.1
                 16   -5    20.1
                -17   -5    20.1
                -17   -13    20.6   
                 16   -13    20.6
                 16   -5    20.6
                -17   -5    20.6    ];
            
P_base_e = [P_base_e ones(size(P_base_e,1),1)];

P_base_1e = P_base_e';
% P_base_2e = trans3(0,0,-4)*P_base_1e;
P_base_3e = trans3(0,0,-15.1)*P_base_1e;
% P_base_4e =trans3(0,0,-12)*P_base_1e;


base1_e = patch('Vertices',P_base_1e(1:3,:)','Faces',F_mesa,'Facecolor','#8c8c8c');
% base2_e = patch('Vertices',P_base_2e(1:3,:)','Faces',F_mesa,'Facecolor','#8c8c8c');
base3_e = patch('Vertices',P_base_3e(1:3,:)','Faces',F_mesa,'Facecolor','#8c8c8c');
% base4_e = patch('Vertices',P_base_4e(1:3,:)','Faces',F_mesa,'Facecolor','#8c8c8c');


  % base
  r = 4;
  [X,Y,Z] = cylinder(r,100);
  h = zr1-0.5;
  Z = Z*h;
  surf(X+xr1,Y+yr1,Z+0.05,'edgecolor','none','facecolor','#262626')
  
  hold on
  

  R = 3.98 ;    % Radius of circle 
  teta=0:0.01:2*pi ;
  x_c=R*cos(teta) + xr1  ;
  y_c= R*sin(teta) + yr1 ;
  z_c = (zr1-0.5)*ones(size(x_c)) ;

  patch('XData',x_c,'YData',y_c,'ZData',z_c,'facecolor','#262626') 
  patch('XData',x_c,'YData',y_c,'ZData',z_c*0+0.05,'facecolor','#262626') 

  
  
  hold on
  % base
  r = 4;
  [X,Y,Z] = cylinder(r,100);
  h = zr2-0.5;
  Z = Z*h;
  surf(X+xr2,Y+yr2,Z+0.05,'edgecolor','none','facecolor','#262626')
  
  hold on
  

  R = 3.98 ;    % Radius of circle 
  teta=0:0.01:2*pi ;
  x_c=R*cos(teta) + xr2  ;
  y_c= R*sin(teta) + yr2 ;
  z_c = (zr2-0.5)*ones(size(x_c)) ;

  patch('XData',x_c,'YData',y_c,'ZData',z_c,'facecolor','#262626') 
  patch('XData',x_c,'YData',y_c,'ZData',z_c*0+0.05,'facecolor','#262626') 

  
%   plot3(0,0,0,'-o','Color','b','MarkerSize',5,'MarkerFaceColor','#D9FFFF')

  % Objetos a pegar
  
  P_bloco    = [ -0.5   -0.5   0    
                  0.5  -0.5    0
                  0.5   0.5    0
                 -0.5   0.5    0
                 -0.5   -0.5   1   
                  0.5   -0.5   1
                  0.5   0.5    1
                 -0.5   0.5    1    ];
             
P_bloco = [P_bloco ones(size(P_bloco,1),1)];

P_bloco1 = trans3(xr1,yr1,zr1)*trans3(-10,0,-1.5)*rotx(pi)*P_bloco';
P_bloco2 = trans3(0,-8,20.6)*P_bloco';
P_bloco3 = trans3(3,-8,20.6)*P_bloco';
P_bloco4 =trans3(6,-8,20.6)*P_bloco';
P_bloco5 =trans3(9,-8,20.6)*P_bloco';
P_bloco6 = trans3(0,-11,20.6)*P_bloco';
P_bloco7 = trans3(3,-11,20.6)*P_bloco';
P_bloco8=trans3(6,-11,20.6)*P_bloco';
P_bloco9 =trans3(9,-11,20.6)*P_bloco';
P_bloco10 = trans3(-3,-8,20.6)*P_bloco';
P_bloco11 =trans3(-6,-8,20.6)*P_bloco';
P_bloco12 =trans3(-9,-8,20.6)*P_bloco';
P_bloco13 = trans3(-3,-11,20.6)*P_bloco';
P_bloco14=trans3(-6,-11,20.6)*P_bloco';
P_bloco15 =trans3(-9,-11,20.6)*P_bloco';


P_bloco16 = trans3(3,-8,5.5)*P_bloco';
P_bloco17 = trans3(6,-8,5.5)*P_bloco';
P_bloco18 = trans3(9,-8,5.5)*P_bloco';
P_bloco19 = trans3(0,-11,5.5)*P_bloco';
P_bloco20 = trans3(3,-11,5.5)*P_bloco';
P_bloco21 = trans3(6,-11,5.5)*P_bloco';
P_bloco22 = trans3(9,-11,5.5)*P_bloco';
P_bloco23 = trans3(-3,-8,5.5)*P_bloco';
P_bloco24 =trans3(-6,-8,5.5)*P_bloco';
P_bloco25 = trans3(-9,-8,5.5)*P_bloco';
P_bloco26 = trans3(-3,-11,5.5)*P_bloco';
P_bloco27 = trans3(-6,-11,5.5)*P_bloco';
P_bloco28 =trans3(-9,-11,5.5)*P_bloco';


bloco1 = patch('Vertices',P_bloco1(1:3,:)','Faces',F_mesa,'Facecolor','#ff0000');
P_bloco0Grab = P_bloco;

bloco2 = patch('Vertices',P_bloco2(1:3,:)','Faces',F_mesa,'Facecolor','#ff0000');
bloco3 = patch('Vertices',P_bloco3(1:3,:)','Faces',F_mesa,'Facecolor','#00cc00');
bloco4 = patch('Vertices',P_bloco4(1:3,:)','Faces',F_mesa,'Facecolor','#ffcc00');
bloco5 = patch('Vertices',P_bloco5(1:3,:)','Faces',F_mesa,'Facecolor','#663300');
bloco6 = patch('Vertices',P_bloco6(1:3,:)','Faces',F_mesa,'Facecolor','#0000ff');
bloco7 = patch('Vertices',P_bloco7(1:3,:)','Faces',F_mesa,'Facecolor','#6666ff');
bloco8 = patch('Vertices',P_bloco8(1:3,:)','Faces',F_mesa,'Facecolor','#660066');
bloco9 = patch('Vertices',P_bloco9(1:3,:)','Faces',F_mesa,'Facecolor','#ff0066');
bloco10 = patch('Vertices',P_bloco10(1:3,:)','Faces',F_mesa,'Facecolor','#009999');
bloco11 = patch('Vertices',P_bloco11(1:3,:)','Faces',F_mesa,'Facecolor','#ffffff');
bloco12 = patch('Vertices',P_bloco12(1:3,:)','Faces',F_mesa,'Facecolor','#0d0d0d');
bloco13 = patch('Vertices',P_bloco13(1:3,:)','Faces',F_mesa,'Facecolor','#009933');
bloco14 = patch('Vertices',P_bloco14(1:3,:)','Faces',F_mesa,'Facecolor','#ff8000');
bloco15 = patch('Vertices',P_bloco15(1:3,:)','Faces',F_mesa,'Facecolor','#99ff66');

bloco16 = patch('Vertices',P_bloco16(1:3,:)','Faces',F_mesa,'Facecolor','#00cc00');
bloco17 = patch('Vertices',P_bloco17(1:3,:)','Faces',F_mesa,'Facecolor','#ffcc00');
bloco18 = patch('Vertices',P_bloco18(1:3,:)','Faces',F_mesa,'Facecolor','#663300');
bloco19 = patch('Vertices',P_bloco19(1:3,:)','Faces',F_mesa,'Facecolor','#0000ff');
bloco20 = patch('Vertices',P_bloco20(1:3,:)','Faces',F_mesa,'Facecolor','#6666ff');
bloco21 = patch('Vertices',P_bloco21(1:3,:)','Faces',F_mesa,'Facecolor','#660066');
bloco22 = patch('Vertices',P_bloco22(1:3,:)','Faces',F_mesa,'Facecolor','#ff0066');
bloco23 = patch('Vertices',P_bloco23(1:3,:)','Faces',F_mesa,'Facecolor','#009999');
bloco24 = patch('Vertices',P_bloco24(1:3,:)','Faces',F_mesa,'Facecolor','#ffffff');
bloco25 = patch('Vertices',P_bloco25(1:3,:)','Faces',F_mesa,'Facecolor','#0d0d0d');
bloco26 = patch('Vertices',P_bloco26(1:3,:)','Faces',F_mesa,'Facecolor','#009933');
bloco27 = patch('Vertices',P_bloco27(1:3,:)','Faces',F_mesa,'Facecolor','#ff8000');
bloco28 = patch('Vertices',P_bloco28(1:3,:)','Faces',F_mesa,'Facecolor','#99ff66');



% =================
% =================
%      Robô 1
% =================
% =================

% Posição inicial do robô
    


% ====================================================================
% ====================================================================
%                       Cinemática Inversa
% ====================================================================
% ====================================================================

  %[theta1_r1, theta2_r1, theta3_r1, theta4_r1, theta5_r1, theta6_r1] = deal(180,0,0,0,0,0);
  initial_positial_robot1=[-13.6 0 9.2 45 -90 -45];
 %[DH, rr] = Joint2CartExtra(theta1_r1,theta2_r1,theta3_r1,theta4_r1,theta5_r1,theta6_r1);
  [theta1_r1, theta2_r1, theta3_r1, theta4_r1, theta5_r1, theta6_r1] = Cart2JointExtra(initial_positial_robot1,1,-1,-1);
  
  [LA, LB, LC, LD, LE, LF] = deal(0, 3, 7.2, 2.0, 8.6, 2.0);
  
  DH = [            theta1_r1+pi/2     pi/2      0     LA
                    pi/2               pi/2      0     LB
                    theta2_r1          pi        LC    0 
                    theta3_r1          pi/2      LD    0 
                      0                pi        0     LE 
                    theta4_r1          pi/2      0     0
                    theta5_r1          -pi/2     0     0
                    theta6_r1          pi        0     -LF   ];
  
  
  
  
  
  
% Hipermatriz de transformação
  Hiper_DH = TransLinks(DH);

% Desenha os elos
  hLinks=drawLinksExtra(Hiper_DH,'#5300C6','#FFBA37',xr1,yr1,zr1);
  
  
  hold on
  
% Desenha Gripper
  otg = GetOTG(DH);
  PGripper = 2*OpenGrip();
  PGripper(end,1:end)=1;
  PGripper = otg*PGripper;
  PGripper = trans3(xr1,yr1,zr1)*PGripper;
  hGrip = DrawGrip(PGripper);
  

% =================
% =================
%      Robô 2
% =================
% =================

% Posição inicial do robô
  [theta1_r2, theta2_r2, theta3_r2, theta4_r2, theta5_r2, theta6_r2] = deal(-90,48,90,0,-90,90);
  [DH, ~] = Joint2CartExtra(theta1_r2,theta2_r2,theta3_r2,theta4_r2,theta5_r2,theta6_r2);

% Hipermatriz de transformação
  Hiper_DH = TransLinks(DH);

% Desenha os elos
  hLinks2=drawLinksExtra(Hiper_DH,'#33cc33','#6666ff',xr2,yr2,zr2);

  % Desenha Gripper
  otg2 = GetOTG(DH);
  PGripper2 = 2*CloseGrip();
  PGripper2(end,1:end)=1;
  PGripper2 = otg2*PGripper2;
  PGripper2 = trans3(xr2,yr2,zr2)*PGripper2;
  hGrip2 = DrawGrip(PGripper2);

  
% ################
% Movimentar robôs
% ################
% Posicionamento para pegar no bloco
theta_1_r1 = linspace(theta1_r1,theta1_r1,100);
theta_2_r1 = linspace(theta2_r1,theta2_r1+5,100);
theta_3_r1 = linspace(theta3_r1,theta3_r1-60,100);
theta_4_r1 = linspace(theta4_r1+88.1360,theta4_r1+88.1360,100);
theta_5_r1 = linspace(theta5_r1,theta5_r1-30,100);
theta_6_r1 = linspace(theta6_r1-88.1360,theta6_r1-88.1360,100);



for i=1:100
    [theta1_r1, theta2_r1, theta3_r1, theta4_r1, theta5_r1, theta6_r1] = ...
        deal(theta_1_r1(i), theta_2_r1(i), theta_3_r1(i), theta_4_r1(i), theta_5_r1(i), theta_6_r1(i));
    [DH, ~] = Joint2CartExtra(theta1_r1,theta2_r1,theta3_r1,theta4_r1,theta5_r1,theta6_r1);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*OpenGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(xr1,yr1,zr1)*PGripper;
        
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#5300C6','#FFBA37',xr1,yr1,zr1,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);


    pause(0.01)
end

  hold on
  
  
  % Fechar as garras robô 1
  pause(0.5)
  PGripper = 2*CloseGrip();
  PGripper(end,1:end)=1;
  PGripper = otg*PGripper;
  PGripper = trans3(xr1,yr1,zr1)*PGripper;
  hGrip = DrawGrip(PGripper, hGrip);
  
  % Bloco agarrado
  P_blocoGrab = otg*P_bloco0Grab'; 
  P_blocoGrab = trans3(xr1,yr1,zr1-0.2)*P_blocoGrab;
  P_blocoGrab = P_blocoGrab(1:3,:)';
  set(bloco1,'Vertices',P_blocoGrab,'Faces',F_mesa,'Facecolor','#ff3300');
 
  
  pause(0.5)
  %---------
  % Passo 2
  %---------
theta_1_r1 = linspace(theta1_r1,theta1_r1+90,100);
theta_2_r1 = linspace(theta2_r1,theta2_r1-5,100);
theta_3_r1 = linspace(theta3_r1,theta3_r1+60,100);
theta_4_r1 = linspace(theta4_r1,theta4_r1,100);
theta_5_r1 = linspace(theta5_r1,theta5_r1+30,100);
theta_6_r1 = linspace(theta6_r1,theta6_r1,100);



for i=1:100
    [theta1_r1, theta2_r1, theta3_r1, theta4_r1, theta5_r1, theta6_r1] = ...
        deal(theta_1_r1(i), theta_2_r1(i), theta_3_r1(i), theta_4_r1(i), theta_5_r1(i), theta_6_r1(i));
    [DH, ~] = Joint2CartExtra(theta1_r1,theta2_r1,theta3_r1,theta4_r1,theta5_r1,theta6_r1);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*CloseGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(xr1,yr1,zr1)*PGripper;
      
      % Bloco agarrado
      P_blocoGrab = otg*P_bloco0Grab'; 
      P_blocoGrab = trans3(xr1,yr1,zr1-0.2)*P_blocoGrab;
      P_blocoGrab = P_blocoGrab(1:3,:)';
      set(bloco1,'Vertices',P_blocoGrab,'Faces',F_mesa,'Facecolor','#ff3300');
 
        
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#5300C6','#FFBA37',xr1,yr1,zr1,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);


    pause(0.01)
end

  pause(0.2)
  % Abrir as garras robô 2
  PGripper2 = 2*OpenGrip();
  PGripper2(end,1:end)=1;
  PGripper2 = otg2*PGripper2;
  PGripper2 = trans3(xr2,yr2,zr2)*PGripper2;
  hGrip2 = DrawGrip(PGripper2, hGrip2);
  
  
    pause(0.5)
  %---------
  % Passo 3
  %---------
theta_1_r1 = linspace(theta1_r1,theta1_r1,100);
theta_2_r1 = linspace(theta2_r1,theta2_r1+5,100);
theta_3_r1 = linspace(theta3_r1,theta3_r1-60,100);
theta_4_r1 = linspace(theta4_r1,theta4_r1,100);
theta_5_r1 = linspace(theta5_r1,theta5_r1-30,100);
theta_6_r1 = linspace(theta6_r1,theta6_r1,100);

theta_1_r2 = linspace(theta1_r2,theta1_r2,100);
theta_2_r2 = linspace(theta2_r2,theta2_r2-48,100);
theta_3_r2 = linspace(theta3_r2,theta3_r2,100);
theta_4_r2 = linspace(theta4_r2,theta4_r2,100);
theta_5_r2 = linspace(theta5_r2,theta5_r2,100);
theta_6_r2 = linspace(theta6_r2,theta6_r2,100);


for i=1:100
    %=== Robô 1 ===
    [theta1_r1, theta2_r1, theta3_r1, theta4_r1, theta5_r1, theta6_r1] = ...
        deal(theta_1_r1(i), theta_2_r1(i), theta_3_r1(i), theta_4_r1(i), theta_5_r1(i), theta_6_r1(i));
    [DH, ~] = Joint2CartExtra(theta1_r1,theta2_r1,theta3_r1,theta4_r1,theta5_r1,theta6_r1);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*CloseGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(xr1,yr1,zr1)*PGripper;
      
      % Bloco agarrado
      P_blocoGrab = otg*P_bloco0Grab'; 
      P_blocoGrab = trans3(xr1,yr1,zr1-0.2)*P_blocoGrab;
      P_blocoGrab = P_blocoGrab(1:3,:)';
      set(bloco1,'Vertices',P_blocoGrab,'Faces',F_mesa,'Facecolor','#ff3300');
 
        
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#5300C6','#FFBA37',xr1,yr1,zr1,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);

      % === Robô 2 ===
     [theta1_r2, theta2_r2, theta3_r2, theta4_r2, theta5_r2, theta6_r2] = ...
        deal(theta_1_r2(i), theta_2_r2(i), theta_3_r2(i), theta_4_r2(i), theta_5_r2(i), theta_6_r2(i));
     [DH, ~] = Joint2CartExtra(theta1_r2,theta2_r2,theta3_r2,theta4_r2,theta5_r2,theta6_r2);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg2 = GetOTG(DH);
      PGripper2 = 2*OpenGrip();
      PGripper2(end,1:end)=1;
      PGripper2 = otg2*PGripper2;
      PGripper2 = trans3(xr2,yr2,zr2)*PGripper2;
      
     % Atualiza robô
      hLinks2 = drawLinksExtra(Hiper_DH,'#33cc33','#6666ff',xr2,yr2,zr2,hLinks2);
      hGrip2 = DrawGrip(PGripper2, hGrip2);

    pause(0.01)
end

P_blocoGrab(1:4,3)=6.5;
P_blocoGrab(5:8,3)=5.5;
set(bloco1,'Vertices',P_blocoGrab,'Faces',F_mesa,'Facecolor','#ff3300');  

  % Abrir as garras robô 1
  pause(0.5)
  PGripper = 2*OpenGrip();
  PGripper(end,1:end)=1;
  PGripper = otg*PGripper;
  PGripper = trans3(xr1,yr1,zr1)*PGripper;
  hGrip = DrawGrip(PGripper, hGrip);
  
  
  
  %---------
  % Passo 4
  %---------
theta_1_r1 = linspace(theta1_r1,theta1_r1-90,100);
theta_2_r1 = linspace(theta2_r1,theta2_r1-5,100);
theta_3_r1 = linspace(theta3_r1,theta3_r1+60,100);
theta_4_r1 = linspace(theta4_r1,theta4_r1,100);
theta_5_r1 = linspace(theta5_r1,theta5_r1-60,100);
theta_6_r1 = linspace(theta6_r1,theta6_r1,100);

theta_1_r2 = linspace(theta1_r2,theta1_r2+180,100);
theta_2_r2 = linspace(theta2_r2,theta2_r2,100);
theta_3_r2 = linspace(theta3_r2,theta3_r2-90,100);
theta_4_r2 = linspace(theta4_r2,theta4_r2,100);
theta_5_r2 = linspace(theta5_r2,theta5_r2+90,100);
theta_6_r2 = linspace(theta6_r2,theta6_r2-90,100);

pause(0.5)

for i=1:100
    %=== Robô 1 ===
    [theta1_r1, theta2_r1, theta3_r1, theta4_r1, theta5_r1, theta6_r1] = ...
        deal(theta_1_r1(i), theta_2_r1(i), theta_3_r1(i), theta_4_r1(i), theta_5_r1(i), theta_6_r1(i));
    [DH, ~] = Joint2CartExtra(theta1_r1,theta2_r1,theta3_r1,theta4_r1,theta5_r1,theta6_r1);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*OpenGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(xr1,yr1,zr1)*PGripper;
             
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#5300C6','#FFBA37',xr1,yr1,zr1,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);

      % === Robô 2 ===
     [theta1_r2, theta2_r2, theta3_r2, theta4_r2, theta5_r2, theta6_r2] = ...
        deal(theta_1_r2(i), theta_2_r2(i), theta_3_r2(i), theta_4_r2(i), theta_5_r2(i), theta_6_r2(i));
     [DH, ~] = Joint2CartExtra(theta1_r2,theta2_r2,theta3_r2,theta4_r2,theta5_r2,theta6_r2);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg2 = GetOTG(DH);
      PGripper2 = 2*OpenGrip();
      PGripper2(end,1:end)=1;
      PGripper2 = otg2*PGripper2;
      PGripper2 = trans3(xr2,yr2,zr2)*PGripper2;
      
     % Atualiza robô
      hLinks2 = drawLinksExtra(Hiper_DH,'#33cc33','#6666ff',xr2,yr2,zr2,hLinks2);
      hGrip2 = DrawGrip(PGripper2, hGrip2);

      pause(0.01)
end




  %---------
  % Passo 5
  %---------

theta_1_r2 = linspace(theta1_r2,theta1_r2,100);
theta_2_r2 = linspace(theta2_r2,theta2_r2+30,100);
theta_3_r2 = linspace(theta3_r2,theta3_r2-53,100);
theta_4_r2 = linspace(theta4_r2,theta4_r2,100);
theta_5_r2 = linspace(theta5_r2,theta5_r2-37,100);
theta_6_r2 = linspace(theta6_r2,theta6_r2,100);

pause(0.5)

for i=1:100
      % === Robô 2 ===
     [theta1_r2, theta2_r2, theta3_r2, theta4_r2, theta5_r2, theta6_r2] = ...
        deal(theta_1_r2(i), theta_2_r2(i), theta_3_r2(i), theta_4_r2(i), theta_5_r2(i), theta_6_r2(i));
     [DH, ~] = Joint2CartExtra(theta1_r2,theta2_r2,theta3_r2,theta4_r2,theta5_r2,theta6_r2);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg2 = GetOTG(DH);
      PGripper2 = 2*OpenGrip();
      PGripper2(end,1:end)=1;
      PGripper2 = otg2*PGripper2;
      PGripper2 = trans3(xr2,yr2,zr2)*PGripper2;
      
     % Atualiza robô
      hLinks2 = drawLinksExtra(Hiper_DH,'#33cc33','#6666ff',xr2,yr2,zr2,hLinks2);
      hGrip2 = DrawGrip(PGripper2, hGrip2);

      pause(0.01)
end


  pause(0.2)
  % Fechar as garras robô 2
  PGripper2 = 2*CloseGrip();
  PGripper2(end,1:end)=1;
  PGripper2 = otg2*PGripper2;
  PGripper2 = trans3(xr2,yr2,zr2)*PGripper2;
  hGrip2 = DrawGrip(PGripper2, hGrip2);
  
 
  %---------
  % Passo 6
  %---------

theta_1_r2 = linspace(theta1_r2,theta1_r2-180,100);
theta_2_r2 = linspace(theta2_r2,3,100);
theta_3_r2 = linspace(theta3_r2,theta3_r2,100);
theta_4_r2 = linspace(theta4_r2,theta4_r2,100);
theta_5_r2 = linspace(theta5_r2,theta5_r2,100);
theta_6_r2 = linspace(theta6_r2,theta6_r2,100);

pause(0.5)

for i=1:100
      % === Robô 2 ===
     [theta1_r2, theta2_r2, theta3_r2, theta4_r2, theta5_r2, theta6_r2] = ...
        deal(theta_1_r2(i), theta_2_r2(i), theta_3_r2(i), theta_4_r2(i), theta_5_r2(i), theta_6_r2(i));
     [DH, ~] = Joint2CartExtra(theta1_r2,theta2_r2,theta3_r2,theta4_r2,theta5_r2,theta6_r2);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg2 = GetOTG(DH);
      PGripper2 = 2*CloseGrip();
      PGripper2(end,1:end)=1;
      PGripper2 = otg2*PGripper2;
      PGripper2 = trans3(xr2,yr2,zr2)*PGripper2;
      
            
      % Bloco agarrado
      P_blocoGrab = otg2*P_bloco0Grab'; 
      P_blocoGrab = trans3(xr2,yr2,zr2-0.2)*P_blocoGrab;
      P_blocoGrab = P_blocoGrab(1:3,:)';
      set(bloco1,'Vertices',P_blocoGrab,'Faces',F_mesa,'Facecolor','#ff3300');
 
      
     % Atualiza robô
      hLinks2 = drawLinksExtra(Hiper_DH,'#33cc33','#6666ff',xr2,yr2,zr2,hLinks2);
      hGrip2 = DrawGrip(PGripper2, hGrip2);

      pause(0.01)
end

pause(0.5)
  % Abrir as garras robô 2
  PGripper2 = 2*OpenGrip();
  PGripper2(end,1:end)=1;
  PGripper2 = otg2*PGripper2;
  PGripper2 = trans3(xr2,yr2,zr2)*PGripper2;
  hGrip2 = DrawGrip(PGripper2, hGrip2);
 
  
  bloco_h1 = linspace(P_blocoGrab(1,3),6.5,10);
  bloco_h2 = linspace(P_blocoGrab(8,3),5.5,10);
  
  pause(0.2)
 for i=1:10
    % Bloco cai
     P_blocoGrab(1:4,3)=bloco_h1(i);
     P_blocoGrab(5:8,3)=bloco_h2(i);
     set(bloco1,'Vertices',P_blocoGrab,'Faces',F_mesa,'Facecolor','#ff3300');
     pause(0.01)
 end

 
 
theta_1_r2 = linspace(theta1_r2,theta1_r2-180,100);
theta_2_r2 = linspace(theta2_r2,0,100);
theta_3_r2 = linspace(theta3_r2,0,100);
theta_4_r2 = linspace(theta4_r2,0,100);
theta_5_r2 = linspace(theta5_r2,-90,100);
theta_6_r2 = linspace(theta6_r2,0,100);

pause(0.5)

for i=1:100
      % === Robô 2 ===
     [theta1_r2, theta2_r2, theta3_r2, theta4_r2, theta5_r2, theta6_r2] = ...
        deal(theta_1_r2(i), theta_2_r2(i), theta_3_r2(i), theta_4_r2(i), theta_5_r2(i), theta_6_r2(i));
     [DH, ~] = Joint2CartExtra(theta1_r2,theta2_r2,theta3_r2,theta4_r2,theta5_r2,theta6_r2);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg2 = GetOTG(DH);
      PGripper2 = 2*OpenGrip();
      PGripper2(end,1:end)=1;
      PGripper2 = otg2*PGripper2;
      PGripper2 = trans3(xr2,yr2,zr2)*PGripper2;
      
     % Atualiza robô
      hLinks2 = drawLinksExtra(Hiper_DH,'#33cc33','#6666ff',xr2,yr2,zr2,hLinks2);
      hGrip2 = DrawGrip(PGripper2, hGrip2);

      pause(0.01)
end


%% Ex2 Extra
addpath('functions')
clear
clc

hF=figure('Renderer','painters', 'Position', [675 20 675 675]);
xlabel('X'); ylabel('Y'); zlabel('Z')
lighting phong %some nice lighting
% shading interp %remove grid and smoothen the surface color
axis equal %takes care of display in the right proportion
axis([-22 22 -12 32 0 30]) %give some more axis space (for the snow later)
axis equal off
% view(-37.5,30)
view(-120,28)
hold on
% title('Ex.Extra:  Bom ano!!')%self explaining
title({'Ex.Extra', 'Bom Ano!!'})

P_chao = [  -22   32    0   
             22   32    0
             22  -12    0
            -22  -12    0
            -22   32   0.01
             22   32   0.01
             22  -12   0.01 
            -22  -12   0.01 ];

F_patches = [  1   2   3   4
               5   6   7   8
               1   2   6   5
               1   5   8   4
               3   7   8   4
               2   6   7   3 ];
           
chao = patch('Vertices',P_chao,'Faces',F_patches,'Facecolor','#b5651d');

% Referência: https://www.mathworks.com/matlabcentral/fileexchange/65525-rotating-christmas-tree
hold on, 
N = 6^4; c = 30; k = randi(6,c,1); l = randperm(N,c);
q = @(x) rand(N,1); a = q()*2*pi; z = q(); r = 8*(1-z); t = q();
x = r.*cos(a); y = r.*sin(a); P = {'ro','ys','md','b^','kh','c*'};
scatter3(x.*t,y.*t,20*z,[],[zeros(N,1) (t.*r).^.6 zeros(N,1)],'*')
plot3(0,0,21.5,'rp','markers',18,'markerf','r')
for i = 1:6
    L = l(k==i);
    plot3(x(L),y(L),20*z(L),P{i},'markers',8,'linew',2);
end
[X,Y,Z] = cylinder(.025,30);
surf(X,Y,-Z*.1) 
hold on


  
% Modelação
% =========
P_mesa = [   4    25   8.5  
             16   25   8.5
             16  7.5   8.5
             4   7.5   8.5
             4    25   9.5 
             16   25   9.5
             16  7.5   9.5
             4   7.5   9.5 ];
         
F_mesa = [     1   2   3   4
               5   6   7   8
               1   2   6   5
               1   5   8   4
               3   7   8   4
               2   6   7   3 ];
mesa = patch('Vertices',P_mesa,'Faces',F_mesa,'Facecolor','#999966');


P_perna1 = [ 15   25   0.05    
             16   25   0.05
             16   24   0.05
             15   24   0.05
             15   25   8.5   
             16   25   8.5
             16   24   8.5
             15   24   8.5  ];

P_perna1 = [P_perna1 ones(size(P_perna1,1),1)];

P_perna1 = P_perna1';
P_perna2 = trans3(0,-16.5,0)*P_perna1;
P_perna3 = trans3(-11,-16.5,0)*P_perna1;
P_perna4 =trans3(-11,0,0)*P_perna1;


perna1 = patch('Vertices',P_perna1(1:3,:)','Faces',F_mesa,'Facecolor','#999966');
perna2 = patch('Vertices',P_perna2(1:3,:)','Faces',F_mesa,'Facecolor','#999966');
perna3 = patch('Vertices',P_perna3(1:3,:)','Faces',F_mesa,'Facecolor','#999966');
perna4 = patch('Vertices',P_perna4(1:3,:)','Faces',F_mesa,'Facecolor','#999966');
  
  
  P_2  = [  20 25 25    %P1
            20 20 25    %P2
            20 20 19    %P3
            20 24 19    %P4
            20 24 15    %P5
            20 20 15    %P6
            20 20 14    %P7
            20 25 14    %P8
            20 25 20    %P9
            20 21 20    %P10
            20 21 24    %P11
            20 25 24    %P12
            19 25 25    %P13
            19 20 25    %P14
            19 20 19    %P15
            19 24 19    %P16
            19 24 15    %P17
            19 20 15    %P18
            19 20 14    %P19
            19 25 14    %P20
            19 25 20    %P21
            19 21 20    %P22
            19 21 24    %P23
            19 25 24 ]; %P24
        
F_2   = [  1  2  3  4  5  6  7  8  9  10 11 12 
           13 14 15 16 17 18 19 20 21 22 23 24 ];

F_2_2 = [  1  2  14 13
           1  13 24 12 
           12 24 23 11
           11 10 22 23 
           9  10 22 21
           9  21 20 8
           8  20 19 7
           7  6  18 19
           6  5  17 18
           5  4  16 17
           4  3  15 16
           3  2  14 15
            ];
        
  P_0  = [  0.5  3 11    %P1
            0.5 -3 11    %P2
            0.5 -3  0    %P3
            0.5  3  0    %P4
            0.5  2 10    %P5
            0.5 -2 10    %P6
            0.5 -2  1    %P7
            0.5  2  1    %P8
           -0.5  3 11    %P9
           -0.5 -3 11    %P10
           -0.5 -3  0    %P11
           -0.5  3  0    %P12
           -0.5  2 10    %P13
           -0.5 -2 10    %P14
           -0.5 -2  1    %P15
           -0.5  2  1 ]; %P16
        
F_0   = [  1  2  6  5
           2  6  7  3 
           3  4  8  7 
           4  8  5  1 
           9  10 14 13
           10 14 15 11 
           11 12 16 15 
           12 16 13 9  
           1  2  10 9
           2  3  11 10
           3  4  12 11
           4  1  9  12 ];
        

  P_1  = [  0.5  0.5 11    %P1
            0.5 -0.5 11    %P2
            0.5 -0.5 0     %P3
            0.5  0.5 0     %P4
           -0.5  0.5 11    %P5
           -0.5 -0.5 11    %P6
           -0.5 -0.5 0     %P7
           -0.5  0.5 0 ];  %P8
        
F_1   = [  1 2 3 4
           5 6 7 8
           1 5 6 2
           2 3 7 6
           3 4 8 7
           4 1 5 8 ];
       
P_21 = [P_2 ones(size(P_2,1),1)];
P_21 = P_21'; P_21 = trans3(0,3.5,0)*P_21; P_21 = P_21(1:3,:)';

P_01 = [P_0 ones(size(P_0,1),1)];
P_01 = P_01'; P_01 = trans3(19.5,19.5,14)*P_01; P_01 = P_01(1:3,:)';

P_22 = [P_2 ones(size(P_2,1),1)];
P_22 = P_22'; P_22 = trans3(0,-9.5,0)*P_22; P_22 = P_22(1:3,:)';

% P_02 = [P_0 ones(size(P_0,1),1)];
% P_02 = P_02'; P_02 = trans3(0,-8,0)*P_02; P_02 = P_02(1:3,:)';

patch('Vertices',P_21,'Faces',F_2,'Facecolor','#ff3300');
patch('Vertices',P_21,'Faces',F_2_2,'Facecolor','#ff3300');       
patch('Vertices',P_01,'Faces',F_0,'Facecolor','#ff3300');  
patch('Vertices',P_22,'Faces',F_2,'Facecolor','#ff3300');
patch('Vertices',P_22,'Faces',F_2_2,'Facecolor','#ff3300');  


P_02 = [P_0 ones(size(P_0,1),1)];
P_02 = P_02'; 
P0_grab = trans3(-.5,0,1.15)*rotz(pi)*roty(-pi/2)*P_02; P0_grab = P0_grab(1:3,:)';
P_02 = trans3(19.5,7,14)*P_02; 
P_02 = P_02(1:3,:)';
Num0 = patch('Vertices',P_02,'Faces',F_0,'Facecolor','#ff3300');  

P_1_final = [P_1 ones(size(P_1,1),1)]';
P_1_final = trans3(19.5,9,14)*P_1_final; P_1_final=P_1_final(1:3,:)';


P_11 = [P_1 ones(size(P_1,1),1)];
P_11 = P_11';
% P_11 = otg*P_11; P_11 = trans3(x,y,z)*P_11;
P1_grab = trans3(0,-4.1,1)*rotz(3*pi/2)*roty(-pi/2)*P_11; P1_grab = P1_grab(1:3,:)';
P_11 = trans3(5.5,25,10)*rotx(pi/2)*P_11;  P_11 = P_11(1:3,:)';
Num1 = patch('Vertices',P_11,'Faces',F_1,'Facecolor','#ff3300');

% plot3(0,0,0,'-o','Color','b','MarkerSize',4,'MarkerFaceColor','#D9FFFF')

% Robô a movimentar
% =================
 [x,y,z] = deal(5,9,10); % Translação a aplicar sempre ao robô
% -----------------
%      Passo 1
% -----------------
% Posição inicial do robô

r=[0,13.6,9.2,45,-90,-135]';

%%[theta1, theta2, theta3, theta4, theta5, theta6] = deal(90,0,0,0,0,0);
%%[DH, r] = Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6)

[theta1, theta2, theta3, theta4, theta5, theta6,DH] = Cart2JointExtra(r,1,-1,1);


% Hipermatriz de transformação
  Hiper_DH = TransLinks(DH);

% Desenha os elos
  hLinks=drawLinksExtra(Hiper_DH,'#1a1a1a','#e6b800',x,y,z);
   
% Desenha Gripper
  otg = GetOTG(DH);
  PGripper = 2*OpenGrip();
  PGripper(end,1:end)=1;
  PGripper = otg*PGripper;
  PGripper = trans3(x,y,z)*PGripper;
  hGrip = DrawGrip(PGripper);



% -----------------
%      Passo 2
% -----------------
% Posicionamento para pegar no 0
theta_1 = linspace(theta1,theta1,50);
theta_2 = linspace(theta2,theta2,50);
theta_3 = linspace(theta3,theta3-45,50);
theta_4 = linspace(theta4,theta4-92,50);
theta_5 = linspace(theta5,theta5+60,50);
theta_6 = linspace(theta6,theta6+92,50);


for i=1:50
    [theta1, theta2, theta3, theta4, theta5, theta6] = ...
        deal(theta_1(i), theta_2(i), theta_3(i), theta_4(i), theta_5(i), theta_6(i));
    [DH, ~] = Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*OpenGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(x,y,z)*PGripper;
        
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#1a1a1a','#e6b800',x,y,z,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);


    pause(0.02)
end

pause(0.2)
theta_1 = linspace(theta1,theta1-98,50);
theta_2 = linspace(theta2,theta2,50);
theta_3 = linspace(theta3,theta3,50);
theta_4 = linspace(theta4,theta4,50);
theta_5 = linspace(theta5,theta5,50);
theta_6 = linspace(theta6,theta6,50);

for i=1:50
    [theta1, theta2, theta3, theta4, theta5, theta6] = ...
        deal(theta_1(i), theta_2(i), theta_3(i), theta_4(i), theta_5(i), theta_6(i));
    [DH, ~] = Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*OpenGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(x,y,z)*PGripper;
        
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#1a1a1a','#e6b800',x,y,z,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);


    pause(0.02)
end

pause(0.2)
theta_1 = linspace(theta1,theta1,50);
theta_2 = linspace(theta2,theta2,50);
theta_3 = linspace(theta3,theta3+12,50);
theta_4 = linspace(theta4,theta4,50);
theta_5 = linspace(theta5,theta5-25,50);
theta_6 = linspace(theta6,theta6,50);

for i=1:50
    [theta1, theta2, theta3, theta4, theta5, theta6] = ...
        deal(theta_1(i), theta_2(i), theta_3(i), theta_4(i), theta_5(i), theta_6(i));
    [DH, ~] = Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*OpenGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(x,y,z)*PGripper;
        
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#1a1a1a','#e6b800',x,y,z,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);


    pause(0.02)
end

% Fechar as garras
pause(0.5)
PGripper = 2*CloseGrip();
PGripper(end,1:end)=1;
PGripper = otg*PGripper;
PGripper = trans3(x,y,z)*PGripper;
hGrip = DrawGrip(PGripper, hGrip);


% -----------------
%      Passo 3
% -----------------
pause(0.5)
theta_1 = linspace(theta1,theta1+60,50);
theta_2 = linspace(theta2,theta2,50);
theta_3 = linspace(theta3,theta3-30,50);
theta_4 = linspace(theta4,theta4,50);
theta_5 = linspace(theta5,theta5+30,50);
theta_6 = linspace(theta6,theta6,50);

for i=1:50
    [theta1, theta2, theta3, theta4, theta5, theta6] = ...
        deal(theta_1(i), theta_2(i), theta_3(i), theta_4(i), theta_5(i), theta_6(i));
    [DH, ~] = Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*CloseGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(x,y,z)*PGripper;
      
    % Número 0
      P_02 = [P0_grab ones(size(P_0,1),1)];
      P_02 = P_02'; 
      P_02 = otg*P_02; P_02 = trans3(x,y,z)*P_02;
      P_02 = P_02(1:3,:)';
      
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#1a1a1a','#e6b800',x,y,z,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);
      set(Num0,'Vertices',P_02,'Faces',F_0,'Facecolor','#ff3300');


    pause(0.02)
end


% -----------------
%      Passo 4
% -----------------
pause(0.2)
theta_1 = linspace(theta1,theta1+5,50);
theta_2 = linspace(theta2,theta2,50);
theta_3 = linspace(theta3,theta3+23,50);
theta_4 = linspace(theta4,theta4,50);
theta_5 = linspace(theta5,theta5-115,50);
theta_6 = linspace(theta6,theta6,50);

for i=1:50
    [theta1, theta2, theta3, theta4, theta5, theta6] = ...
        deal(theta_1(i), theta_2(i), theta_3(i), theta_4(i), theta_5(i), theta_6(i));
    [DH, ~] = Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*CloseGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(x,y,z)*PGripper;
      
    % Número 0
      P_02 = [P0_grab ones(size(P_0,1),1)];
      P_02 = P_02'; 
      P_02 = otg*P_02; P_02 = trans3(x,y,z)*P_02;
      P_02 = P_02(1:3,:)';
      
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#1a1a1a','#e6b800',x,y,z,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);
      set(Num0,'Vertices',P_02,'Faces',F_0,'Facecolor','#ff3300');

    pause(0.02)
end


% Abrir as garras
pause(0.5)
PGripper = 2*OpenGrip();
PGripper(end,1:end)=1;
PGripper = otg*PGripper;
PGripper = trans3(x,y,z)*PGripper;
hGrip = DrawGrip(PGripper, hGrip);


% -----------------
%      Passo 5
% -----------------
pause(0.2)
theta_1 = linspace(theta1,90,50);
theta_2 = linspace(theta2,0,50);
theta_3 = linspace(theta3,0,50);
theta_4 = linspace(theta4,0,50);
theta_5 = linspace(theta5,0,50);
theta_6 = linspace(theta6,0,50);

for i=1:50
    [theta1, theta2, theta3, theta4, theta5, theta6] = ...
        deal(theta_1(i), theta_2(i), theta_3(i), theta_4(i), theta_5(i), theta_6(i));
    [DH, ~] = Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*OpenGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(x,y,z)*PGripper;
      
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#1a1a1a','#e6b800',x,y,z,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);


    pause(0.02)
end



% -----------------
%      Passo 6
% -----------------
pause(0.2)
theta_1 = linspace(theta1,theta1,50);
theta_2 = linspace(theta2,theta2-18,50);
theta_3 = linspace(theta3,theta3-32,50);
theta_4 = linspace(theta4,theta4,50);
theta_5 = linspace(theta5,theta5-58,50);
theta_6 = linspace(theta6,theta6+90,50);

for i=1:50
    [theta1, theta2, theta3, theta4, theta5, theta6] = ...
        deal(theta_1(i), theta_2(i), theta_3(i), theta_4(i), theta_5(i), theta_6(i));
    [DH, ~] = Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*OpenGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(x,y,z)*PGripper;
      
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#1a1a1a','#e6b800',x,y,z,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);


    pause(0.02)
end

% Fechar as garras
pause(0.5)
PGripper = 2*CloseGrip();
PGripper(end,1:end)=1;
PGripper = otg*PGripper;
PGripper = trans3(x,y,z)*PGripper;
hGrip = DrawGrip(PGripper, hGrip);



% -----------------
%      Passo 7
% -----------------
pause(0.2)
theta_1 = linspace(theta1,theta1-90,50);
theta_2 = linspace(theta2,theta2-22,50);
theta_3 = linspace(theta3,theta3+20,50);
theta_4 = linspace(theta4,theta4,50);
theta_5 = linspace(theta5,theta5+60,50);
theta_6 = linspace(theta6,theta6+90,50);

for i=1:50
    [theta1, theta2, theta3, theta4, theta5, theta6] = ...
        deal(theta_1(i), theta_2(i), theta_3(i), theta_4(i), theta_5(i), theta_6(i));
    [DH, ~] = Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*CloseGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(x,y,z)*PGripper;
      
    % Número 1
      P_11 = [P1_grab ones(size(P_1,1),1)];
      P_11 = P_11'; 
      P_11= otg*P_11; P_11 = trans3(x,y,z)*P_11;
      P_11 = P_11(1:3,:)';
      
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#1a1a1a','#e6b800',x,y,z,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);
      set(Num1,'Vertices',P_11,'Faces',F_1,'Facecolor','#ff3300');

    pause(0.02)
end


% -----------------
%      Passo 8
% -----------------
pause(0.2)
theta_1 = linspace(theta1,theta1,50);
theta_2 = linspace(theta2,theta2,50);
theta_3 = linspace(theta3,theta3,50);
theta_4 = linspace(theta4,theta4,50);
theta_5 = linspace(theta5,theta5,50);
theta_6 = linspace(theta6,theta6-90,50);

for i=1:50
    [theta1, theta2, theta3, theta4, theta5, theta6] = ...
        deal(theta_1(i), theta_2(i), theta_3(i), theta_4(i), theta_5(i), theta_6(i));
    [DH, ~] = Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*CloseGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(x,y,z)*PGripper;
      
    % Número 1
      P_11 = [P1_grab ones(size(P_1,1),1)];
      P_11 = P_11'; 
      P_11= otg*P_11; P_11 = trans3(x,y,z)*P_11;
      P_11 = P_11(1:3,:)';
      
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#1a1a1a','#e6b800',x,y,z,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);
      set(Num1,'Vertices',P_11,'Faces',F_1,'Facecolor','#ff3300');

    pause(0.02)
end


% -----------------
%      Passo 9
% -----------------
pause(0.2)
theta_1 = linspace(theta1,theta1,50);
theta_2 = linspace(theta2,0,50);
theta_3 = linspace(theta3,-8,50);
theta_4 = linspace(theta4,0,50);
theta_5 = linspace(theta5,8,50);
theta_6 = linspace(theta6,theta6,50);

for i=1:50
    [theta1, theta2, theta3, theta4, theta5, theta6] = ...
        deal(theta_1(i), theta_2(i), theta_3(i), theta_4(i), theta_5(i), theta_6(i));
    [DH, ~] = Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*CloseGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(x,y,z)*PGripper;
      
    % Número 1
      P_11 = [P1_grab ones(size(P_1,1),1)];
      P_11 = P_11'; 
      P_11= otg*P_11; P_11 = trans3(x,y,z)*P_11;
      P_11 = P_11(1:3,:)';
      
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#1a1a1a','#e6b800',x,y,z,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);
      if i<50
        set(Num1,'Vertices',P_11,'Faces',F_1,'Facecolor','#ff3300');
      else
        set(Num1,'Vertices',P_1_final,'Faces',F_1,'Facecolor','#ff3300');
      end
      pause(0.02)
end

% Abrir as garras
pause(0.5)
PGripper = 2*OpenGrip();
PGripper(end,1:end)=1;
PGripper = otg*PGripper;
PGripper = trans3(x,y,z)*PGripper;
hGrip = DrawGrip(PGripper, hGrip);


% -----------------
%      Passo 10
% -----------------
pause(0.2)
theta_1 = linspace(theta1,theta1,50);
theta_2 = linspace(theta2,theta2 - 30,50);
theta_3 = linspace(theta3,-8,50);
theta_4 = linspace(theta4,0,50);
theta_5 = linspace(theta5,8,50);
theta_6 = linspace(theta6,theta6,50);

for i=1:50
    [theta1, theta2, theta3, theta4, theta5, theta6] = ...
        deal(theta_1(i), theta_2(i), theta_3(i), theta_4(i), theta_5(i), theta_6(i));
    [DH, ~] = Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*OpenGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(x,y,z)*PGripper;

      
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#1a1a1a','#e6b800',x,y,z,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);

      pause(0.02)
end

% -----------------
%      Passo 10
% -----------------
pause(0.2)
theta_1 = linspace(theta1,90,50);
theta_2 = linspace(theta2,0,50);
theta_3 = linspace(theta3,0,50);
theta_4 = linspace(theta4,0,50);
theta_5 = linspace(theta5,0,50);
theta_6 = linspace(theta6,0,50);

for i=1:50
    [theta1, theta2, theta3, theta4, theta5, theta6] = ...
        deal(theta_1(i), theta_2(i), theta_3(i), theta_4(i), theta_5(i), theta_6(i));
    [DH, ~] = Joint2CartExtra(theta1,theta2,theta3,theta4,theta5,theta6);

    % Hipermatriz de transformação
      Hiper_DH = TransLinks(DH);

    % Gripper
      otg = GetOTG(DH);
      PGripper = 2*OpenGrip();
      PGripper(end,1:end)=1;
      PGripper = otg*PGripper;
      PGripper = trans3(x,y,z)*PGripper;

      
      % Atualiza robô
      hLinks = drawLinksExtra(Hiper_DH,'#1a1a1a','#e6b800',x,y,z,hLinks);
      hGrip = DrawGrip(PGripper, hGrip);

      pause(0.02)
end