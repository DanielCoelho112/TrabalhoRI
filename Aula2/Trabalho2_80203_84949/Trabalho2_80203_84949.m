% Trabalho 2 - Translação e rotações de objetos 2D
% Daniel Coelho       nºmec.84949
% Miguel Pina         nºmec.80203

% ------------------------------------------------------------------------
% -------------------- 1.Rotações de segmentos de reta -------------------
% ------------------------------------------------------------------------

%% Ex1 alínea (a)
% Initial configurations
clc % Clear all text from command window
close all
clear % Clear previous environment variables

% Criação dos pontos p0(0,0) e p1(3,0) do segmento de reta pretendido
p0 = [0 0]';   p1 = [3 0]';
p_line = [p0 p1];

% Configurações da janela e representação gráfica do segmento de reta

figure('Renderer','painters', 'Position', [0 20 675 675])
line(p_line(1,:),p_line(2,:), 'LineWidth', 2, 'Color', 'blue');
title('Ex.1a - Visualização do segmento de reta limitado pelos pontos p0 e p1')
xlabel('x'); ylabel('y');
axis([-4 4 -4 4]);
pause(1)


%% Ex1 alínea (b)
% Função auxiliar (rot.m) criada num script à parte

%% Ex1 alínea (c)
% Initial configurations
clc % Clear all text from command window

clear % Clear previous environment variables

% Criação dos pontos p0(0,0) e p1(3,0) do segmento de reta pretendido
p0 = [0 0]';   p1 = [3 0]';
p_line = [p0 p1];


% Configurações da janela e representação gráfica do segmento de reta

figure('Renderer', 'painters', 'Position', [675 20 675 675])
h=line(p_line(1,:),p_line(2,:), 'LineWidth', 2, 'Color', 'blue');
title('Ex.1a - Visualização do segmento de reta limitado pelos pontos p0 e p1')
xlabel('x'); ylabel('y'); axis([-4 4 -4 4])


% Pontos do segmento de reta para uma rotação de 45º:
p_line45 = rot(pi/4)*p_line;

% Pontos do segmento de reta para uma rotação de 90º:
p_line90 = rot(pi/2)*p_line;

% Representação gráfica da rotação:
angs = linspace(0,pi/2,25);
titulos = ["0º" "45º" "90º"];
idx = 1;

title('Ex.1c - Rotações de 45º e 90º ao segmento de reta')
for a = angs
    p_line_rot = rot(a)*p_line;
    set(h,'Xdata',p_line_rot(1,:), 'Ydata',p_line_rot(2,:));
    
    if a==0 || a==pi/4 || a==pi/2
        
        line(p_line_rot(1,:),p_line_rot(2,:), 'LineWidth', 2, 'Color', rand(1,3)) % Representa a linha com uma cor aleatória
        text(max(p_line_rot(1,:))+0.15,max(p_line_rot(2,:))+0.15,titulos(idx))  
        idx = idx +1;
        
    end
    pause(0.08)
end
pause(1)


%% Ex1 alínea d)
% Initial configurations
clc % Clear all text from command window

clear % Clear previous environment variables

% Criação dos pontos p0(0,0) e p1(3,0) do segmento de reta pretendido
p0 = [0 0]';   p1 = [3 0]';
p_line = [p0 p1];

% Configurações da janela

figure('Renderer', 'painters', 'Position', [0 20 675 675])
xlabel('x'); ylabel('y'); axis([-4 4 -4 4])

% Representação gráfica da alínea:
angs = linspace(0,2*pi,360);
h=line(p_line(1,:),p_line(2,:), 'LineWidth', 2, 'Color', 'blue');
axis([-4 4 -4 4]);     title('Ex.1d - Trajetória de p1 centrado em p0')


text(0,0,'p0(0,0)')
tx=text(3,0,'p1(3,0)');
hold on
pause(1)
for a = angs
    p_line_rot = rot(a)*p_line;
    set(h,'Xdata',p_line_rot(1,:), 'Ydata',p_line_rot(2,:));
    plot(p_line_rot(1,2),p_line_rot(2,2),'.','MarkerSize', 10)
    pause(0.005)
end

delete(tx) % Apaga o texto que foi escrito para poder pintar a circunferência depois
rectangle('Position',[-3 -3 6 6],'Curvature',[1 1], 'FaceColor',[0.63 0.714 0.86]) % Pinta a circunferência


