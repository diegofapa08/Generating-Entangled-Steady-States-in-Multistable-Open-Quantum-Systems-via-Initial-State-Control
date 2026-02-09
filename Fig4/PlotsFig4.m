%%
data1 = load('QFIBalanced.txt');
xdomain = linspace(0,60/2,100);
ydomain = data1(1,2)/60 - 4/180.*xdomain.*(xdomain+1);
ydomain2 = zeros(100)+1;
cmap1 = [flipud(plasma(5))];
cmap1(1,:)=[];
colororder(cmap1)

hold on
plot(xdomain,ydomain,'LineStyle','-','LineWidth',2,'Color','k')
scatter(data1(:,1),data1(:,2)/60,'LineWidth',2,'MarkerEdgeColor',cmap1(1,:),'MarkerFaceColor',cmap1(1,:),'MarkerFaceAlpha',0.5,'SizeData',60)
%set(gca,'yscale','log')
plot(xdomain,ydomain2,'LineStyle','--','LineWidth',2,'Color','r')
set(gca,'FontSize',15)
ylabel('$F^Q_{\rho_{{\rm B},S}}/N$','Interpreter','latex','FontSize',22)
xlabel('$S$','Interpreter','latex','FontSize',22)
ylim([0,23])
xlim([-0.5,30.5])
title('(c)','Interpreter','latex','FontSize',26)
legend('$F^Q_{\rho_{{\rm B},S}}= \frac{N^2 + 4N}{3}-\frac{4}{3}S(S+1)$','','SQL','Interpreter','latex','box','off','Location','southwest','FontSize',18)
pbaspect([1 0.5 1])
hold off
box on
exportgraphics(gca,'Fig4Panelc.pdf','Resolution',300)



%%
data1 = load('N50Protocol.txt');
data2 = load('MinDickeQFI.txt');
xdomain = linspace(0,100,100);
ydomain = 1/3.*xdomain.^2 + 2/3.*xdomain;
ydomain2 = zeros(100)+1;


cmap1 = [flipud(plasma(6))];
cmap1(1,:)=[];
colororder(cmap1)
plot(xdomain,ydomain./xdomain,'LineStyle','-','LineWidth',2,'Color',cmap1(3,:))
hold on
plot(data2(:,1),data2(:,2)./data2(:,1),'LineStyle','--','LineWidth',2,'Color',cmap1(2,:))
scatter(data1(:,5),data1(:,2)./data1(:,5),'LineWidth',2,'MarkerEdgeColor',cmap1(2,:),'MarkerFaceColor',cmap1(2,:),'MarkerFaceAlpha',0.5,'SizeData',60)
scatter(data1(:,5),data1(:,4)./data1(:,5),'LineWidth',2,'MarkerEdgeColor',cmap1(3,:),'MarkerFaceColor',cmap1(3,:),'MarkerFaceAlpha',0.5,'SizeData',60,'Marker','diamond')
scatter(data1(:,5),data1(:,3)./data1(:,5),'LineWidth',2,'MarkerEdgeColor',cmap1(4,:),'MarkerFaceColor',cmap1(4,:),'MarkerFaceAlpha',0.5,'SizeData',60,'Marker','^')
plot(xdomain,ydomain2,'LineStyle',':','LineWidth',2,'Color',[1,0,0])
set(gca,'FontSize',15)
ylabel('$F^Q_{\rho_{\rm SS}}/N$','Interpreter','latex','FontSize',22)
xlabel('$N$','Interpreter','latex','FontSize',22)
% ylim([-0.8,23])
xlim([-0.5,100.5])
ylim([0,30])
title('(d)','Interpreter','latex','FontSize',26)
legend('','','$F^Q_{\rho_{{\rm SS},L_1}}$','$F^Q_{\rm pro}$','Bal $\vert \psi_{\rm dif}\rangle$','Interpreter','latex','box','off','Location','northwest','FontSize',18,'NumColumns',2)
pbaspect([1 0.5 1])
text(65,19,'$F^Q_{\rm pro} = \frac{N^2 + 2N}{3}$','Interpreter','latex','FontSize',18,'Color',cmap1(3,:),'Rotation',20)
text(42,10,'$F^Q_{\rho_{{\rm SS},L_1}} = \sum_S p(S) F^Q_{\vert S,-S \rangle}$','Interpreter','latex','FontSize',18,'Color',cmap1(2,:),'Rotation',5)
text(80,3,'SQL','Interpreter','latex','FontSize',18,'Color','r','Rotation',0)
hold off
box on
exportgraphics(gca,'Fig4Paneld.pdf','Resolution',300)

