root = 'D:\repos\files\spike2_example_files\files';

d = dir(fullfile(root,'*.smrx'));
d = [d; dir(fullfile(root,'*.smr'))];
names = {d.name}';
[names,I] = sort(lower(names));
d = d(I);

n_files = length(d);
loaded_mask = false(1,n_files);
for i = 1:n_files
    try
        f = ced.file(d(i));
        t2 = f.getTypeSummary();
        loaded_mask(i) = true;
    catch ME
        fprintf(2,'Failed: %s\n',names{i});
        t2 = ced.file.getEmptyTypeSummary();
    end
    if i == 1
        t = t2;
    else
        t = [t; t2]; %#ok<AGROW>
    end
end

%name = string(names(loaded_mask));
name = string(names);
t = addvars(t,name,'Before',1);
row_names = string(t.Properties.VariableNames)';
