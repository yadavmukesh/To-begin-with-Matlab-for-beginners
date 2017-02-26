%------------------------trial-1----------------------------------------
figure;
pie([2.48049 1.51951]);
 
figure(2);
pie([3 4 5]);
 
figure(3);
pie([6 7 8]);
colormap([
          0 1 0;      % green
          1 0 0;      % red
          %0 0 1      % blue
      ]) ; 
%-------------------------trial-2---------------------------------------
figure;
 labels = {'POSITIVE','NEGATIVE','NEUTRAL'};
 pie([1 2 3],labels);
 colormap([
           0 1 0;      %// green
           1 0 0;      %// red
           0 0 1      %// blue
       ]) ; 
   
 x = pie([1 2 3],labels);
 y = pie([1 2 3],labels);
 plot(x);
set(gca,'Position',[left bottom width height])
plot(y);
%------------trial 3-bar graph---------------
 title('Bar Chart', 'fontsize', 15)
 x=[1 2 3];
 y=[3 4 5];
 a=[7 8 9];
 b=[10 11 12];
 
 subplot(2,2,1)
 bar(x),title('A bar chart of vector x')
 xlabel('Positive  Negative  Neutral') % x-axis label
 
 subplot(2,2,2)
 bar(y),title('A bar chart of vector y')
 xlabel('Positive  Negative  Neutral') % x-axis label
 
 subplot(2,2,3)
 bar(a),title('A bar chart of vector a')
 xlabel('Positive  Negative  Neutral') % x-axis label
 
 subplot(2,2,4)
 bar(b),title('A bar chart of vector b')
 xlabel('Positive  Negative  Neutral') % x-axis label
 
 print('BarPlot','-dpng')
%-------------trial-4--pie chart--------------------
set(gcf,'color','white','position', [0, 0, 200, 300])
names = char('Positive', 'Negative', 'Neutral');
title('Pie Chart for polarity', 'fontsize', 15);
 x=[1 2 3];
 y=[3 4 5];
 a=[7 8];
 b=[10 11];
 c=[1 1];
 d=[1];
zoom on
zoom xon
zoom yon
 z=[3 7];   %------------------------this
 subplot(3,3,1)
 pie(x),title('A pie chart of vector x')
 
 subplot(3,3,2)
 pie(y),title('A pie chart of vector y')
 
 subplot(3,3,3)
 pie(a),title('A pie chart of vector a') %------------------------this
 
 subplot(3,3,4)
 pie(b),title('A pie chart of vector b')
 
 subplot(3,3,5)
 pie(b),title('A pie chart of vector b')
 
 subplot(3,3,6)
 pie(x),title('A pie chart of vector b')
 
 subplot(3,3,7)
 pie(c),title('A pie chart of vector b')
 
 subplot(3,3,8)
 pie(d),title('A pie chart of vector b')
 
 subplot(3,3,9)
 pie(a),title('A pie chart of vector b')
 
 subplot(3,3,10)
 pie(x),title('A pie chart of vector b')
 subplot(2,2)
 pie(b),title('A pie chart of vector b')
 
 subplot(3,3,5)
 imshow(imread('label.png'));

 subplot(3,3,6)
 im = imread('label.png');
 info = imfinfo('label.png');
 ht = info.Height;
 wid = info.Width;
 if ht > 10 ||  wid > 10   % if rows or columns have more than 10px
      iq=imresize(im,0.85);   % reduce by factor 1/2=0.5
 end;
 imshow(iq)    % reduced image


colormap([
          0 1 0;      % green
          1 0 0;      % red
          %0 0 1      % blue
      ]) ; 
   for i=1:3
     gtext(names(i,:)); 
 % gtext('string') displays the graph window, puts up a
% % cross-hair, and waits for a mouse button or keyboard 
% % key to be pressed.
   end;

% % Enlarge figure to full screen. 
 set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
 % Give a name to the title bar. 
 set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'off') 

figure('position', [0, 0, 200, 300]) 
print('trial-999','-dpng');

% %-----------------------------To show in guide---------------------------------------------- 
 hfig=figure;
 x=[num2str(count_pos) num2str(count_neg) num2str(count_neu)];
 y=[num2str(pos1) num2str(neg1)];
 a=[num2str(count_pos) num2str(count_neg) num2str(count_neu)];
 b=[num2str(pos1) num2str(neg1)];
 
 subplot(3,3,1)
 pie(x),title('A pie chart of vector x')
 
 subplot(3,3,2)
 pie(y),title('A pie chart of vector y')
 
 subplot(3,3,4)
 pie(a),title('A pie chart of vector a')
 
 subplot(3,3,5)
 pie(b),title('A pie chart of vector b')
 
 % subplot(3,3,5)
 % imshow(imread('label.png'));
 
 subplot(3,3,6)
 im = imread('label.png');
 info = imfinfo('label.png');
 ht = info.Height;
 wid = info.Width;
 if ht > 10 ||  wid > 10   % if rows or columns have more than 10px
      iq=imresize(im,0.85);   % reduce by factor 1/2=0.5
 end;
 imshow(iq)    % reduced image
 
 
 colormap([
           0 1 0;      % green
           1 0 0;      % red
           0 0 1      % blue
       ]) ; 
 
 print(hfig,'-dpng')
 
 h= imread('figure2.png');
 
 axes(handles.axes1)
 
 imshow(h);
 
 msgbox('Polarity Extraction Done');
%---------------------
