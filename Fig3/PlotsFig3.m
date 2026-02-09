
%%
data1 = load('QFIUnbalanced.txt');
N=60;


cmap1 = [flipud(plasma(5))];
cmap1(1,:)=[];
colororder(cmap1)
xdomain = linspace(0,30,100);
ydomain = zeros(100)+1;

hold on
plot(xdomain,ydomain,'LineStyle','--','Color','r','LineWidth',2)
scatter(data1(:,1),data1(:,2)/60,'LineWidth',2,'MarkerEdgeColor',cmap1(1,:),'MarkerFaceColor',cmap1(1,:),'MarkerFaceAlpha',0.5,'SizeData',60)

set(gca,'FontSize',15)
ylabel('$F^Q_{\vert S,-S \rangle}/N$','Interpreter','latex','FontSize',22)
xlabel('$S$','Interpreter','latex','FontSize',22)
ylim([-1.2,23])
xlim([-0.5,30.5])
title('(c)','Interpreter','latex','FontSize',20)
legend('SQL','Interpreter','latex','box','off','Location','northeast','FontSize',18)
pbaspect([1 0.3 1])
hold off
box on
exportgraphics(gca,'Unbalanced(c).pdf','Resolution',300)

