function [faces] = ladoscubo(centro,aresta)
a=aresta/2;
v1= [centro(1)-a centro(2)+a centro(3)+a];
v2= [centro(1)+a centro(2)+a centro(3)+a];
v3= [centro(1)+a centro(2)+a centro(3)-a];
v4= [centro(1)-a centro(2)+a centro(3)-a];
v5= [centro(1)-a centro(2)-a centro(3)+a];
v6= [centro(1)+a centro(2)-a centro(3)+a];
v7= [centro(1)+a centro(2)-a centro(3)-a];
v8= [centro(1)-a centro(2)-a centro(3)-a];

 faces=[{v1} {v2} {v3} {v4};{v4} {v3} {v7} {v8};{v4} {v1} {v8} {v5};{v1} {v2} {v5} {v6}; {v3} {v2} {v7} {v6}; {v8} {v7} {v5} {v6}];

end