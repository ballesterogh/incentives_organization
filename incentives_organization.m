close all
clear all

d= 0.7;
p = 0:0.0001:0.8;
p1 = 0:0.0001:0.8;
q = 0.2+p;
q1 = 1-p1;

p2 = fliplr(p1);

%Condición de sharing information en incentivos grupales con q=0.2+p
s=[];
for i=1:length(p)    
    s(i)= (p(i)-p(i)*q(i)+q(i)*d) / ((1-p(i))*(1-q(i))-(1-q(i)).^2);
end

s1=[];
for i=1:length(p1)    
    s1(i)= (p1(i)-p1(i)*q1(i)+q1(i)*d) / ((1-p1(i))*(1-q1(i))-(1-q1(i)).^2);
end

s2 = fliplr(s1);

%Restricción de crebilidad individual 
a=[];
for i=1:length(p)    
    a(i) = (d*(1-(1-q(i))*(1-p(i)))*p(i))/ (2*(1-d)+d*(p(i)+q(i)));
end

a1=[];
for i=1:length(p1)    
    a1(i) = (d*(1-(1-q1(i))*(1-p1(i)))*p1(i))/ (2*(1-d)+d*(p1(i)+q1(i)));
end

a2 = fliplr(a1);

%Restricción de crebilidad en equipo con transmisión de información
b=[];
for i=1:length(p)    
    b(i) = ((d*(1-(1-q(i))^2))/(1-d*(1-q(i))^2))*((q(i)-q(i)*q(i)+q(i)*d)/2);
end

b1=[];
for i=1:length(p1)    
    b1(i) = ((d*(1-(1-q1(i))^2))/(1-d*(1-q1(i))^2))*((q1(i)-q1(i)*q1(i)+q1(i)*d)/2);
end

b2 = fliplr(b1);

%Restricción de crebilidad bono grupal sin transimisión de información
c=[];
for i=1:length(p)    
    c(i) = ((d*(1-(1-p(i))*(1-q(i))))/(1-d*((1-p(i))*(1-q(i)))))*((p(i)-p(i)*q(i)+q(i)*d)/2);
end

c1=[];
for i=1:length(p1)    
    c1(i) = ((d*(1-(1-p1(i))*(1-q1(i))))/(1-d*((1-p1(i))*(1-q1(i)))))*((p1(i)-p1(i)*q1(i)+q1(i)*d)/2);
end

c2 = fliplr(c1);

set(groot,'defaultAxesTickLabelInterpreter','latex');

%Gráfico cooperación
figure (1)
A1 = area(p, s);
set(gca,'FontSize',18)
A1.FaceColor = [0.4, 0.4, 0.4];
alpha(.5);
A1.LineWidth = 1.25;
xlim([0 0.8])
ylim([0 8])
ylabel('$c/k$','Interpreter','Latex');
xlabel('$p_2$','Interpreter','Latex')
legend('No cooperación','Location','northwest');

figure (11)
A11 = area(p2, s2);
set(gca,'FontSize',18)
A11.FaceColor = [0.4, 0.4, 0.4];
alpha(.5);
A11.LineWidth = 1.25;
xlim([0 0.5])
ylim([0 12])
ylabel('$c/k$','Interpreter','Latex');
xlabel('$p_1-p_2$','Interpreter','Latex')
legend('No cooperación','Location','northwest');
xticks([0 0.1 0.2 0.3 0.4 0.5]);
xticklabels({'0', '0.2' '0.4', '0.6' '0.8', '1'});

%Gráfico incentivos grupales
figure (2)
P2 = plot (p, b, 'LineWidth', 2);
P2.Color = [1 0.2 0.2];
set(gca,'FontSize',18);
hold on
P3 = plot (p, c, 'LineWidth',2);
P3.Color = [0 0.5 1];
ylabel('$c/V$','Interpreter','Latex');
xlabel('$p_2$','Interpreter','Latex');
legend('Incentivos grupales con transimisión de información', 'Incentivos grupales sin transmisión de información','Location','northwest');
xlim([0 0.8]);
ylim([0 0.35]);
yticks([0 0.1 0.2 0.3]);

figure (21)
P21 = plot (p2, b2, 'LineWidth', 2);
P21.Color = [1 0.2 0.2];
set(gca,'FontSize',18);
hold on
P31 = plot (p2, c2, 'LineWidth',2);
P31.Color = [0 0.5 1];
ylabel('$c/V$','Interpreter','Latex');
xlabel('$p_1-p_2$','Interpreter','Latex');
legend('Incentivos grupales con transimisión de información', 'Incentivos grupales sin transmisión de información','Location','northwest');
xlim([0 0.5]);
ylim([0 0.35]);
yticks([0 0.1 0.2 0.3]);
xticks([0 0.1 0.2 0.3 0.4 0.5]);
xticklabels({'0', '0.2' '0.4', '0.6' '0.8', '1'});

