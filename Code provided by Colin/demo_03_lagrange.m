%% Run the examples from the notes:
% Uses lagrange.m and lagrange_poly.m

figure(1); clf;

lagrange([1 2 3 4], [2 4 8 8])

disp('paused'); pause

figure(1); clf

lagrange([1 1.5 2 5.1], [3 3.2 3 0])

disp('paused'); pause

figure(1); clf

lagrange([1 1.5 2 2.1], [3 3.2 3 0])

disp('paused'); pause

figure(1); clf

lagrange([1 1.5 2 2.05], [3 3.2 3 0])

disp('paused'); pause

%% Show if you put binary data, you get the L_{n,k} back

figure(1); clf
subplot(1, 4, 1);
lagrange([1 2 3 4], [1 0 0 0])
title('L_{3,0}(x)')

subplot(1, 4, 2);
lagrange([1 2 3 4], [0 1 0 0])
title('L_{3,1}(x)')

subplot(1, 4, 3);
lagrange([1 2 3 4], [0 0 1 0])
title('L_{3,2}(x)')

subplot(1, 4, 4);
lagrange([1 2 3 4], [0 0 0 1])
title('L_{3,3}(x)')
