/* Copyright (C) 2017 Felipe de Lima Peressim
 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

function y = secantes(f, fder1, fder2, a, b)
   // f é a função passada como uma string, assim como
    // suas derivadas primeira e segunda.
    // deff as converte para uma função do scilab
    // a e b são os intervalos.
    deff('[z]=f(x)','z='+f);
    deff('[k]=fder1(x)','k='+fder1);
    deff('[p]=fder2(x)','p='+fder2);
    // Teste do teorema de bolzano
    if f(a) * f(b) > 0 then
        printf("Não existem raizes no intervalor ´[%f,%f]\n", a, b);
        y = 0;
        return
    else 
        converfder1 = fder1(a)
        converfder2 = fder2(a)
        for (i = a : 0.1 : b)
            if (fder1(i) == 0 | fder2(i) == 0)
                printf("%f\n", i)
                printf("%f\n%f\n", fder1(i), fder2(i))
                printf("Intervalo não converge")
                return
            end 
            if ~(converfder1*fder1(1) > 0 | converfder2*fder2(1) > 0)
                printf("Intervalo não converge")
                return       
            end
        end
        if ~( abs(f(a)/fder1(a)) < (b - a) | abs(f(b)/fder1(b)) < (b - a))
            printf("Intervalo não converge")
            return   
       end 
    end
        y = 0
        epsilon = 1*10^-10;
        x = b - ((b-a)*f(b))/(f(b) - f(a));
        var_err = b;
        iter_count = 0;
        erro = abs(x-var_err)/abs(x);
        lim = 100
        i = 1  
        while f(x) ~= 0 & abs(f(x)) > epsilon & erro > epsilon & iter_count < lim
            xresult(1, i) = x;
            i = i + 1
            iter_count = iter_count + 1;
            erro = abs(x-var_err)/abs(x);
            printf("a = %f\nb = %f\nx = %f\nf(a) = %f\nf(b) = %f\nf(x) = %f\nfder1(x) = %f\nErro Relativo = %f\n", a, b, x, f(a), f(b), f(x), fder1(x), erro)            
            a = b
            b = x
            x = b - ((b-a)*f(b))/(f(b) - f(a));
        end
    erro = abs(x-var_err)/abs(x);
    printf("%f\n", erro);
    printf("Iterações = %d\n", iter_count)
    y = x; 
    printf("RESPOSTA = %f\n", y)
    plot([1 : 1 : length(xresult)], xresult, '--rs', 'LineWidth', 2)
endfunction

