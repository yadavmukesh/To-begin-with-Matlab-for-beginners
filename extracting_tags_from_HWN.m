%%
%%-----------------To extract the tags from HindiWordNet(HWN) database--------------------------------
function tag = postag(word)  %% function definition
global dictionary;    %% dictionary is HindiWordNet database
if numel(dictionary) < 1
    load dictionary;
end;
[r c] = find(cellfun(@numel, regexp(dictionary, ['^' word '$']))); %%find the word in the database 'dictionary'
if numel(r)
    tag = dictionary(r(1), 2);
    tag = str2num(tag{1});
else
    tag = 0;
end;
%%--------------------------------------------------------------------------------------------
%%------------Here all tags of the word are taken into consideration(Noun, Adjective, Verb, Adverb) present in HWN-------------------
