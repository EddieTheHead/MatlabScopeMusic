%original script 
%http://www.mathworks.com/matlabcentral/fileexchange/14397-real-time-scope-display--simple-script-
%audio file:
%http://space.jerobeamfenderson.net/download/kickstarter192khz.wav

%Preparation:
%uiopen('kickstarter192khz.wav',1) %contains 'fs' and 'data' variables
%lChannel = data(:,1)';
%rChannel = data(:,2)';

player = audioplayer(data, fs);
timeBase = 0.05;   %sec
hF = figure;
hAx = gca;

N = length(rChannel);
maxA = max(rChannel);  minA = min(rChannel);
nSamples = round(fs*timeBase);
ind = 1;
hLine = plot(hAx,(1:nSamples)/fs,rChannel(:,ind:ind+nSamples-1),'green');
whitebg('black');

xlabel('Right Channel');
ylabel('Left Channel');
title('Scope');
ylim([minA maxA]);

play(player);
tic;    %start time measuring
while (ind < N-nSamples) & ishandle(hLine)
   

   set(hLine,'ydata',rChannel(:,ind:ind+nSamples-1));
   set(hLine,'xdata',lChannel(:,ind:ind+nSamples-1));
   
   drawnow  %updates the display
   
   t = toc; %measuring current time
   ind = round(t*fs); 
   ind = max(ind,1);
   
end
stop(player);