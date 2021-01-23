% Trabalho 3 - Translação e rotações de objetos 3D
% Daniel Coelho       nºmec.84949
% Miguel Pina         nºmec.80203

% ------------------------------------------------------------------------
% --------------- 1.Simulação de manipuladores RRR a 2D ------------------
% ------------------------------------------------------------------------
%% Ex1 alínea a)
% Configurações Iniciais
close all
clear
clc

% Pontos do elo 1
p1 = [0 -0.5 0 1]';
p2 = [3 -0.5 0 1]';
p3 = [3 0.5 0 1]';
p4 = [0 0.5 0 1]';

% Definição do elo 1 e translação do mesmo para definição dos elos 2 e 3
p_elo1 = [p1 p2 p3 p4];
p_elo2 = trans3(3,0,0)*p_elo1;
p_elo3 = trans3(3,0,0)*p_elo2;

% Configurações da janela e representação gráfica do manipulador
figure('Position', [0 20 675 675])
axis([-10 10 -10 10]); xlabel('x'); ylabel('y')
title('Ex.1a - Visualização do manipulador RRR')
hold on; grid on; axis square 

fill(p_elo1(1,:),p_elo1(2,:), 'red');
hold on
fill(p_elo2(1,:),p_elo2(2,:), 'blue');
hold on
fill(p_elo3(1,:),p_elo3(2,:), 'green');

pause(2)

%% Ex1 alínea (b)
% Funções (rotx.m, roty.m, rotz.m e trans3.m) criadas em scripts à parte

%% Ex1 alínea (c)
% Configurações inciciais
clear
clc

% Configurações da janela
figure('Position', [675 20 675 675])
xlabel('x'); ylabel('y')
title('Ex.1c - Simular o funcionamento do manipulador RRR')
hold on; grid on; axis square 

% Pontos do elo 1
p1 = [0 -0.5 0 1]';
p2 = [3 -0.5 0 1]';
p3 = [3 0.5 0 1]';
p4 = [0 0.5 0 1]';

% Definição do elo 1 e translação do mesmo para definição dos elos 2 e 3
p_elo1 = [p1 p2 p3 p4];
p_elo2 = trans3(3,0,0)*p_elo1;
p_elo3 = trans3(6,0,0)*p_elo1;

% Inicialização de variáveis auxiliares
sair = 'n';
erro = false;

while sair=='n'
    
axis([-10 10 -10 10]);

% Manipulador na posição inicial
elo1 = fill(p_elo1(1,:),p_elo1(2,:), 'red');
hold on
elo2 = fill(p_elo2(1,:),p_elo2(2,:), 'blue');
hold on
elo3 = fill(p_elo3(1,:),p_elo3(2,:), 'green');
    
% Janela de inputs
    inputs = inputdlg({'Rotação do elo 1 (em º)','Rotação do elo 2 (em º)',...
                       'Rotação do elo 3 (em º)'},'Inputs',...
                       [1 50; 1 50; 1 50]);
        
%   Se carregar em 'Cancel' ou fechar a janela, programa acaba
    if isempty(inputs)
        break
    end
    
    
% Converte os inputs para números
    ang_1 = str2double(inputs{1});
    if isempty(inputs{1}) % Se não for colocado valor, assume-se 0
        ang_1 = 0;
    elseif isnan(ang_1) % Se for letra, frase, etc..., não é válido
        erro = true;
    end
    ang_1 = deg2rad(ang_1); % Converte para radianos
    
    
    ang_2 = str2double(inputs{2});
    if isempty(inputs{2})
        ang_2 = 0;
    elseif isnan(ang_2) 
        erro = true;
    end
    ang_2 = deg2rad(ang_2);
    

    ang_3 = str2double(inputs{3}); 
    if isempty(inputs{3})
        ang_3 = 0;
    elseif isnan(ang_3)
        erro = true;
    end
    ang_3 = deg2rad(ang_3);
    
      
    if erro %Se não for válido, dá uma janela de erro e termina o programa
        errordlg('O input deve ser um número')
        break
    end
    
