function F = atualizar_robot(fill_1,fill_2,fill_3,pontos_elo1,pontos_elo2,pontos_elo3)

    set( fill_1, 'XData', pontos_elo1(1,:), 'YData', pontos_elo1(2,:));
    set( fill_2, 'XData', pontos_elo2(1,:), 'YData', pontos_elo2(2,:));
    set( fill_3, 'XData', pontos_elo3(1,:), 'YData', pontos_elo3(2,:));

end