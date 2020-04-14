%%%%�޶����SEIRģ��%%%%
%Powered by Denny��Z
%A Junior Metaheuristic Learner
%��ģ��ΪԤ�����ʡ��������
%�Ƚ��Ƿ���Ǳ���ߵĴ�Ⱦ���
%��ʼ��
clear all
close all
clc
%��������
%ģ�ͳ�ֵ�趨
%S1=59170000;%����ʡ�˿�����
S1=59170000;%����ʡ�˿�����
N0=S1;
S2=S1;
S3=S1;
E1=4007;% 1��23��1��29������ȷ�ﲡ����
E2=E1;
E3=E1;
I1=786;%��Ⱦ��
I2=786;
I3=786;
Sq1=2776;%���ڽ���ҽѧ�۲������
Sq2=Sq1;
Sq3=Sq1;
Eq1=400;%����ֵ��Ϊ���ڱ������Ǳ����
Eq2=Eq1;
Eq3=Eq1;
H1=1186;%����סԺ�Ļ��ߣ�Ϊ��Ⱦ�ߺͱ������Ǳ����֮��
H2=H1;
H3=H1;
R1=31;%�ٷ������ĳ�Ժ����
R2=R1;
R3=R1;
%ģ�Ͳ����趨
c1=2;%�Ӵ���
c2=2.2;%�Ӵ���
c3=2.5;%�Ӵ���
deltaI=0.13;%��Ⱦ�ߵĸ����ٶ�
deltaq=0.13;%����Ǳ����������Ⱦ�ߵ�ת������
gammaI=0.007;%��Ⱦ�ߵĻָ���
gammaH=0.014;%�����Ⱦ�ߵĻָ�����
beta1=2.05*10^(-9);%��Ⱦ����
beta2=2.05*10^(-9);%��Ⱦ����
beta3=2.05*10^(-9);%��Ⱦ����
q1=1*10^(-6);%�������
q2=1*10^(-6);%�������
q3=1*10^(-6)/2;%�������
alpha1=2.7*10^(-4);%������
alpha2=2.7*10^(-4);%������
alpha3=2.7*10^(-4);%������
rho1=1;%��Ч�Ӵ�ϵ�����ο�ȡ1
rho2=1;%��Ч�Ӵ�ϵ�����ο�ȡ1
rho3=1;%��Ч�Ӵ�ϵ�����ο�ȡ1
theta1=0.2;%Ǳ��������ڸ�Ⱦ�ߵĴ�Ⱦ������ֵ
theta2=0.2;%Ǳ��������ڸ�Ⱦ�ߵĴ�Ⱦ������ֵ
theta3=0.2;%Ǳ��������ڸ�Ⱦ�ߵĴ�Ⱦ������ֵ
lambda=1/14;%�������ٶȣ�Ϊ14��ĵ���
sigma=1/7;%Ǳ�������Ⱦ�ߵ�ת���ٶȣ�ƽ��Ǳ����Ϊ7�죬Ϊ7��ĵ���
%��ֵ�������
newinfected1(1)=0;
newinfected2(1)=0;
newinfected3(1)=0;
E_sum1=E1;%�ܸ�Ⱦ����
E_sum2=E1;%�ܸ�Ⱦ����
E_sum3=E1;%�ܸ�Ⱦ����
T=1:300;
for i =1:length(T)-1
    %%
    %�ֹ��龰
    dS1=(rho1*c1*beta1+rho1*c1*q1*(1-beta1))*S1(i)*(I1(i)+theta1*E1(i))-lambda*Sq1(i);
    newinfected1(i+1)=rho1*c1*beta1*S1(i)*(I1(i)+theta1*E1(i));
    S1(i+1)=S1(i)-dS1;%�׸���������
    E1(i+1)=E1(i)+rho1*c1*beta1*(1-q1)*S1(i)*(I1(i)+theta1*E1(i))-sigma*E1(i);%Ǳ������������
    I1(i+1)=I1(i)+sigma*E1(i)-(deltaI+alpha1+gammaI)*I1(i);%��Ⱦ����������
    Sq1(i+1)=Sq1(i)+rho1*c1*q1*(1-beta1)*S1(i)*(I1(i)+theta1*E1(i))-lambda*Sq1(i);%�����׸�Ⱦ����������
    Eq1(i+1)=Eq1(i)+rho1*c1*beta1*q1*S1(i)*(I1(i)+theta1*E1(i))-deltaq*Eq1(i);%����Ǳ������������
    H1(i+1)=H1(i)+deltaI*I1(i)+deltaq+Eq1(i)-(alpha1+gammaH)*H1(i);%סԺ������������
    R1(i+1)=R1(i)+gammaI*I1(i)+gammaH*H1(i);%������������ 
    E_sum1=E_sum1+newinfected1(i+1);
    if E_sum1/N0 > 1/2000
        rho1 = rho1/1.01;  %rho1/1.1����ǿ�����ʩ
        q1=1*10^(-6)*1.01; %q1*1.3������������
        beta1=2.05*10^(-9)/1.01;%��Ⱦ���ʽ���
    end
    
    %%
    %���龰
    dS2=(rho2*c2*beta2+rho2*c2*q2*(1-beta2))*S2(i)*(I2(i)+theta2*E2(i))-lambda*Sq2(i);
    newinfected2(i+1)=rho2*c2*beta2*S2(i)*(I2(i)+theta2*E2(i));
    S2(i+1)=S2(i)-dS2;%�׸���������
    E2(i+1)=E2(i)+rho2*c2*beta2*(1-q2)*S2(i)*(I2(i)+theta2*E2(i))-sigma*E2(i);%Ǳ������������
    I2(i+1)=I2(i)+sigma*E2(i)-(deltaI+alpha2+gammaI)*I2(i);%��Ⱦ����������
    Sq2(i+1)=Sq2(i)+rho2*c2*q2*(1-beta2)*S2(i)*(I2(i)+theta2*E2(i))-lambda*Sq2(i);%�����׸�Ⱦ����������
    Eq2(i+1)=Eq2(i)+rho2*c2*beta2*q2*S2(i)*(I2(i)+theta2*E2(i))-deltaq*Eq2(i);%����Ǳ������������
    H2(i+1)=H2(i)+deltaI*I2(i)+deltaq+Eq2(i)-(alpha2+gammaH)*H2(i);%סԺ������������
    R2(i+1)=R2(i)+gammaI*I2(i)+gammaH*H2(i);%������������ 
    E_sum2=E_sum2+newinfected2(i+1);
    if E_sum2/N0 > 1/100
        rho2 = rho2/1.002;
        q2=1*10^(-6)*1.01; %����������
        beta2=2.05*10^(-9)/1.005;%��Ⱦ���ʽ���
    end
    
   %%
    %�����龰
    dS3=(rho3*c3*beta3+rho3*c3*q3*(1-beta3))*S3(i)*(I3(i)+theta3*E3(i))-lambda*Sq3(i);
    newinfected3(i+1)=rho3*c3*beta3*S3(i)*(I3(i)+theta3*E3(i));
    S3(i+1)=S3(i)-dS3;%�׸���������
    E3(i+1)=E3(i)+rho3*c3*beta3*(1-q3)*S3(i)*(I3(i)+theta3*E3(i))-sigma*E3(i);%Ǳ������������
    I3(i+1)=I3(i)+sigma*E3(i)-(deltaI+alpha3+gammaI)*I3(i);%��Ⱦ����������
    Sq3(i+1)=Sq3(i)+rho3*c3*q3*(1-beta3)*S3(i)*(I3(i)+theta3*E3(i))-lambda*Sq3(i);%�����׸�Ⱦ����������
    Eq3(i+1)=Eq3(i)+rho3*c3*beta3*q3*S3(i)*(I3(i)+theta3*E3(i))-deltaq*Eq3(i);%����Ǳ������������
    H3(i+1)=H3(i)+deltaI*I3(i)+deltaq+Eq3(i)-(alpha3+gammaH)*H3(i);%סԺ������������
    R3(i+1)=R3(i)+gammaI*I3(i)+gammaH*H3(i);%������������ 
    E_sum3=E_sum3+newinfected3(i+1);
    %if E_sum3/N0 > 1/100
       % rho3 = rho3/1.002;
       % q3=1*10^(-6)*1.01; %����������
      %  beta3=2.05*10^(-9)/1.005;%��Ⱦ���ʽ���
   % end
end
plot(T,I1,'LineWidth',2);
hold on;
plot(T,I2,'LineWidth',2);
hold on;
plot(T,I3,'LineWidth',2);
grid on;
legend('�ֹ��龰','���龰','�����龰');
xlabel('����');
ylabel('��Ⱦ����');