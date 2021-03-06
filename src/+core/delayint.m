function [sd, tn] = delayint(s,fs,d,ns)
%  This function delays the signal in vector S sampled at FS by an amount
%  D denoted in seconds.  If NS is present in the input argument,
%  the output signal length will be equal to this value in seconds (either by
%  truncating or zero padding).  If not present, the output signal length
%  will vary depending on the delay (it will be the original
%  signal length plus the max delay rounded up to the next sample).
%
%    [sd, tn] = delayint(s,fs,d,ns)
%
%  The delayed version of the signal SD starts at the same time point (D should
%  not be negative otherwise an error will occur).  This version performs the delay
%  in the time domain using a vector substitution with offest, where the
%  offest is rounded off to the nearest integer multiple of the sampling
%  interval.
%  IF TN is present in the output, a time axis is created for the output array
%  where 0 denotes the original starting point for S.
%  If S is a matrix, the program will assume each column is a signal and
%  the number of elements in D must be equal to the number of columns.
%
%   Written by Kevin D. Donohue (donohue@engr.uky.edu)  July 2005
%


%  Find length and dimension of input signal
[r,c] = size(s);

%  Covert to column vectors for processing
if r == 1;
    s = s.';  %  Ensure it is a column vector
    [rn,c] = size(s);
elseif c == 1
    [rn,c] = size(s); % Otherwise rn = r indicating it came in as a column vector
else   %  If multi column and row then process each column as its own signal
    [rn,c] = size(s); % Otherwise input was columnwise matrix
    if length(d) ~= c
        error('Number of columns in signal matrix must equal number of elements in delay vector')
    end
end

if min(d) < 0;
    error('Delay cannot be negative')
end
% Compute requested delay in sample points rounded off to nearest sample
nd = ceil(d*fs);

%  Determine final output length
if nargin == 4
    slen = ceil(ns*fs);
else
    slen = max(nd)+rn;   %  Take max of all delays in vector to determine final signal length
end
sdd = zeros(slen,1);  % Initalize dummy vector for storing integer shift
sd = zeros(slen,c);       % Initialize output matrix

%  Loop through each row of signal matrix and apply delay
for k=1:c
    %  Shift integer sample component of delay
    id = fix(d(k)*fs)+1;
    sdd(id:min([slen,(rn+id-1)])) = s(1:min([slen-id+1, rn]),k);
    sd(:,k) = sdd(1:slen);
end

%  Restore dimension of signal vector to original orientation
if rn == r     % If input was originally a column or multi-signal matrix we are done
   if nargout == 2      %   Create time axis if requested
     tn = [0:slen-1]'/fs;
   end
else      % If input was originally a row vector, take transpose
   sd = (sd.');
   if nargout == 2      %   Create time axis if requested
     tn = [0:slen-1]/fs;
   end
end
end