%% ------------------------------------------------------------------------
%  --------------- 2.Rotações e Translações de polígonos 2D ---------------
%  ------------------------------------------------------------------------


%% Ex2 alínea a) %%

clc % Clear all text from command window
clear % Clear previous environment variables


figure('Renderer', 'painters', 'Position', [675 20 675 675])

%definição dos pontos que defininem o trapézio

p1 = [-1,0]';
p2 = [1 0]';
p3 = [1 0.75]';
p4 = [0.5 0.75]';
p5 = [0.1 3]';
p6 = [-0.1 3]';
p7 = [-0.5 0.75]';
p8 = [-1 0.75]';

pontos_0 = [p1,p2,p3,p4,p5,p6,p7,p8];

pontos_0(end+1,:)= 1; %de forma a ficar homogeneo


%criação das componentes horizontais e verticais dos pontos a mostrar

x= pontos_0(1,:);
y=pontos_0(2,:);

fill(x,y,'Red')

grid on
xlabel('x')
ylabel('y')
title('Ex.2a - Visualização do polígono')
hold off
axis([-4 4 -4 4])
pause(1)

 
%% Ex2 alínea b) %%


%Movimento: Trans(3,0), Rot(z,90) relativamente ao referencial global

clc % Clear all text from command window

clear % Clear previous environment variables


figure('Renderer', 'painters', 'Position', [0 20 675 675])


%definição dos pontos que defininem o trapézio

p1 = [-1,0]';
p2 = [1 0]';
p3 = [1 0.75]';
p4 = [0.5 0.75]';
p5 = [0.1 3]';
p6 = [-0.1 3]';
p7 = [-0.5 0.75]';
p8 = [-1 0.75]';
pontos_0 = [p1,p2,p3,p4,p5,p6,p7,p8];

pontos_0(end+1,:)= 1; %de forma a ficar homogeneo


%Translação de 3 unidades em x sentido positivo (Trans(3,0))

for i = 0:0.1:3
    
    pontos = Trans_2D(i,0) * pontos_0;
    x= pontos(1,:);
    y=pontos(2,:);
    fill(x,y,'Red')
    
    grid on
    xlabel('x')
    ylabel('y')
    title('Ex.2b - Rotação em torno da origem de 0 a 90')
    axis([-10 10 -10 10])
    
    pause(0.001)

    
end

%Rotação de 90 graus em z sentido positivo (Rot(z,3)) relativamente ao
%referencial global


for i = 0:1:90
    
    rad = (i * pi) / 180 ;
    
    pontos = Rot_2D(rad) * Trans_2D(3,0) * pontos_0;
    x= pontos(1,:);
    y=pontos(2,:);
    fill(x,y,'Red')
    
    grid on
    xlabel('x')
    ylabel('y')
    title('Ex.2b - Rotação em torno da origem de 0 a 90')
    axis([-10 10 -10 10])
    
    pause(0.001)

    
end
pause(1)

    
    
%% Ex2 alínea b) Mas com rotação relativamente ao novo referencial

clc % Clear all text from command window

clear % Clear previous environment variables


figure('Renderer', 'painters', 'Position', [675 20 675 675])

%definição dos pontos que defininem o trapézio

p1 = [-1,0]';
p2 = [1 0]';
p3 = [1 0.75]';
p4 = [0.5 0.75]';
p5 = [0.1 3]';
p6 = [-0.1 3]';
p7 = [-0.5 0.75]';
p8 = [-1 0.75]';
pontos_0 = [p1,p2,p3,p4,p5,p6,p7,p8];

pontos_0(end+1,:)= 1; %de forma a ficar homogeneo


%Translação de 3 unidades em x sentido positivo (Trans(3,0))

for i = 0:0.1:3
    
    pontos = Trans_2D(i,0) * pontos_0;
    x= pontos(1,:);
    y=pontos(2,:);
    fill(x,y,'Red')
    
    grid on
    xlabel('x')
    ylabel('y')
    title('Ex.2b - com rotação relativamente ao novo referencial')
    axis([-10 10 -10 10])
    
    pause(0.01)

    
end

%Rotação de 90 graus em z sentido positivo (Rot(z,3)) relativamente ao novo
%referencial

