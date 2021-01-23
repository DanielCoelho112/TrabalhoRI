function D = desenhar_robot(pontos_elo1,pontos_elo2,pontos_elo3)

axis([-10 10 -10 10]); xlabel('x'); ylabel('y')

hold on; grid on; axis square 

Fill_Elo1=fill(pontos_elo1(1,:),pontos_elo1(2,:), 'red');
hold on
Fill_Elo2=fill(pontos_elo2(1,:),pontos_elo2(2,:), 'blue');
hold on
Fill_Elo3=fill(pontos_elo3(1,:),pontos_elo3(2,:), 'green');

D=[Fill_Elo1,Fill_Elo2,Fill_Elo3];

end