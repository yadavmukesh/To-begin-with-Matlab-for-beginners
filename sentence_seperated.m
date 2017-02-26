%%-----------------------------Sentence Separation by searching purna viram i.e. Hindi full stop---------------------------------
%%-----------------------trial-1----by sending to Java API----------------------
% % clc;
% % clear all;
% % close all;
% feature('DefaultCharacterSet', 'UTF-8');
% x=PipeSeparatedSentences3;
% %javaMethod('getSeparatedSentences3',x);
% javaMethod('getSeperated3',x);

%%-----------------trial-2-----------------------------------
feature('DefaultCharacterSet', 'UTF8');

opfile='D:\mukesh\project\code3\code3\sepsentences\output.txt';  % destination file
file_id=fopen('D:\mukesh\project\code3\code3\translated output\output.txt');% input file
x=char(fread(file_id, 'char'))';
fclose(file_id);

y = double(x);
z = find(ismember(y, [2404]));  % removal of hindi purna viram
y(z) = [10]; % -------line feed, contain double values
disp([10] * length(z)); % length

x = char(y);
%disp(char(x));

x1 = strtrim(x); % removes blank row, another function: newChr = deblank(chr) %% trimming of string
x2 = regexprep(x1, '\n\s+', '\n');
x3 = regexprep(x2,'\s\n','\n');
disp(char(x3));  %% sentence separated is displayed

% x2 = regexprep(x1,'\s\n','\n');
% disp(char(x2));

file_id2 = fopen(opfile, 'w');  % open destination file
fwrite(file_id2, x3, 'char');    % write in destination file
fclose(file_id2);

%%----------------------------------------------------
