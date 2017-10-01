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

function vector_solution = gauss_pivot(A, b, line_max_size, column_max_size)
    vector_solution = zeros(0,line_max_size)
    for line = 1 : line_max_size
        disp(A)
        //  Guarda o maior valor absoluto como pivot da matriz e o indice da linha
        // ao qual esse valor se encontra. O indice da coluna é o mesmo
        // que o indice da coluna porque essa é a diagonal principal da matriz  
        [pivot, index] =  max(abs(A(line : line_max_size, line)))
        [pmin] = abs(min(A(line : line_max_size, line)))
        if pmin == pivot
            pivot = pivot * (-1)
        end
        index = index + line-1
        if pivot == 0 then
            printf("Pivô = 0. Matrix não pode ser resolvida pelo método de Gauss")
            break
        end
        if index ~= line
        // Troca a linha atual pela linha que contém o maior valor absoluto
        // encontrado. A troca é feita apenas se o indice do maior valor
        // não for o indice da linha atual
            printf("\nPivô: %f\n", pivot)
            printf("\nL%d <=> L%d\n", index, line)
            printf("------------------------------------------------------------\n") 
            temp = A(index, 1 : column_max_size)
            A(index, 1 : column_max_size) = A(line, 1 : column_max_size)
            A(line, 1 : column_max_size) = temp(:, 1 : column_max_size)
            temp = b(index)
            b(index) = b(line)
            b(line) = temp
        end
        // Zera todas as colunas abaixo da diagonal principal
        for next_line = line+1 : line_max_size
           scalar = (A(next_line, line)/pivot) * (-1)
           updated_line =  (scalar * A(line, 1 : column_max_size)) + A(next_line, 1 : column_max_size)
           A(next_line, 1 : column_max_size) = updated_line(:,:); 
           updated_line = (scalar * b(line)) + b(next_line);
           b(next_line) = updated_line;
           //disp(A)            
        end
    end
    printf('\n')
    vector_solution = sretro(line_max_size, A, b)
endfunction
