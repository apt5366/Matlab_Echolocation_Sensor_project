addpath('demo/');

[fs, windowsize, rep, sos]= getConstant;

filename= strcat(strcat('wgn-', int2str(windowsize)), '.m4a');

[xsignal, fs1]= audioread(filename);
xsignal = xsignal(1:windowsize, 1);
[ysignal, fs2]= audioread('r.m4a');

start = fix(size(ysignal,1)*(1/3));
ysignal= ysignal(start:start+windowsize-1);
 
%%%%% ----- ------%%%%%

xfft= fft(xsignal);
yfft= fft(ysignal);
hfft= yfft ./ xfft;
h = ifft(hfft);

% figure;
% p =xsignal;
% x= linspace(0,size(p,1), size(p,1));
% plot(x, p); hold on;
% p = ysignal; plot(x,p);

%%% ---- ----%%%
plot(h)

