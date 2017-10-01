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

function y = retangulos(a, b, side)
    /* Espera uma matriz linha como entrada, o número de subdivisões
    e o lado do intervalo ao qual deve ser calculado, sendo 'l' => Left
    'r' => Rigth e 'm' => Middle  */
    
    n = 1
    subdiv = 10^n
    epsilon = 10^-3
    absError = 1
    areaAnterior = 0
    
    while absError > epsilon
        printf("\nIteração: %d\n", n)
        printf("Número de subdivisões: %d\n", subdiv)
        sub = (b-a)/subdiv
        i = a
        k = 1
        while i < b
            x(k) = i
            k = k + 1
            i = i + sub
        end
        x(k) = b
        [maxLine] = size(x, 'r')
        deltaX = (x(maxLine) - x(1))/subdiv;
        begin = 1;
        final = maxLine;
        area = 0;
        if side ~= 'm' then
            if side == 'l'
                final = final - 1;
            else
                begin = begin + 1;
            end
            for i = begin : final
                area = area + f(x(i));            
            end
        else
            for i = begin : final-1
                area = area + f((x(i)+ x(i+1))/2);            
            end        
        end
        area = area * deltaX;
        printf("\nSomatório: %f\n", area)
        absError = abs(area - areaAnterior)/abs(area)
        areaAnterior = area
        if (n > 1)
            printf("Erro relativo: %f\n\n", absError)
        end
        n = n + 1
        subdiv = 10^n
    end
    y = area;
endfunction
