%% To save list of negation words in Hindi 
clc;
clear all;
close all;

feature('DefaultCharacterSet', 'UTF8');
[fid,msg]=fopen('negwords.txt','r','n','UTF-8');  %% open files having prestored negation words
negword = fscanf(fid,'%c');
negword = regexp(negword, '[,]', 'split')  %% split the negation words using comma, as they are stored in such a way
fclose(fid);

%snegword = regexp(negword, '[,]', 'split');

save negword;  %% contains negation words in Hindi
