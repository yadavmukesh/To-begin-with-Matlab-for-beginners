clc;
clear all;
close all;

feature('DefaultCharacterSet', 'UTF8');
[fid,msg]=fopen('negwords.txt','r','n','UTF-8');
negword = fscanf(fid,'%c');
negword = regexp(negword, '[,]', 'split')
fclose(fid);

%snegword = regexp(negword, '[,]', 'split');

save negword;