% Animar rotação dos elos com os ângulos definidos pelo utilizador:
    angs_1 = linspace(0,ang_1,100);
    angs_2 = linspace(0,ang_2,100);
    angs_3 = linspace(0,ang_3,100);
    
    for i = 1:100
        Q1 = rotz(angs_1(i))*p_elo1;
        set( elo1, 'XData', Q1(1,:), 'YData', Q1(2,:));

        Q2 = rotz(angs_1(i))*trans3(3,0,0)*rotz(angs_2(i))*p_elo1;
        set( elo2, 'XData', Q2(1,:), 'YData', Q2(2,:));
        
        Q3 = rotz(angs_1(i)) * trans3(3,0,0) * rotz(angs_2(i)) * trans3(3,0,0) *rotz(angs_3(i)) *p_elo1;
        set( elo3, 'XData', Q3(1,:), 'YData', Q3(2,:));       


        pause(0.02) %Intervalo de 0.02s entre cada iteração do ciclo
    end
    
    % Janela a dar a opção de correr o programa de novo com novos inputs,
    % ou terminar o programa
    answer = questdlg('Pretende continuar no programa?', ...
                      'Janela de saída', 'Sim','Não','Não');
    while true
        if strcmp(answer,'Não')
            sair = 'y';
            break
        elseif strcmp(answer,'Sim')
            clf
            title('Ex.1c - Simular o funcionamento do manipulador RRR')
            xlabel('x'); ylabel('y')
            hold on; grid on; axis square 
            break
        else
            answer = questdlg('Não escolheu nenhuma das opções. Pretende continuar no programa?', ...
                              'Janela de saída', 'Sim','Não','Não');
        end
    end
end


%% -----------------------------------------------------------------------
% --------------- 2.Simulação de manipuladores RRR a 3D ------------------
% ------------------------------------------------------------------------

%% Ex2 alínea a)

figure('Position', [0 20 675 675])
axis([-10 10 -10 10 -10 10]); xlabel('x'); ylabel('y'); zlabel('z')
title('Ex.2a - Simular o funcionamento do manipulador RRR a 3D')
hold on; grid on; axis square,view(3)

p_id = [0.5 -0.5 0 1]';
p_ie = [-0.5 -0.5 0 1]';
p_se = [-0.5 -0.5 3 1]';
p_sd = [0.5 -0.5 3 1]';
p_iey = [-0.5 0.5 0 1]';
p_idy = [0.5  0.5 0 1]';
p_sey = [-0.5 0.5 3 1]';
p_sdy = [0.5  0.5 3 1]';

p_id_end = [0.3 -0.3 0 1]';
p_ie_end = [-0.3 -0.3 0 1]';
p_se_end = [-0.3 -0.3 1 1]';
p_sd_end = [0.3 -0.3 1 1]';
p_iey_end = [-0.3 0.3 0 1]';
p_idy_end = [0.3  0.3 0 1]';
p_sey_end = [-0.3 0.3 1 1]';
p_sdy_end = [0.3  0.3 1 1]';
p_end_orig = [p_id_end p_ie_end p_se_end p_sd_end p_iey_end p_idy_end p_sey_end p_sdy_end];
p_elo1=[p_id p_ie p_se p_sd p_iey p_idy p_sey p_sdy];
p_elo2 =  trans3(0,0,3) * p_elo1 ;
p_elo3 =  trans3(0,0,6) * p_elo1 ;


p_end = trans3(0,0,9) * p_end_orig ;


desenhar_robot3(p_elo1,p_elo2,p_elo3,p_end);

pause(2);



%% Ex2 alínea b)

figure('Position', [675 20 675 675])
axis([-10 10 -10 10 -10 10]); xlabel('x'); ylabel('y'); zlabel('z')
title('Ex.2b - Simular o funcionamento do manipulador RRR a 3D')
hold on; grid on; axis square ; view(3)


p_id = [0.5 -0.5 0 1]';
p_ie = [-0.5 -0.5 0 1]';
p_se = [-0.5 -0.5 3 1]';
p_sd = [0.5 -0.5 3 1]';
p_iey = [-0.5 0.5 0 1]';
p_idy = [0.5  0.5 0 1]';
p_sey = [-0.5 0.5 3 1]';
p_sdy = [0.5  0.5 3 1]';

