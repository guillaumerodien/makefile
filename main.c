#include "fonction.h"
#include <stdio.h>

int main()
{
int a = 8;
int b = 9; 
  printf("Le resultat de l'addition est : %i\n", addition(a, b));
  printf("Le resultat de la multiplication est : %i\n", multiplication(a, b));
  printf("Le resultat de soustraction est : %i\n", soustraction(a, b));
  printf("Le resultat de la division est : %lf\n", division(a, b));
return 0;
}

