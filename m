From: Masoud Sharbiani <masouds@masoud.ir>
Date: Wed, 05 Oct 2005 17:01:41 +0000
Subject: [KJ] hexdigits definition consolidation
Message-Id: <20051005170141.GA14139@masoud.ir>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54040972445024682=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54040972445024682==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, 
The following patch consolidates several definitions of hex digits as string that are spread throughout the kernel and drivers.
I had to create a separate file in lib/ directory to hold the actual values, and EXPORT_SYMBOL them them so that they could be used by modules.


cheers, 
Masoud

Signed-off-by: Masoud A Sharbiani <masouds@masoud.ir>


diff -urN linux-2.6.clean/arch/cris/arch-v10/kernel/kgdb.c linux-2.6.patched/arch/cris/arch-v10/kernel/kgdb.c
--- linux-2.6.clean/arch/cris/arch-v10/kernel/kgdb.c	2005-10-05 12:10:36.000000000 -0400
+++ linux-2.6.patched/arch/cris/arch-v10/kernel/kgdb.c	2005-10-05 12:36:48.000000000 -0400
@@ -230,6 +230,7 @@
 #include <linux/delay.h>
 #include <linux/linkage.h>
 #include <linux/reboot.h>
+#include <linux/digits.h>
 
 #include <asm/setup.h>
 #include <asm/ptrace.h>
@@ -415,7 +416,6 @@
 #define RUNLENMAX 64
 
 /* Definition of all valid hexadecimal characters */
-static const char hexchars[] = "0123456789abcdef";
 
 /* The inbound/outbound buffers used in packet I/O */
 static char remcomInBuffer[BUFMAX];
@@ -557,8 +557,8 @@
 	char *sd;
 	int x = 0;
 	
