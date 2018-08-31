centro=[0 0 0];
[faces]=ladoscubo(centro,2);
for i=1:6
   funcionraytracing(faces(1,:),faces(2,:));
end
% funcionraytracing({[-1 1 -1] [1 1 -1] [1 -1 -1] [-1 -1 -1]})