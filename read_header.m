function [class] = read_header(hea_file)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    fid = fopen(hea_file, 'r');
    tline = fgetl(fid);
    while ischar(tline)
        % disp(tline);  % or parse it line by line
        if startsWith(tline, '#')
            val = strsplit(tline, '#');
            class = val{1,2};
        end
        tline = fgetl(fid);
    end
    fclose(fid);
end