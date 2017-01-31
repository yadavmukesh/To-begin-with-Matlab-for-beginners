%% Approach 2.........Classification using HSWN only
tic
feature('DefaultCharacterSet', 'UTF8');

global dictionary2;
if numel(dictionary2) < 1
    load dictionary2;  % contains HSWN database
end;
global negword;   % contains negation words
if numel(negword) < 1
    load negword;
end;
negative_present = 0;
[fid,msg]=fopen('sepsentences\output1.txt','r','n','UTF-8');
words = fscanf(fid,'%c');
words1 = regexp(words, '\s', 'split')';
fclose(fid);
%save words1;
count_p=0;
count_n=0;
count_neutral=0;
disp_words=[];
opfile='D:\mukesh\project\code3\code3\button5\disp_words.txt';
file_id2 = fopen(opfile, 'w');  % open new file

for i = 1:numel(words1)
    [pos(i) neg(i)] = polarity(words1{i});
    %----------counting---------------
    if pos(i)>neg(i)
        disp(strcat('Count pos=',num2str(count_p)));
        count_p=count_p+1;
    end;
    if pos(i)<neg(i)
        disp(strcat('Count neg=',num2str(count_n)));
        count_n=count_n+1;
    end;
    if pos==neg
        disp(strcat('Count neutral=',num2str(count_neutral)));
        count_neutral=count_neutral+1;
    end;
    %--------------------------------
    disp(strcat('Word-',num2str(i)));
    
    if i>1 && any(cellfun(@numel, regexp(negword, ['^' words1{i} '$'])))
        pos(i-1) = -pos(i-1);
        neg(i-1) = -neg(i-1);
        negative_present = 1;
        disp('Negation present');
    end;
    disp(strcat('for loop Positive Polarity:',num2str(pos)));
    disp(strcat('for loop Negative Polarity: ',num2str(neg)));
    uu = strcat('word', num2str(i),': ',words1(i), ',', num2str(pos(i)), ',', num2str(neg(i)));
    fprintf(file_id2, '%s\n', char(uu));
    
end;
%---------------------------
fclose(file_id2);  % close the file

%---------------------------
disp('-------------------------------------------------');
%---------------------Counting--------------------------------
count_pos=count_p;disp(strcat('count pos:',num2str(count_pos)));
count_neg=count_n;disp(strcat('count neg:',num2str(count_neg)));
count_neu=count_neutral;disp(strcat('count neu:',num2str(count_neu)));
if count_pos>count_neg % condition 1
    if count_pos>count_neu
        class='Positive';
        disp('Positive Document by word count (condition 1)');
    end
end
if count_neg>count_pos % condition 2
    if count_neg>count_neu
        class='Negative';
        disp('Negative Document by word count (condition 2)');
    end
end
if count_neu>count_pos % condition 3
    if count_neu>count_neg
        class='Neutral';
        disp('Neutral Document by word count (condition 3)');
    end
end
if count_pos==count_neg % condition 4
    if count_pos==count_neu
        class='Neutral';
        disp('Neutral Document by word count (condition 4)');
    end
end
if count_pos==count_neg % condition 5
    if count_pos>count_neu
        class='Neutral';
        disp('Neutral Document by word count (condition 5)');
    end
end
if count_pos==count_neg % condition 6
    if count_pos<count_neu
        class='Neutral';
        disp('Neutral Document by word count (condition 6)');
    end
end
%---------------------------------------------------------------------
disp('-------------------------------------------------');
pos1 = pos;  % displays all column 3 values
disp(strcat('All values from column 3:',num2str(pos1)));
neg1 = neg;  % displays all column 4 values
disp(strcat('All values from column 4:',num2str(neg1)));
disp('-------------------------------------------------');

%%----------------classification-------------------------------
pos1 = sum(pos1); % sum of all column 3
disp(strcat('Total Positive Polarity:',num2str(pos1)));

neg1 = sum(neg1); % sum of all column 4
disp(strcat('Total Negative Polarity:',num2str(neg1)));
disp('-------------------------------------------------');
%%-------------------------------------------------------------
if pos1>neg1
    class1='Positive';
    disp('Positive Document by polarity count');
end
if pos1<neg1
    class1='Negative';
    disp('Negative Document by polarity count');
end
if pos1==neg1
    class1='Neutral';
    disp('Neutral Document by polarity count');
end
disp('-------------------------------------------------');
toc