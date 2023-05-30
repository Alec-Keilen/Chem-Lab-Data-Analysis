function K = FirstOrderKinetics()

R=dlmread('Alec, Emmanuel, Griffin Rxn Rate Data.txt');
Ainf=0.733;

%MethodI

x1= R(:,1);
y1 = log(Ainf - R(:,2));

%plot(x1,y1);
xlabel('Reaction Duration (minutes)','fontsize',(17))
ylabel('ln(A∞ –At)','fontsize',(17))

xlim([0 45])
ylim([-0.75 -0.35])

M1=polyfit(x1,y1,1);
K1 = abs(M1(1));

%MethodII

R1 = R(1:21,:); 
R2 = R(21:41,:);

x2= R(1:21,1);
y2= log(R2(:,2) - R1(:,2)) ;

%plot(x2,y2,'r');
xlabel('Reaction Duration (minutes)','fontsize',(17))
ylabel('ln(At+τ – At)','fontsize',(17))
xlim([0 25])

M2=polyfit(x2,y2,1);
K2 = abs(M2(1));

%MethodIII
x3=R2(:,2);
y3=R1(:,2);

plot(x3,y3,'g');
xlabel('At+τ','fontsize',(20))
ylabel('At','fontsize',(20))


M3=polyfit(x3,y3,1);


k1=log(M3(1));
k2 = k1/20;
K3 = abs(k2);

K = [K1 K2 K3];


    




