%%%%%%%%%%%%The BA scalefree model %%%%%%%
%%%%%%%%%%%%Write by Wu Ye %%%%%%%%%
function A=Net_SF(n,rd)
%n=20; % The total number of the net
%rd=3.5;
A=zeros(n,n);
all=0;
expect=0;
for i=1:n
    all=i^(-rd)+all;
end
for i=1:n
    expect=i*(i^(-rd)/all)+expect;
end
m=fix(expect)+1; % The mean degree
% The initial random network
n0=5;
p0=0.8;
for i=1:n0
    for j=i+1:n0
        if rand(1,1)<p0
            A(i,j)=1;
            A(j,i)=1;
        end
    end
end
for i=1:n0
    deg(i,1)=sum(A(i,:));
end
%%%%%%%%%%%%%%%%%%%%
for i=n0:n-1
     b=zeros(m,1);
    [b]=scalefree(i,m,deg);
    for j=1:m
        A(b(j,1),i+1)=1;
        A(i+1,b(j,1))=1;
        deg(b(j,1),1)=deg(b(j,1),1)+1;
    end
    deg(i+1,1)=m;
end
% A=A;
% B=n*mean(A,2);%求邻接矩阵的行和，即度，求列和用mean(A,1)
% D=diag(B);%生成度矩阵
% L=D-A;%网络的拉普拉斯矩阵,这里生成的网络为无向的
%lambda=eig(L);
end
function [b]=scalefree(ni,m,de)
b=zeros(m,1);
dp=zeros(ni+1,1);
sk=0;
for i=1:ni
    sk=sk+de(i);
end
dp(1,1)=0;
for i=1:ni
    dp(i+1,1)=dp(i,1)+de(i,1);
end
is=1;
while is<=m 
r=rand(1,1);
r=fix(r*sk+1);
    for i=1:ni
        if r>dp(i,1)&&r<=dp(i+1,1)
            it=i;
        end
    end
    pd=0;  
    for j=1:is
        if it==b(j,1)
            pd=1;
        end
    end
    if pd==0
       b(is,1)=it;
       is=is+1;
    end
end
end