function [ filterResponses, invalid ] = extractFilterResponses( path )
%EXTRACTFILTERRESPONSES Summary of this function goes here
%   Detailed explanation goes here

    % Define variables
    Tw = 12;                % analysis frame duration (ms)
    Ts = 4;                % analysis frame shift (ms)
    alpha = 0.97;           % preemphasis coefficient
    M = 20;                 % number of filterbank channels 
    C = 12;                 % number of cepstral coefficients
    L = 22;                 % cepstral sine lifter parameter
    LF = 1500;               % lower frequency limit (Hz)
    HF = 22000;              % upper frequency limit (Hz)
    wav_file = path;  % input audio filename
    
        % Read speech samples, sampling rate and precision from file
    [ speech, fs, nbits ] = wavread( wav_file );


    % Feature extraction (feature vectors as columns)
    [ MFCCs, FBEs, frames ] = ...
                    mfcc( speech, fs, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
                
    MFCCs = MFCCs'; % n x p 
    MFCCs_1 = gradient(MFCCs);
    MFCCs_2 = gradient(MFCCs_1);
    
    filterResponses = [MFCCs, MFCCs_1, MFCCs_2];
    
    invalid = 0;
    if ~isempty(find(isnan(MFCCs), 1))
        path
        invalid = 1;
    end
    
end

