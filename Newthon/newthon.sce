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

function u = newthon(f, fder1, fder2, a, b)
    u = 0
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
        for (i = a : 0.001 : b)
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
    end
    iter_count = 0
    epsilon = 10^(-10)
    lim = 100
    u = 0
    i = 1
    // Escolha do chute inicial
    if f(a)*fder2(a) > 0 
        x = a
    else
        x = b
    end
    old_x = x
    printf("x = %f\nf(%f) = %f\n fder1(%f) = %f\n", x, x, f(x), x, fder1(x))
    erro = 1
    while f(x)~= 0 & abs(f(x)) > epsilon & iter_count < lim & erro > epsilon
        iter_count = iter_count + 1
        x = x - f(x)/fder1(x)
        xresult(1, i) = x;
        i = i + 1
        erro = abs(x - old_x)/abs(x)
        old_x = x
        printf("x = %f\nf(%f) = %f\n fder1(%f) = %f\nerro relativo = %f\n", x, x, f(x), x, fder1(x), erro)
    end
    printf("Número de iterações:%d \n", iter_count)
    u = x
    plot([1 : 1 : length(xresult)], xresult, '--rs', 'LineWidth', 2)
    
endfunction




