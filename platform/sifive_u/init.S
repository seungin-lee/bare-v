/*
 * Original code from https://github.com/ucb-bar/libgloss-htif
 * Copyright (c) 2019, The Regents of the University of California (Regents).
 * Licensed under the BSD 3-Clause License.
 */
 
    /* Define _init() and _fini() for compatibility */
    .global _init
    .type _init, @function
    .global _fini
    .type _fini, @function
_init:
_fini:
    ret
    .size _init, .-_init
    .size _fini, .-_fini
