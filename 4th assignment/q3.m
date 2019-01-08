clear all
% set up z in a complex plane
z_re1d = linspace(-3,3,100);
z_im1d = linspace(-4,4,100);
[z_re, z_im] = meshgrid(z_re1d, z_im1d);

z = z_re + 1i*z_im;

%% the growth factor G(z)

% Leapfrog
G = (z.^2 - 1)./ (2*z);


% plot 1-contour of the magnitude of the growth factor
figure(1), clf
% optionally, show the surface not just the 1-contour:
pcolor(z_re, z_im, abs(G)); shading flat; hold on;
contour(z_re, z_im, abs(G), [1 1], 'k', 'linewidth', 3);
grid on, axis equal;
xlabel('Re(z)','fontsize',14);
ylabel('Im(z)','fontsize',14);
%axis([min(z_re1d) max(z_re1d) min(z_im) max(z_im)]);
title('Stability Region', 'fontsize', 14);
colorbar
colormap jet