-	for (s1 = (char*)s; (sd = gdb_cris_memchr(hexchars, *s1, base)) != NULL; ++s1)
-		x = x * base + (sd - hexchars);
+	for (s1 = (char*)s; (sd = gdb_cris_memchr(hex, *s1, base)) != NULL; ++s1)
+		x = x * base + (sd - hex);
         
         if (endptr)
         {
diff -urN linux-2.6.clean/arch/cris/arch-v32/kernel/kgdb.c linux-2.6.patched/arch/cris/arch-v32/kernel/kgdb.c
--- linux-2.6.clean/arch/cris/arch-v32/kernel/kgdb.c	2005-10-05 12:10:36.000000000 -0400
+++ linux-2.6.patched/arch/cris/arch-v32/kernel/kgdb.c	2005-10-05 12:36:48.000000000 -0400
@@ -169,6 +169,7 @@
 #include <linux/delay.h>
 #include <linux/linkage.h>
 #include <linux/reboot.h>
+#include <linux/digits.h>
 
 #include <asm/setup.h>
 #include <asm/ptrace.h>
@@ -465,7 +466,6 @@
 #define RUNLENMAX 64
 
 /* Definition of all valid hexadecimal characters */
-static const char hexchars[] = "0123456789abcdef";
 
 /* The inbound/outbound buffers used in packet I/O */
 static char input_buffer[BUFMAX];
@@ -550,8 +550,8 @@
 	char *sd;
 	int x = 0;
 
-	for (s1 = (char*)s; (sd = gdb_cris_memchr(hexchars, *s1, base)) != NULL; ++s1)
-		x = x * base + (sd - hexchars);
+	for (s1 = (char*)s; (sd = gdb_cris_memchr(hex, *s1, base)) != NULL; ++s1)
+		x = x * base + (sd - hex);
 
         if (endptr) {
                 /* Unconverted suffix is stored in endptr unless endptr is NULL. */
@@ -660,7 +660,7 @@
 static inline char
 highhex(int x)
 {
-	return hexchars[(x >> 4) & 0xf];
+	return hex[(x >> 4) & 0xf];
 }
 
 /* Returns the character equivalent of a nibble, bit 3, 2, 1, and 0 of a byte,
@@ -668,7 +668,7 @@
 static inline char
 lowhex(int x)
 {
-	return hexchars[x & 0xf];
+	return hex[x & 0xf];
 }
 
 /* Returns the integer equivalent of a hexadecimal character. */
diff -urN linux-2.6.clean/arch/frv/kernel/gdb-stub.c linux-2.6.patched/arch/frv/kernel/gdb-stub.c
--- linux-2.6.clean/arch/frv/kernel/gdb-stub.c	2005-10-05 12:10:36.000000000 -0400
+++ linux-2.6.patched/arch/frv/kernel/gdb-stub.c	2005-10-05 12:36:48.000000000 -0400
@@ -123,6 +123,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/nmi.h>
+#include <linux/digits.h>
 
 #include <asm/pgtable.h>
 #include <asm/system.h>
@@ -182,8 +183,6 @@
 static char	input_buffer[BUFMAX];
 static char	output_buffer[BUFMAX];
 
-static const char hexchars[] = "0123456789abcdef";
-
 static const char *regnames[] = {
 	"PSR ", "ISR ", "CCR ", "CCCR",
 	"LR  ", "LCR ", "PC  ", "_stt",
@@ -383,8 +382,8 @@
 		}
 
 		gdbstub_tx_char('#');
-		gdbstub_tx_char(hexchars[checksum >> 4]);
-		gdbstub_tx_char(hexchars[checksum & 0xf]);
+		gdbstub_tx_char(hex[checksum >> 4]);
+		gdbstub_tx_char(hex[checksum & 0xf]);
 
 	} while (gdbstub_rx_char(&ch,0),
 #ifdef GDBSTUB_DEBUG_PROTOCOL
@@ -680,8 +679,8 @@
 	if ((uint32_t)mem&1 && count>=1) {
 		if (!gdbstub_read_byte(mem,ch))
 			return NULL;
-		*buf++ = hexchars[ch[0] >> 4];
-		*buf++ = hexchars[ch[0] & 0xf];
+		*buf++ = hex[ch[0] >> 4];
+		*buf++ = hex[ch[0] & 0xf];
 		mem++;
 		count--;
 	}
@@ -689,10 +688,10 @@
 	if ((uint32_t)mem&3 && count>=2) {
 		if (!gdbstub_read_word(mem,(uint16_t *)ch))
 			return NULL;
-		*buf++ = hexchars[ch[0] >> 4];
-		*buf++ = hexchars[ch[0] & 0xf];
-		*buf++ = hexchars[ch[1] >> 4];
-		*buf++ = hexchars[ch[1] & 0xf];
+		*buf++ = hex[ch[0] >> 4];
+		*buf++ = hex[ch[0] & 0xf];
+		*buf++ = hex[ch[1] >> 4];
+		*buf++ = hex[ch[1] & 0xf];
 		mem += 2;
 		count -= 2;
 	}
@@ -700,14 +699,14 @@
 	while (count>=4) {
 		if (!gdbstub_read_dword(mem,(uint32_t *)ch))
 			return NULL;
-		*buf++ = hexchars[ch[0] >> 4];
-		*buf++ = hexchars[ch[0] & 0xf];
-		*buf++ = hexchars[ch[1] >> 4];
-		*buf++ = hexchars[ch[1] & 0xf];
-		*buf++ = hexchars[ch[2] >> 4];
-		*buf++ = hexchars[ch[2] & 0xf];
-		*buf++ = hexchars[ch[3] >> 4];
-		*buf++ = hexchars[ch[3] & 0xf];
+		*buf++ = hex[ch[0] >> 4];
+		*buf++ = hex[ch[0] & 0xf];
+		*buf++ = hex[ch[1] >> 4];
+		*buf++ = hex[ch[1] & 0xf];
+		*buf++ = hex[ch[2] >> 4];
+		*buf++ = hex[ch[2] & 0xf];
+		*buf++ = hex[ch[3] >> 4];
+		*buf++ = hex[ch[3] & 0xf];
 		mem += 4;
 		count -= 4;
 	}
@@ -715,10 +714,10 @@
 	if (count>=2) {
 		if (!gdbstub_read_word(mem,(uint16_t *)ch))
 			return NULL;
-		*buf++ = hexchars[ch[0] >> 4];
-		*buf++ = hexchars[ch[0] & 0xf];
-		*buf++ = hexchars[ch[1] >> 4];
-		*buf++ = hexchars[ch[1] & 0xf];
+		*buf++ = hex[ch[0] >> 4];
+		*buf++ = hex[ch[0] & 0xf];
+		*buf++ = hex[ch[1] >> 4];
+		*buf++ = hex[ch[1] & 0xf];
 		mem += 2;
 		count -= 2;
 	}
@@ -726,8 +725,8 @@
 	if (count>=1) {
 		if (!gdbstub_read_byte(mem,ch))
 			return NULL;
-		*buf++ = hexchars[ch[0] >> 4];
-		*buf++ = hexchars[ch[0] & 0xf];
+		*buf++ = hex[ch[0] >> 4];
+		*buf++ = hex[ch[0] & 0xf];
 	}
 
 	*buf = 0;
@@ -1448,22 +1447,22 @@
 		*ptr++ = 'O';
 		ptr = mem2hex(title, ptr, sizeof(title) - 1,0);
 
-		hx = hexchars[(brr & 0xf0000000) >> 28];
-		*ptr++ = hexchars[hx >> 4];	*ptr++ = hexchars[hx & 0xf];
-		hx = hexchars[(brr & 0x0f000000) >> 24];
-		*ptr++ = hexchars[hx >> 4];	*ptr++ = hexchars[hx & 0xf];
-		hx = hexchars[(brr & 0x00f00000) >> 20];
-		*ptr++ = hexchars[hx >> 4];	*ptr++ = hexchars[hx & 0xf];
-		hx = hexchars[(brr & 0x000f0000) >> 16];
-		*ptr++ = hexchars[hx >> 4];	*ptr++ = hexchars[hx & 0xf];
-		hx = hexchars[(brr & 0x0000f000) >> 12];
-		*ptr++ = hexchars[hx >> 4];	*ptr++ = hexchars[hx & 0xf];
-		hx = hexchars[(brr & 0x00000f00) >> 8];
-		*ptr++ = hexchars[hx >> 4];	*ptr++ = hexchars[hx & 0xf];
-		hx = hexchars[(brr & 0x000000f0) >> 4];
-		*ptr++ = hexchars[hx >> 4];	*ptr++ = hexchars[hx & 0xf];
-		hx = hexchars[(brr & 0x0000000f)];
-		*ptr++ = hexchars[hx >> 4];	*ptr++ = hexchars[hx & 0xf];
+		hx = hex[(brr & 0xf0000000) >> 28];
+		*ptr++ = hex[hx >> 4];	*ptr++ = hex[hx & 0xf];
+		hx = hex[(brr & 0x0f000000) >> 24];
+		*ptr++ = hex[hx >> 4];	*ptr++ = hex[hx & 0xf];
+		hx = hex[(brr & 0x00f00000) >> 20];
+		*ptr++ = hex[hx >> 4];	*ptr++ = hex[hx & 0xf];
+		hx = hex[(brr & 0x000f0000) >> 16];
+		*ptr++ = hex[hx >> 4];	*ptr++ = hex[hx & 0xf];
+		hx = hex[(brr & 0x0000f000) >> 12];
+		*ptr++ = hex[hx >> 4];	*ptr++ = hex[hx & 0xf];
+		hx = hex[(brr & 0x00000f00) >> 8];
+		*ptr++ = hex[hx >> 4];	*ptr++ = hex[hx & 0xf];
+		hx = hex[(brr & 0x000000f0) >> 4];
+		*ptr++ = hex[hx >> 4];	*ptr++ = hex[hx & 0xf];
+		hx = hex[(brr & 0x0000000f)];
+		*ptr++ = hex[hx >> 4];	*ptr++ = hex[hx & 0xf];
 
 		ptr = mem2hex(crlf, ptr, sizeof(crlf) - 1, 0);
 		*ptr = 0;
@@ -1477,12 +1476,12 @@
 
 	/* Send trap type (converted to signal) */
 	*ptr++ = 'T';
-	*ptr++ = hexchars[sigval >> 4];
-	*ptr++ = hexchars[sigval & 0xf];
+	*ptr++ = hex[sigval >> 4];
+	*ptr++ = hex[sigval & 0xf];
 
 	/* Send Error PC */
-	*ptr++ = hexchars[GDB_REG_PC >> 4];
-	*ptr++ = hexchars[GDB_REG_PC & 0xf];
+	*ptr++ = hex[GDB_REG_PC >> 4];
+	*ptr++ = hex[GDB_REG_PC & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex(&__debug_frame->pc, ptr, 4, 0);
 	*ptr++ = ';';
@@ -1490,8 +1489,8 @@
 	/*
 	 * Send frame pointer
 	 */
-	*ptr++ = hexchars[GDB_REG_FP >> 4];
-	*ptr++ = hexchars[GDB_REG_FP & 0xf];
+	*ptr++ = hex[GDB_REG_FP >> 4];
+	*ptr++ = hex[GDB_REG_FP & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex(&__debug_frame->fp, ptr, 4, 0);
 	*ptr++ = ';';
@@ -1499,8 +1498,8 @@
 	/*
 	 * Send stack pointer
 	 */
-	*ptr++ = hexchars[GDB_REG_SP >> 4];
-	*ptr++ = hexchars[GDB_REG_SP & 0xf];
+	*ptr++ = hex[GDB_REG_SP >> 4];
+	*ptr++ = hex[GDB_REG_SP & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex(&__debug_frame->sp, ptr, 4, 0);
 	*ptr++ = ';';
@@ -1525,8 +1524,8 @@
 			/* request repeat of last signal number */
 		case '?':
 			output_buffer[0] = 'S';
-			output_buffer[1] = hexchars[sigval >> 4];
-			output_buffer[2] = hexchars[sigval & 0xf];
+			output_buffer[1] = hex[sigval >> 4];
+			output_buffer[2] = hex[sigval & 0xf];
 			output_buffer[3] = 0;
 			break;
 
@@ -2044,8 +2043,8 @@
 	}
 
 	gdbstub_tx_char('#');
-	gdbstub_tx_char(hexchars[checksum >> 4]);
-	gdbstub_tx_char(hexchars[checksum & 0xf]);
+	gdbstub_tx_char(hex[checksum >> 4]);
+	gdbstub_tx_char(hex[checksum & 0xf]);
 
 	/* make sure the output is flushed, or else RedBoot might clobber it */
 	gdbstub_tx_char('-');
diff -urN linux-2.6.clean/arch/mips/au1000/common/puts.c linux-2.6.patched/arch/mips/au1000/common/puts.c
--- linux-2.6.clean/arch/mips/au1000/common/puts.c	2005-10-05 12:10:37.000000000 -0400
+++ linux-2.6.patched/arch/mips/au1000/common/puts.c	2005-10-05 12:36:48.000000000 -0400
@@ -39,7 +39,6 @@
 #define TIMEOUT       0xffffff
 #define SLOW_DOWN
 
-static const char digits[16] = "0123456789abcdef";
 static volatile unsigned long * const com1 = (unsigned long *)SERIAL_BASE;
 
 
@@ -124,7 +123,7 @@
     do {
         cnt--;
         ch = (unsigned char)(ul >> cnt * 4) & 0x0F;
-                putch(digits[ch]);
+                putch(hex[ch]);
     } while (cnt > 0);
 }
 
@@ -140,6 +139,6 @@
     do {
         cnt--;
         ch = (unsigned char)(u >> cnt * 4) & 0x0F;
-                putch(digits[ch]);
+                putch(hex[ch]);
     } while (cnt > 0);
 }
diff -urN linux-2.6.clean/arch/mips/galileo-boards/ev96100/puts.c linux-2.6.patched/arch/mips/galileo-boards/ev96100/puts.c
--- linux-2.6.clean/arch/mips/galileo-boards/ev96100/puts.c	2005-10-05 12:10:37.000000000 -0400
+++ linux-2.6.patched/arch/mips/galileo-boards/ev96100/puts.c	2005-10-05 12:36:48.000000000 -0400
@@ -21,7 +21,6 @@
 #define TIMEOUT    0xffff
 #undef SLOW_DOWN
 
-static const char digits[16] = "0123456789abcdef";
 static volatile unsigned char *const com1 = (unsigned char *) SERIAL_BASE;
 
 
@@ -118,7 +117,7 @@
 	do {
 		cnt--;
 		ch = (unsigned char) (ul >> cnt * 4) & 0x0F;
-		putch(digits[ch]);
+		putch(hex[ch]);
 	} while (cnt > 0);
 }
 
@@ -133,6 +132,6 @@
 	do {
 		cnt--;
 		ch = (unsigned char) (u >> cnt * 4) & 0x0F;
-		putch(digits[ch]);
+		putch(hex[ch]);
 	} while (cnt > 0);
 }
diff -urN linux-2.6.clean/arch/mips/ite-boards/generic/puts.c linux-2.6.patched/arch/mips/ite-boards/generic/puts.c
--- linux-2.6.clean/arch/mips/ite-boards/generic/puts.c	2005-10-05 12:10:37.000000000 -0400
+++ linux-2.6.patched/arch/mips/ite-boards/generic/puts.c	2005-10-05 12:36:48.000000000 -0400
@@ -38,7 +38,6 @@
 #define TIMEOUT       0xffff
 #undef SLOW_DOWN
 
