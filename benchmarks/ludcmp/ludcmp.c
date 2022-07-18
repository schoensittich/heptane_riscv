/* MDH WCET BENCHMARK SUITE. File version $Id: ludcmp.c,v 1.1.1.1 2007-12-11 15:22:56 puaut Exp $ */

/*************************************************************************/
/*                                                                       */
/*   SNU-RT Benchmark Suite for Worst Case Timing Analysis               */
/*   =====================================================               */
/*                              Collected and Modified by S.-S. Lim      */
/*                                           sslim@archi.snu.ac.kr       */
/*                                         Real-Time Research Group      */
/*                                        Seoul National University      */
/*                                                                       */
/*                                                                       */
/*        < Features > - restrictions for our experimental environment   */
/*                                                                       */
/*          1. Completely structured.                                    */
/*               - There are no unconditional jumps.                     */
/*               - There are no exit from loop bodies.                   */
/*                 (There are no 'break' or 'return' in loop bodies)     */
/*          2. No 'switch' statements.                                   */
/*          3. No 'do..while' statements.                                */
/*          4. Expressions are restricted.                               */
/*               - There are no multiple expressions joined by 'or',     */
/*                'and' operations.                                      */
/*          5. No library calls.                                         */
/*               - All the functions needed are implemented in the       */
/*                 source file.                                          */
/*                                                                       */
/*                                                                       */
/*************************************************************************/
/*                                                                       */
/*  FILE: ludcmp.c                                                       */
/*  SOURCE : Turbo C Programming for Engineering                         */
/*                                                                       */
/*  DESCRIPTION :                                                        */
/*                                                                       */
/*     Simultaneous linear equations by LU decomposition.                */
/*     The arrays a[][] and b[] are input and the array x[] is output    */
/*     row vector.                                                       */
/*     The variable n is the number of equations.                        */
/*     The input arrays are initialized in function main.                */
/*                                                                       */
/*                                                                       */
/*  REMARK :                                                             */
/*                                                                       */
/*  EXECUTION TIME :                                                     */
/*                                                                       */
/*                                                                       */
/*************************************************************************/

#include <annot.h>

/* Changes:
 * JG 2005/12/12: Indented program. Removed unused variable nmax.
 */

/*
** Benchmark Suite for Real-Time Applications, by Sung-Soo Lim
**
**    III-4. ludcmp.c : Simultaneous Linear Equations by LU Decomposition
**                 (from the book C Programming for EEs by Hyun Soon Ahn)
*/


#ifdef MSP430_ARCHI
#define LBSIZE 10
#else
#define LBSIZE 50
#endif

// typedef double THETYPE;
typedef float THETYPE; // Lbesnard Sept 2019

THETYPE           a[LBSIZE][LBSIZE], b[LBSIZE], x[LBSIZE];

int             ludcmp( /* int nmax, */ int n, THETYPE  eps);


static THETYPE  
fabs(THETYPE  n)
{
	THETYPE           f;

	if (n >= 0)
		f = n;
	else
		f = -n;
	return f;
}

int 
main(void)
{

	int             i, j/*, nmax = 50*/, n = 5, chkerr;
	THETYPE           eps, w;

	eps = 1.0e-6;

	for (i = 0; i <= n; i++) 
	  {
	    ANNOT_MAXITER(6);
	    w = 0.0;
	    for (j = 0; j <= n; j++) {
	      ANNOT_MAXITER(6);
	      a[i][j] = (i + 1) + (j + 1);
	      if (i == j)
		a[i][j] *= 10.0;
	      w += a[i][j];
	    }
	    b[i] = w;
	  }
	
	chkerr = ludcmp( /* nmax, */ n, eps);

	return 0;

}

int 
ludcmp( /* int nmax, */ int n, THETYPE  eps)
{

  int             i, j, k;
  THETYPE           w, y[100];

  if (n > 99 || eps <= 0.0)
    return (999);
  for (i = 0; i < n; i++) 
    {
      ANNOT_MAXITER(5);
      if (fabs(a[i][i]) <= eps)
	return (1);
      for (j = i + 1; j <= n; j++) 
	{
	  ANNOT_MAXITER(5);
	  w = a[j][i];
	  if (i != 0)
	    for (k = 0; k < i; k++) 
	      {
		ANNOT_MAXITER(5);
		w -= a[j][k] * a[k][i];
	      }
	  a[j][i] = w / a[i][i];
	}
      for (j = i + 1; j <= n; j++) 
	{
	  ANNOT_MAXITER(5);
	  w = a[i + 1][j];
	  for (k = 0; k <= i; k++) 
	    {
	      ANNOT_MAXITER(5);
	      w -= a[i + 1][k] * a[k][j];
	    }
	  a[i + 1][j] = w;
	}
    }
  
  y[0] = b[0];
  for (i = 1; i <= n; i++) 
    {
      ANNOT_MAXITER(5);
      w = b[i];
      for (j = 0; j < i; j++) 
	{
	  ANNOT_MAXITER(5);
	  w -= a[i][j] * y[j];
	}
      y[i] = w;
    }
  x[n] = y[n] / a[n][n];
  for (i = n - 1; i >= 0; i--) 
    {
      ANNOT_MAXITER(5);
      w = y[i];
      for (j = i + 1; j <= n; j++) 
	{
	  ANNOT_MAXITER(5);
	  w -= a[i][j] * x[j];
	}
      x[i] = w / a[i][i];
    }
  return (0);
  
}
