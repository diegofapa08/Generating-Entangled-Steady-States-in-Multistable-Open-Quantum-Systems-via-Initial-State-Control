data1 = load('Balanced.txt');

cmap1 = [flipud(plasma(5))];
cmap1(1,:)=[];
colororder(cmap1)

scatter(data1(:,1),data1(:,2),'LineWidth',2,'MarkerEdgeColor',cmap1(1,:),'MarkerFaceColor',cmap1(1,:),'MarkerFaceAlpha',0.5)
hold on
plot(data1(:,1),data1(:,3),'LineWidth',3,'Color',cmap1(3,:),'LineStyle','-')

%set(gca,'yscale','log')
set(gca,'FontSize',20)
ylabel('$C(\rho_{\rm SS})$','Interpreter','latex','FontSize',26)
xlabel('$\vert c_2 \vert =\vert \rho_{\rm SS,2}^\dagger\vec{\rho}_0\vert$','Interpreter','latex','FontSize',26)
ylim([-0.05,1.05])
xlim([-0.05,1.05])
title('(b)','Interpreter','latex','FontSize',30)
xticks([0,0.25,0.5,0.75,1])
yticks([0,0.25,0.5,0.75,1])
pbaspect([0.8 0.5 1])
legend('Eq.(2)','Eq.(5)','Interpreter','latex','Location','northwest','numcolumns',1,'box','off','fontsize',22)
box on
hold off
exportgraphics(gca,'TwoQubits(b).pdf','Resolution',300)

%%
data1 = load('Unbalanced.txt');

cmap1 = [flipud(plasma(5))];
cmap1(1,:)=[];
colororder(cmap1)

scatter(data1(:,1),data1(:,2),'LineWidth',2,'MarkerEdgeColor',cmap1(1,:),'MarkerFaceColor',cmap1(1,:),'MarkerFaceAlpha',0.5)
hold on
plot(data1(:,1),data1(:,3),'LineWidth',3,'Color',cmap1(3,:),'LineStyle','-')

%set(gca,'yscale','log')
set(gca,'FontSize',20)
ylabel('$C(\rho_{\rm SS})$','Interpreter','latex','FontSize',26)
xlabel('$\vert \tilde{c}_2 \vert =\vert (\vec{\mathcal{U}}_2)^\dagger \vec{\rho}_0\vert$','Interpreter','latex','FontSize',26)
ylim([-0.05,1.05])
xlim([-0.05,1.05])
xticks([0,0.25,0.5,0.75,1])
yticks([0,0.25,0.5,0.75,1])
title('(d)','Interpreter','latex','FontSize',30)
pbaspect([0.8 0.5 1])
legend('Eq.(3)','Eq.(5)','Interpreter','latex','Location','northwest','numcolumns',1,'box','off','fontsize',22)
box on
hold off
exportgraphics(gca,'TwoQubits(d).pdf','Resolution',300)

