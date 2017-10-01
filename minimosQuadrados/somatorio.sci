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

function [k, z] = somatorio(xyCoord, graua, graub)
    x = 0
    y = 0
    lineMaxSize = size(xyCoord)
    for i = 1 :  lineMaxSize(1)
        x = x + xyCoord(i, 1)^(graua) * xyCoord(i, 1)^(graub)
        y = y + xyCoord(i, 2) * xyCoord(i, 1)^graua
    end
    k = x 
    z = y
endfunction
