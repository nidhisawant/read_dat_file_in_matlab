%% Run the below lines ones changing the path to your python executable file 
% import sys; print(sys.executable); run this in python to obtain the path to your python executable file
% pyenv('Version','C:\Users\nidhi\AppData\Local\Programs\Python\Python310\python.exe')
% [status, result] = system('"C:\Users\nidhi\AppData\Local\Programs\Python\Python310\python.exe" -m pip install wfdb');
fileID = fopen("C:\Users\nidhi\Downloads\paroxysmal-atrial-fibrillation-1.0.0\paroxysmal-atrial-fibrillation-events-detection-from-dynamic-ecg-recordings-the-4th-china-physiological-signal-challenge-2021-1.0.0\RECORDS", 'r');  % Replace with your actual 'RECORDS' file path 
paths = {};

line = fgetl(fileID);
while ischar(line)
    paths{end+1} = strtrim(line);  % Add line to cell array
    line = fgetl(fileID);
end

fclose(fileID);
file_path= 'C:\Users\nidhi\Downloads\paroxysmal-atrial-fibrillation-1.0.0\paroxysmal-atrial-fibrillation-events-detection-from-dynamic-ecg-recordings-the-4th-china-physiological-signal-challenge-2021-1.0.0\';
for i=1:length(paths)
    sample_path = [file_path paths{i}];  
    [pySignals, pySymbol, pySample] = pyrunfile("read_data.py", ["signals", "symbol", "sample"], path = sample_path);
    sig = double(pySignals);
    ann_idx = double(pySample);
    ann_symbol = cell(pySymbol);
    label = read_header([sample_path '.hea']);
    [qrs_amp_raw,qrs_i_raw,delay]=pan_tompkin(sig(:,1),200,0);

end
