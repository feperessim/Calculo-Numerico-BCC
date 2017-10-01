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

function [B, d] = preparador_unitario(A, b)
    [lineMaxSize, columnMaxSize] = size(A)
    
    A = A * (-1)
    for i = 1 : lineMaxSize
        for j = 1 : columnMaxSize
            if i == j then
                if A(i, j) < 0
                    A(i, :) = A(i, :) *(-1)
                end
                preparador(i, j) = preparador(i, j) - 1 
            else 
                preparador(i, j) = 0
            end
        end
    end
    A = A - preparador
    B = A;
    d = b;
endfunction
    