-static const char digits[16] = "0123456789abcdef";
 static volatile unsigned char *const com1 = (unsigned char *) SERIAL_BASE;
 
 
@@ -119,7 +118,7 @@
 	do {
 		cnt--;
 		ch = (unsigned char) (ul >> cnt * 4) & 0x0F;
-		putch(digits[ch]);
+		putch(hex[ch]);
 	} while (cnt > 0);
 }
 
@@ -134,6 +133,6 @@
 	do {
 		cnt--;
 		ch = (unsigned char) (u >> cnt * 4) & 0x0F;
-		putch(digits[ch]);
+		putch(hex[ch]);
 	} while (cnt > 0);
 }
diff -urN linux-2.6.clean/arch/mips/jmr3927/common/puts.c linux-2.6.patched/arch/mips/jmr3927/common/puts.c
--- linux-2.6.clean/arch/mips/jmr3927/common/puts.c	2005-10-05 12:10:37.000000000 -0400
+++ linux-2.6.patched/arch/mips/jmr3927/common/puts.c	2005-10-05 12:36:48.000000000 -0400
@@ -33,6 +33,7 @@
  */
 
 #include <linux/types.h>
+#include <linux/digits.h>
 #include <asm/jmr3927/txx927.h>
 #include <asm/jmr3927/tx3927.h>
 #include <asm/jmr3927/jmr3927.h>
@@ -40,8 +41,6 @@
 #define TIMEOUT       0xffffff
 #define SLOW_DOWN
 
-static const char digits[16] = "0123456789abcdef";
-
 #ifdef SLOW_DOWN
 #define slow_down() { int k; for (k=0; k<10000; k++); }
 #else
@@ -147,7 +146,7 @@
     do {
         cnt--;
         ch = (unsigned char)(ul >> cnt * 4) & 0x0F;
-                putch(digits[ch]);
+                putch(hex[ch]);
     } while (cnt > 0);
 }
 
@@ -163,6 +162,6 @@
     do {
         cnt--;
         ch = (unsigned char)(u >> cnt * 4) & 0x0F;
-                putch(digits[ch]);
+                putch(hex[ch]);
     } while (cnt > 0);
 }
diff -urN linux-2.6.clean/arch/mips/jmr3927/rbhma3100/kgdb_io.c linux-2.6.patched/arch/mips/jmr3927/rbhma3100/kgdb_io.c
--- linux-2.6.clean/arch/mips/jmr3927/rbhma3100/kgdb_io.c	2005-10-05 12:10:37.000000000 -0400
+++ linux-2.6.patched/arch/mips/jmr3927/rbhma3100/kgdb_io.c	2005-10-05 12:36:48.000000000 -0400
@@ -39,8 +39,6 @@
 #define TIMEOUT       0xffffff
 #define SLOW_DOWN
 
-static const char digits[16] = "0123456789abcdef";
-
 #ifdef SLOW_DOWN
 #define slow_down() { int k; for (k=0; k<10000; k++); }
 #else
diff -urN linux-2.6.clean/arch/mips/kernel/gdb-stub.c linux-2.6.patched/arch/mips/kernel/gdb-stub.c
--- linux-2.6.clean/arch/mips/kernel/gdb-stub.c	2005-10-05 12:10:37.000000000 -0400
+++ linux-2.6.patched/arch/mips/kernel/gdb-stub.c	2005-10-05 12:36:48.000000000 -0400
@@ -132,6 +132,7 @@
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/reboot.h>
+#include <linux/digits.h>
 
 #include <asm/asm.h>
 #include <asm/cacheflush.h>
@@ -189,7 +190,6 @@
 static char output_buffer[BUFMAX];
 static int initialized;	/* !0 means we've been initialized */
 static int kgdb_started;
-static const char hexchars[]="0123456789abcdef";
 
 /* Used to prevent crashes in memory access.  Note that they'll crash anyway if
    we haven't set up fault handlers yet... */
@@ -305,8 +305,8 @@
 		}
 
 		putDebugChar('#');
-		putDebugChar(hexchars[checksum >> 4]);
-		putDebugChar(hexchars[checksum & 0xf]);
+		putDebugChar(hex[checksum >> 4]);
+		putDebugChar(hex[checksum & 0xf]);
 
 	}
 	while ((getDebugChar() & 0x7f) != '+');
@@ -327,8 +327,8 @@
 	while (count-- > 0) {
 		if (kgdb_read_byte(mem++, &ch) != 0)
 			return 0;
-		*buf++ = hexchars[ch >> 4];
-		*buf++ = hexchars[ch & 0xf];
+		*buf++ = hex[ch >> 4];
+		*buf++ = hex[ch & 0xf];
 	}
 
 	*buf = 0;
@@ -748,14 +748,14 @@
 	 * Send trap type (converted to signal)
 	 */
 	*ptr++ = 'T';
-	*ptr++ = hexchars[sigval >> 4];
-	*ptr++ = hexchars[sigval & 0xf];
+	*ptr++ = hex[sigval >> 4];
+	*ptr++ = hex[sigval & 0xf];
 
 	/*
 	 * Send Error PC
 	 */
-	*ptr++ = hexchars[REG_EPC >> 4];
-	*ptr++ = hexchars[REG_EPC & 0xf];
+	*ptr++ = hex[REG_EPC >> 4];
+	*ptr++ = hex[REG_EPC & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&regs->cp0_epc, ptr, sizeof(long), 0);
 	*ptr++ = ';';
@@ -763,8 +763,8 @@
 	/*
 	 * Send frame pointer
 	 */
-	*ptr++ = hexchars[REG_FP >> 4];
-	*ptr++ = hexchars[REG_FP & 0xf];
+	*ptr++ = hex[REG_FP >> 4];
+	*ptr++ = hex[REG_FP & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&regs->reg30, ptr, sizeof(long), 0);
 	*ptr++ = ';';
@@ -772,8 +772,8 @@
 	/*
 	 * Send stack pointer
 	 */
-	*ptr++ = hexchars[REG_SP >> 4];
-	*ptr++ = hexchars[REG_SP & 0xf];
+	*ptr++ = hex[REG_SP >> 4];
+	*ptr++ = hex[REG_SP & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&regs->reg29, ptr, sizeof(long), 0);
 	*ptr++ = ';';
