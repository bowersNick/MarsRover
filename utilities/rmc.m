function y = rmc(u)
% example string
%220725.00,A,4349.94607,N,09643.86727,W,0.669,,021219,,,A*7E
idx = find(u == hex2dec('2c'));
pos = diff(idx);
pos = [idx(1) pos length(u)-idx(end)];
% single = find(pos == 1);
y = zeros(1,80,'uint8');
yIdx=1;
uIdx=1;
for i=1:length(pos)
    if (pos(i) == 1)
        % 0, - idx=46 idx=47
        % 0, - idx=54 idx=55
        % 0, - idx=56 idx=57
%         yIdx = yIdx + 1;
        y(yIdx:yIdx+1) = ['0' ','];
        yIdx = yIdx + 2;
        uIdx = idx(i)+1;
    else
        % 220725.00, - idx=1 idx=10
        % A, - idx=11 idx=12
        % 4349.94607, - idx=13 idx=23
        % N, - idx=24 idx=25
        % 09643.86727, - idx=26 idx=37
        % W, - idx=38 idx=39
        % 0.669, - idx=40 idx=45
        % , - idx=46 (idx=46 idx=47)
        % 021219, - idx=47 idx=53 (idx=48 idx=54)
        % , - idx=54 (idx=55 idx=56)
        % , - idx=55 (idx=57 idx=58)
        % A - idx=56 (idx=59)
        % *7E
        y(yIdx:yIdx+pos(i)-1) = u(uIdx:uIdx+pos(i)-1);
        yIdx = yIdx + pos(i);
        uIdx = uIdx + pos(i);
    end
%     disp(char(y))
%     disp(yIdx)
end