for i = 0:1:90
    
    rad = (i * pi) / 180 ;
    
    pontos =  Trans_2D(3,0) * Rot_2D(rad) * pontos_0;
    x= pontos(1,:);
    y=pontos(2,:);
    fill(x,y,'Red')
    
    grid on
    xlabel('x')
    ylabel('y')
    title('Ex.2b com rotação relativamente ao novo referencial')
    axis([-10 10 -10 10])
    
    pause(0.01)

    
end
pause(1)


%% Ex2 alínea c) 

clc % Clear all text from command window

clear % Clear previous environment variables


figure('Renderer', 'painters', 'Position', [0 20 675 675])

%definição dos pontos que defininem o trapézio

p1 = [-1,0]';
p2 = [1 0]';
p3 = [1 0.75]';
p4 = [0.5 0.75]';
p5 = [0.1 3]';
p6 = [-0.1 3]';
p7 = [-0.5 0.75]';
p8 = [-1 0.75]';
pontos_0 = [p1,p2,p3,p4,p5,p6,p7,p8];

pontos_0(end+1,:)= 1; %de forma a ficar homogeneo


%Translação de 3 unidades em x sentido positivo (Trans(3,0))

for i = 0:0.1:3
    
    pontos = Trans_2D(i,0) * pontos_0;
    x= pontos(1,:);
    y=pontos(2,:);
    fill(x,y,'Red')
    
    grid on
    xlabel('x')
    ylabel('y')
    title('Ex.2c')
    axis([-10 10 -10 10])
    
    pause(0.01)

    
end


%Rotação de 90 graus em z sentido positivo (Rot(z,90)) relativamente ao
%referencial global


for i = 0:1:90
    
    rad = (i * pi) / 180 ;
    
    pontos = Rot_2D(rad) * Trans_2D(3,0) * pontos_0;
    x= pontos(1,:);
    y=pontos(2,:);
    fill(x,y,'Red')
    grid on
    xlabel('x')
    ylabel('y')
    title('Ex.2c')
    axis([-10 10 -10 10])
    
    pause(0.01)

    
end

%Rotação de 90 a 180 graus em z sentido positivo (Rot(z,90)) relativamente ao
%referencial global com rotação relativamente a si de forma a ficar virado
%para cima

ordem = 0;


for i = 91:1:180
    
    ordem = ordem + 1;
    alfa = 2 * ordem;
    
    alfa = -(alfa * pi) / 180;
    
    
    rad = (i * pi) / 180 ;
    
    pontos = Rot_2D(rad) * Trans_2D(3,0)* Rot_2D(alfa) * pontos_0;
    x= pontos(1,:);
    y=pontos(2,:);
    fill(x,y,'Red')
    grid on
    xlabel('x')
    ylabel('y')
    title('Ex.2c')
    axis([-10 10 -10 10])
    
    pause(0.01)

    
end
pause(1)



%% Ex2 alinea c) mas mantendo o bico sempre para cima

clc % Clear all text from command window

clear % Clear previous environment variables


figure('Renderer', 'painters', 'Position', [675 20 675 675])

%definição dos pontos que defininem o trapézio

p1 = [-1,0]';
p2 = [1 0]';
p3 = [1 0.75]';
p4 = [0.5 0.75]';
p5 = [0.1 3]';
p6 = [-0.1 3]';
p7 = [-0.5 0.75]';
p8 = [-1 0.75]';
pontos_0 = [p1,p2,p3,p4,p5,p6,p7,p8];

pontos_0(end+1,:)= 1; %de forma a ficar homogeneo


ordem = 0;
alfa = 0;


%Se apenas fizesse a Rot_2D(rad) ele ia rodar e ia acabar com o bico virado
%para baixo, como o quero manter sempre para cima temos de ir rodando
%sempre relativamente a si mesmo, como queremos que ele fique para cima
%temos de rodas pi



for i = 0:1:180
    
    ordem = ordem + 1;
    alfa = 1 * ordem;
    
    alfa = -(alfa * pi) / 180;
    
    
    rad = (i * pi) / 180 ;
    
    pontos = Rot_2D(rad) * Trans_2D(3,0)* Rot_2D(alfa) * pontos_0;
    x= pontos(1,:);
    y=pontos(2,:);
    fill(x,y,'Red')
    grid on
    xlabel('x')
    ylabel('y')
    title('Ex.2c - com bico sempre para cima')
    axis([-10 10 -10 10])
    
    pause(0.01)

    
end

pause(1)




%% Ex2 alínea d)


% Neste exercício utilizou-se uma função de transferência diferente,
% 'transf', em que possibilita tanto a rotação como a translação dependendo
% dos inputs fornecidos.


