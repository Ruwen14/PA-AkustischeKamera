A = rand(1000, 16);




shiftVector = [1:16];


tic
shifted5 = delayMatrix(A, shiftVector);
toc

tic
shifted1 = delayseq(A, shiftVector);
toc

tic
shifted2 = fastShift1(A, shiftVector);
toc

tic
shifted3 = fastShift2(A', shiftVector);
toc


tic
shifted4 = fastdelayseq(A, shiftVector);
toc




function shifted = fastShift1(A, ShiftVector)
[m,n]=size(A);
J=repmat(1:n,m,1);
Inew=(1:m).'+ ShiftVector;
idx=(1<=Inew) & (Inew<=m);
shifted=accumarray([Inew(idx),J(idx)], A(idx),[m,n]);
end

function A = fastShift2(A, shiftVector)
for k = 1:size(A,1)
    n = shiftVector(k);
    row = A(k, :);
    B = zeros(size(row));
    B(n+1:end)=row(1:end-n);
    A(k,:) = B;
end
A = A';
end


function Mat = delayMatrix(Mat,delayVec)
    for i = 1:size(Mat,2)
        shift = delayVec(i);
        if shift == 0
            continue
        end
        Mat(:, i) = circshift(Mat(:, i), shift);
        if shift > 0
            Mat(1:shift,i) = 0;
        else
            Mat(end+shift+1:end,i) = 0;
        end
    end
end


function y=fastdelayseq(x,dtIn)
%delayseq Delay or advance time sequence
%   Y = delayseq(X, DELAY) returns the delayed or advanced sequence Y by
%   applying DELAY to the input sequence X. DELAY (in samples) can be
%   integer or non-integer values. When it is negative, the sequence X is
%   advanced. X can be a vector or a matrix. DELAY is a scalar or a vector.
%
%   When X is a column vector, X is delayed by each element of DELAY and
%   the resulting sequence will be stored in corresponding column of Y.
%
%   When X has multiple columns, each column is delayed by corresponding
%   element of DELAY. If DELAY is a scalar, it will be applied to each
%   column of X.
%
%   The output sequence Y always has the same length as input with
%   appropriate truncations or zero padding.
%
%   Y = delayseq(X, DELAY, Fs) specifies DELAY in seconds. Fs is the
%   sampling frequency (in Hz).
%
%   This function supports single and double precision for input data and
%   arguments. If the input data X is single precision, the output data 
%   is single precision. If the input data X is double precision, the 
%   output data is double precision. The precision of the output is
%   independent of the precision of the arguments.
%
%   % Example:
%   %   Delay a sinusoid by 0.001 second.
%
%   fs = 8e3; t = 0:1/fs:0.005; x = sin(2*pi*100*t).';
%   y = delayseq(x,0.001,fs);
%   plot(t,x,'r',t,y,'b'); legend('Original','Delayed');
%
%   See also phased, phased.TimeDelayBeamformer.

%   Copyright 2010-2012 The MathWorks, Inc.

%   Reference
%   [1] Harry Van Trees, Optimum Array Processing, Wiley, 2002

%#codegen
%#ok<*EMCA>

bSingleVecX = true;
if size(x,2)~=1         % not a column vector
    bSingleVecX = false;
    if (length(dtIn) == 1)    % scalar expansion of dt
        dt = dtIn*ones(size(x,2),1);
    else
        dt = dtIn;
    end
else
    dt = dtIn;
end


% initialization
inputLength = size(x,1);
delayInt = round(dt);    % Integer delays in samples
maxLength = inputLength+max(0, max(delayInt)); % maximum sequence length
% Define upperbound
if maxLength > 2*inputLength
    maxLengthLimit = 2*inputLength;
else
    maxLengthLimit = maxLength;
end
if isreal(x)
   output = zeros(maxLengthLimit,length(dt),class(x));
else
   output = complex(zeros(maxLengthLimit,length(dt),class(x)));
end

% Perform delay operation
for colI=1:length(dt)

    endIdx = inputLength+delayInt(colI);
    % no operation if delayed or advanced out of scope
    if (endIdx <= 0) || (endIdx > 2*inputLength)
        continue;
    end

    if bSingleVecX
        tmpx = x(:);
    else
        tmpx = x(:,colI);
    end
    
    % Integer sampling shifting
    if delayInt(colI) >= 0
        orgStart = 1;
        newStart = delayInt(colI) + 1;
    else
        orgStart = 1-delayInt(colI);
        newStart = 1;
    end
    orgEnd = inputLength;
    output(newStart:endIdx,colI) = tmpx(orgStart:orgEnd);

end

% output has the same length as input
y = output(1:inputLength, :);

end
