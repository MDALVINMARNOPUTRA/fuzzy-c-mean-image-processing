clear
clc
close all

a=imread('11.jpg');
[baris kolom] = size(a);
x=a(:);
x=x';
x=double(x);
m = 2;
n = 2/(m-1);
c1=50;
c2=200;
er=1;


while er>0.1
for i=1:length(x)
    %fungsi keanggotaan
    u1(i)=1/(((x(i)-c1)/(x(i)-c1))^n + ((x(i)-c1)/(x(i)-c2))^n);
    if(isnan(u1(i)))
        ul(i)=1;
    end
    u2(i)=1/(((x(i)-c2)/(x(i)-c1)) ^n + ((x(i)-c2)/(x(i)-c2))^n);
    if(isnan(u2(i)))
        u2(i)=1;
    end
    if u1(i)>= u2(i)
        ux(i) = 1;
    else
        ux(i) = 0;
    end
end
    %hitung pusat cluster baru
    c1baru= sum((u1.^2).*x)/sum(u1.^2);
    c2baru= sum((u2.^2).*x)/sum(u2.^2);
    %perhitungan selisih cluster
    er=(abs(c1-c1baru)+abs(c2-c2baru))/2;
    %update nilai cluster
    c1=c1baru;
    c2=c2baru;
    
    b=reshape (ux, [baris kolom]);
    imshow(b);
    pause(1);
    
end
