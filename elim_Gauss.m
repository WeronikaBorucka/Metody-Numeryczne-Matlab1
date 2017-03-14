%eliminacja Gaussa - funkcja z dwoma wsp�czynnikami wej�ciowymi
function [xg, Ag] = elim_Gauss(A ,b)

k=1; %numer kolumny
w=1; %numer wiersza
maxval=0;
wzam = 1;
Azam(1,21)=0;
bzam=0;
a=0; %wsp�czynnik potrzebny do odejmowania wierszy
xg=[zeros(21,1)]; %macierz wynik�w dla eliminacji Gaussa
suma = 0;
rozm = size(A,2);

    if det(A) ~= 0 && rozm==size(A,1) %sprawdzenie czy wyznacznik nie jest r�wny 0 oraz czy macierz jest kwadratowa

        for k=1:rozm
            maxval = A(k,k);
            wzam = k;
            Azam=A(k,:);

            %znajdywanie elementu g��wnego - najwi�kszego wsp�czynnika
            for w = k:rozm
                    if abs(A(w,k)) >= abs(maxval);
                      wzam = w;              
                      maxval= A(wzam,k);
                    end
            end

            %zamiana wierszy najwi�kszego z tym, w kt�rej teraz jeste�my kolumnie
            Azam = A(wzam,:);
            A(wzam,:)= A(k,:);
            A(k,:)= Azam;
            bzam = b(wzam,1);
            b(wzam,1)= b(k,1);
            b(k,1)= bzam;
            wzam = k;

            %odejmowanie wierszy od siebie
            for w=(k+1):rozm
                    if A(w,k)~=0 && A(wzam,k)~=0
                        a=A(w,k)./A(wzam,k);
                        A(w,:)=A(w,:)-a.*Azam;
                        b(w,1)=b(w,1)-a.*bzam;
                    end
            end
        end

        
        %rozwi�zanie uk�adu r�wna� metod� eliminacji Gaussa
        for w=rozm:-1:1
            suma = 0;            
            for kk=(w+1):rozm
                suma=(A(w,kk)*xg(kk,1))+suma;
            end            
            xg(w,1)=(b(w,1)-suma)/A(w,w);
        end 
    end
    
Ag = A;
end