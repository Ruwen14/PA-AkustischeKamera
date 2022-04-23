function [freqs, cAmpl, maxFreq] = singleSidedFFT(signal, fSamp, options)
    arguments
        signal
        fSamp
        options.MakePlot (1,1) {mustBeNumericOrLogical} = false
    end

    Y = fft(signal);
    L = length(signal);
    
    P2 = abs(Y/ L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f1 = fSamp*(0:(L/2))/L

    if options.MakePlot
        plot(f1,P1) 
        title('Single-Sided Amplitude Spectrum of Signal')
        xlabel('f (Hz)')
        ylabel('|P1(f)|')
    end

    [~,index] = max(abs(Y(1:L/2+1)));
    freqs = f1;
    cAmpl = P1;
    maxFreq = freqs(index);
end