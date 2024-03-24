addpath('.');

fs= 48000;
windowsize = 4800;
rep =50;
sos= 343; 

%%% generating the audio file %%%
%[fs, windowsize, rep, sos] = getConstant;

xsignal =wgn(windowsize,1,0);
xsignal_= repmat(xsignal, rep);
xsignal_= xsignal_(:,1);
%xsignal_ = normalize(xsignal_);

x = linspace(0, windowsize, windowsize);
plot(x, xsignal_(1:windowsize, 1)); hold on;
filename = strcat(strcat('wgn-', int2str(windowsize)), '.m4a');

audiowrite(filename, xsignal_, fs);
