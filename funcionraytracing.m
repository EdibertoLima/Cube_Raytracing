function[]=funcionraytracing(p,p2)
% Ponto de visão
e = [3 2 -2];

objetos = {};
objetos{1} = struct();
objetos{1}.cor = [50 0 255];
objetos{1}.tipo = 'poligono';
% objetos{1}.pontos = {[2 1 10] ,[2 8 10], [5 11 10], [8 8 10], [8 1 10]};
% objetos{1}.pontos = {[2 -1 10] ,[2 -8 10], [8 -8 10],[8 -1 10]};
objetos{1}.pontos = p;

objetos{2} = struct();
objetos{2}.cor = [50 0 255];
objetos{2}.tipo = 'poligono';
objetos{2}.pontos = p2;


% Vetor unitário w
w = e / norm(e);
[~,t_aux] = min(abs(e));
t = e;
t(t_aux) = 1;

% Vetor unitário u
u = (cross(t, w)) / (norm(cross(t, w)));

% Vetor unitário v
v = cross(u, w);

linhas = 420;
colunas = 400;
% matriz = zeros(linhas, colunas);

r_param = 20;
l_param = -20;
j_param = 20;
b_param = -20;

% matriz_p = zeros(linhas, colunas);
imagem = zeros(linhas, colunas, 3);
% declaration - transformation - begin

%u_value_reference = l_param + (r_param - l_param) * (linhas + 0.5)/linhas;
%v_value_reference = b_param + (j_param - b_param) * (colunas + 0.5)/colunas;

for i = 1:linhas
    for j = 1:colunas
        indice_min = -1;
         u_value = l_param + (r_param - l_param) * (i + 0.5) / linhas;
         v_value = b_param + (j_param - b_param) * (j + 0.5) / colunas;
        
      
        
         % Ortográfico
        origem = e + u_value * u + v_value * v;
        direcao = -w;
         for index = 1 : size(objetos, 2)
            
            if(strcmp(objetos{index}.tipo, 'poligono'))
            p1=objetos{index}.pontos{1};
            p2=objetos{index}.pontos{2};
            p3=objetos{index}.pontos{3};
            n=abs(cross((p1-p2),(p1-p3)));
            nu=n/norm(n);
            tp=dot((p1-e),nu)/dot(direcao,nu);
            numeroLados = size(objetos{index}.pontos,2);
            tocaTriangulo = tpoligono(direcao, origem, objetos{index}.pontos, numeroLados);
            
            if(tocaTriangulo)
               indice_min = index;
            end
            end
         end
         % Ponto de iluminação
            ponto_iluminacao = [-5 0 0];
            ii=1;
            
         if(indice_min ~= -1)  
             pt=origem + tp*direcao;
             l= (pt -ponto_iluminacao)/norm(pt -ponto_iluminacao);
             vi = (pt - e) /norm(pt - e);
             h = (vi + l) / norm(vi + l);
             
              % Cor da luz
            ks = [50 0 255]; 
            
            % Cor do ambiente
            ka = [30 0 0];
            
            % Intensidade do luz do ambiente
            ia = 2;
            
            % Intensidade da cor da luz
            pp = 0.5;
            
            imagem(i,j,1) = ka(1)*ia + objetos{indice_min}.cor(1)* ii * max(0, dot(nu, l)) + ks(1) * ii * max(0, dot(nu, h)^pp);
            imagem(i,j,2) = ka(2)*ia + objetos{indice_min}.cor(2)* ii * max(0, dot(nu, l)) + ks(2) * ii * max(0, dot(nu, h)^pp);
            imagem(i,j,3) = ka(3)*ia + objetos{indice_min}.cor(3)* ii * max(0, dot(nu, l)) + ks(3) * ii * max(0, dot(nu, h)^pp);
         
            
         end
         
    end
end

imagem = uint8(imagem);
figure, imshow(imagem);
end