p_id_end = [0.3 -0.3 0 1]';
p_ie_end = [-0.3 -0.3 0 1]';
p_se_end = [-0.3 -0.3 1 1]';
p_sd_end = [0.3 -0.3 1 1]';
p_iey_end = [-0.3 0.3 0 1]';
p_idy_end = [0.3  0.3 0 1]';
p_sey_end = [-0.3 0.3 1 1]';
p_sdy_end = [0.3  0.3 1 1]';

p_end_orig = [p_id_end p_ie_end p_se_end p_sd_end p_iey_end p_idy_end p_sey_end p_sdy_end];

%Para ir para o p0:  rotz(-90) elo1; 
%os elos 2 e 3 apenas podem rodar relativamente ao x local deles
ang_1=0;
ang_2=-pi/2;
ang_3=+pi/2;
p_elo1=[p_id p_ie p_se p_sd p_iey p_idy p_sey p_sdy];
p_elo2=trans3(0,0,3)*p_elo1;
p_elo3=trans3(0,0,6)*p_elo1;
p_end=trans3(0,0,9)*p_end_orig;

P=desenhar_robot3(p_elo1,p_elo2,p_elo3,p_end);

for i = linspace(0,1,100)

new_p_elo1= rotz(ang_1*i) * p_elo1;

new_p_elo2 = rotz(ang_1*i) * trans3(0,0,3) * rotx(ang_2*i) * p_elo1;

new_p_elo3 = rotz(ang_1*i) * trans3(0,0,3) * rotx(ang_2*i) * trans3(0,0,3) *rotx(ang_3*i) *  p_elo1;

new_p_end =  rotz(ang_1*i) * trans3(0,0,3) * rotx(ang_2*i) * trans3(0,0,3) * rotx(ang_3*i) * trans3(0,0,3) *  p_end_orig;

atualizar_robot3(P,new_p_elo1,new_p_elo2,new_p_elo3,new_p_end);
pause(0.0005)

end

pause(2)



%% Ex2 alínea c)


figure('Position', [0 20 675 675])
axis([-10 10 -10 10 -10 10]); xlabel('x'); ylabel('y'); zlabel('z')
title('Ex.2c - Simular o funcionamento do manipulador RRR a 3D')
hold on; grid on; axis square ; view(3)


p_id = [0.5 -0.5 0 1]';
p_ie = [-0.5 -0.5 0 1]';
p_se = [-0.5 -0.5 3 1]';
p_sd = [0.5 -0.5 3 1]';
p_iey = [-0.5 0.5 0 1]';
p_idy = [0.5  0.5 0 1]';
p_sey = [-0.5 0.5 3 1]';
p_sdy = [0.5  0.5 3 1]';

p_id_end = [0.3 -0.3 0 1]';
p_ie_end = [-0.3 -0.3 0 1]';
p_se_end = [-0.3 -0.3 1 1]';
p_sd_end = [0.3 -0.3 1 1]';
p_iey_end = [-0.3 0.3 0 1]';
p_idy_end = [0.3  0.3 0 1]';
p_sey_end = [-0.3 0.3 1 1]';
p_sdy_end = [0.3  0.3 1 1]';

p_end_orig = [p_id_end p_ie_end p_se_end p_sd_end p_iey_end p_idy_end p_sey_end p_sdy_end];

%Para ir para o p0:  rotz(-90) elo1; 
%os elos 2 e 3 apenas podem rodar relativamente ao x local deles
ang_1=0;
ang_2=-pi/2;
ang_3=pi/2;
p_elo1=[p_id p_ie p_se p_sd p_iey p_idy p_sey p_sdy];

new_p0_elo1= rotz(ang_1) * p_elo1;

new_p0_elo2 = rotz(ang_1) * trans3(0,0,3) * rotx(ang_2) * p_elo1;

new_p0_elo3 = rotz(ang_1) * trans3(0,0,3) * rotx(ang_2) * trans3(0,0,3) *rotx(ang_3) *  p_elo1;

new_p0_end =  rotz(ang_1) * trans3(0,0,3) * rotx(ang_2) * trans3(0,0,3) * rotx(ang_3) * trans3(0,0,3) *  p_end_orig;

Fill_elos=desenhar_robot3(new_p0_elo1,new_p0_elo2,new_p0_elo3,new_p0_end);