%Gráfico Esquema de incentivos 
figure (3)
P2 = plot (p, b, 'LineWidth', 2);
set(gca,'FontSize',18);
P2.Color = [1 0.2 0.2];
hold on
P3 = plot (p, c, 'LineWidth',2);
P3.Color = [0 0.5 1];
hold on
P1 = plot (p, a, 'LineWidth',2);
P1.Color = [0 0.6 0.3];
LL=line([0.61516 0.61516], [0 0.2497], 'LineStyle','--', 'LineWidth',1);
LL.Color = [0, 0, 0];
LL=line([0.5343 0.5343], [0 0.22], 'LineStyle','--', 'LineWidth',1);
LL.Color = [0, 0, 0];
xticks([0 0.1 0.2 0.3 0.4 0.5 0.5343 0.61516 0.7 0.8]);
xticklabels({'0', '0.1' '0.2', '0.3' '0.4', '0.5', '$\alpha$', '$\beta$', '0.7', '0.8'});
yticks([0 0.1 0.2 0.3]);
xlim([0 0.8]);
ylim([0 0.35]);
ylabel('$c/V$','Interpreter','Latex');
xlabel('$p_2$','Interpreter','Latex');
legend('Incentivos grupales con transimisión de información', 'Incentivos grupales sin transmisión de información', 'Incentivos individuales', 'Location','northwest');


figure (31)
P21 = plot(p2, b2, 'LineWidth',2);
set(gca,'FontSize',18);
P21.Color = [1 0.2 0.2];
hold on
P31 = plot (p2, c2, 'LineWidth',2);
P31.Color = [0 0.5 1];
hold on
P11 = plot (p2, a2, 'LineWidth',2);
P11.Color = [0 0.6 0.3];
LL=line([0.4844 0.4844], [0 0.19571], 'LineStyle','--', 'LineWidth',1);
LL.Color = [0, 0, 0];
LL=line([0.464 0.464], [0 0.18805], 'LineStyle','--', 'LineWidth',1);
LL.Color = [0, 0, 0];
xticks([0 0.1 0.2 0.3 0.4 0.464 0.4844 0.5]);
xticklabels({'0', '0.2' '0.4', '0.6' '0.8','$\alpha$', '$\beta$'});
yticks([0 0.1 0.2 0.3]);
xlim([0 0.5]);
ylim([0 0.35]);
ylabel('$c/V$','Interpreter','Latex');
xlabel('$p_1-p_2$','Interpreter','Latex');
legend('Incentivos grupales con transimisión de información', 'Incentivos grupales sin transmisión de información', 'Incentivos individuales', 'Location','northwest');


%Gráfico Esquema de incentivos 
figure (4)
A3 = area(p([1:6152]),b([1:6152]));
set(gca,'FontSize',18);
A3.FaceColor=[1 0.2 0.2];
alpha(.3);
A3.LineWidth = 1.25;
hold on
A2 = area(p([6152:8001]),a([6152:8001]));
A2.FaceColor = [0 0.6 0.3];
alpha(.3);
A2.LineWidth = 1.25;
P1 = plot (p, a, 'LineWidth',2);
set(gca,'FontSize',18);
P1.Color = [0 0.6 0.3];
hold on
P2 = plot (p, b, 'LineWidth', 2);
P2.Color = [1 0.2 0.2];
hold on
P3 = plot (p, c, 'LineWidth',2);
P3.Color = [0 0.5 1];
LL=line([0.61516 0.61516], [0 0.2497], 'LineStyle','--', 'LineWidth',1);
LL.Color = [0, 0, 0];
LL=line([0.5343 0.5343], [0 0.22], 'LineStyle','--', 'LineWidth',1);
LL.Color = [0, 0, 0];
xticks([0 0.1 0.2 0.3 0.4 0.5 0.5343 0.61516 0.7 0.8]);
xticklabels({'0', '0.1' '0.2', '0.3' '0.4', '0.5', '$\alpha$', '$\beta$', '0.7', '0.8'});
yticks([0 0.1 0.2 0.3]);
xlim([0 0.8]);
ylim([0 0.35]);
ylabel('$c/V$','Interpreter','Latex');
xlabel('$p_2$','Interpreter','Latex');
legend('Incentivos grupales con transimisión de información', 'Incentivos individuales','Location','northwest');

figure (41)
A31 = area(p2([3157:8001]),b2([3157:8001]));
set(gca,'FontSize',18);
A31.FaceColor=[1 0.2 0.2];
alpha(.3);
A31.LineWidth = 1.25;
hold on
A21 = area(p2([1:3157]),a2([1:3157]));
A21.FaceColor = [0 0.6 0.3];
alpha(.3);
A21.LineWidth = 1.25;
P11 = plot (p2, a2, 'LineWidth',2);
set(gca,'FontSize',18);
P11.Color = [0 0.6 0.3];
hold on
P21 = plot (p2, b2, 'LineWidth', 2);
P21.Color = [1 0.2 0.2];
hold on
P31 = plot (p2, c2, 'LineWidth',2);
P31.Color = [0 0.5 1];
LL=line([0.4844 0.4844], [0 0.19571], 'LineStyle','--', 'LineWidth',1);
LL.Color = [0, 0, 0];
LL=line([0.464 0.464], [0 0.18805], 'LineStyle','--', 'LineWidth',1);
LL.Color = [0, 0, 0];
xticks([0 0.1 0.2 0.3 0.4 0.464 0.4844 0.5]);
xticklabels({'0', '0.2' '0.4', '0.6' '0.8','$\alpha$', '$\beta$'});
yticks([0 0.1 0.2 0.3]);
xlim([0 0.5]);
ylim([0 0.35]);
ylabel('$c/V$','Interpreter','Latex');
xlabel('$p_1-p_2$','Interpreter','Latex');
legend('Incentivos grupales con transimisión de información', 'Incentivos individuales','Location','northwest');
