clear
Vin = linspace(-10, 10,20); 
G = [1 0 0 0 0 0 0; 
    0 -1 1 0 0 0 0;
    1 -1.5 0 -1 0 0 0;
    0 0 -0.1 1 0 0 0;
    0 0 0 0 10 1 -10;
    0 0 -10 0 1 0 0;
    0 0 0 0 0 1 1/1000];
C = [0 0 0 0 0 0 0;
    0 0 0 0.2 0 0 0;
    0.25 -0.25 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0];

for l = 1:20
F = [Vin(l); 0; 0; 0; 0; 0; 0];
V = G\F
Vo(l)=V(5);
V3(l)=V(3);
end
subplot(2,2,1)
plot (Vin, Vo,Vin,V3)
legend('Vo', 'V3');
xlabel('Vin (V)')
ylabel('Voltage ') 


f =linspace (0,15,10000)*2*pi;
F = [1; 0; 0; 0; 0; 0; 0];
for l = 1:size(f, 2)
   V =  (G+j*f(l)*C)\F;
   Vabso(l)=20*log10(abs(V(5)));
   Vabs3(l)=20*log10(abs(V(3)));
end 
subplot(2,2,2)
plot (f, Vabso,f,Vabs3)
legend('Vo', 'V3')
xlim([0 100])
xlabel('w')
ylabel('V')

c = normrnd(0.25,0.05,[1,1000]);
subplot(2,2,3)
hist(c)
xlabel('C')
ylabel('Number')

for l = 1:size(c, 2)
   C = [0 0 0 0 0 0 0;
    0 0 0 0.2 0 0 0;
    c(l) -(c(l)) 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0];
    V =  (G+j*pi*C)\F;
    Vo (l)=abs(V(7)); 
end
subplot(2,2,4)
hist(Vo)
xlabel ('Vo/Vin')
ylabel('Number')