ang_11=-pi/2;
%ang_22=-pi/2;
ang_33=-pi;


for i = linspace(0,1,100)

new_p1_elo1= rotz(ang_11*i) * rotz(ang_1) * p_elo1;


new_p1_elo2 = rotz(ang_11*i)* rotz(ang_1) * trans3(0,0,3) * rotx(ang_2) * p_elo1;


new_p1_elo3 = rotz(ang_11*i)* rotz(ang_1) * trans3(0,0,3) * rotx(ang_2) * trans3(0,0,3) *rotx(ang_3)*  rotx(ang_33*i)*  p_elo1;


new_p1_end = rotz(ang_11*i)* rotz(ang_1) * trans3(0,0,3) * rotx(ang_2) * trans3(0,0,3) * rotx(ang_3) * rotx(ang_33*i) * trans3(0,0,3) *  p_end_orig;


atualizar_robot3(Fill_elos,new_p1_elo1,new_p1_elo2,new_p1_elo3,new_p1_end)

pause(0.005)

end

pause(2);


%% Ex2 alínea d)


figure('Position', [675 20 675 675])
axis([-10 10 -10 10 -10 10]); xlabel('x'); ylabel('y'); zlabel('z')
title('Ex.2d - Simular o funcionamento do manipulador RRR a 3D')
hold on; grid on; axis square ; view(3)




p_id = [0.5 -0.5 0 1]';
p_ie = [-0.5 -0.5 0 1]';
p_se = [-0.5 -0.5 3 1]';
p_sd = [0.5 -0.5 3 1]';
p_iey = [-0.5 0.5 0 1]';
p_idy = [0.5  0.5 0 1]';
p_sey = [-0.5 0.5 3 1]';
p_sdy = [0.5  0.5 3 1]';

p_id_end = [0.3 -0.3 0 1]';
p_ie_end = [-0.3 -0.3 0 1]';
p_se_end = [-0.3 -0.3 1 1]';
p_sd_end = [0.3 -0.3 1 1]';
p_iey_end = [-0.3 0.3 0 1]';
p_idy_end = [0.3  0.3 0 1]';
p_sey_end = [-0.3 0.3 1 1]';
p_sdy_end = [0.3  0.3 1 1]';


p_end_orig = [p_id_end p_ie_end p_se_end p_sd_end p_iey_end p_idy_end p_sey_end p_sdy_end];
p_elo1=[p_id p_ie p_se p_sd p_iey p_idy p_sey p_sdy];

%A partir de p0(0,3,7)' aplicar essas rotacoes nas juntas, qual sera p2??



ang_1=0;
ang_2=-pi/2;
ang_3=pi/2;


%coordenadas dos elos no ponto0

new_p0_elo1= rotz(ang_1) * p_elo1;

new_p0_elo2 = rotz(ang_1) * trans3(0,0,3) * rotx(ang_2) * p_elo1;

new_p0_elo3 = rotz(ang_1) * trans3(0,0,3) * rotx(ang_2) * trans3(0,0,3) *rotx(ang_3) *  p_elo1;

new_p0_end =  rotz(ang_1) * trans3(0,0,3) * rotx(ang_2) * trans3(0,0,3) * rotx(ang_3) * trans3(0,0,3) *  p_end_orig;

F=desenhar_robot3(new_p0_elo1,new_p0_elo2,new_p0_elo3,new_p0_end);


%estes angulos nao sao os que ele tem de rodar, mas sim para onde vai ficar

%como o ang_1 tinha rodado 0, vai ter de rodar agora -135
ang_1_p2=deg2rad(-135);
%como o ang_2 tinha rodado -90, vai ter de rodar 45
ang_2_p2=deg2rad(45);
%como o ang_3 tinha rodado +90, vai ter de rodar -90
ang_3_p2=deg2rad(-90);
%como o ang_4 tinha rodado 0, vai ter de rodar -45
ang_4_p2=deg2rad(-45);


%primeiro roda a base, depois o braço 2, depois o 3, depois o end effector
i=0;
k=0;
m=0;
for j=linspace(0,1,100)
    
new_p2_elo1= rotz(ang_1_p2*j) * rotz(ang_1) *  p_elo1;

