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

function [A, b] = minimosQuadrados(matrixCoord, maiorGrau)
    // Recebe a matriz com as coordenadas (x, y) e 
    // o maior grau do polinômio da função
    // Faz o somatório das derivadas parciais
    // em relação aos coeficientes
    grauA = maiorGrau
    grauB = maiorGrau
    A = 0;
    for (i = 1 : maiorGrau+1)
        for (j = 1 : maiorGrau+1)    
            [x y] = somatorio(matrixCoord, grauA-i+1, grauB-j+1)
            A(i, j) = x
            b(i) = y
        end
    end
endfunction
