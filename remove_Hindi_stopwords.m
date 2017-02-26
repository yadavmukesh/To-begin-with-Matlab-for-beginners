%%-----------------------Hindi stop words removal------------------------------
%%------------------------trial-1----sending data to java API to do the process-----------------
% % clc;
% % clear all;
% % close all;
% feature('DefaultCharacterSet', 'UTF8');
% x=RemoveStopwords3;
% javaMethod('removestopwords',x);
% %x=char(javaMethod('removestopwords',sample1));
%%---------------------------trial-2----------------------
feature('DefaultCharacterSet', 'UTF8');

opfile='D:\mukesh\project\code3\code3\stopwordout\output.txt';  % destination file
file_id=fopen('D:\mukesh\project\code3\code3\nonhindisep\output.txt');% input file
x=char(fread(file_id, 'char'))';
fclose(file_id);

opfile1='D:\mukesh\project\code3\code3\stopwords_hi.txt'; % stopword file
file_id1=fopen('D:\mukesh\project\code3\code3\stopwords_hi.txt');
y=char(fread(file_id1, 'char'))';
fclose(file_id1);

%A = strsplit(y,'%s', 'delimiter', sprintf('\n'));
A = strsplit(y,'\n'); % split

%x=regexprep(x,A, ' ');  % replace the stopwords with space
for elem=A
    pat = strcat('\s', elem{1:end}, '\s');
    x = regexprep(x, pat, ' ');  % replace
     
end;
disp(char(x));
disp(pat(1));

file_id2 = fopen(opfile, 'w','n','UTF-8');  % open destination file
fwrite(file_id2, x, 'char');    % write in destination file
fclose(file_id2);
%%----------------------------------------------------
