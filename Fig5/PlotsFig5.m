%%
data1 = load('P(S)50Eta0.txt');
data2 = load('P(S)50Eta2.txt');
data3 = load('P(S)50Eta4.txt');
cmap1 = [flipud(plasma(5))];
cmap1(1,:)=[];
colororder(cmap1)

x_fill = [data1(:,1); fliplr(data1(:,1)')' ];
y_fill = [data1(:,2); zeros(size(data1(:,2)))];
x_fill2 = [data2(:,1); fliplr(data2(:,1)')' ];
y_fill2 = [data2(:,2); zeros(size(data2(:,2)))];
x_fill3 = [data3(:,1); fliplr(data3(:,1)')' ];
y_fill3 = [data3(:,2); zeros(size(data3(:,2)))];
fill(x_fill,y_fill,cmap1(1,:),'FaceAlpha',0.7,'EdgeColor',cmap1(1,:),'LineWidth',2)
hold on
fill(x_fill2,y_fill2,cmap1(2,:),'FaceAlpha',0.7,'EdgeColor',cmap1(2,:),'LineWidth',2)
fill(x_fill3,y_fill3,cmap1(3,:),'FaceAlpha',0.7,'EdgeColor',cmap1(3,:),'LineWidth',2)
set(gca,'FontSize',18)
ylabel('$p(S)$','Interpreter','latex','FontSize',25)
xlabel('$S$','Interpreter','latex','FontSize',25)
legend('$\eta=0$','$\eta=2$','$\eta =4$','Interpreter','latex','FontSize',18,'box','off')
title('(a)','Interpreter','latex','FontSize',25)
hold off
box on
pbaspect([1,0.3,1])
exportgraphics(gca,'Panela.pdf','Resolution',300)

%%
data1 = load('QFIUnbalancedEta0.txt');
data2 = load('QFIUnbalancedEta2.txt');
data3 = load('QFIUnbalancedEta4.txt');

cmap1 = [flipud(plasma(5))];
cmap1(1,:)=[];
colororder(cmap1)
xdomain = linspace(0,25,100);
ydomain = zeros(100)+1;
scatter(data1(:,1),data1(:,2)/50,'LineWidth',2,'MarkerEdgeColor',cmap1(1,:),'MarkerFaceColor',cmap1(1,:),'MarkerFaceAlpha',0.5,'SizeData',60)
hold on
scatter(data2(:,1),data2(:,2)/50,'LineWidth',2,'MarkerEdgeColor',cmap1(2,:),'MarkerFaceColor',cmap1(2,:),'MarkerFaceAlpha',0.5,'SizeData',60,'Marker','d')
scatter(data3(:,1),data3(:,2)/50,'LineWidth',2,'MarkerEdgeColor',cmap1(3,:),'MarkerFaceColor',cmap1(3,:),'MarkerFaceAlpha',0.5,'SizeData',60,'Marker','^')
plot(xdomain,ydomain,'LineStyle','--','Color','r','LineWidth',2)
set(gca,'FontSize',18)
ylabel('$F^Q_{\vert S,-S \rangle}/N$','Interpreter','latex','FontSize',25)
xlabel('$S$','Interpreter','latex','FontSize',25)
ylim([-1.2,23])
xlim([-0.5,25.5])
legend('$\eta=0$', '$\eta=2$', '$\eta=4$','SQL','Interpreter','latex', 'FontSize',18,'box','off','numcolumns',2)
title('(b)','Interpreter','latex','FontSize',25)
pbaspect([1 0.3 1])
hold off
box on
exportgraphics(gca,'Panelb.pdf','Resolution',300)
%%
data4 = load('QFIBalancedEta0.txt');
data5 = load('QFIBalancedEta2.txt');
data6 = load('QFIBalancedEta4.txt');

xdomain = linspace(0,25,100);
ydomain = zeros(100)+1;
cmap1 = [flipud(plasma(5))];
cmap1(1,:)=[];
colororder(cmap1)

scatter(data4(:,1),data4(:,2)/50,'LineWidth',2,'MarkerEdgeColor',cmap1(1,:),'MarkerFaceColor',cmap1(1,:),'MarkerFaceAlpha',0.5,'SizeData',60)
hold on
scatter(data5(:,1),data5(:,2)/50,'LineWidth',2,'MarkerEdgeColor',cmap1(2,:),'MarkerFaceColor',cmap1(2,:),'MarkerFaceAlpha',0.5,'SizeData',60,'Marker','d')
scatter(data6(:,1),data6(:,2)/50,'LineWidth',2,'MarkerEdgeColor',cmap1(3,:),'MarkerFaceColor',cmap1(3,:),'MarkerFaceAlpha',0.5,'SizeData',60,'Marker','^')
plot(xdomain,ydomain,'LineStyle','--','Color','r','LineWidth',2)
set(gca,'FontSize',18)
ylabel('$F^Q_{\rho_{{\rm B},S}}/N$','Interpreter','latex','FontSize',25)
xlabel('$S$','Interpreter','latex','FontSize',25)
ylim([-1.2,23])
xlim([-0.5,25.5])
legend('$\eta=0$', '$\eta=2$', '$\eta=4$','Interpreter','latex', 'FontSize',16,'box','off')
title('(c)','Interpreter','latex','FontSize',25)
pbaspect([1 0.3 1])
hold off
box on
exportgraphics(gca,'Panelc.pdf','Resolution',300)
%%

data1 = load('N50ProtocolVarEta.txt');
xdomain = linspace(0,24,100);
ydomain = 1/3.*50^2 + 2/3*50-(4/3)*xdomain.^2;
ydomain2 = zeros(100)+1;
cmap1 = [flipud(plasma(5))];
cmap1(1,:)=[];
colororder(cmap1)
scatter(data1(:,5),data1(:,2)./50,'LineWidth',2,'MarkerEdgeColor',cmap1(1,:),'MarkerFaceColor',cmap1(1,:),'MarkerFaceAlpha',0.5,'SizeData',60)
hold on
scatter(data1(:,5),data1(:,4)./50,'LineWidth',2,'MarkerEdgeColor',cmap1(2,:),'MarkerFaceColor',cmap1(2,:),'MarkerFaceAlpha',0.5,'SizeData',60,'Marker','d')
plot(data1(:,5),data1(:,4)./data1(:,2),'LineWidth',2,'Color',cmap1(3,:))
plot(xdomain,ydomain2 ,'LineStyle','--','LineWidth',2,'Color','r')
set(gca,'FontSize',18)
ylabel('$F^Q_{\rho_{\rm SS}}/N$','Interpreter','latex','FontSize',25)
xlabel('$\eta$','Interpreter','latex','FontSize',25)
ylim([-0.8,23])
xlim([-0.5,24.5])
title('(d)','Interpreter','latex','FontSize',25)
legend('$F^Q_{\rho_{{\rm SS},L_1}}$','$F^Q_{\rm pro}$','$F^Q_{\rm pro}/F^Q_{\rho_{{\rm SS},L_1}}$','Interpreter','latex','box','off','Location','northeast','FontSize',18,'NumColumns',2)
pbaspect([1 0.3 1])
hold off
box on

exportgraphics(gca,'Paneld.pdf','Resolution',300)
%%
data1 = load('Dif1.txt');
data2 = load('Dif2.txt');

cmap1 = [flipud(plasma(5))];
cmap1(1,:)=[];
colororder(cmap1)

plot(data2(:,1),data2(:,2)/50,'LineStyle','-','LineWidth',2,'Color',cmap1(1,:))
hold on
plot(data2(:,1),data2(:,3)/50,'LineStyle','-','LineWidth',2,'Color',cmap1(2,:))
plot(data1(:,1),data1(:,2)/50,'LineStyle','--','LineWidth',2,'Color',cmap1(1,:))
plot(data1(:,1),data1(:,3)/50,'LineStyle','--','LineWidth',2,'Color',cmap1(2,:))
set(gca,'FontSize',18)
ylabel('$\langle S_z^{A/B}\rangle/N$','Interpreter','latex','FontSize',25)
xlabel('$\gamma t$','Interpreter','latex','FontSize',25)
legend('$\langle S_z^A\rangle_1$','$\langle S_z^B\rangle_1$','$\langle S_z^A\rangle_2$','$\langle S_z^B\rangle_2$','Interpreter','latex', 'FontSize',16,'box','off', 'Location','eastoutside')
title('(e)','Interpreter','latex','FontSize',25)
pbaspect([0.4 1 1])
hold off
box on
exportgraphics(gca,'Panele.pdf','Resolution',300)