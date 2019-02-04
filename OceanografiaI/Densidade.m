function [Den ] = Densidade( S,T,P )
%UNTITLED12 Summary of this function goes here
  %Cálculos para calcular a Densidade da água do mar
    %fórmula para calcular a densidade da água pura na superficie
    pw=999.842594+6.793952*10^-2*T-9.095290*10^-3*T^2+1.001685*10^-4*T^3-1.120083*10^-6*T^4+6.536332*10^(-9)*T^5;
   
    %Fórmula para calcular a densidade da água do mar à superficie
    p= pw+S*(0.824493-4.0899*10^(-3)*T+7.6438*10^(-5)*T^2-8.2467*10^(-7)*T^3+5.3875*10^(-9)*T^4)+S^(3/2)*(-5.72466*10^(-3)+1.0227*10^(-4)*T-1.6546*10^(-6)*T^2)+4.8314*10^(-4)*S^2;
    
    %Coeficiente de incompressibilidade para a água doce à superficie
    kw=19652.21+148.4206*T-2.327105*T^2+1.360477*10^-2*T^3-5.155288*10^(-5)*T^4;
    
    %Coeficiente de incompressibilidade para a água do mar à superficie
    k=kw+S*(54.6746-0.603459*T+1.09987*10^-2*T^2-6.1670*10^-5*T^3)+S^(3/2)*(7.944*10^-2+1.6483*10^-2*T-5.3009*10^-4*T^2);

    %Coeficiente de incompressibilidade para a água do mar na pressão
    k=k+P*(3.239908+1.43713*10^-3*T+1.16092*10^-4*T^2-5.77905*10^-7*T^3)+P*S*(2.2838*10^-3-1.0981*10^-5*T-1.6078*10^-6*T^2)+1.91075*10^-4*P*S^(3/2)+P^2*(8.50935*10^-5-6.12293*10^-6*T+5.2787*10^-8*T^2)+P^2*S*(-9.348*10^-7+2.0816*10^-8*T+9.1697*10^-10*T^2);

    %Densidade da água do mar
    %Den=densidade(T,S,P);
    Den=p/(1-P/k);

end