new_p2_elo2 = rotz(ang_1_p2*j)*rotz(ang_1)  * trans3(0,0,3) * rotx(ang_2)*rotx(ang_2_p2*i) * p_elo1;

new_p2_elo3 = rotz(ang_1_p2*j) *rotz(ang_1) * trans3(0,0,3) * rotx(ang_2) *rotx(ang_2_p2*i)* trans3(0,0,3) *rotx(ang_3) * rotx(ang_3_p2*k) * p_elo1;

new_p2_end = rotz(ang_1_p2*j) * rotz(ang_1) * trans3(0,0,3) * rotx(ang_2)*rotx(ang_2_p2*i) * trans3(0,0,3) * rotx(ang_3) * rotx(ang_3_p2*k) * trans3(0,0,3) * rotx(ang_4_p2*m) *  p_end_orig;


atualizar_robot3(F,new_p2_elo1,new_p2_elo2,new_p2_elo3,new_p2_end)

pause(0.005)

end


j=1;
k=0;
m=0;
for i=linspace(0,1,100)
    
new_p2_elo1= rotz(ang_1_p2*j) * rotz(ang_1) *  p_elo1;

new_p2_elo2 = rotz(ang_1_p2*j)*rotz(ang_1)  * trans3(0,0,3) * rotx(ang_2)*rotx(ang_2_p2*i) * p_elo1;

new_p2_elo3 = rotz(ang_1_p2*j) *rotz(ang_1) * trans3(0,0,3) * rotx(ang_2) *rotx(ang_2_p2*i)* trans3(0,0,3) *rotx(ang_3) * rotx(ang_3_p2*k) * p_elo1;

new_p2_end = rotz(ang_1_p2*j) * rotz(ang_1) * trans3(0,0,3) * rotx(ang_2)*rotx(ang_2_p2*i) * trans3(0,0,3) * rotx(ang_3) * rotx(ang_3_p2*k) * trans3(0,0,3) * rotx(ang_4_p2*m) *  p_end_orig;


atualizar_robot3(F,new_p2_elo1,new_p2_elo2,new_p2_elo3,new_p2_end)

pause(0.005)

end

j=1;
i=1;
m=0;
for k=linspace(0,1,100)
    
new_p2_elo1= rotz(ang_1_p2*j) * rotz(ang_1) *  p_elo1;

new_p2_elo2 = rotz(ang_1_p2*j)*rotz(ang_1)  * trans3(0,0,3) * rotx(ang_2)*rotx(ang_2_p2*i) * p_elo1;

new_p2_elo3 = rotz(ang_1_p2*j) *rotz(ang_1) * trans3(0,0,3) * rotx(ang_2) *rotx(ang_2_p2*i)* trans3(0,0,3) *rotx(ang_3) * rotx(ang_3_p2*k) * p_elo1;

new_p2_end = rotz(ang_1_p2*j) * rotz(ang_1) * trans3(0,0,3) * rotx(ang_2)*rotx(ang_2_p2*i) * trans3(0,0,3) * rotx(ang_3) * rotx(ang_3_p2*k) * trans3(0,0,3) * rotz(ang_4_p2*m) *  p_end_orig;


atualizar_robot3(F,new_p2_elo1,new_p2_elo2,new_p2_elo3,new_p2_end)

pause(0.005)

end

j=1;
i=1;
k=1;
for m=linspace(0,1,100)
    
new_p2_elo1= rotz(ang_1_p2*j) * rotz(ang_1) *  p_elo1;

new_p2_elo2 = rotz(ang_1_p2*j)*rotz(ang_1)  * trans3(0,0,3) * rotx(ang_2)*rotx(ang_2_p2*i) * p_elo1;

new_p2_elo3 = rotz(ang_1_p2*j) *rotz(ang_1) * trans3(0,0,3) * rotx(ang_2) *rotx(ang_2_p2*i)* trans3(0,0,3) *rotx(ang_3) * rotx(ang_3_p2*k) * p_elo1;

new_p2_end = rotz(ang_1_p2*j) * rotz(ang_1) * trans3(0,0,3) * rotx(ang_2)*rotx(ang_2_p2*i) * trans3(0,0,3) * rotx(ang_3) * rotx(ang_3_p2*k) * trans3(0,0,3) * rotx(ang_4_p2*m) *  p_end_orig;


