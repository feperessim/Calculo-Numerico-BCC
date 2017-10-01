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

function [B, d] = preparador_classico(A, b)
    [lineMaxSize, columnMaxSize] = size(A)
    
    for line = 1 : lineMaxSize
        [pivot, index] =  max(abs(A(line : lineMaxSize, line)))
        if index ~= line
            // Troca a linha atual pela linha que contém o maior valor absoluto
            // encontrado. A troca é feita apenas se o indice do maior valor
            // não for o indice da linha atual
            printf("\nL%d <=> L%d\n", index, line)
            printf("------------------------------------------------------------\n") 
            temp = A(index, 1 : columnMaxSize)
            A(index, 1 : columnMaxSize) = A(line, 1 : columnMaxSize)
            A(line, 1 : columnMaxSize) = temp(:, 1 : columnMaxSize)
            temp = b(index)
            b(index) = b(line)
            b(line) = temp
         end
    end    
    for i = 1 : lineMaxSize
        A(i, :) = A(i, :)/A(i, i);
        b(i) = b(i) / A(i, 1);
        A(i, i) = 0;
        A(i, :) = A(i, :)*(-1);
    end
    B = A;
    d = b;
endfunction
    
