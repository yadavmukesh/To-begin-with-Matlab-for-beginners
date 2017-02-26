%% -------------------trial-1----removing the unwanted words by sending to java API---------------
% clc;
% clear all;
% close all;
% currentCharacterEncoding=slCharacterEncoding();
% slCharacterEncoding('UTF-8');
% feature('DefaultCharacterSet', 'UTF8');
% [filename filepath]=uigetfile('*.txt','select input text file');
% final_path=strcat(filepath,filename);
% 
%str = java.lang.String(final_path);
% x=RemoveEnglishCharacters3;
% char(javaMethod('filterEnglishWords',x,final_path));
%------------------------trial-2--------------------------
feature('DefaultCharacterSet', 'UTF8');
opfile='D:\mukesh\project\code3\code3\nonhindisep\output.txt'; % open output file
file_id=fopen(final_path);
x=char(fread(file_id, 'char'))';  % read the file
fclose(file_id);  % close the file
x=regexprep(x, '[!@#$%^&*(){}[]\"+=/_\.,-]', ' '); % remove special characters
x=regexprep(x, '[a-zA-Z0-9]', ' '); % remove english characters
disp(char(x));  % display the non hindi words replaced file
file_id2 = fopen(opfile, 'w');  % open new file
fwrite(file_id2, x, 'char');  % write in new file
fclose(file_id2);  % close the file
%%----------------------------------------------------------
%x=char(javaMethod('filterEnglishWords',RemoveEnglishCharacters3,final_path));
%disp(char(x(1,:)));
