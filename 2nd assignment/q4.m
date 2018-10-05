clear all
clc

max_1 = [];
max_2 = [];
n_s = [];
x= linspace(-1,1,3000);

for n = 2:1:40
    %% Equispaced points
    equi = linspace(-1,1,n+1);
  
  
    %% Chebyshev points
  
    cheby = cos(linspace(-pi, 0, n+1))';
    
    f = poly(equi);
    g = poly(cheby);
    
    r = -1 + 2 * rand(1000,1);
    
    f_eval = polyval(f,r);
    g_eval = polyval(g,r);   
    
    max_1 = [max_1 max(abs(f_eval))]; %4c
    max_2 = [max_2 max(abs(g_eval))]; %4c
    n_s = [n_s n];
    
%     if n == 8 %4b
%         plot(x,f(x),'r',x,g(x),'b');
%         plot(equi,zz,'r*',cheby,zz,'b*'); %4b
%     end 

%hold on


end

semilogy(n_s, max_1, 'r', n_s, max_2 , 'b')


