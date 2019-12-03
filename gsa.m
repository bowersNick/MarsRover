function [y, prns] = gsa(u)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y = zeros(size(u),'uint8');
num_prns = 12;
prns = zeros(size(u),'uint8');
idx = find(u == hex2dec('2c')) ;
% prns = zeros(1,12,'uint16');
%A,3,66,84,74,75,76,85,,,,,,,1.47,0.78,1.24,*17

sIdx = 1;
% for i = 1:length(prns)
%     new_string = u(sIdx:idx(i)-1);
%     if (~isempty(new_string))
%         prns(i) = uint16(str2double(new_string));
%     end
%     sIdx = idx(i)+1;
% end
for i=1:num_prns
    %66,34,23,53,,,,,,,,,,
    new_string = u(sIdx:idx(i)-1);
    if (~isempty(new_string))
        prns(sIdx:sIdx+length(new_string)) = [new_string, ','];
        z = length(new_string);
    else
        if (i == num_prns)
            prns(sIdx) = '0';
            z = 1;
        else
            prns(sIdx:sIdx+1) = '0,';
            z = 1;
        end
    end
%     prns(pIdx:idx(i)) = u(sIdx:idx(i));
    sIdx = sIdx + z + 1;
    disp(i)
    disp(char(prns))
end
y(1:length(u)-idx(12)) = u(idx(12)+1:end);
% pdop = str2double(char(u(sIdx:
% hdop = 
% vdop = 
% checksum = 
end
% function [y, prns] = gsa_u(u)
% y = zeros(1,80,'uint8');
% [z,prns] = gsa(u);
% y(1:length(z)) = z;
% end

