%% spectrometer fig
clear all;
close all;
load('result');

fontsize = 15; 
for i=1:8
    
    
    figure(i)
    %set(gcf,'unit','normalized','position',[0.2,0.2,0.4,0.5]);%window
    plot(t,P1(:,i),'LineWidth',2);
    
    hold on;
    plot(t,result(:,i),'LineWidth',2);
    
    %title('Nanobeam','fontname','arial','fontsize',fontsize,'FontWeight','bold');
    ylabel('Intensity(dB)','fontname','arial','fontsize',fontsize,'FontWeight','bold');
    xlabel('Wavelength(nm)','fontname','arial','fontsize',fontsize,'FontWeight','bold');
    set(gca,'fontsize',fontsize,'FontWeight','bold','fontname','arial');
    ylim([-75,-30]);
    xlim([1530,1600]);
    %set(gca,'Ytick',[-20:2.5:0],'fontsize',fontsize,'FontWeight','bold','fontname','arial');
    %set(gca,'Xtick',[lamda-2 lamda-1 lamda lamda+1 lamda+2],'fontsize',fontsize,'FontWeight','bold','fontname','arial');
    %set(gca,'YtickLabel',[-20:5:0],'fontsize',fontsize,'FontWeight','bold','fontname','arial');
    %set(gca,'XtickLabel',[-2:2],'fontsize',fontsize,'FontWeight','bold','fontname','arial');
    %axis([0,2,0,2.5]); 
    
    h=legend('Conventional spectrometer','Reconstruction');
    set(h,'fontname','arial','fontsize',fontsize,'FontWeight','bold','location','north');
    set(h,'box','off');
    box off;
    alpha(0.5);
end



%%

spotn = 3501;
%plot
j=1;
%sdatalog(1:spotn,csvn+1)=10.^((sdata(1:spotn,csvn+1)+12.8-12.8)./10);

%for i=[99:116,117:4:137,140:150,151:4:183,187:190]  
% 99:102 bad 99:107 left
for i=[108:116,117:4:137,140:149,151:4:183,187:190] 
%sdatalog(1:spotn,i)=10.^((sdata(1:spotn,i)+12.8-12.8-sdata(1:spotn,csvn+1))./10);
s1=sdata(1:spotn,i)-sdata(1:spotn,csvn+1);
windowSize = 30;
s1=smoothdata(s1,'gaussian',windowSize);
[ms1(j),is1(j)]=max(s1);


s2=-10-max(s1)+s1;
figure(10);
 plot(sdata00,s1);%

% % title('-source');
% % axis([1525,1575,-40,0]);
% % subplot(2,1,2);
%plot(data00,(data(1:spotn,i)));
hold on;
%plot(data00,(data(1:spotn,34)-data(1:spotn,csvn+1)));
%title('15nm????');
%axis([1540,1600,-40,-10]);
%A(i)=trapz(sdatalog(1:spotn,i));

% A(j)=trapz(sdata00,sdatalog(1:spotn,i));
% A(j)=10*log10(A(j));
j=j+1;
 xlim([1530,1600]);
 
%  figure(11)
%   plot(sdata00,s2);%
%   hold on;
  
end
%% integrate confirm
filename = strcat('/zhome/05/4/145917/github/matlab/2007spectrometer/5.CSV');
grating = csvread(filename,29,0);
figure(21)
plot(grating(:,1),grating(:,2));
hold on;
%
fs1=sdata00(is1);
%ps1=polyfit(fs1',ms1,6);
%gs1=ps1(1)*sdata00.^6+ps1(2)*sdata00.^5+ps1(3)*sdata00.^4+ps1(4)*sdata00.^3+ps1(5)*sdata00.^2+ps1(6)*sdata00.^1+ps1(7);
ps1=polyfit(fs1',ms1,7);
gs1=ps1(1)*sdata00.^7+ps1(2)*sdata00.^6+ps1(3)*sdata00.^5+ps1(4)*sdata00.^4+ps1(5)*sdata00.^3+ps1(6)*sdata00.^2+ps1(7)*sdata00.^1+ps1(8);
figure(21)
plot(sdata00,gs1+max(grating(:,2))-max(gs1)-3);
ylim([-60,-40])
% plot(A);
% hold on;
% plot(P(:,1)+25);