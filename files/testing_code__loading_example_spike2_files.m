%Test Loading
root = 'D:\repos\files\spike2_example_files\files';

f1 = fullfile(root,'Demo_Jim.smrx');

file = ced.file(f1);

adc = file.waveforms.getData("return_format","int16");
adc = file.waveforms.getData("return_format","single");
adc = file.waveforms.getData("return_format","double");
adc = file.waveforms.getData("return_format","data_object");

event_falls = file.event_falls(1).getTimes("time_format","datetime");

event_both = file.event_both.getTimes("return_format","times");
event_both = file.event_both.getTimes("return_format","time_series1");
event_both = file.event_both.getTimes("return_format","time_series2");
event_both = file.event_both.getTimes("return_format","switch_times");
event_both = file.event_both.getTimes("return_format","starts_and_stops");

marker = file.markers.getData("collapse_struct",false);

wavemark = file.wave_markers.getData("return_format","matrix2");

realmark = file.real_markers.getData("return_format","struct");

textmark = file.text_markers.getData();
