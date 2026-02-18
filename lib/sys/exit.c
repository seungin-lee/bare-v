/*
 * Copyright (c) 2026, seungin.lee8@gmail.com
 * Licensed under the BSD 3-Clause License.
 */

void __attribute__ ((noreturn)) _exit(int code)
{
	for (;;) {
		__asm__ __volatile__ ("wfi");
	}
}