atualizar_robot3(F,new_p2_elo1,new_p2_elo2,new_p2_elo3,new_p2_end)

pause(0.005)

end



%tirar as coordenadas do plano e fazer o centro do plano



p1=new_p2_end(:,3);
p2=new_p2_end(:,4);
p3=new_p2_end(:,7);
p4=new_p2_end(:,8);

p2(1)=(p1(1)+p2(1)+p3(1)+p4(1))/4;
p2(2)=(p1(2)+p2(2)+p3(2)+p4(2))/4;
p2(3)=(p1(3)+p2(3)+p3(3)+p4(3))/4;



txt="p2: x= " + string(p2(1))+" y= "+ string(p2(2))+ " z= " + string(p2(3))

text(-6,3,-10,txt,'FontSize',14)

pause(3);


%% Ex2 - Extra
% Configurações inciciais
clear
clc

% Configurações da janela
figure('Position', [0 20 675 675])
axis([-10 10 -10 10 -10 10]); xlabel('x'); ylabel('y'); zlabel('z')
title('Ex.2 - Extra: Mover uma caixa de sítio')
hold on; grid on; axis square 
view(3)  % Começa com vista 3D


P_mesa = [  -5   7   -0.5   
             5   7   -0.5
             5  -7   -0.5
            -5  -7   -0.5
            -5   7    0 
             5   7    0
             5  -7    0 
            -5  -7    0 ];
        
P_perna1 = [ -5   7   -8   
             -4   7   -8
             -4   6   -8
             -5   6   -8
             -5   7   -0.5   
             -4   7   -0.5
             -4   6   -0.5
             -5   6   -0.5  ];

P_elo1 = [  0.5   0.5   0     % P1
            0.5  -0.5   0     % P2
           -0.5  -0.5   0     % P3
           -0.5   0.5   0     % P4
            0.5   0.5   3     % P5
            0.5  -0.5   3     % P6
           -0.5  -0.5   3     % P7
           -0.5   0.5   3  ]; % P8
       
% Homogeneização dos pontos
P_elo1 = [P_elo1 ones(size(P_elo1,1),1)];
P_perna1 = [P_perna1 ones(size(P_perna1,1),1)];

P_elo1 = P_elo1';
P_elo2 = trans3(0,0,3)*P_elo1;
P_elo3 = trans3(0,0,3)*P_elo2;
P_caixa = [P_elo1(1:2,:); P_elo1(3,:)/4 ;P_elo1(4,:)];
P_caix = trans3(0,2.6,0)*P_caixa;

P_gripper = [P_elo1(1:2,:)/2; P_elo1(3,:)/4 ;P_elo1(4,:)];
P_grip = trans3(0,0,9)*P_gripper;

P_perna1 = P_perna1';
P_perna2 = trans3(0,-13,0)*P_perna1;
P_perna3 = trans3(9,-13,0)*P_perna1;
P_perna4 =trans3(9,0,0)*P_perna1;

                       
F_elos = [  1   2   3   4
            5   6   7   8
            1   2   6   5
            1   5   8   4
            3   7   8   4
            2   6   7   3 ];
        