@@ -792,8 +792,8 @@
 		{
 		case '?':
 			output_buffer[0] = 'S';
-			output_buffer[1] = hexchars[sigval >> 4];
-			output_buffer[2] = hexchars[sigval & 0xf];
+			output_buffer[1] = hex[sigval >> 4];
+			output_buffer[2] = hex[sigval & 0xf];
 			output_buffer[3] = 0;
 			break;
 
diff -urN linux-2.6.clean/arch/ppc/boot/common/misc-common.c linux-2.6.patched/arch/ppc/boot/common/misc-common.c
--- linux-2.6.clean/arch/ppc/boot/common/misc-common.c	2005-10-05 12:10:37.000000000 -0400
+++ linux-2.6.patched/arch/ppc/boot/common/misc-common.c	2005-10-05 12:36:49.000000000 -0400
@@ -18,6 +18,7 @@
 #include <linux/config.h>
 #include <linux/string.h>
 #include <linux/zlib.h>
+#include <linux/digits.h>
 #include "nonstdio.h"
 
 /* If we're on a PReP, assume we have a keyboard controller
@@ -280,7 +281,7 @@
 	int i;
 	for (i = 7;  i >= 0;  i--)
 	{
-		buf[i] = "0123456789ABCDEF"[val & 0x0F];
+		buf[i] = hex[val & 0x0F];
 		val >>= 4;
 	}
 	buf[8] = '\0';
@@ -362,13 +363,13 @@
 						sign = '-';
 						val = -val;
 					}
-					length = _cvt(val, buf, 10, "0123456789");
+					length = _cvt(val, buf, 10, decimal);
 					break;
 				case 'x':
-					length = _cvt(val, buf, 16, "0123456789abcdef");
+					length = _cvt(val, buf, 16, hex);
 					break;
 				case 'X':
-					length = _cvt(val, buf, 16, "0123456789ABCDEF");
+					length = _cvt(val, buf, 16, HEX);
 					break;
 				}
 				cp = buf;
diff -urN linux-2.6.clean/arch/ppc/kernel/ppc-stub.c linux-2.6.patched/arch/ppc/kernel/ppc-stub.c
--- linux-2.6.clean/arch/ppc/kernel/ppc-stub.c	2005-10-05 12:10:37.000000000 -0400
+++ linux-2.6.patched/arch/ppc/kernel/ppc-stub.c	2005-10-05 12:36:49.000000000 -0400
@@ -107,6 +107,7 @@
 #include <linux/smp_lock.h>
 #include <linux/init.h>
 #include <linux/sysrq.h>
+#include <linux/digits.h>
 
 #include <asm/cacheflush.h>
 #include <asm/system.h>
@@ -132,7 +133,6 @@
 static int kdebug;
 
 
-static const char hexchars[]="0123456789abcdef";
 
 /* Place where we save old trap entries for restoration - sparc*/
 /* struct tt_entry kgdb_savettable[256]; */
@@ -206,28 +206,28 @@
 		if ((count == 2) && (((long)mem & 1) == 0)) {
 			tmp_s = *(unsigned short *)mem;
 			mem += 2;
-			*buf++ = hexchars[(tmp_s >> 12) & 0xf];
-			*buf++ = hexchars[(tmp_s >> 8) & 0xf];
-			*buf++ = hexchars[(tmp_s >> 4) & 0xf];
-			*buf++ = hexchars[tmp_s & 0xf];
+			*buf++ = hex[(tmp_s >> 12) & 0xf];
+			*buf++ = hex[(tmp_s >> 8) & 0xf];
+			*buf++ = hex[(tmp_s >> 4) & 0xf];
+			*buf++ = hex[tmp_s & 0xf];
 
 		} else if ((count == 4) && (((long)mem & 3) == 0)) {
 			tmp_l = *(unsigned int *)mem;
 			mem += 4;
-			*buf++ = hexchars[(tmp_l >> 28) & 0xf];
-			*buf++ = hexchars[(tmp_l >> 24) & 0xf];
-			*buf++ = hexchars[(tmp_l >> 20) & 0xf];
-			*buf++ = hexchars[(tmp_l >> 16) & 0xf];
-			*buf++ = hexchars[(tmp_l >> 12) & 0xf];
-			*buf++ = hexchars[(tmp_l >> 8) & 0xf];
-			*buf++ = hexchars[(tmp_l >> 4) & 0xf];
-			*buf++ = hexchars[tmp_l & 0xf];
+			*buf++ = hex[(tmp_l >> 28) & 0xf];
+			*buf++ = hex[(tmp_l >> 24) & 0xf];
+			*buf++ = hex[(tmp_l >> 20) & 0xf];
+			*buf++ = hex[(tmp_l >> 16) & 0xf];
+			*buf++ = hex[(tmp_l >> 12) & 0xf];
+			*buf++ = hex[(tmp_l >> 8) & 0xf];
+			*buf++ = hex[(tmp_l >> 4) & 0xf];
+			*buf++ = hex[tmp_l & 0xf];
 
 		} else {
 			while (count-- > 0) {
 				ch = *mem++;
-				*buf++ = hexchars[ch >> 4];
-				*buf++ = hexchars[ch & 0xf];
+				*buf++ = hex[ch >> 4];
+				*buf++ = hex[ch & 0xf];
 			}
 		}
 
@@ -412,8 +412,8 @@
 		}
 
 		putDebugChar('#');
-		putDebugChar(hexchars[checksum >> 4]);
-		putDebugChar(hexchars[checksum & 0xf]);
+		putDebugChar(hex[checksum >> 4]);
+		putDebugChar(hex[checksum & 0xf]);
 		recv = getDebugChar();
 	} while ((recv & 0x7f) != '+');
 }
@@ -603,15 +603,15 @@
 	ptr = remcomOutBuffer;
 
 	*ptr++ = 'T';
-	*ptr++ = hexchars[sigval >> 4];
-	*ptr++ = hexchars[sigval & 0xf];
-	*ptr++ = hexchars[PC_REGNUM >> 4];
-	*ptr++ = hexchars[PC_REGNUM & 0xf];
+	*ptr++ = hex[sigval >> 4];
+	*ptr++ = hex[sigval & 0xf];
+	*ptr++ = hex[PC_REGNUM >> 4];
+	*ptr++ = hex[PC_REGNUM & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&regs->nip, ptr, 4);
 	*ptr++ = ';';
-	*ptr++ = hexchars[SP_REGNUM >> 4];
-	*ptr++ = hexchars[SP_REGNUM & 0xf];
+	*ptr++ = hex[SP_REGNUM >> 4];
+	*ptr++ = hex[SP_REGNUM & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex(((char *)regs) + SP_REGNUM*4, ptr, 4);
 	*ptr++ = ';';
@@ -633,8 +633,8 @@
 		switch (remcomInBuffer[0]) {
 		case '?': /* report most recent signal */
 			remcomOutBuffer[0] = 'S';
-			remcomOutBuffer[1] = hexchars[sigval >> 4];
-			remcomOutBuffer[2] = hexchars[sigval & 0xf];
+			remcomOutBuffer[1] = hex[sigval >> 4];
+			remcomOutBuffer[2] = hex[sigval & 0xf];
 			remcomOutBuffer[3] = 0;
 			break;
 #if 0
diff -urN linux-2.6.clean/arch/ppc/kernel/process.c linux-2.6.patched/arch/ppc/kernel/process.c
--- linux-2.6.clean/arch/ppc/kernel/process.c	2005-10-05 12:10:37.000000000 -0400
+++ linux-2.6.patched/arch/ppc/kernel/process.c	2005-10-05 12:36:49.000000000 -0400
@@ -37,6 +37,7 @@
 #include <linux/kallsyms.h>
 #include <linux/mqueue.h>
 #include <linux/hardirq.h>
+#include <linux/digits.h>
 
 #include <asm/pgtable.h>
 #include <asm/uaccess.h>
@@ -695,7 +696,7 @@
 	int i;
 	for (i = 7;  i >= 0;  i--)
 	{
-		buf[i] = "0123456789ABCDEF"[val & 0x0F];
+		buf[i] = HEX[val & 0x0F];
 		val >>= 4;
 	}
 	buf[8] = '\0';
diff -urN linux-2.6.clean/arch/ppc/platforms/apus_setup.c linux-2.6.patched/arch/ppc/platforms/apus_setup.c
--- linux-2.6.clean/arch/ppc/platforms/apus_setup.c	2005-10-05 12:10:38.000000000 -0400
+++ linux-2.6.patched/arch/ppc/platforms/apus_setup.c	2005-10-05 12:36:49.000000000 -0400
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/initrd.h>
 #include <linux/seq_file.h>
+#include <linux/digits.h>
 
 /* Needs INITSERIAL call in head.S! */
 #undef APUS_DEBUG
@@ -627,10 +628,9 @@
 void __debug_print_hex(unsigned long x)
 {
 	int i;
-	char hexchars[] = "0123456789ABCDEF";
 
 	for (i = 0; i < 8; i++) {
-		__debug_ser_out(hexchars[(x >> 28) & 15]);
+		__debug_ser_out(HEX[(x >> 28) & 15]);
 		x <<= 4;
 	}
 	__debug_ser_out('\n');
diff -urN linux-2.6.clean/arch/ppc/platforms/residual.c linux-2.6.patched/arch/ppc/platforms/residual.c
--- linux-2.6.clean/arch/ppc/platforms/residual.c	2005-10-05 12:10:38.000000000 -0400
+++ linux-2.6.patched/arch/ppc/platforms/residual.c	2005-10-05 12:36:49.000000000 -0400
@@ -17,6 +17,7 @@
  */
 
 #include <linux/string.h>
+#include <linux/digits.h>
 #include <asm/residual.h>
 #include <asm/pnp.h>
 #include <asm/byteorder.h>
@@ -770,15 +771,14 @@
 	       unsigned short Number,
 	       char * str)
 {
-	static unsigned const char hexdigit[]="0123456789ABCDEF";
 	if (strlen(str)!=7) return 0;
 	if ( ( ((vendor>>10)&0x1f)+'A'-1 == str[0])  &&
 	     ( ((vendor>>5)&0x1f)+'A'-1 == str[1])   &&
 	     ( (vendor&0x1f)+'A'-1 == str[2])        &&
-	     (hexdigit[(Number>>12)&0x0f] == str[3]) &&
-	     (hexdigit[(Number>>8)&0x0f] == str[4])  &&
-	     (hexdigit[(Number>>4)&0x0f] == str[5])  &&
-	     (hexdigit[Number&0x0f] == str[6]) ) return 1;
+	     (HEX[(Number>>12)&0x0f] == str[3]) &&
+	     (HEX[(Number>>8)&0x0f] == str[4])  &&
+	     (HEX[(Number>>4)&0x0f] == str[5])  &&
+	     (HEX[Number&0x0f] == str[6]) ) return 1;
 	return 0;
 }
 
diff -urN linux-2.6.clean/arch/ppc/syslib/btext.c linux-2.6.patched/arch/ppc/syslib/btext.c
--- linux-2.6.clean/arch/ppc/syslib/btext.c	2005-10-05 12:10:38.000000000 -0400
+++ linux-2.6.patched/arch/ppc/syslib/btext.c	2005-10-05 12:36:49.000000000 -0400
@@ -8,6 +8,7 @@
 #include <linux/string.h>
 #include <linux/init.h>
 #include <linux/version.h>
+#include <linux/digits.h>
 
 #include <asm/sections.h>
 #include <asm/bootx.h>
@@ -392,18 +393,17 @@
 void BTEXT
 btext_drawhex(unsigned long v)
 {
-	static char hex_table[] = "0123456789abcdef";
 
 	if (!boot_text_mapped)
 		return;
-	btext_drawchar(hex_table[(v >> 28) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 24) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 20) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 16) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 12) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >>  8) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >>  4) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >>  0) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 28) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 24) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 20) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 16) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 12) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >>  8) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >>  4) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >>  0) & 0x0000000FUL]);
 	btext_drawchar(' ');
 }
 
