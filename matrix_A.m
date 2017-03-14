%PROJEKT NR.1 Weronika Borucka #5

clear all;
A = [zeros(21,21)];
xld = [zeros(21,1)]; %wynik lewego dzielenia
xg = [zeros(21,1)];%wynik eliminacji Gaussa
roznica = [zeros(21,1)];%porównanie wyników operacji lewego dzielenia i eliminacji Gaussa

A(1,[1 2])=1;
A(2,[3 4])=1;
A(3,[5 6 7])=1;
A(4,[8 9])=1;
A(5,[10 11])=1;
A(6,[12 13 14])=1;
A(7,[15 16])=1;
A(8,[17 18 19])=1;
A(9,[20 21])=1;
A(10,[5 12])=1;
A(11,[8 17])=1;
A(12,[1 20])=1;
A(13,[6 13 15])=1;
A(14,[3 9])=1;
A(15,[10 18])=1;
A(16,[7 11 16])=1;
A(17,[2 14 19])=1;
A(18,[2 4 7])=1;
A(19,[9 10 13])=1;
A(20,[15 18])=1;
A(21,[16 19 21])=1;

b = [9;14;10;9;7;13;10;10;8;6;11;7;12;12;5;17;9;12;11;4;17];

xld=A\b;

[xg,Ag]=elim_Gauss(A,b)
roznica=xg-xld;