clc % Clear all text from command window

clear % Clear previous environment variables

% Configuração da janela

figure('Renderer', 'painters', 'Position', [0 20 675 675])
axis([-10 10 -10 10]); title('Ex.2d - Trajetória definida pelo perímetro de um quadrado')
xlabel('x'); ylabel('y')
hold on; grid on; axis square 

% Pontos do polígono
p1 = [-1 0]';
p2 = [1 0]';
p3 = [1 0.75]';
p4 = [0.5 0.75]';
p5 = [0.1 3]';
p6 = [-0.1 3]';
p7 = [-0.5 0.75]';
p8 = [-1 0.75]';
P=[p1 p2 p3 p4 p5 p6 p7 p8];

% Homogeneização do polígono
P = [P; ones(1,8)]; 

P_t = transf(0,3,0)*P;

% Preenchimento do polígono a vermelho
h = fill(P_t(1,:),P_t(2,:),'r');

pause(1)

p0 = [3 0]';
% Translação (0,3)
for t = linspace(0,3,100)
    Q = transf(0,0,t)*transf(0,3,0)*P;
    
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    
    p1 = [3 t]';
    p_line1 = [p0 p1];
    linha=line(p_line1(1,:),p_line1(2,:), 'LineWidth', 2, 'Color', 'blue');
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end