diff -urN linux-2.6.clean/arch/ppc64/kernel/btext.c linux-2.6.patched/arch/ppc64/kernel/btext.c
--- linux-2.6.clean/arch/ppc64/kernel/btext.c	2005-10-05 12:10:38.000000000 -0400
+++ linux-2.6.patched/arch/ppc64/kernel/btext.c	2005-10-05 12:36:49.000000000 -0400
@@ -7,6 +7,7 @@
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/init.h>
+#include <linux/digits.h>
 
 #include <asm/sections.h>
 #include <asm/prom.h>
@@ -278,26 +279,24 @@
 
 void btext_drawhex(unsigned long v)
 {
-	char *hex_table = "0123456789abcdef";
-
 	if (!boot_text_mapped)
 		return;
-	btext_drawchar(hex_table[(v >> 60) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 56) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 52) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 48) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 44) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 40) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 36) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 32) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 28) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 24) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 20) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 16) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >> 12) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >>  8) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >>  4) & 0x0000000FUL]);
-	btext_drawchar(hex_table[(v >>  0) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 60) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 56) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 52) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 48) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 44) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 40) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 36) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 32) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 28) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 24) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 20) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 16) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >> 12) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >>  8) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >>  4) & 0x0000000FUL]);
+	btext_drawchar(hex[(v >>  0) & 0x0000000FUL]);
 	btext_drawchar(' ');
 }
 
diff -urN linux-2.6.clean/arch/ppc64/kernel/mf.c linux-2.6.patched/arch/ppc64/kernel/mf.c
--- linux-2.6.clean/arch/ppc64/kernel/mf.c	2005-10-05 12:10:38.000000000 -0400
+++ linux-2.6.patched/arch/ppc64/kernel/mf.c	2005-10-05 12:36:49.000000000 -0400
@@ -33,6 +33,7 @@
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/bcd.h>
+#include <linux/digits.h>
 
 #include <asm/time.h>
 #include <asm/uaccess.h>
@@ -643,10 +644,10 @@
 		72);
 	src[6] = value >> 8;
 	src[7] = value & 255;
-	src[44] = "0123456789ABCDEF"[(value >> 12) & 15];
-	src[45] = "0123456789ABCDEF"[(value >> 8) & 15];
-	src[46] = "0123456789ABCDEF"[(value >> 4) & 15];
-	src[47] = "0123456789ABCDEF"[value & 15];
+	src[44] = HEX[(value >> 12) & 15];
+	src[45] = HEX[(value >> 8) & 15];
+	src[46] = HEX[(value >> 4) & 15];
+	src[47] = HEX[value & 15];
 	dma_and_signal_ce_msg(ce, NULL, src, sizeof(src), 9 * 64 * 1024);
 }
 
diff -urN linux-2.6.clean/arch/sh/kernel/kgdb_stub.c linux-2.6.patched/arch/sh/kernel/kgdb_stub.c
--- linux-2.6.clean/arch/sh/kernel/kgdb_stub.c	2005-10-05 12:10:38.000000000 -0400
+++ linux-2.6.patched/arch/sh/kernel/kgdb_stub.c	2005-10-05 12:36:49.000000000 -0400
@@ -100,6 +100,7 @@
 #include <linux/delay.h>
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/digits.h>
 
 #include <asm/system.h>
 #include <asm/current.h>
@@ -240,7 +241,6 @@
 /* Misc static */
 static int stepped_address;
 static short stepped_opcode;
-static const char hexchars[] = "0123456789abcdef";
 static char in_buffer[BUFMAX];
 static char out_buffer[OUTBUFMAX];
 
@@ -268,13 +268,13 @@
 /* Get high hex bits */
 static char highhex(const int x)
 {
-	return hexchars[(x >> 4) & 0xf];
+	return hex[(x >> 4) & 0xf];
 }
 
 /* Get low hex bits */
 static char lowhex(const int x)
 {
-	return hexchars[x & 0xf];
+	return hex[x & 0xf];
 }
 
 /* Convert ch to hex */
@@ -367,8 +367,8 @@
 /* Pack a hex byte */
 static char *pack_hex_byte(char *pkt, int byte)
 {
-	*pkt++ = hexchars[(byte >> 4) & 0xf];
-	*pkt++ = hexchars[(byte & 0xf)];
+	*pkt++ = hex[(byte >> 4) & 0xf];
+	*pkt++ = hex[(byte & 0xf)];
 	return pkt;
 }
 
diff -urN linux-2.6.clean/arch/sparc/kernel/sparc-stub.c linux-2.6.patched/arch/sparc/kernel/sparc-stub.c
--- linux-2.6.clean/arch/sparc/kernel/sparc-stub.c	2005-10-05 12:10:38.000000000 -0400
+++ linux-2.6.patched/arch/sparc/kernel/sparc-stub.c	2005-10-05 12:36:49.000000000 -0400
@@ -99,6 +99,7 @@
 #include <linux/mm.h>
 #include <linux/smp.h>
 #include <linux/smp_lock.h>
+#include <linux/digits.h>
 
 #include <asm/system.h>
 #include <asm/signal.h>
@@ -127,8 +128,6 @@
 
 static int initialized;	/* !0 means we've been initialized */
 
-static const char hexchars[]="0123456789abcdef";
-
 #define NUMREGS 72
 
 /* Number of bytes of registers.  */
@@ -298,8 +297,8 @@
 		}
 
 		putDebugChar('#');
-		putDebugChar(hexchars[checksum >> 4]);
-		putDebugChar(hexchars[checksum & 0xf]);
+		putDebugChar(hex[checksum >> 4]);
+		putDebugChar(hex[checksum & 0xf]);
 		recv = getDebugChar();
 	} while ((recv & 0x7f) != '+');
 }
@@ -337,8 +336,8 @@
 			".word 1b, 2b\n\t"
 			".text\n"
 			: "=r" (mem), "=r" (ch) : "0" (mem));
-		*buf++ = hexchars[ch >> 4];
-		*buf++ = hexchars[ch & 0xf];
+		*buf++ = hex[ch >> 4];
+		*buf++ = hex[ch & 0xf];
 	}
 
 	*buf = 0;
@@ -527,35 +526,35 @@
 	ptr = remcomOutBuffer;
 
 	*ptr++ = 'T';
-	*ptr++ = hexchars[sigval >> 4];
-	*ptr++ = hexchars[sigval & 0xf];
+	*ptr++ = hex[sigval >> 4];
+	*ptr++ = hex[sigval & 0xf];
 
-	*ptr++ = hexchars[PC >> 4];
-	*ptr++ = hexchars[PC & 0xf];
+	*ptr++ = hex[PC >> 4];
+	*ptr++ = hex[PC & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&registers[PC], ptr, 4);
 	*ptr++ = ';';
 
-	*ptr++ = hexchars[FP >> 4];
-	*ptr++ = hexchars[FP & 0xf];
+	*ptr++ = hex[FP >> 4];
+	*ptr++ = hex[FP & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *) (sp + 8 + 6), ptr, 4); /* FP */
 	*ptr++ = ';';
 
-	*ptr++ = hexchars[SP >> 4];
-	*ptr++ = hexchars[SP & 0xf];
+	*ptr++ = hex[SP >> 4];
+	*ptr++ = hex[SP & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&sp, ptr, 4);
 	*ptr++ = ';';
 
-	*ptr++ = hexchars[NPC >> 4];
-	*ptr++ = hexchars[NPC & 0xf];
+	*ptr++ = hex[NPC >> 4];
+	*ptr++ = hex[NPC & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&registers[NPC], ptr, 4);
 	*ptr++ = ';';
 
