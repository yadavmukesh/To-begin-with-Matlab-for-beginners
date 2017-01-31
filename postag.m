function tag = postag(word)
global dictionary;
if numel(dictionary) < 1
    load dictionary;
end;
[r c] = find(cellfun(@numel, regexp(dictionary, ['^' word '$'])));
if numel(r)
    tag = dictionary(r(1), 2);
    tag = str2num(tag{1});
else
    tag = 0;
end;