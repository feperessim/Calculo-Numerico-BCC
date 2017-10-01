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

/* Calcula a integral definida de uma função através do método numérico 
 * Regra de Simpson através da regra composta dada pelo somatório de 
 * h/3 *[f(x1) + 4f(xm) + f(x2))]  */
function y  = simpson(a, b)
    
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
        /* Somatório da área */
        sigmaArea = 0
        /* Subdivisões */
        subdiv = 10^n
        /* Valor inicial do intervalo*/
        x = a
        /* Incremento da subdivisão */
        //inc = (b - a)/subdiv
        /* Ponto médio */
        //xm = (a + b)/2
        /* Altura dada por um polinômio de 3 grau, dividida pelo número de subdivisões*/
        h = (b - a)/(2*subdiv)
        printf("\nIteração: %d\n", n)
        printf("Número de subdivisões: %d\n", subdiv)
        while x < b
           sigmaArea = sigmaArea + (h/3)*(f(x) + 4*f(x+h) + f(x+2*h))
           x = x + 2*h
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