elo1 = patch('Vertices',P_elo1(1:3,:)','Faces',F_elos,'Facecolor','r');
elo2 = patch('Vertices',P_elo2(1:3,:)','Faces',F_elos,'Facecolor','b');
elo3 = patch('Vertices',P_elo3(1:3,:)','Faces',F_elos,'Facecolor','g');

gripper = patch('Vertices',P_grip(1:3,:)','Faces',F_elos,'Facecolor','c');

mesa = patch('Vertices',P_mesa,'Faces',F_elos,'Facecolor','#663300');

caixa = patch('Vertices',P_caix(1:3,:)','Faces',F_elos,'Facecolor','#8080ff');

perna1 = patch('Vertices',P_perna1(1:3,:)','Faces',F_elos,'Facecolor','#663300');
perna2 = patch('Vertices',P_perna2(1:3,:)','Faces',F_elos,'Facecolor','#663300');
perna3 = patch('Vertices',P_perna3(1:3,:)','Faces',F_elos,'Facecolor','#663300');
perna4 = patch('Vertices',P_perna4(1:3,:)','Faces',F_elos,'Facecolor','#663300');


% Posicionando no ponto p0
for ang=linspace(0,pi/3,100)
    Q2 = (trans3(0,0,3)*rotx(-ang)*P_elo1)';
    set(elo2,'Vertices',Q2(:,1:3),'Faces',F_elos);    

    Q3 = (trans3(0,0,3)*rotx(-ang)*trans3(0,0,3)*rotx(ang)*P_elo1)';
    set(elo3,'Vertices',Q3(:,1:3),'Faces',F_elos); 
    
    Q4 = (trans3(0,0,3)*rotx(-ang)*trans3(0,0,3)*rotx(ang)*trans3(0,0,3)*P_gripper)';
    set(gripper,'Vertices',Q4(:,1:3),'Faces',F_elos);
    
    pause(0.02) %Intervalo de 0.02s entre cada iteração do ciclo
end

% Posicionar para pegar na caixa
for ang=linspace(0,-pi,100)
    Q3 = (trans3(0,0,3)*rotx(-pi/3)*trans3(0,0,3)*rotx(pi/3)*rotx(ang)*P_elo1)';
    set(elo3,'Vertices',Q3(:,1:3),'Faces',F_elos); 
    
    Q4 = (trans3(0,0,3)*rotx(-pi/3)*trans3(0,0,3)*rotx(pi/3)*rotx(ang)*trans3(0,0,3)*P_gripper)';
    set(gripper,'Vertices',Q4(:,1:3),'Faces',F_elos);
    
    pause(0.02) %Intervalo de 0.02s entre cada iteração do ciclo
end

pause(0.5)
% Subir com a caixa
for ang=linspace(0,pi/7,100)
    Q2 = (trans3(0,0,3)*rotx(-pi/3)*rotx(ang)*P_elo1)';
    set(elo2,'Vertices',Q2(:,1:3),'Faces',F_elos); 
    
    Q3 = (trans3(0,0,3)*rotx(-pi/3)*rotx(ang)*trans3(0,0,3)*rotx(pi/3)*rotx(-pi)*rotx(-ang)*P_elo1)';
    set(elo3,'Vertices',Q3(:,1:3),'Faces',F_elos); 
    
    Q4 = (trans3(0,0,3)*rotx(-pi/3)*rotx(ang)*trans3(0,0,3)*rotx(pi/3)*rotx(-pi)*rotx(-ang)*trans3(0,0,3)*P_gripper)';
    set(gripper,'Vertices',Q4(:,1:3),'Faces',F_elos);
     
    Q5 = (rotx(ang)*trans3(0,2.6,0)*trans3(0,0,1.5)*rotx(-ang)*trans3(0,0,-1.5)*P_caixa)';
    set(caixa,'Vertices',Q5(:,1:3),'Faces',F_elos);
    pause(0.02) %Intervalo de 0.02s entre cada iteração do ciclo
end

% Rodar elo 1 -180º
for ang=linspace(0,-pi,100)
    Q1 = (rotz(ang)*P_elo1)';
    set(elo1,'Vertices',Q1(:,1:3),'Faces',F_elos); 
    
    Q2 = (rotz(ang)*trans3(0,0,3)*rotx(-pi/3)*rotx(pi/7)*P_elo1)';
    set(elo2,'Vertices',Q2(:,1:3),'Faces',F_elos); 
    
    Q3 = (rotz(ang)*trans3(0,0,3)*rotx(-pi/3)*rotx(pi/7)*trans3(0,0,3)*rotx(pi/3)*rotx(-pi)*rotx(-pi/7)*P_elo1)';
    set(elo3,'Vertices',Q3(:,1:3),'Faces',F_elos); 
    
    Q4 = (rotz(ang)*trans3(0,0,3)*rotx(-pi/3)*rotx(pi/7)*trans3(0,0,3)*rotx(pi/3)*rotx(-pi)*rotx(-pi/7)*trans3(0,0,3)*P_gripper)';
    set(gripper,'Vertices',Q4(:,1:3),'Faces',F_elos);
         
    Q5 = (rotz(ang)*rotx(pi/7)*trans3(0,2.6,0)*trans3(0,0,1.5)*rotx(-pi/7)*trans3(0,0,-1.5)*P_caixa)';
    set(caixa,'Vertices',Q5(:,1:3),'Faces',F_elos);
    
    pause(0.02) %Intervalo de 0.02s entre cada iteração do ciclo
end


% Descer com a caixa
for ang=linspace(0,pi/7,100)  
    Q2 = (rotz(-pi)*trans3(0,0,3)*rotx(-pi/3)*rotx(pi/7)*rotx(-ang)*P_elo1)';
    set(elo2,'Vertices',Q2(:,1:3),'Faces',F_elos); 
    
    Q3 = (rotz(-pi)*trans3(0,0,3)*rotx(-pi/3)*rotx(pi/7)*rotx(-ang)*trans3(0,0,3)*rotx(pi/3)*rotx(-pi)*rotx(-pi/7)*rotx(ang)*P_elo1)';
    set(elo3,'Vertices',Q3(:,1:3),'Faces',F_elos); 
    
    Q4 = (rotz(-pi)*trans3(0,0,3)*rotx(-pi/3)*rotx(pi/7)*rotx(-ang)*trans3(0,0,3)*rotx(pi/3)*rotx(-pi)*rotx(-pi/7)*rotx(ang)*trans3(0,0,3)*P_gripper)';
    set(gripper,'Vertices',Q4(:,1:3),'Faces',F_elos);
     
    Q5 = (rotz(-pi)*rotx(pi/7)*rotx(-ang)*trans3(0,2.6,0)*trans3(0,0,1.5)*rotx(-pi/7)*rotx(ang)*trans3(0,0,-1.5)*P_caixa)';
    set(caixa,'Vertices',Q5(:,1:3),'Faces',F_elos);
    
    pause(0.02) %Intervalo de 0.02s entre cada iteração do ciclo
end

pause(0.5)
% Subir sem caixa
for ang=linspace(0,pi,100)   
    Q3 = (rotz(-pi)*trans3(0,0,3)*rotx(-pi/3)*rotx(pi/7)*rotx(-pi/7)*trans3(0,0,3)*rotx(pi/3)*rotx(-pi)*rotx(-pi/7)*rotx(pi/7)*rotx(ang)*P_elo1)';
    set(elo3,'Vertices',Q3(:,1:3),'Faces',F_elos); 
    
    Q4 = (rotz(-pi)*trans3(0,0,3)*rotx(-pi/3)*rotx(pi/7)*rotx(-pi/7)*trans3(0,0,3)*rotx(pi/3)*rotx(-pi)*rotx(-pi/7)*rotx(pi/7)*rotx(ang)*trans3(0,0,3)*P_gripper)';
    set(gripper,'Vertices',Q4(:,1:3),'Faces',F_elos);
    
    pause(0.02) %Intervalo de 0.02s entre cada iteração do ciclo
end

% Volta à posição inicial
for ang=linspace(0,pi/3,100) 
    Q2 = (rotz(-pi)*trans3(0,0,3)*rotx(-pi/3)*rotx(pi/7)*rotx(-pi/7)*rotx(ang)*P_elo1)';
    set(elo2,'Vertices',Q2(:,1:3),'Faces',F_elos); 
    
    Q3 = (rotz(-pi)*trans3(0,0,3)*rotx(-pi/3)*rotx(pi/7)*rotx(-pi/7)*rotx(ang)*trans3(0,0,3)*rotx(pi/3)*rotx(-pi)*rotx(-pi/7)*rotx(pi/7)*rotx(pi)*rotx(-ang)*P_elo1)';
    set(elo3,'Vertices',Q3(:,1:3),'Faces',F_elos); 
    
    Q4 = (rotz(-pi)*trans3(0,0,3)*rotx(-pi/3)*rotx(pi/7)*rotx(-pi/7)*rotx(ang)*trans3(0,0,3)*rotx(pi/3)*rotx(-pi)*rotx(-pi/7)*rotx(pi/7)*rotx(pi)*rotx(-ang)*trans3(0,0,3)*P_gripper)';
    set(gripper,'Vertices',Q4(:,1:3),'Faces',F_elos);
    
    pause(0.02) %Intervalo de 0.02s entre cada iteração do ciclo
end

