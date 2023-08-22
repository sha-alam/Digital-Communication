% Unipolar Non Return to Zero Line Coding
bitStream = [1 0 1 1 0 1 1 0 0 1]; % Binary bit stream

% Signal Shaping
t = 0:length(bitStream) - 1;
signal = repmat(bitStream, 1, 1);

% Plotting
stairs(t, signal, 'b', 'linewidth', 2);
axis([0, length(bitStream) - 1, -0.5, 1.5]);
grid on;
title("Unipolar NRZ Signaling");
xlabel("Time (bit periods)");
ylabel("Amplitude");
