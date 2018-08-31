function [retorno] = tpoligono(direcao, origem, pontos, numeroLados)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    index_p1 = 1;
    index_p2 = 2;
    retorno = 0;
    
    for index = 1 : numeroLados - 2
        
        index_p1 = index_p1 + 1;
        index_p2 = index_p2 + 1;
        
        %Ponto a
        xa = pontos{1}(1);
        ya = pontos{1}(2);
        za = pontos{1}(3);
        
        %Ponto b
        xb = pontos{index_p1}(1);
        yb = pontos{index_p1}(2);
        zb = pontos{index_p1}(3);
        
        %Ponto c
        xc = pontos{index_p2}(1);
        yc = pontos{index_p2}(2);
        zc = pontos{index_p2}(3);
        
        %Direcao
        xd = direcao(1);
        yd = direcao(2);
        zd = direcao(3);
        
        %Origem
        xe = origem(1);
        ye = origem(2);
        ze = origem(3);
        
        A = [xa-xb xa-xc xd; ya-yb ya-yc yd; za-zb za-zc zd];
        detA = det(A);
        
        %Beta
        betaNum = [xa-xe xa-xc xd; ya-ye ya-yc yd; za-ze za-zc zd];
        detBetaNum = det(betaNum);
        beta = detBetaNum/detA;
        
        %Gama
        gamaNum = [xa-xb xa-xe xd; ya-yb ya-ye yd; za-zb za-ze zd];
        detGamaNum = det(gamaNum);
        gama = detGamaNum/detA;
        
        %Te
        teNum = [xa-xb xa-xc xa-xe; ya-yb ya-yc ya-ye; za-zb za-zc za-ze];
        detTeNum = det(teNum);
        te = detTeNum/detA;
        
        if(beta>0 && gama>0 && (beta+gama)<1)
            retorno = 1;
        end   
    end
end





