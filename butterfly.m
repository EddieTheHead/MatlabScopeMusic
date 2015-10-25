%Butterfly code generation using formula given in
%http://www.jerobeamfenderson.net/post/101351329308/how-it-works 

duration = 10; %s
fs = 192000; %Hz
t = 1:1/fs:duration;
Amp = 10;

x = sin(t).*(exp(cos(t)) -  2*cos(4*t)-(sin(t/12)).^5 );
y = cos(t).*(exp(cos(t)) -  2*cos(4*t)-(sin(t/12)).^5 );

x = Amp * x;
y = Amp * y;

%plot(x,y,'g')
sample = [x' y'];
ScopeSound(sample,fs);