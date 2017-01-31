% feature('DefaultCharacterSet', 'UTF8');
% x=Translation3;
% javaMethod('translatetoHindi',x);


%%--------------------translation-------------------------
feature('DefaultCharacterSet', 'UTF8');
dictionary = containers.Map;

file_id1=fopen('D:\mukesh\project\code3\code3\translation dictionary\Dictionary_en.txt');
x=char(fread(file_id1, 'char'))'; 
fclose(file_id1);

file_id2=fopen('D:\mukesh\project\code3\code3\translation dictionary\Dictionary_hi.txt');
y=char(fread(file_id2, 'char'))'; 
fclose(file_id2);

D1=strsplit(x,'\r\n')';
D2=strsplit(y,'\r\n')';

opfile='D:\mukesh\project\code3\code3\translated output\output.txt';  % destination file
file_id=fopen('D:\mukesh\project\code3\code3\stopwordout\output.txt');% input file
x=char(fread(file_id, 'char'))';
fclose(file_id);

%z = regexprep(x, '?', ' ? '); % its not working
z = strsplit(x, ' ')';

z1 = find(ismember(z, D1));
z2 = find(ismember(D1, z)); % location in D1 dict
z3 = D2((z2));  % mtched in hi db

Y  = z; 
Y(z1) = z3;  
x = strjoin(Y', ' ');
disp(char(x));

file_id2 = fopen(opfile, 'w');  % open destination file
fwrite(file_id2, x, 'char');    % write in destination file
fclose(file_id2);
%%----------------------------------------------------