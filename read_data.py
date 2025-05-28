import sys
import wfdb

def data_pass(directory):
# directory = sys.argv[1]
    record = wfdb.rdrecord(directory)
    signals = record.p_signal
    annotations = wfdb.rdann(directory, 'atr')
    return signals, annotations.symbol, annotations.sample

[signals, symbol, sample] = data_pass(path)