-	*ptr++ = hexchars[O7 >> 4];
-	*ptr++ = hexchars[O7 & 0xf];
+	*ptr++ = hex[O7 >> 4];
+	*ptr++ = hex[O7 & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&registers[O7], ptr, 4);
 	*ptr++ = ';';
@@ -577,8 +576,8 @@
 		switch (remcomInBuffer[0]) {
 		case '?':
 			remcomOutBuffer[0] = 'S';
-			remcomOutBuffer[1] = hexchars[sigval >> 4];
-			remcomOutBuffer[2] = hexchars[sigval & 0xf];
+			remcomOutBuffer[1] = hex[sigval >> 4];
+			remcomOutBuffer[2] = hex[sigval & 0xf];
 			remcomOutBuffer[3] = 0;
 			break;
 
diff -urN linux-2.6.clean/drivers/ide/ide.c linux-2.6.patched/drivers/ide/ide.c
--- linux-2.6.clean/drivers/ide/ide.c	2005-10-05 12:10:40.000000000 -0400
+++ linux-2.6.patched/drivers/ide/ide.c	2005-10-05 12:37:59.000000000 -0400
@@ -154,6 +154,7 @@
 #include <linux/seq_file.h>
 #include <linux/device.h>
 #include <linux/bitops.h>
+#include <linux/digits.h>
 
 #include <asm/byteorder.h>
 #include <asm/irq.h>
@@ -1442,8 +1443,6 @@
  */
 static int __init match_parm (char *s, const char *keywords[], int vals[], int max_vals)
 {
-	static const char *decimal = "0123456789";
-	static const char *hex = "0123456789abcdef";
 	int i, n;
 
 	if (*s++ == '=') {
diff -urN linux-2.6.clean/drivers/isdn/icn/icn.c linux-2.6.patched/drivers/isdn/icn/icn.c
--- linux-2.6.clean/drivers/isdn/icn/icn.c	2005-10-05 12:10:40.000000000 -0400
+++ linux-2.6.patched/drivers/isdn/icn/icn.c	2005-10-05 12:36:51.000000000 -0400
@@ -12,6 +12,7 @@
 #include "icn.h"
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/digits.h>
 
 static int portbase = ICN_BASEADDR;
 static unsigned long membase = ICN_MEMADDR;
@@ -1385,7 +1386,7 @@
 						c->parm.num[0] ? "N" : "ALL", c->parm.num);
 				} else
 					sprintf(cbuf, "%02d;EAZ%s\n", (int) a,
-						c->parm.num[0] ? (char *)(c->parm.num) : "0123456789");
+						c->parm.num[0] ? (char *)(c->parm.num) : decimal);
 				i = icn_writecmd(cbuf, strlen(cbuf), 0, card);
 			}
 			break;
diff -urN linux-2.6.clean/drivers/isdn/isdnloop/isdnloop.c linux-2.6.patched/drivers/isdn/isdnloop/isdnloop.c
--- linux-2.6.clean/drivers/isdn/isdnloop/isdnloop.c	2005-10-05 12:10:40.000000000 -0400
+++ linux-2.6.patched/drivers/isdn/isdnloop/isdnloop.c	2005-10-05 12:36:51.000000000 -0400
@@ -14,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/sched.h>
+#include <linux/digits.h>
 #include "isdnloop.h"
 
 static char *revision = "$Revision: 1.11.6.7 $";
@@ -1297,7 +1298,7 @@
 							c->parm.num[0] ? "N" : "ALL", c->parm.num);
 					} else
 						sprintf(cbuf, "%02d;EAZ%s\n", (int) a,
-							c->parm.num[0] ? c->parm.num : (u_char *) "0123456789");
+							c->parm.num[0] ? c->parm.num : decimal);
 					i = isdnloop_writecmd(cbuf, strlen(cbuf), 0, card);
 				}
 				break;
diff -urN linux-2.6.clean/drivers/net/irda/ma600.c linux-2.6.patched/drivers/net/irda/ma600.c
--- linux-2.6.clean/drivers/net/irda/ma600.c	2005-10-05 12:10:41.000000000 -0400
+++ linux-2.6.patched/drivers/net/irda/ma600.c	2005-10-05 12:36:52.000000000 -0400
@@ -54,10 +54,6 @@
 	        func}
 #endif
 
-/* convert hex value to ascii hex */
-static const char hexTbl[] = "0123456789ABCDEF";
-
-
 static void ma600_open(dongle_t *self, struct qos_info *qos);
 static void ma600_close(dongle_t *self);
 static int  ma600_change_speed(struct irda_task *task);
