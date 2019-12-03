fid = fopen('./log/serialData.txt', 'wt');
if fid ~= -1
    for t=1:length(gps{1}.Values.Time)
        for i=1:gps.numElements
            fprintf(fid, '%c', gps{i}.Values.Data(t));
%             serialData(i) = gps{i}.Values.Data(t);
%             fprintf(fid, '%s', char(serialData));
        end
    end
    fclose(fid);
else
    disp('Could not open text file to write to');
end
