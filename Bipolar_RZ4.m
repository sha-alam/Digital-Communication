%Bipolar Return to Zero Signaling
clc;
clear all;
close all;
N=10; %Number of bits
n=randi([0,1],1,N) %Random bit generation
%Binary to Bipolar Conversion
f=1;
for m=1:N
    if n(m)==1
        if f==1
            nn(m)=1;
            f=-1;
        else
            nn(m)=-1;
            f=1;
        end
    else
        nn(m)=0;
    end
end
nn
%Bipolar RZ Pulse Shaping
i=1;
a=0; %Initial value for the first half cycle
b=0.5; %Initial value for the second half cycle
t=0:0.01:length(n);
for j=1:length(t)
    if t(j)>=a && t(j)<=b %Condition for the first half cycle
        y(j)=nn(i); %Assign first 50 values for
    elseif t(j)>b && t(j)<=i %Condition for the Second half cycle
        y(j)=0; %Set all values 0 for the second half cycle
    else
        i=i+1; %Binary input data index increment
        a=a+1; %Initial value for the first half cycle increment
        b=b+1; %Initial value for the second half cycle increment
    end
end
plot(t,y,'lineWidth', 2); %Linewidth 2 for clear visualization
axis([0,N,-1.5,1.5]); %Axis set-up
grid on;
title('Bipolar return-to-zero (BRZ) signaling');