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


function y = falsa_posicao (f, a, b)
    
    // f é a função passada como uma string
    // e deff a converte para uma função do scilab
    // a e b são os intervalos.
    deff('[z]=f(x)','z='+f);
    // Teste do teorema de bolzano
    if f(a) * f(b) > 0 then
        printf("Não existem raizes no intervalor ´[%f,%f]\n", a, b);
        y = 0;
        return
    end
        epsilon = 1*10^(-10);
        x = a - ((b-a)*f(a))/(f(b) - f(a));
        var_err = b;
        iter_count = 0;
        erro = abs(x-var_err)/abs(x);
        lim = 100
        i = 1  
        while f(x) ~= 0 & abs(f(x)) > epsilon & erro > epsilon & iter_count < lim
            xresult(1, i) = x;
            i = i + 1
            erro = abs(x-var_err)/abs(x);
            printf("a = %f\nb = %f\nx = %f\nf(a) = %f\nf(b) = %f\nf(x) = %f\nErro Relativo = %f\n", a, b, x, f(a), f(b), f(x), erro)            
            if f(x)*f(a) < 0
                b = x;
                var_err = b;
            else
                a = x;
                var_err = a;
            end
        x = a - ((b-a)*f(a))/(f(b) - f(a));
        iter_count = iter_count + 1;
    end
    erro = abs(x-var_err)/abs(x);
    printf("%f\n", erro);
    printf("Iterações = %d\n", iter_count)
    y = x; 
    // Plot da convergência
    plot([1 : 1 : length(xresult)], xresult, '--rs', 'LineWidth', 2)
endfunction


