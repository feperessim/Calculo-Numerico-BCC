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

// Algoritmo resolve sistemas lineares pelo método de Gauss
// Escalona o sistema o transformando em um sistema triangular superior
// E depois o resolve por substituição retroativa.
// Assume-se que o vetor não tem elementos com o valor 0
// Autor: Felipe de Lima Peressim
// Argumentos: A Matris de coeficientes e 
//             b termos independentes

function result = gauss(A, b, lineSize, columnSize)

    column = 1;
    for line = 1 : lineSize -1
        for i = line+1 : lineSize
            factor =  A(i, column) / A(line, column);
            for j = column : columnSize 
                A(i, j) = A(i, j) - factor*A(line, j);
            end
            b(i) = b(i) - factor*b(line);
        end
        disp(A), disp(b)
        column = column + 1;
    end
    
    // Agora juntamos os coeficientes e os termos independentes
    // para passarmos como parametro para a função sretro
    // que nos dara as soluções do sistema triangular superior
    
    A
    b
    result = sretro(lineSize, A, b);
endfunction
