%% extracting polarity using functions---------------------------
function [pos neg] = polarity(word)
global dictionary2;  %% dictionary2 is HindiSentiWordNet database
if numel(dictionary2) < 1
    load dictionary2;
end;
[r c] = find(cellfun(@numel, regexp(dictionary2, ['^' word '$'])));  %% finding the hindi word in database
if numel(r)  % for a particular word match found
    pos = mean(cellfun(@str2num, dictionary2(r, 3)));  % take the mean of positive value of all the words present in the HSWN and store in pos variable
    neg = mean(cellfun(@str2num, dictionary2(r, 4)));  % take the mean of negative value of all the words present in the HSWN and store in neg variable
else
opfile='D:\mukesh\project\code3\code3\notfound\notfound.txt';  % if word not found in databse then store that word in a text file
file_id2 = fopen(opfile, 'w');
    pos = 0;  % take the value of pos as zero when not found
    neg = 0;  % take the value of neg as zero when not found
end;
