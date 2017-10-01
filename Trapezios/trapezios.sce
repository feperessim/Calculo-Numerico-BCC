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

/* O Algoritmo a seguir calcula a integral definida de uma função através 
 * do método numérico Regra do Trapézio composta atavés de n
 * subintervalos, dada pela fórmula SIGMA(a, b)((b-a)* (f(b) + f(a))/2) */

function y = trapezios(a, b)
    /* Define um critério de parada */
    epsilon = 10^-3
    /* Expoente das subdivisões */
    n = 1
    /* Somatório anterior para calcular o erro relativo contra o atual sendo 
     * também um critério de parada */
    prevSigma = 0
    absError = 1
    
    printf("\nIntervalo: [%d %d]\n", a, b)
    printf("Critério de parada epsilon: %f\n", epsilon)
    while absError > epsilon
        /* Somatório dos resultados dos subintervalos calculados */
        sigmaArea = 0
        /* subdivisão inicial */
        subdiv = 10^n
        /* Altura do trapézio é constante, e também é o fator de adição para x_i+1 */
        h = (b - a)/subdiv
        /* Valor inicial de x é o inicio do intervalo */
        x = a    
        printf("\nIteração: %d\n", n)
        printf("Número de subdivisões: %d\n", subdiv)
        while x < b
            sigmaArea = sigmaArea + h*((f(x) + f(x+h))/2)
            x = x + h    
        end
        absError = abs((sigmaArea - prevSigma)/sigmaArea)
        prevSigma = sigmaArea
        printf("\nSomatório: %f\n", sigmaArea)
        if (n > 1)
            printf("Erro relativo: %f\n\n", absError)
        end
        n = n + 1
    end
    y = sigmaArea
endfunction
 
