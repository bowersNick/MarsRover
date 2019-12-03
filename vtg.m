function [ttrack,mtrack,gs_k,gs_kph,sig_ent,checksum] = vtg(u)
%,T,,M,0.346,N,0.642,K,A*3C
ttrack = zeros(1,8,'uint8');
mtrack = zeros(1,8,'uint8');
gs_k = zeros(1,8,'uint8');
gs_kph = zeros(1,8,'uint8');
sig_ent = zeros(1,1, 'uint8');
checksum = zeros(1,2, 'uint8');
idx = find(u == hex2dec('2c')) ;
if (idx(1) > 1)
    ttrack(1:idx(1)-1) = u(1:idx(1)-1);
%     ttrack(1) = sscanf(u(1:idx(1)-1), '%lf');
%     ttrack(1) = str2double(u(1:idx(1)-1));
end
if (idx(3)- idx(2) > 1)
    mtrack(1:idx(3) - idx(2)) = u(idx(2)+1:idx(3)-1);
%     mtrack(1) = str2double(u(idx(2)+1:idx(3)-1));
end
if (idx(5)-idx(4) > 1)
    gs_k(1:idx(5)-idx(4)) = u(idx(4)+1:idx(5)-1);
%     gs_k(1) = str2double(u(idx(4)+1:idx(5)-1));
end
if (idx(7)-idx(6) > 1)
    gs_kph(1:idx(7)-idx(6)) = u(idx(6)+1:idx(7)-1);
%     gs_kph(1) = str2double(u(idx(6)+1:idx(7)-1));
end
sig_ent(1) = u(idx(8)+1);
checksum(1:end) = u(idx(8)+3:end);
end

