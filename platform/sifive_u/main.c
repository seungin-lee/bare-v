/*
 * Original code from https://github.com/ucb-bar/libgloss-htif
 * Copyright (c) 2019, The Regents of the University of California (Regents).
 * Licensed under the BSD 3-Clause License.
 */
 
/*
 * Main function for secondary harts
 * 
 * Multi-threaded programs should provide their own implementation.
 */
void  __attribute__ ((weak,noreturn)) __main(void)
{
    for (;;) {
        __asm__ __volatile__ ("wfi");
    }
}