% Rotação 90º sobre si mesmo no vértice
for angs = linspace(0,pi/2,100)
    Q = transf(0,0,3)*transf(0,3,0)*transf(angs,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end


p0 = [3 3]';
p_t = linspace(3,-3,100);
i=0;
% Translação (-6,0)
for t = linspace(0,-6,100)
    Q = transf(0,t,0)*transf(0,0,3)*transf(0,3,0)*transf(pi/2,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    
    i = i+1;
    p1 = [p_t(i) 3]';
    p_line1 = [p0 p1];
    linha=line(p_line1(1,:),p_line1(2,:), 'LineWidth', 2, 'Color', 'blue');
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end

% Rotação 90º sobre si mesmo no vértice
for angs = linspace(0,pi/2,100)
    Q = transf(0,-6,0)*transf(0,0,3)*transf(pi/2,6,0)*transf(pi/2,0,0)*...
        transf(0,3,0)*transf(pi,0,0)*transf(pi/2,0,0)*transf(angs,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end


p0 = [-3 3]';
p_t = linspace(3,-3,100);
i = 0;
% Translação (0,-6)
for t = linspace(0,-6,100)
    Q = transf(0,0,t)*transf(0,-6,0)*transf(0,0,3)*transf(pi/2,6,0)*...
        transf(pi/2,0,0)*transf(0,3,0)*transf(pi,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    
    i = i+1;
    p1 = [-3 p_t(i)]';
    p_line1 = [p0 p1];
    linha=line(p_line1(1,:),p_line1(2,:), 'LineWidth', 2, 'Color', 'blue');
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end


% Rotação 90º sobre si mesmo no vértice
for angs = linspace(0,pi/2,100)
    Q = transf(0,0,-6)*transf(0,-6,0)*transf(0,0,3)*transf(pi/2,6,0)*transf(pi/2,0,0)*...
        transf(0,3,0)*transf(pi,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(angs,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end


p0 = [-3 -3]';
p_t = linspace(-3,3,100);
i = 0;
% Translação (6,0)
for t = linspace(0,6,100)
    Q = transf(0,t,0)*transf(0,0,-6)*transf(0,-6,0)*transf(0,0,3)*transf(pi/2,6,0)*transf(pi/2,0,0)*...
        transf(0,3,0)*transf(pi,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    
    i = i+1;
    p1 = [p_t(i) -3]';
    p_line1 = [p0 p1];
    linha=line(p_line1(1,:),p_line1(2,:), 'LineWidth', 2, 'Color', 'blue');
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end


% Rotação 90º sobre si mesmo no vértice
for angs = linspace(0,pi/2,100)
    Q = transf(0,6,0)*transf(0,0,-6)*transf(0,-6,0)*transf(0,0,3)*transf(pi/2,6,0)*transf(pi/2,0,0)*...
        transf(0,3,0)*transf(pi,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(angs,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end


p0 = [3 -3]';
p_t = linspace(-3,0,100);
i = 0;
%Translação (0,3)
for t = linspace(0,3,100)
    Q = transf(0,0,t)*transf(0,6,0)*transf(0,0,-6)*transf(0,-6,0)*transf(0,0,3)*transf(pi/2,6,0)*transf(pi/2,0,0)*...
        transf(0,3,0)*transf(pi,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    
    i = i+1;
    p1 = [3 p_t(i)]';
    p_line1 = [p0 p1];
    linha=line(p_line1(1,:),p_line1(2,:), 'LineWidth', 2, 'Color', 'blue');
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end


%====================================================================
%====================================================================
%====================================================================

title('Ex2 - Finalização do trabalho')
% Posicionamento para escrever 'RI' em cima do quadrado desenhado
angs = linspace(0,3*pi/4,50);
t_x = linspace(0,2.2,50);
t_y = linspace(0,4,50);
for i=1:50
    Q = transf(angs(i),t_x(i),t_y(i))*transf(0,0,3)*transf(0,6,0)*transf(0,0,-6)*transf(0,-6,0)*transf(0,0,3)*...
        transf(0,3,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end

% Começa a escrever:
% ESCREVE A LETRA R

p0 = [Q(1,6) Q(2,6)]';
p_t = linspace(Q(2,6),Q(2,6)+3,50);
i = 0;
for t = linspace(0,3,50)
    Q = transf(0,0,t)*transf(3*pi/4,2.2,4)*transf(0,0,3)*transf(0,6,0)*transf(0,0,-6)*transf(0,-6,0)*...
        transf(0,0,3)*transf(0,3,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    
    i = i+1;
    p1 = [Q(1,6) p_t(i)]';
    p_line1 = [p0 p1];
    linha=line(p_line1(1,:),p_line1(2,:), 'LineWidth', 4, 'Color', 'red');
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end



p0 = [Q(1,6) Q(2,6)]';
p_t = linspace(Q(1,6),Q(1,6)+1.5,50);
i = 0;
for t = linspace(0,1.5,50)
    Q = transf(0,t,0)*transf(0,0,3)*transf(3*pi/4,2.2,4)*transf(0,0,3)*transf(0,6,0)*transf(0,0,-6)*transf(0,-6,0)*...
        transf(0,0,3)*transf(0,3,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    
    i = i+1;
    p1 = [p_t(i) Q(2,6)]';
    p_line1 = [p0 p1];
    linha=line(p_line1(1,:),p_line1(2,:), 'LineWidth', 4, 'Color', 'red');
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end


p0 = [Q(1,6) Q(2,6)]';
p_t = linspace(Q(2,6),Q(2,6)-1.5,50);
i = 0;
for t = linspace(0,-1.5,50)
    Q = transf(0,0,t)*transf(0,1.5,0)*transf(0,0,3)*transf(3*pi/4,2.2,4)*transf(0,0,3)*transf(0,6,0)*transf(0,0,-6)*...
        transf(0,-6,0)*transf(0,0,3)*transf(0,3,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    
    i = i+1;
    p1 = [Q(1,6) p_t(i)]';
    p_line1 = [p0 p1];
    linha=line(p_line1(1,:),p_line1(2,:), 'LineWidth', 4, 'Color', 'red');
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end

p0 = [Q(1,6) Q(2,6)]';
p_t = linspace(Q(1,6),Q(1,6)-1.5,50);
i = 0;
for t = linspace(0,-1.5,50)
    Q = transf(0,t,0)*transf(0,0,-1.5)*transf(0,1.5,0)*transf(0,0,3)*transf(3*pi/4,2.2,4)*transf(0,0,3)*transf(0,6,0)*transf(0,0,-6)*...
        transf(0,-6,0)*transf(0,0,3)*transf(0,3,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    
    i = i+1;
    p1 = [p_t(i) Q(2,6)]';
    p_line1 = [p0 p1];
    linha=line(p_line1(1,:),p_line1(2,:), 'LineWidth', 4, 'Color', 'red');
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end


p0 = [Q(1,6) Q(2,6)]';
p_t = linspace(Q(1,6),Q(1,6)+1.5,50);
p_t2 = linspace(Q(2,6),Q(2,6)-1.5,50);
i = 0;
t1 = linspace(0,1.5,50);
for t = linspace(0,-1.5,50)
    i = i+1;
    Q = transf(0,t1(i),t)*transf(0,-1.5,0)*transf(0,0,-1.5)*transf(0,1.5,0)*transf(0,0,3)*transf(3*pi/4,2.2,4)*transf(0,0,3)*transf(0,6,0)*...
        transf(0,0,-6)*transf(0,-6,0)*transf(0,0,3)*transf(0,3,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    
    p1 = [p_t(i) p_t2(i)]';
    p_line1 = [p0 p1];
    linha=line(p_line1(1,:),p_line1(2,:), 'LineWidth', 4, 'Color', 'red');
    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end


%LEVANTA O POLÍGONO E VAI PARA ONDE VAI ESCREVER O 'I'
for angs = linspace(0,-pi/4,50)
    Q = transf(0,1.5,-1.5)*transf(0,-1.5,0)*transf(0,0,-1.5)*transf(0,1.5,0)*transf(0,0,3)*transf(3*pi/4,2.2,4)*...
        transf(0,0,3)*transf(0,6,0)*transf(0,0,-6)*transf(0,-6,0)*transf(0,0,3)*transf(pi/2,6,0)*transf(pi/2,0,0)*...
        transf(0,3,0)*transf(pi,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(angs,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));

    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end


for t = linspace(0,1.5,50)
    Q = transf(0,t,0)*transf(0,1.5,-1.5)*transf(0,-1.5,0)*transf(0,0,-1.5)*transf(0,1.5,0)*transf(0,0,3)*transf(3*pi/4,2.2,4)*...
        transf(0,0,3)*transf(0,6,0)*transf(0,0,-6)*transf(0,-6,0)*transf(0,0,3)*transf(pi/2,6,0)*transf(pi/2,0,0)*...
        transf(0,3,0)*transf(pi,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(-pi/4,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));

    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end

for angs = linspace(0,pi/4,50)
    Q = transf(0,1.5,0)*transf(0,1.5,-1.5)*transf(0,-1.5,0)*transf(0,0,-1.5)*transf(0,1.5,0)*transf(0,0,3)*transf(3*pi/4,2.2,4)*...
        transf(0,0,3)*transf(0,6,0)*transf(0,0,-6)*transf(0,-6,0)*transf(0,0,3)*transf(pi/2,6,0)*transf(pi/2,0,0)*transf(0,3,0)*...
        transf(pi,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(-pi/4,0,0)*transf(angs,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));

    pause(0.0005) %Intervalo de 0.0005s entre cada iteração do ciclo
end

%ESCREVE A LETRA I
p0 = [Q(1,6) Q(2,6)]';
p_t = linspace(Q(2,6),Q(2,6)+3,50);
i = 0;
for t = linspace(0,3,50)
    Q = transf(0,0,t)*transf(0,1.5,0)*transf(0,1.5,-1.5)*transf(0,-1.5,0)*transf(0,0,-1.5)*transf(0,1.5,0)*transf(0,0,3)*transf(3*pi/4,2.2,4)*...
        transf(0,0,3)*transf(0,6,0)*transf(0,0,-6)*transf(0,-6,0)*transf(0,0,3)*transf(pi/2,6,0)*transf(pi/2,0,0)*transf(0,3,0)*...
        transf(pi,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(-pi/4,0,0)*transf(pi/4,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:));
    
    i = i+1;
    p1 = [Q(1,6) p_t(i)]';
    p_line1 = [p0 p1];
    linha=line(p_line1(1,:),p_line1(2,:), 'LineWidth', 4, 'Color', 'red');
    pause(0.001) %Intervalo de 0.005s entre cada iteração do ciclo
end



% Translação para retirar polígono
for t = linspace(0,30,300)
    Q = transf(0,t,0)*transf(0,0,3)*transf(0,1.5,0)*transf(0,1.5,-1.5)*transf(0,-1.5,0)*transf(0,0,-1.5)*transf(0,1.5,0)*transf(0,0,3)*...
        transf(3*pi/4,2.2,4)*transf(0,0,3)*transf(0,6,0)*transf(0,0,-6)*transf(0,-6,0)*transf(0,0,3)*transf(pi/2,6,0)*transf(pi/2,0,0)*...
        transf(0,3,0)*transf(pi,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(pi/2,0,0)*transf(-pi/4,0,0)*transf(pi/4,0,0)*P;
    set( h, 'XData', Q(1,:), 'YData', Q(2,:), 'FaceColor',rand(1,3));
    if t>10
        rectangle('Position',[-3 -3 6 6], 'FaceColor',[0.63 0.714 0.86])
    else
        pause(0.00005)
    end
end