@@ -243,10 +239,10 @@
 			/* if control byte != echo, I don't know what to do */
 			printk(KERN_WARNING "%s() control byte written != read!\n", __FUNCTION__);
 			printk(KERN_WARNING "control byte = 0x%c%c\n", 
-			       hexTbl[(byte>>4)&0x0f], hexTbl[byte&0x0f]);
+			       HEX[(byte>>4)&0x0f], HEX[byte&0x0f]);
 			printk(KERN_WARNING "byte echo = 0x%c%c\n", 
-			       hexTbl[(byte_echo>>4) & 0x0f], 
-			       hexTbl[byte_echo & 0x0f]);
+			       HEX[(byte_echo>>4) & 0x0f], 
+			       HEX[byte_echo & 0x0f]);
 		#ifndef NDEBUG
 		} else {
 			IRDA_DEBUG(2, "%s() control byte write read OK\n", __FUNCTION__);
diff -urN linux-2.6.clean/drivers/net/ppp_synctty.c linux-2.6.patched/drivers/net/ppp_synctty.c
--- linux-2.6.clean/drivers/net/ppp_synctty.c	2005-10-05 12:10:42.000000000 -0400
+++ linux-2.6.patched/drivers/net/ppp_synctty.c	2005-10-05 12:36:52.000000000 -0400
@@ -43,6 +43,7 @@
 #include <linux/ppp_channel.h>
 #include <linux/spinlock.h>
 #include <linux/init.h>
+#include <linux/digits.h>
 #include <asm/uaccess.h>
 #include <asm/semaphore.h>
 
@@ -108,7 +109,6 @@
 ppp_print_hex (register __u8 * out, const __u8 * in, int count)
 {
 	register __u8 next_ch;
-	static char hex[] = "0123456789ABCDEF";
 
 	while (count-- > 0) {
 		next_ch = *in++;
diff -urN linux-2.6.clean/drivers/net/sk98lin/skge.c linux-2.6.patched/drivers/net/sk98lin/skge.c
--- linux-2.6.clean/drivers/net/sk98lin/skge.c	2005-10-05 12:10:42.000000000 -0400
+++ linux-2.6.patched/drivers/net/sk98lin/skge.c	2005-10-05 12:36:52.000000000 -0400
@@ -113,6 +113,7 @@
 #include	<linux/init.h>
 #include 	<linux/proc_fs.h>
 #include	<linux/dma-mapping.h>
+#include	<linux/digits.h>
 
 #include	"h/skdrv1st.h"
 #include	"h/skdrv2nd.h"
@@ -4810,7 +4811,6 @@
 int	haddr, addr;
 char	hex_buffer[180];
 char	asc_buffer[180];
-char	HEXCHAR[] = "0123456789ABCDEF";
 
 	addr = 0;
 	haddr = 0;
@@ -4823,9 +4823,9 @@
 			asc_buffer[addr] = '.';
 		addr++;
 		asc_buffer[addr] = 0;
-		hex_buffer[haddr] = HEXCHAR[(*p & 0xf0) >> 4];
+		hex_buffer[haddr] = HEX[(*p & 0xf0) >> 4];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[*p & 0x0f];
+		hex_buffer[haddr] = HEX[*p & 0x0f];
 		haddr++;
 		hex_buffer[haddr] = ' ';
 		haddr++;
@@ -4858,7 +4858,7 @@
 int	haddr, addr;
 char	hex_buffer[180];
 char	asc_buffer[180];
-char	HEXCHAR[] = "0123456789ABCDEF";
+char	HEX[] = "0123456789ABCDEF";
 long	*p;
 int	l;
 
@@ -4869,21 +4869,21 @@
 	p = (long*) pc;
 	for (i=0; i < size; ) {
 		l = (long) *p;
-		hex_buffer[haddr] = HEXCHAR[(l >> 28) & 0xf];
+		hex_buffer[haddr] = HEX[(l >> 28) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[(l >> 24) & 0xf];
+		hex_buffer[haddr] = HEX[(l >> 24) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[(l >> 20) & 0xf];
+		hex_buffer[haddr] = HEX[(l >> 20) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[(l >> 16) & 0xf];
+		hex_buffer[haddr] = HEX[(l >> 16) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[(l >> 12) & 0xf];
+		hex_buffer[haddr] = HEX[(l >> 12) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[(l >> 8) & 0xf];
+		hex_buffer[haddr] = HEX[(l >> 8) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[(l >> 4) & 0xf];
+		hex_buffer[haddr] = HEX[(l >> 4) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[l & 0x0f];
+		hex_buffer[haddr] = HEX[l & 0x0f];
 		haddr++;
 		hex_buffer[haddr] = ' ';
 		haddr++;
diff -urN linux-2.6.clean/drivers/net/skfp/smt.c linux-2.6.patched/drivers/net/skfp/smt.c
--- linux-2.6.clean/drivers/net/skfp/smt.c	2005-10-05 12:10:42.000000000 -0400
+++ linux-2.6.patched/drivers/net/skfp/smt.c	2005-10-05 12:36:52.000000000 -0400
@@ -1731,7 +1731,8 @@
 #endif
 
 #ifdef	DEBUG
-#define hextoasc(x)	"0123456789abcdef"[x]
+#include <linux/digits.h>
+#define hextoasc(x)	hex[x]
 
 char *addr_to_string(struct fddi_addr *addr)
 {
diff -urN linux-2.6.clean/drivers/net/wireless/strip.c linux-2.6.patched/drivers/net/wireless/strip.c
--- linux-2.6.clean/drivers/net/wireless/strip.c	2005-10-05 12:10:43.000000000 -0400
+++ linux-2.6.patched/drivers/net/wireless/strip.c	2005-10-05 12:36:53.000000000 -0400
@@ -107,6 +107,7 @@
 #include <linux/serial.h>
 #include <linux/serialP.h>
 #include <linux/rcupdate.h>
+#include <linux/digits.h>
 #include <net/arp.h>
 
 #include <linux/ip.h>
@@ -404,8 +405,6 @@
      (S)->battery_voltage.c[0]  && \
      memcmp(&(S)->true_dev_addr, zero_address.c, sizeof(zero_address)))
 
-static const char hextable[16] = "0123456789ABCDEF";
-
 static const MetricomAddress zero_address;
 static const MetricomAddress broadcast_address =
     { {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF} };
@@ -1292,13 +1291,13 @@
 	__u8 *p = buffer;
 	while (p < end)
 		sum += *p++;
-	end[3] = hextable[sum & 0xF];
+	end[3] = HEX[sum & 0xF];
 	sum >>= 4;
-	end[2] = hextable[sum & 0xF];
+	end[2] = HEX[sum & 0xF];
 	sum >>= 4;
-	end[1] = hextable[sum & 0xF];
+	end[1] = HEX[sum & 0xF];
 	sum >>= 4;
-	end[0] = hextable[sum & 0xF];
+	end[0] = HEX[sum & 0xF];
 	return (end + 4);
 }
 
@@ -1379,15 +1378,15 @@
 
 	*ptr++ = 0x0D;
 	*ptr++ = '*';
-	*ptr++ = hextable[haddr.c[2] >> 4];
-	*ptr++ = hextable[haddr.c[2] & 0xF];
-	*ptr++ = hextable[haddr.c[3] >> 4];
-	*ptr++ = hextable[haddr.c[3] & 0xF];
+	*ptr++ = HEX[haddr.c[2] >> 4];
+	*ptr++ = HEX[haddr.c[2] & 0xF];
+	*ptr++ = HEX[haddr.c[3] >> 4];
+	*ptr++ = HEX[haddr.c[3] & 0xF];
 	*ptr++ = '-';
-	*ptr++ = hextable[haddr.c[4] >> 4];
-	*ptr++ = hextable[haddr.c[4] & 0xF];
-	*ptr++ = hextable[haddr.c[5] >> 4];
-	*ptr++ = hextable[haddr.c[5] & 0xF];
+	*ptr++ = HEX[haddr.c[4] >> 4];
+	*ptr++ = HEX[haddr.c[4] & 0xF];
+	*ptr++ = HEX[haddr.c[5] >> 4];
+	*ptr++ = HEX[haddr.c[5] & 0xF];
 	*ptr++ = '*';
 	*ptr++ = key.c[0];
 	*ptr++ = key.c[1];
diff -urN linux-2.6.clean/drivers/pnp/pnpbios/rsparser.c linux-2.6.patched/drivers/pnp/pnpbios/rsparser.c
--- linux-2.6.clean/drivers/pnp/pnpbios/rsparser.c	2005-10-05 12:10:44.000000000 -0400
+++ linux-2.6.patched/drivers/pnp/pnpbios/rsparser.c	2005-10-05 12:36:53.000000000 -0400
@@ -7,6 +7,7 @@
 #include <linux/ctype.h>
 #include <linux/pnp.h>
 #include <linux/pnpbios.h>
+#include <linux/digits.h>
 
 #ifdef CONFIG_PCI
 #include <linux/pci.h>
@@ -481,8 +482,6 @@
 
 void pnpid32_to_pnpid(u32 id, char *str)
 {
-	const char *hex = "0123456789abcdef";
-
 	id = be32_to_cpu(id);
 	str[0] = CHAR(id, 26);
 	str[1] = CHAR(id, 21);
diff -urN linux-2.6.clean/drivers/scsi/ibmmca.c linux-2.6.patched/drivers/scsi/ibmmca.c
--- linux-2.6.clean/drivers/scsi/ibmmca.c	2005-10-05 12:10:45.000000000 -0400
+++ linux-2.6.patched/drivers/scsi/ibmmca.c	2005-10-05 12:36:53.000000000 -0400
@@ -39,6 +39,7 @@
 #include <linux/spinlock.h>
 #include <linux/init.h>
 #include <linux/mca-legacy.h>
+#include <linux/digits.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -1007,7 +1008,6 @@
 /* interpreter for logical device numbers (ldn) */
 static char *ti_l(int val)
 {
-	const char hex[16] = "0123456789abcdef";
 	static char answer[2];
 
 	answer[1] = (char) (0x0);
diff -urN linux-2.6.clean/drivers/scsi/ultrastor.c linux-2.6.patched/drivers/scsi/ultrastor.c
--- linux-2.6.clean/drivers/scsi/ultrastor.c	2005-10-05 12:10:46.000000000 -0400
+++ linux-2.6.patched/drivers/scsi/ultrastor.c	2005-10-05 12:36:54.000000000 -0400
@@ -138,6 +138,7 @@
 #include <linux/spinlock.h>
 #include <linux/stat.h>
 #include <linux/bitops.h>
+#include <linux/digits.h>
 
 #include <asm/io.h>
 #include <asm/system.h>
@@ -869,8 +870,8 @@
 	for (i = 0; i < 16; i++)
 	  {
 	    unsigned char p = inb(port0 + i);
-	    out[28 + i * 3] = "0123456789abcdef"[p >> 4];
-	    out[29 + i * 3] = "0123456789abcdef"[p & 15];
+	    out[28 + i * 3] = hex[p >> 4];
+	    out[29 + i * 3] = hex[p & 15];
 	    out[30 + i * 3] = ' ';
 	  }
 	out[28 + i * 3] = '\n';
diff -urN linux-2.6.clean/drivers/serial/sh-sci.c linux-2.6.patched/drivers/serial/sh-sci.c
--- linux-2.6.clean/drivers/serial/sh-sci.c	2005-10-05 12:10:46.000000000 -0400
+++ linux-2.6.patched/drivers/serial/sh-sci.c	2005-10-05 12:36:54.000000000 -0400
@@ -42,6 +42,7 @@
 #include <linux/delay.h>
 #include <linux/console.h>
 #include <linux/bitops.h>
+#include <linux/digits.h>
 
 #ifdef CONFIG_CPU_FREQ
 #include <linux/notifier.h>
@@ -119,16 +120,14 @@
 }
 
 /* Taken from sh-stub.c of GDB 4.18 */
-static const char hexchars[] = "0123456789abcdef";
-
 static __inline__ char highhex(int  x)
 {
-	return hexchars[(x >> 4) & 0xf];
+	return hex[(x >> 4) & 0xf];
 }
 
 static __inline__ char lowhex(int  x)
 {
-	return hexchars[x & 0xf];
+	return hex[x & 0xf];
 }
 
 #endif /* CONFIG_SH_STANDARD_BIOS || CONFIG_SH_KGDB */
diff -urN linux-2.6.clean/fs/udf/unicode.c linux-2.6.patched/fs/udf/unicode.c
--- linux-2.6.clean/fs/udf/unicode.c	2005-10-05 12:10:49.000000000 -0400
+++ linux-2.6.patched/fs/udf/unicode.c	2005-10-05 12:36:55.000000000 -0400
@@ -29,6 +29,7 @@
 #include <linux/string.h>	/* for memset */
 #include <linux/nls.h>
 #include <linux/udf_fs.h>
+#include <linux/digits.h>
 
 #include "udf_sb.h"
 
@@ -427,7 +428,6 @@
 	int extIndex = 0, newExtIndex = 0, hasExt = 0;
 	unsigned short valueCRC;
 	uint8_t curr;
-	const uint8_t hexChar[] = "0123456789ABCDEF";
 
 	if (udfName[0] == '.' && (udfLen == 1 ||
 		(udfLen == 2 && udfName[1] == '.')))
@@ -500,10 +500,10 @@
 			newIndex = 250;
 		newName[newIndex++] = CRC_MARK;
 		valueCRC = udf_crc(fidName, fidNameLen, 0);
-		newName[newIndex++] = hexChar[(valueCRC & 0xf000) >> 12];
-		newName[newIndex++] = hexChar[(valueCRC & 0x0f00) >> 8];
-		newName[newIndex++] = hexChar[(valueCRC & 0x00f0) >> 4];
-		newName[newIndex++] = hexChar[(valueCRC & 0x000f)];
+		newName[newIndex++] = HEX[(valueCRC & 0xf000) >> 12];
+		newName[newIndex++] = HEX[(valueCRC & 0x0f00) >> 8];
+		newName[newIndex++] = HEX[(valueCRC & 0x00f0) >> 4];
+		newName[newIndex++] = HEX[(valueCRC & 0x000f)];
 
 		if (hasExt)
 		{
diff -urN linux-2.6.clean/include/linux/digits.h linux-2.6.patched/include/linux/digits.h
--- linux-2.6.clean/include/linux/digits.h	1969-12-31 19:00:00.000000000 -0500
+++ linux-2.6.patched/include/linux/digits.h	2005-10-05 12:44:46.000000000 -0400
@@ -0,0 +1,15 @@
+/* include/linux/digits.h
+ *
+ * Contains extern definitions for ascii representation of hex or decimal 
+ * variables.
+ *
+ * Oct. 4, 2005 Masoud Sharbiani <masouds@masoud.ir>
+ * This source code is licensed under the GNU General Public License,
+ * Version 2. See the file COPYING for more details.
+ *
+ */
+
+extern unsigned char *hex;
+extern unsigned char *HEX;
+extern unsigned char *decimal;
+
diff -urN linux-2.6.clean/kernel/audit.c linux-2.6.patched/kernel/audit.c
--- linux-2.6.clean/kernel/audit.c	2005-10-05 12:10:54.000000000 -0400
+++ linux-2.6.patched/kernel/audit.c	2005-10-05 12:36:59.000000000 -0400
@@ -54,6 +54,7 @@
 #include <net/sock.h>
 #include <linux/skbuff.h>
 #include <linux/netlink.h>
+#include <linux/digits.h>
 
 /* No auditing will take place until audit_initialized != 0.
  * (Initialization happens after skb_init is called.) */
@@ -787,7 +788,6 @@
 	int i, avail, new_len;
 	unsigned char *ptr;
 	struct sk_buff *skb;
-	static const unsigned char *hex = "0123456789ABCDEF";
 
 	BUG_ON(!ab->skb);
 	skb = ab->skb;
@@ -803,8 +803,8 @@
 
 	ptr = skb->tail;
 	for (i=0; i<len; i++) {
-		*ptr++ = hex[(buf[i] & 0xF0)>>4]; /* Upper nibble */
-		*ptr++ = hex[buf[i] & 0x0F];	  /* Lower nibble */
+		*ptr++ = HEX[(buf[i] & 0xF0)>>4]; /* Upper nibble */
+		*ptr++ = HEX[buf[i] & 0x0F];	  /* Lower nibble */
 	}
 	*ptr = 0;
 	skb_put(skb, len << 1); /* new string is twice the old string */
diff -urN linux-2.6.clean/lib/digits.c linux-2.6.patched/lib/digits.c
--- linux-2.6.clean/lib/digits.c	1969-12-31 19:00:00.000000000 -0500
+++ linux-2.6.patched/lib/digits.c	2005-10-05 12:36:59.000000000 -0400
@@ -0,0 +1,20 @@
+/* 
+ * linux/lib/digits.c
+ * Contains string definitions of hex and decimal digits. Created to consolidate
+ * all of the instances from all over the place.
+ *
+ * Oct. 4, 2005 Masoud Sharbiani <masouds@masoud.ir>
+ * This source code is licensed under the GNU General Public License,
+ * Version 2. See the file COPYING for more details.
+ *
+ */
+
+#include <linux/module.h>
+
+const unsigned char hex[] = "0123456789abcdef";
+const unsigned char decimal[] = "0123456789";
+const unsigned char HEX[] = "0123456789ABCDEF";
+
+EXPORT_SYMBOL(hex);
+EXPORT_SYMBOL(decimal);
+EXPORT_SYMBOL(HEX);
diff -urN linux-2.6.clean/lib/Makefile linux-2.6.patched/lib/Makefile
--- linux-2.6.clean/lib/Makefile	2005-10-05 12:10:54.000000000 -0400
+++ linux-2.6.patched/lib/Makefile	2005-10-05 12:36:59.000000000 -0400
@@ -9,7 +9,7 @@
 
 lib-y	+= kobject.o kref.o kobject_uevent.o klist.o
 
-obj-y += sort.o parser.o halfmd4.o
+obj-y += sort.o parser.o halfmd4.o digits.o
 
 ifeq ($(CONFIG_DEBUG_KOBJECT),y)
 CFLAGS_kobject.o += -DDEBUG
diff -urN linux-2.6.clean/net/ipv4/arp.c linux-2.6.patched/net/ipv4/arp.c
--- linux-2.6.clean/net/ipv4/arp.c	2005-10-05 12:10:54.000000000 -0400
+++ linux-2.6.patched/net/ipv4/arp.c	2005-10-05 12:36:59.000000000 -0400
@@ -102,6 +102,7 @@
 #ifdef CONFIG_SYSCTL
 #include <linux/sysctl.h>
 #endif
+#include <linux/digits.h>
 
 #include <net/ip.h>
 #include <net/icmp.h>
@@ -1291,7 +1292,6 @@
 				   struct neighbour *n)
 {
 	char hbuffer[HBUFFERLEN];
-	const char hexbuf[] = "0123456789ABCDEF";
 	int k, j;
 	char tbuf[16];
 	struct net_device *dev = n->dev;
@@ -1305,8 +1305,8 @@
 	else {
 #endif
 	for (k = 0, j = 0; k < HBUFFERLEN - 3 && j < dev->addr_len; j++) {
-		hbuffer[k++] = hexbuf[(n->ha[j] >> 4) & 15];
-		hbuffer[k++] = hexbuf[n->ha[j] & 15];
+		hbuffer[k++] = HEX[(n->ha[j] >> 4) & 15];
+		hbuffer[k++] = HEX[n->ha[j] & 15];
 		hbuffer[k++] = ':';
 	}
 	hbuffer[--k] = 0;
diff -urN linux-2.6.clean/net/ipv4/netfilter/ipt_CLUSTERIP.c linux-2.6.patched/net/ipv4/netfilter/ipt_CLUSTERIP.c
--- linux-2.6.clean/net/ipv4/netfilter/ipt_CLUSTERIP.c	2005-10-05 12:10:55.000000000 -0400
+++ linux-2.6.patched/net/ipv4/netfilter/ipt_CLUSTERIP.c	2005-10-05 12:36:59.000000000 -0400
@@ -22,6 +22,7 @@
 #include <linux/if_arp.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
+#include <linux/digits.h>
 
 #include <net/checksum.h>
 
@@ -502,11 +503,10 @@
 #define HBUFFERLEN 30
 	char hbuffer[HBUFFERLEN];
 	int j,k;
-	const char hexbuf[]= "0123456789abcdef";
 
 	for (k=0, j=0; k < HBUFFERLEN-3 && j < ETH_ALEN; j++) {
-		hbuffer[k++]=hexbuf[(payload->src_hw[j]>>4)&15];
-		hbuffer[k++]=hexbuf[payload->src_hw[j]&15];
+		hbuffer[k++]=hex[(payload->src_hw[j]>>4)&15];
+		hbuffer[k++]=hex[payload->src_hw[j]&15];
 		hbuffer[k++]=':';
 	}
 	hbuffer[--k]='\0';

--===============54040972445024682==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54040972445024682==--
