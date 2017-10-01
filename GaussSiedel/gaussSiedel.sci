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

function y = gaussSiedel(B, d)
    epsilon = 10^-4;
    qtdMaxIter = 20;
    [line, column] = size(B)
    xk = ones(line, 1)
    xp = xk;
    criterioParada = 10
    iter = 1
    while iter < qtdMaxIter & criterioParada > epsilon
        for i = 1 : length(B(1, :))
            xk(i) = B(i, :)*xk + d(i);
        end
        iter = iter + 1;
        criterioParada = sqrt(sum((xp - xk)^2));
        xp = xk 
        disp(criterioParada)
    end
    disp(iter)
    y = xk;
endfunction
