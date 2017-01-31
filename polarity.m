function [pos neg] = polarity(word)
global dictionary2;
if numel(dictionary2) < 1
    load dictionary2;
end;
[r c] = find(cellfun(@numel, regexp(dictionary2, ['^' word '$'])));
if numel(r)
    pos = mean(cellfun(@str2num, dictionary2(r, 3)));
    neg = mean(cellfun(@str2num, dictionary2(r, 4)));
else
opfile='D:\mukesh\project\code3\code3\notfound\notfound.txt';
file_id2 = fopen(opfile, 'w');
    pos = 0;
    neg = 0;
end;