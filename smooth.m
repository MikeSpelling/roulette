function smoothed = smooth(waveform, numSegs)
smoothed = zeros(1, numSegs);
segLen = length(waveform)/(numSegs+1);
if numSegs == 1
    smoothed = mean(waveform);
else
    smoothed(1) = mean(waveform(1:round(segLen)));
    for n = 2: numSegs
        smoothed(n) = mean(waveform((round(n * segLen): round((n * segLen)+segLen))));
    end
end