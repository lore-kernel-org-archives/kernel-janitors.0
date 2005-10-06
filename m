From: Masoud Sharbiani <masouds@masoud.ir>
Date: Thu, 06 Oct 2005 20:28:26 +0000
Subject: Re: [KJ] hexdigits definition consolidation [RESEND3]
Message-Id: <20051006202825.GA27824@masoud.ir>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40862942948571379=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051005201210.GA27788@masoud.ir>
In-Reply-To: <20051005201210.GA27788@masoud.ir>
To: kernel-janitors@vger.kernel.org

--===============40862942948571379==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,
This is 3rd edition of hexdigits consolidation patch.

I've refrained from modifying kgdb files (cris arch) and boot-misc.c (ppc arch) since they may be subject to space or other technical limitions.

cheers, 
Masoud

Signed-off-by: Masoud A Sharbiani <masouds@masoud.ir>


diff -urp linux-2.6.clean/arch/cris/arch-v10/kernel/kgdb.c linux-2.6.patched/arch/cris/arch-v10/kernel/kgdb.c
--- linux-2.6.clean/arch/cris/arch-v10/kernel/kgdb.c	2005-10-05 14:11:55.000000000 -0400
+++ linux-2.6.patched/arch/cris/arch-v10/kernel/kgdb.c	2005-10-06 11:49:03.000000000 -0400
@@ -415,7 +415,6 @@ extern unsigned char executing_task;
 #define RUNLENMAX 64
 
 /* Definition of all valid hexadecimal characters */
-static const char hexchars[] = "0123456789abcdef";
 
 /* The inbound/outbound buffers used in packet I/O */
 static char remcomInBuffer[BUFMAX];
@@ -557,8 +556,8 @@ gdb_cris_strtol (const char *s, char **e
 	char *sd;
 	int x = 0;
 	
-	for (s1 = (char*)s; (sd = gdb_cris_memchr(hexchars, *s1, base)) != NULL; ++s1)
-		x = x * base + (sd - hexchars);
+	for (s1 = (char*)s; (sd = gdb_cris_memchr(small_digits, *s1, base)) != NULL; ++s1)
+		x = x * base + (sd - small_digits);
         
         if (endptr)
         {
diff -urp linux-2.6.clean/arch/cris/arch-v32/kernel/kgdb.c linux-2.6.patched/arch/cris/arch-v32/kernel/kgdb.c
--- linux-2.6.clean/arch/cris/arch-v32/kernel/kgdb.c	2005-10-05 14:11:56.000000000 -0400
+++ linux-2.6.patched/arch/cris/arch-v32/kernel/kgdb.c	2005-10-06 11:49:03.000000000 -0400
@@ -465,7 +465,6 @@ void breakpoint(void);
 #define RUNLENMAX 64
 
 /* Definition of all valid hexadecimal characters */
-static const char hexchars[] = "0123456789abcdef";
 
 /* The inbound/outbound buffers used in packet I/O */
 static char input_buffer[BUFMAX];
@@ -550,8 +549,8 @@ gdb_cris_strtol(const char *s, char **en
 	char *sd;
 	int x = 0;
 
-	for (s1 = (char*)s; (sd = gdb_cris_memchr(hexchars, *s1, base)) != NULL; ++s1)
-		x = x * base + (sd - hexchars);
+	for (s1 = (char*)s; (sd = gdb_cris_memchr(small_digits, *s1, base)) != NULL; ++s1)
+		x = x * base + (sd - small_digits);
 
         if (endptr) {
                 /* Unconverted suffix is stored in endptr unless endptr is NULL. */
@@ -660,7 +659,7 @@ read_register(char regno, unsigned int *
 static inline char
 highhex(int x)
 {
-	return hexchars[(x >> 4) & 0xf];
+	return small_digits[(x >> 4) & 0xf];
 }
 
 /* Returns the character equivalent of a nibble, bit 3, 2, 1, and 0 of a byte,
@@ -668,7 +667,7 @@ highhex(int x)
 static inline char
 lowhex(int x)
 {
-	return hexchars[x & 0xf];
+	return small_digits[x & 0xf];
 }
 
 /* Returns the integer equivalent of a hexadecimal character. */
diff -urp linux-2.6.clean/arch/frv/kernel/gdb-stub.c linux-2.6.patched/arch/frv/kernel/gdb-stub.c
--- linux-2.6.clean/arch/frv/kernel/gdb-stub.c	2005-10-05 14:11:56.000000000 -0400
+++ linux-2.6.patched/arch/frv/kernel/gdb-stub.c	2005-10-06 11:49:03.000000000 -0400
@@ -182,8 +182,6 @@ extern volatile u32 __attribute__((secti
 static char	input_buffer[BUFMAX];
 static char	output_buffer[BUFMAX];
 
-static const char hexchars[] = "0123456789abcdef";
-
 static const char *regnames[] = {
 	"PSR ", "ISR ", "CCR ", "CCCR",
 	"LR  ", "LCR ", "PC  ", "_stt",
@@ -383,8 +381,8 @@ static int gdbstub_send_packet(char *buf
 		}
 
 		gdbstub_tx_char('#');
-		gdbstub_tx_char(hexchars[checksum >> 4]);
-		gdbstub_tx_char(hexchars[checksum & 0xf]);
+		gdbstub_tx_char(small_digits[checksum >> 4]);
+		gdbstub_tx_char(small_digits[checksum & 0xf]);
 
 	} while (gdbstub_rx_char(&ch,0),
 #ifdef GDBSTUB_DEBUG_PROTOCOL
@@ -680,8 +678,8 @@ static unsigned char *mem2hex(const void
 	if ((uint32_t)mem&1 && count>=1) {
 		if (!gdbstub_read_byte(mem,ch))
 			return NULL;
-		*buf++ = hexchars[ch[0] >> 4];
-		*buf++ = hexchars[ch[0] & 0xf];
+		*buf++ = small_digits[ch[0] >> 4];
+		*buf++ = small_digits[ch[0] & 0xf];
 		mem++;
 		count--;
 	}
@@ -689,10 +687,10 @@ static unsigned char *mem2hex(const void
 	if ((uint32_t)mem&3 && count>=2) {
 		if (!gdbstub_read_word(mem,(uint16_t *)ch))
 			return NULL;
-		*buf++ = hexchars[ch[0] >> 4];
-		*buf++ = hexchars[ch[0] & 0xf];
-		*buf++ = hexchars[ch[1] >> 4];
-		*buf++ = hexchars[ch[1] & 0xf];
+		*buf++ = small_digits[ch[0] >> 4];
+		*buf++ = small_digits[ch[0] & 0xf];
+		*buf++ = small_digits[ch[1] >> 4];
+		*buf++ = small_digits[ch[1] & 0xf];
 		mem += 2;
 		count -= 2;
 	}
@@ -700,14 +698,14 @@ static unsigned char *mem2hex(const void
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
+		*buf++ = small_digits[ch[0] >> 4];
+		*buf++ = small_digits[ch[0] & 0xf];
+		*buf++ = small_digits[ch[1] >> 4];
+		*buf++ = small_digits[ch[1] & 0xf];
+		*buf++ = small_digits[ch[2] >> 4];
+		*buf++ = small_digits[ch[2] & 0xf];
+		*buf++ = small_digits[ch[3] >> 4];
+		*buf++ = small_digits[ch[3] & 0xf];
 		mem += 4;
 		count -= 4;
 	}
@@ -715,10 +713,10 @@ static unsigned char *mem2hex(const void
 	if (count>=2) {
 		if (!gdbstub_read_word(mem,(uint16_t *)ch))
 			return NULL;
-		*buf++ = hexchars[ch[0] >> 4];
-		*buf++ = hexchars[ch[0] & 0xf];
-		*buf++ = hexchars[ch[1] >> 4];
-		*buf++ = hexchars[ch[1] & 0xf];
+		*buf++ = small_digits[ch[0] >> 4];
+		*buf++ = small_digits[ch[0] & 0xf];
+		*buf++ = small_digits[ch[1] >> 4];
+		*buf++ = small_digits[ch[1] & 0xf];
 		mem += 2;
 		count -= 2;
 	}
@@ -726,8 +724,8 @@ static unsigned char *mem2hex(const void
 	if (count>=1) {
 		if (!gdbstub_read_byte(mem,ch))
 			return NULL;
-		*buf++ = hexchars[ch[0] >> 4];
-		*buf++ = hexchars[ch[0] & 0xf];
+		*buf++ = small_digits[ch[0] >> 4];
+		*buf++ = small_digits[ch[0] & 0xf];
 	}
 
 	*buf = 0;
@@ -1448,22 +1446,22 @@ void gdbstub(int sigval)
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
+		hx = small_digits[(brr & 0xf0000000) >> 28];
+		*ptr++ = small_digits[hx >> 4];	*ptr++ = small_digits[hx & 0xf];
+		hx = small_digits[(brr & 0x0f000000) >> 24];
+		*ptr++ = small_digits[hx >> 4];	*ptr++ = small_digits[hx & 0xf];
+		hx = small_digits[(brr & 0x00f00000) >> 20];
+		*ptr++ = small_digits[hx >> 4];	*ptr++ = small_digits[hx & 0xf];
+		hx = small_digits[(brr & 0x000f0000) >> 16];
+		*ptr++ = small_digits[hx >> 4];	*ptr++ = small_digits[hx & 0xf];
+		hx = small_digits[(brr & 0x0000f000) >> 12];
+		*ptr++ = small_digits[hx >> 4];	*ptr++ = small_digits[hx & 0xf];
+		hx = small_digits[(brr & 0x00000f00) >> 8];
+		*ptr++ = small_digits[hx >> 4];	*ptr++ = small_digits[hx & 0xf];
+		hx = small_digits[(brr & 0x000000f0) >> 4];
+		*ptr++ = small_digits[hx >> 4];	*ptr++ = small_digits[hx & 0xf];
+		hx = small_digits[(brr & 0x0000000f)];
+		*ptr++ = small_digits[hx >> 4];	*ptr++ = small_digits[hx & 0xf];
 
 		ptr = mem2hex(crlf, ptr, sizeof(crlf) - 1, 0);
 		*ptr = 0;
@@ -1477,12 +1475,12 @@ void gdbstub(int sigval)
 
 	/* Send trap type (converted to signal) */
 	*ptr++ = 'T';
-	*ptr++ = hexchars[sigval >> 4];
-	*ptr++ = hexchars[sigval & 0xf];
+	*ptr++ = small_digits[sigval >> 4];
+	*ptr++ = small_digits[sigval & 0xf];
 
 	/* Send Error PC */
-	*ptr++ = hexchars[GDB_REG_PC >> 4];
-	*ptr++ = hexchars[GDB_REG_PC & 0xf];
+	*ptr++ = small_digits[GDB_REG_PC >> 4];
+	*ptr++ = small_digits[GDB_REG_PC & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex(&__debug_frame->pc, ptr, 4, 0);
 	*ptr++ = ';';
@@ -1490,8 +1488,8 @@ void gdbstub(int sigval)
 	/*
 	 * Send frame pointer
 	 */
-	*ptr++ = hexchars[GDB_REG_FP >> 4];
-	*ptr++ = hexchars[GDB_REG_FP & 0xf];
+	*ptr++ = small_digits[GDB_REG_FP >> 4];
+	*ptr++ = small_digits[GDB_REG_FP & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex(&__debug_frame->fp, ptr, 4, 0);
 	*ptr++ = ';';
@@ -1499,8 +1497,8 @@ void gdbstub(int sigval)
 	/*
 	 * Send stack pointer
 	 */
-	*ptr++ = hexchars[GDB_REG_SP >> 4];
-	*ptr++ = hexchars[GDB_REG_SP & 0xf];
+	*ptr++ = small_digits[GDB_REG_SP >> 4];
+	*ptr++ = small_digits[GDB_REG_SP & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex(&__debug_frame->sp, ptr, 4, 0);
 	*ptr++ = ';';
@@ -1525,8 +1523,8 @@ void gdbstub(int sigval)
 			/* request repeat of last signal number */
 		case '?':
 			output_buffer[0] = 'S';
-			output_buffer[1] = hexchars[sigval >> 4];
-			output_buffer[2] = hexchars[sigval & 0xf];
+			output_buffer[1] = small_digits[sigval >> 4];
+			output_buffer[2] = small_digits[sigval & 0xf];
 			output_buffer[3] = 0;
 			break;
 
@@ -2044,8 +2042,8 @@ void gdbstub_exit(int status)
 	}
 
 	gdbstub_tx_char('#');
-	gdbstub_tx_char(hexchars[checksum >> 4]);
-	gdbstub_tx_char(hexchars[checksum & 0xf]);
+	gdbstub_tx_char(small_digits[checksum >> 4]);
+	gdbstub_tx_char(small_digits[checksum & 0xf]);
 
 	/* make sure the output is flushed, or else RedBoot might clobber it */
 	gdbstub_tx_char('-');
diff -urp linux-2.6.clean/arch/mips/au1000/common/puts.c linux-2.6.patched/arch/mips/au1000/common/puts.c
--- linux-2.6.clean/arch/mips/au1000/common/puts.c	2005-10-05 14:11:56.000000000 -0400
+++ linux-2.6.patched/arch/mips/au1000/common/puts.c	2005-10-06 11:49:03.000000000 -0400
@@ -39,7 +39,6 @@
 #define TIMEOUT       0xffffff
 #define SLOW_DOWN
 
-static const char digits[16] = "0123456789abcdef";
 static volatile unsigned long * const com1 = (unsigned long *)SERIAL_BASE;
 
 
@@ -124,7 +123,7 @@ put64(uint64_t ul)
     do {
         cnt--;
         ch = (unsigned char)(ul >> cnt * 4) & 0x0F;
-                putch(digits[ch]);
+                putch(small_digits[ch]);
     } while (cnt > 0);
 }
 
@@ -140,6 +139,6 @@ put32(unsigned u)
     do {
         cnt--;
         ch = (unsigned char)(u >> cnt * 4) & 0x0F;
-                putch(digits[ch]);
+                putch(small_digits[ch]);
     } while (cnt > 0);
 }
diff -urp linux-2.6.clean/arch/mips/galileo-boards/ev96100/puts.c linux-2.6.patched/arch/mips/galileo-boards/ev96100/puts.c
--- linux-2.6.clean/arch/mips/galileo-boards/ev96100/puts.c	2005-10-05 14:11:56.000000000 -0400
+++ linux-2.6.patched/arch/mips/galileo-boards/ev96100/puts.c	2005-10-06 11:49:03.000000000 -0400
@@ -21,7 +21,6 @@
 #define TIMEOUT    0xffff
 #undef SLOW_DOWN
 
-static const char digits[16] = "0123456789abcdef";
 static volatile unsigned char *const com1 = (unsigned char *) SERIAL_BASE;
 
 
@@ -118,7 +117,7 @@ void put64(uint64_t ul)
 	do {
 		cnt--;
 		ch = (unsigned char) (ul >> cnt * 4) & 0x0F;
-		putch(digits[ch]);
+		putch(small_digits[ch]);
 	} while (cnt > 0);
 }
 
@@ -133,6 +132,6 @@ void put32(unsigned u)
 	do {
 		cnt--;
 		ch = (unsigned char) (u >> cnt * 4) & 0x0F;
-		putch(digits[ch]);
+		putch(small_digits[ch]);
 	} while (cnt > 0);
 }
diff -urp linux-2.6.clean/arch/mips/ite-boards/generic/puts.c linux-2.6.patched/arch/mips/ite-boards/generic/puts.c
--- linux-2.6.clean/arch/mips/ite-boards/generic/puts.c	2005-10-05 14:11:56.000000000 -0400
+++ linux-2.6.patched/arch/mips/ite-boards/generic/puts.c	2005-10-06 11:49:03.000000000 -0400
@@ -38,7 +38,6 @@
 #define TIMEOUT       0xffff
 #undef SLOW_DOWN
 
-static const char digits[16] = "0123456789abcdef";
 static volatile unsigned char *const com1 = (unsigned char *) SERIAL_BASE;
 
 
@@ -119,7 +118,7 @@ void put64(uint64_t ul)
 	do {
 		cnt--;
 		ch = (unsigned char) (ul >> cnt * 4) & 0x0F;
-		putch(digits[ch]);
+		putch(small_digits[ch]);
 	} while (cnt > 0);
 }
 
@@ -134,6 +133,6 @@ void put32(unsigned u)
 	do {
 		cnt--;
 		ch = (unsigned char) (u >> cnt * 4) & 0x0F;
-		putch(digits[ch]);
+		putch(small_digits[ch]);
 	} while (cnt > 0);
 }
diff -urp linux-2.6.clean/arch/mips/jmr3927/common/puts.c linux-2.6.patched/arch/mips/jmr3927/common/puts.c
--- linux-2.6.clean/arch/mips/jmr3927/common/puts.c	2005-10-05 14:11:56.000000000 -0400
+++ linux-2.6.patched/arch/mips/jmr3927/common/puts.c	2005-10-06 11:49:03.000000000 -0400
@@ -40,8 +40,6 @@
 #define TIMEOUT       0xffffff
 #define SLOW_DOWN
 
-static const char digits[16] = "0123456789abcdef";
-
 #ifdef SLOW_DOWN
 #define slow_down() { int k; for (k=0; k<10000; k++); }
 #else
@@ -147,7 +145,7 @@ put64(uint64_t ul)
     do {
         cnt--;
         ch = (unsigned char)(ul >> cnt * 4) & 0x0F;
-                putch(digits[ch]);
+                putch(small_digits[ch]);
     } while (cnt > 0);
 }
 
@@ -163,6 +161,6 @@ put32(unsigned u)
     do {
         cnt--;
         ch = (unsigned char)(u >> cnt * 4) & 0x0F;
-                putch(digits[ch]);
+                putch(small_digits[ch]);
     } while (cnt > 0);
 }
diff -urp linux-2.6.clean/arch/mips/jmr3927/rbhma3100/kgdb_io.c linux-2.6.patched/arch/mips/jmr3927/rbhma3100/kgdb_io.c
--- linux-2.6.clean/arch/mips/jmr3927/rbhma3100/kgdb_io.c	2005-10-05 14:11:56.000000000 -0400
+++ linux-2.6.patched/arch/mips/jmr3927/rbhma3100/kgdb_io.c	2005-10-06 11:49:03.000000000 -0400
@@ -39,8 +39,6 @@
 #define TIMEOUT       0xffffff
 #define SLOW_DOWN
 
-static const char digits[16] = "0123456789abcdef";
-
 #ifdef SLOW_DOWN
 #define slow_down() { int k; for (k=0; k<10000; k++); }
 #else
diff -urp linux-2.6.clean/arch/mips/kernel/gdb-stub.c linux-2.6.patched/arch/mips/kernel/gdb-stub.c
--- linux-2.6.clean/arch/mips/kernel/gdb-stub.c	2005-10-05 14:11:56.000000000 -0400
+++ linux-2.6.patched/arch/mips/kernel/gdb-stub.c	2005-10-06 11:49:03.000000000 -0400
@@ -189,7 +189,6 @@ static char input_buffer[BUFMAX];
 static char output_buffer[BUFMAX];
 static int initialized;	/* !0 means we've been initialized */
 static int kgdb_started;
-static const char hexchars[]="0123456789abcdef";
 
 /* Used to prevent crashes in memory access.  Note that they'll crash anyway if
    we haven't set up fault handlers yet... */
@@ -305,8 +304,8 @@ static void putpacket(char *buffer)
 		}
 
 		putDebugChar('#');
-		putDebugChar(hexchars[checksum >> 4]);
-		putDebugChar(hexchars[checksum & 0xf]);
+		putDebugChar(small_digits[checksum >> 4]);
+		putDebugChar(small_digits[checksum & 0xf]);
 
 	}
 	while ((getDebugChar() & 0x7f) != '+');
@@ -327,8 +326,8 @@ static unsigned char *mem2hex(char *mem,
 	while (count-- > 0) {
 		if (kgdb_read_byte(mem++, &ch) != 0)
 			return 0;
-		*buf++ = hexchars[ch >> 4];
-		*buf++ = hexchars[ch & 0xf];
+		*buf++ = small_digits[ch >> 4];
+		*buf++ = small_digits[ch & 0xf];
 	}
 
 	*buf = 0;
@@ -748,14 +747,14 @@ void handle_exception (struct gdb_regs *
 	 * Send trap type (converted to signal)
 	 */
 	*ptr++ = 'T';
-	*ptr++ = hexchars[sigval >> 4];
-	*ptr++ = hexchars[sigval & 0xf];
+	*ptr++ = small_digits[sigval >> 4];
+	*ptr++ = small_digits[sigval & 0xf];
 
 	/*
 	 * Send Error PC
 	 */
-	*ptr++ = hexchars[REG_EPC >> 4];
-	*ptr++ = hexchars[REG_EPC & 0xf];
+	*ptr++ = small_digits[REG_EPC >> 4];
+	*ptr++ = small_digits[REG_EPC & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&regs->cp0_epc, ptr, sizeof(long), 0);
 	*ptr++ = ';';
@@ -763,8 +762,8 @@ void handle_exception (struct gdb_regs *
 	/*
 	 * Send frame pointer
 	 */
-	*ptr++ = hexchars[REG_FP >> 4];
-	*ptr++ = hexchars[REG_FP & 0xf];
+	*ptr++ = small_digits[REG_FP >> 4];
+	*ptr++ = small_digits[REG_FP & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&regs->reg30, ptr, sizeof(long), 0);
 	*ptr++ = ';';
@@ -772,8 +771,8 @@ void handle_exception (struct gdb_regs *
 	/*
 	 * Send stack pointer
 	 */
-	*ptr++ = hexchars[REG_SP >> 4];
-	*ptr++ = hexchars[REG_SP & 0xf];
+	*ptr++ = small_digits[REG_SP >> 4];
+	*ptr++ = small_digits[REG_SP & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&regs->reg29, ptr, sizeof(long), 0);
 	*ptr++ = ';';
@@ -792,8 +791,8 @@ void handle_exception (struct gdb_regs *
 		{
 		case '?':
 			output_buffer[0] = 'S';
-			output_buffer[1] = hexchars[sigval >> 4];
-			output_buffer[2] = hexchars[sigval & 0xf];
+			output_buffer[1] = small_digits[sigval >> 4];
+			output_buffer[2] = small_digits[sigval & 0xf];
 			output_buffer[3] = 0;
 			break;
 
diff -urp linux-2.6.clean/arch/ppc/boot/common/misc-common.c linux-2.6.patched/arch/ppc/boot/common/misc-common.c
--- linux-2.6.clean/arch/ppc/boot/common/misc-common.c	2005-10-05 14:11:56.000000000 -0400
+++ linux-2.6.patched/arch/ppc/boot/common/misc-common.c	2005-10-06 14:43:14.000000000 -0400
@@ -280,7 +280,7 @@ puthex(unsigned long val)
 	int i;
 	for (i = 7;  i >= 0;  i--)
 	{
-		buf[i] = "0123456789ABCDEF"[val & 0x0F];
+		buf[i] = large_digits[val & 0x0F];
 		val >>= 4;
 	}
 	buf[8] = '\0';
@@ -362,13 +362,13 @@ _vprintk(void(*putc)(const char), const 
 						sign = '-';
 						val = -val;
 					}
-					length = _cvt(val, buf, 10, "0123456789");
+					length = _cvt(val, buf, 10, small_digits);
 					break;
 				case 'x':
-					length = _cvt(val, buf, 16, "0123456789abcdef");
+					length = _cvt(val, buf, 16, small_digits);
 					break;
 				case 'X':
-					length = _cvt(val, buf, 16, "0123456789ABCDEF");
+					length = _cvt(val, buf, 16, large_digits);
 					break;
 				}
 				cp = buf;
@@ -450,7 +450,7 @@ _cvt(unsigned long val, char *buf, long 
 	} else
 		while (val)
 		{
-			*cp++ = digits[val % radix];
+			*cp++ = small_digits[val % radix];
 			val /= radix;
 		}
 	while (cp != temp)
diff -urp linux-2.6.clean/arch/ppc/kernel/ppc-stub.c linux-2.6.patched/arch/ppc/kernel/ppc-stub.c
--- linux-2.6.clean/arch/ppc/kernel/ppc-stub.c	2005-10-05 14:11:57.000000000 -0400
+++ linux-2.6.patched/arch/ppc/kernel/ppc-stub.c	2005-10-06 11:49:03.000000000 -0400
@@ -132,7 +132,6 @@ static u_int fault_jmp_buf[100];
 static int kdebug;
 
 
-static const char hexchars[]="0123456789abcdef";
 
 /* Place where we save old trap entries for restoration - sparc*/
 /* struct tt_entry kgdb_savettable[256]; */
@@ -206,28 +205,28 @@ mem2hex(const char *mem, char *buf, int 
 		if ((count == 2) && (((long)mem & 1) == 0)) {
 			tmp_s = *(unsigned short *)mem;
 			mem += 2;
-			*buf++ = hexchars[(tmp_s >> 12) & 0xf];
-			*buf++ = hexchars[(tmp_s >> 8) & 0xf];
-			*buf++ = hexchars[(tmp_s >> 4) & 0xf];
-			*buf++ = hexchars[tmp_s & 0xf];
+			*buf++ = small_digits[(tmp_s >> 12) & 0xf];
+			*buf++ = small_digits[(tmp_s >> 8) & 0xf];
+			*buf++ = small_digits[(tmp_s >> 4) & 0xf];
+			*buf++ = small_digits[tmp_s & 0xf];
 
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
+			*buf++ = small_digits[(tmp_l >> 28) & 0xf];
+			*buf++ = small_digits[(tmp_l >> 24) & 0xf];
+			*buf++ = small_digits[(tmp_l >> 20) & 0xf];
+			*buf++ = small_digits[(tmp_l >> 16) & 0xf];
+			*buf++ = small_digits[(tmp_l >> 12) & 0xf];
+			*buf++ = small_digits[(tmp_l >> 8) & 0xf];
+			*buf++ = small_digits[(tmp_l >> 4) & 0xf];
+			*buf++ = small_digits[tmp_l & 0xf];
 
 		} else {
 			while (count-- > 0) {
 				ch = *mem++;
-				*buf++ = hexchars[ch >> 4];
-				*buf++ = hexchars[ch & 0xf];
+				*buf++ = small_digits[ch >> 4];
+				*buf++ = small_digits[ch & 0xf];
 			}
 		}
 
@@ -412,8 +411,8 @@ static void putpacket(unsigned char *buf
 		}
 
 		putDebugChar('#');
-		putDebugChar(hexchars[checksum >> 4]);
-		putDebugChar(hexchars[checksum & 0xf]);
+		putDebugChar(small_digits[checksum >> 4]);
+		putDebugChar(small_digits[checksum & 0xf]);
 		recv = getDebugChar();
 	} while ((recv & 0x7f) != '+');
 }
@@ -603,15 +602,15 @@ handle_exception (struct pt_regs *regs)
 	ptr = remcomOutBuffer;
 
 	*ptr++ = 'T';
-	*ptr++ = hexchars[sigval >> 4];
-	*ptr++ = hexchars[sigval & 0xf];
-	*ptr++ = hexchars[PC_REGNUM >> 4];
-	*ptr++ = hexchars[PC_REGNUM & 0xf];
+	*ptr++ = small_digits[sigval >> 4];
+	*ptr++ = small_digits[sigval & 0xf];
+	*ptr++ = small_digits[PC_REGNUM >> 4];
+	*ptr++ = small_digits[PC_REGNUM & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&regs->nip, ptr, 4);
 	*ptr++ = ';';
-	*ptr++ = hexchars[SP_REGNUM >> 4];
-	*ptr++ = hexchars[SP_REGNUM & 0xf];
+	*ptr++ = small_digits[SP_REGNUM >> 4];
+	*ptr++ = small_digits[SP_REGNUM & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex(((char *)regs) + SP_REGNUM*4, ptr, 4);
 	*ptr++ = ';';
@@ -633,8 +632,8 @@ handle_exception (struct pt_regs *regs)
 		switch (remcomInBuffer[0]) {
 		case '?': /* report most recent signal */
 			remcomOutBuffer[0] = 'S';
-			remcomOutBuffer[1] = hexchars[sigval >> 4];
-			remcomOutBuffer[2] = hexchars[sigval & 0xf];
+			remcomOutBuffer[1] = small_digits[sigval >> 4];
+			remcomOutBuffer[2] = small_digits[sigval & 0xf];
 			remcomOutBuffer[3] = 0;
 			break;
 #if 0
diff -urp linux-2.6.clean/arch/ppc/kernel/process.c linux-2.6.patched/arch/ppc/kernel/process.c
--- linux-2.6.clean/arch/ppc/kernel/process.c	2005-10-05 14:11:57.000000000 -0400
+++ linux-2.6.patched/arch/ppc/kernel/process.c	2005-10-06 11:49:03.000000000 -0400
@@ -695,7 +695,7 @@ void puthex(unsigned long val)
 	int i;
 	for (i = 7;  i >= 0;  i--)
 	{
-		buf[i] = "0123456789ABCDEF"[val & 0x0F];
+		buf[i] = large_digits[val & 0x0F];
 		val >>= 4;
 	}
 	buf[8] = '\0';
diff -urp linux-2.6.clean/arch/ppc/platforms/apus_setup.c linux-2.6.patched/arch/ppc/platforms/apus_setup.c
--- linux-2.6.clean/arch/ppc/platforms/apus_setup.c	2005-10-05 14:11:57.000000000 -0400
+++ linux-2.6.patched/arch/ppc/platforms/apus_setup.c	2005-10-06 11:49:03.000000000 -0400
@@ -627,10 +627,9 @@ int __debug_serinit( void )
 void __debug_print_hex(unsigned long x)
 {
 	int i;
-	char hexchars[] = "0123456789ABCDEF";
 
 	for (i = 0; i < 8; i++) {
-		__debug_ser_out(hexchars[(x >> 28) & 15]);
+		__debug_ser_out(large_digits[(x >> 28) & 15]);
 		x <<= 4;
 	}
 	__debug_ser_out('\n');
diff -urp linux-2.6.clean/arch/ppc/platforms/residual.c linux-2.6.patched/arch/ppc/platforms/residual.c
--- linux-2.6.clean/arch/ppc/platforms/residual.c	2005-10-05 14:11:57.000000000 -0400
+++ linux-2.6.patched/arch/ppc/platforms/residual.c	2005-10-06 11:49:03.000000000 -0400
@@ -770,15 +770,14 @@ static int __init same_DevID(unsigned sh
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
+	     (large_digits[(Number>>12)&0x0f] == str[3]) &&
+	     (large_digits[(Number>>8)&0x0f] == str[4])  &&
+	     (large_digits[(Number>>4)&0x0f] == str[5])  &&
+	     (large_digits[Number&0x0f] == str[6]) ) return 1;
 	return 0;
 }
 
diff -urp linux-2.6.clean/arch/ppc/syslib/btext.c linux-2.6.patched/arch/ppc/syslib/btext.c
--- linux-2.6.clean/arch/ppc/syslib/btext.c	2005-10-05 14:11:57.000000000 -0400
+++ linux-2.6.patched/arch/ppc/syslib/btext.c	2005-10-06 11:49:03.000000000 -0400
@@ -392,18 +392,17 @@ btext_drawstring(const char *c)
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
+	btext_drawchar(small_digits[(v >> 28) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 24) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 20) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 16) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 12) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >>  8) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >>  4) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >>  0) & 0x0000000FUL]);
 	btext_drawchar(' ');
 }
 
diff -urp linux-2.6.clean/arch/ppc64/kernel/btext.c linux-2.6.patched/arch/ppc64/kernel/btext.c
--- linux-2.6.clean/arch/ppc64/kernel/btext.c	2005-10-05 14:11:57.000000000 -0400
+++ linux-2.6.patched/arch/ppc64/kernel/btext.c	2005-10-06 11:49:03.000000000 -0400
@@ -278,26 +278,24 @@ void btext_drawstring(const char *c)
 
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
+	btext_drawchar(small_digits[(v >> 60) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 56) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 52) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 48) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 44) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 40) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 36) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 32) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 28) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 24) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 20) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 16) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >> 12) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >>  8) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >>  4) & 0x0000000FUL]);
+	btext_drawchar(small_digits[(v >>  0) & 0x0000000FUL]);
 	btext_drawchar(' ');
 }
 
diff -urp linux-2.6.clean/arch/ppc64/kernel/mf.c linux-2.6.patched/arch/ppc64/kernel/mf.c
--- linux-2.6.clean/arch/ppc64/kernel/mf.c	2005-10-05 14:11:57.000000000 -0400
+++ linux-2.6.patched/arch/ppc64/kernel/mf.c	2005-10-06 11:49:03.000000000 -0400
@@ -643,10 +643,10 @@ void mf_display_progress(u16 value)
 		72);
 	src[6] = value >> 8;
 	src[7] = value & 255;
-	src[44] = "0123456789ABCDEF"[(value >> 12) & 15];
-	src[45] = "0123456789ABCDEF"[(value >> 8) & 15];
-	src[46] = "0123456789ABCDEF"[(value >> 4) & 15];
-	src[47] = "0123456789ABCDEF"[value & 15];
+	src[44] = large_digits[(value >> 12) & 15];
+	src[45] = large_digits[(value >> 8) & 15];
+	src[46] = large_digits[(value >> 4) & 15];
+	src[47] = large_digits[value & 15];
 	dma_and_signal_ce_msg(ce, NULL, src, sizeof(src), 9 * 64 * 1024);
 }
 
diff -urp linux-2.6.clean/arch/sh/kernel/kgdb_stub.c linux-2.6.patched/arch/sh/kernel/kgdb_stub.c
--- linux-2.6.clean/arch/sh/kernel/kgdb_stub.c	2005-10-05 14:11:57.000000000 -0400
+++ linux-2.6.patched/arch/sh/kernel/kgdb_stub.c	2005-10-06 11:49:03.000000000 -0400
@@ -240,7 +240,6 @@ static jmp_buf rem_com_env;
 /* Misc static */
 static int stepped_address;
 static short stepped_opcode;
-static const char hexchars[] = "0123456789abcdef";
 static char in_buffer[BUFMAX];
 static char out_buffer[OUTBUFMAX];
 
@@ -268,13 +267,13 @@ static inline void ctrl_outl(const unsig
 /* Get high hex bits */
 static char highhex(const int x)
 {
-	return hexchars[(x >> 4) & 0xf];
+	return small_digits[(x >> 4) & 0xf];
 }
 
 /* Get low hex bits */
 static char lowhex(const int x)
 {
-	return hexchars[x & 0xf];
+	return small_digits[x & 0xf];
 }
 
 /* Convert ch to hex */
@@ -367,8 +366,8 @@ static char *ebin_to_mem(const char *buf
 /* Pack a hex byte */
 static char *pack_hex_byte(char *pkt, int byte)
 {
-	*pkt++ = hexchars[(byte >> 4) & 0xf];
-	*pkt++ = hexchars[(byte & 0xf)];
+	*pkt++ = small_digits[(byte >> 4) & 0xf];
+	*pkt++ = small_digits[(byte & 0xf)];
 	return pkt;
 }
 
diff -urp linux-2.6.clean/arch/sparc/kernel/sparc-stub.c linux-2.6.patched/arch/sparc/kernel/sparc-stub.c
--- linux-2.6.clean/arch/sparc/kernel/sparc-stub.c	2005-10-05 14:11:57.000000000 -0400
+++ linux-2.6.patched/arch/sparc/kernel/sparc-stub.c	2005-10-06 11:49:03.000000000 -0400
@@ -127,8 +127,6 @@ extern char getDebugChar(void);   /* rea
 
 static int initialized;	/* !0 means we've been initialized */
 
-static const char hexchars[]="0123456789abcdef";
-
 #define NUMREGS 72
 
 /* Number of bytes of registers.  */
@@ -298,8 +296,8 @@ putpacket(unsigned char *buffer)
 		}
 
 		putDebugChar('#');
-		putDebugChar(hexchars[checksum >> 4]);
-		putDebugChar(hexchars[checksum & 0xf]);
+		putDebugChar(small_digits[checksum >> 4]);
+		putDebugChar(small_digits[checksum & 0xf]);
 		recv = getDebugChar();
 	} while ((recv & 0x7f) != '+');
 }
@@ -337,8 +335,8 @@ mem2hex(char *mem, char *buf, int count)
 			".word 1b, 2b\n\t"
 			".text\n"
 			: "=r" (mem), "=r" (ch) : "0" (mem));
-		*buf++ = hexchars[ch >> 4];
-		*buf++ = hexchars[ch & 0xf];
+		*buf++ = small_digits[ch >> 4];
+		*buf++ = small_digits[ch & 0xf];
 	}
 
 	*buf = 0;
@@ -527,35 +525,35 @@ handle_exception (unsigned long *registe
 	ptr = remcomOutBuffer;
 
 	*ptr++ = 'T';
-	*ptr++ = hexchars[sigval >> 4];
-	*ptr++ = hexchars[sigval & 0xf];
+	*ptr++ = small_digits[sigval >> 4];
+	*ptr++ = small_digits[sigval & 0xf];
 
-	*ptr++ = hexchars[PC >> 4];
-	*ptr++ = hexchars[PC & 0xf];
+	*ptr++ = small_digits[PC >> 4];
+	*ptr++ = small_digits[PC & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&registers[PC], ptr, 4);
 	*ptr++ = ';';
 
-	*ptr++ = hexchars[FP >> 4];
-	*ptr++ = hexchars[FP & 0xf];
+	*ptr++ = small_digits[FP >> 4];
+	*ptr++ = small_digits[FP & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *) (sp + 8 + 6), ptr, 4); /* FP */
 	*ptr++ = ';';
 
-	*ptr++ = hexchars[SP >> 4];
-	*ptr++ = hexchars[SP & 0xf];
+	*ptr++ = small_digits[SP >> 4];
+	*ptr++ = small_digits[SP & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&sp, ptr, 4);
 	*ptr++ = ';';
 
-	*ptr++ = hexchars[NPC >> 4];
-	*ptr++ = hexchars[NPC & 0xf];
+	*ptr++ = small_digits[NPC >> 4];
+	*ptr++ = small_digits[NPC & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&registers[NPC], ptr, 4);
 	*ptr++ = ';';
 
-	*ptr++ = hexchars[O7 >> 4];
-	*ptr++ = hexchars[O7 & 0xf];
+	*ptr++ = small_digits[O7 >> 4];
+	*ptr++ = small_digits[O7 & 0xf];
 	*ptr++ = ':';
 	ptr = mem2hex((char *)&registers[O7], ptr, 4);
 	*ptr++ = ';';
@@ -577,8 +575,8 @@ handle_exception (unsigned long *registe
 		switch (remcomInBuffer[0]) {
 		case '?':
 			remcomOutBuffer[0] = 'S';
-			remcomOutBuffer[1] = hexchars[sigval >> 4];
-			remcomOutBuffer[2] = hexchars[sigval & 0xf];
+			remcomOutBuffer[1] = small_digits[sigval >> 4];
+			remcomOutBuffer[2] = small_digits[sigval & 0xf];
 			remcomOutBuffer[3] = 0;
 			break;
 
diff -urp linux-2.6.clean/drivers/ide/ide.c linux-2.6.patched/drivers/ide/ide.c
--- linux-2.6.clean/drivers/ide/ide.c	2005-10-05 14:12:00.000000000 -0400
+++ linux-2.6.patched/drivers/ide/ide.c	2005-10-06 11:49:03.000000000 -0400
@@ -1442,8 +1442,6 @@ static int __init stridx (const char *s,
  */
 static int __init match_parm (char *s, const char *keywords[], int vals[], int max_vals)
 {
-	static const char *decimal = "0123456789";
-	static const char *hex = "0123456789abcdef";
 	int i, n;
 
 	if (*s++ == '=') {
@@ -1463,12 +1461,12 @@ static int __init match_parm (char *s, c
 		 * or base16 when prefixed with "0x".
 		 * Return a count of how many were found.
 		 */
-		for (n = 0; (i = stridx(decimal, *s)) >= 0;) {
+		for (n = 0; (i = stridx(small_digits, *s)) >= 0;) {
 			vals[n] = i;
-			while ((i = stridx(decimal, *++s)) >= 0)
+			while ((i = stridx(small_digits, *++s)) >= 0)
 				vals[n] = (vals[n] * 10) + i;
 			if (*s == 'x' && !vals[n]) {
-				while ((i = stridx(hex, *++s)) >= 0)
+				while ((i = stridx(small_digits, *++s)) >= 0)
 					vals[n] = (vals[n] * 0x10) + i;
 			}
 			if (++n == max_vals)
diff -urp linux-2.6.clean/drivers/isdn/isdnloop/isdnloop.c linux-2.6.patched/drivers/isdn/isdnloop/isdnloop.c
--- linux-2.6.clean/drivers/isdn/isdnloop/isdnloop.c	2005-10-05 14:12:00.000000000 -0400
+++ linux-2.6.patched/drivers/isdn/isdnloop/isdnloop.c	2005-10-06 11:49:03.000000000 -0400
@@ -1297,7 +1297,7 @@ isdnloop_command(isdn_ctrl * c, isdnloop
 							c->parm.num[0] ? "N" : "ALL", c->parm.num);
 					} else
 						sprintf(cbuf, "%02d;EAZ%s\n", (int) a,
-							c->parm.num[0] ? c->parm.num : (u_char *) "0123456789");
+							c->parm.num[0] ? c->parm.num : decimal);
 					i = isdnloop_writecmd(cbuf, strlen(cbuf), 0, card);
 				}
 				break;
diff -urp linux-2.6.clean/drivers/net/irda/ma600.c linux-2.6.patched/drivers/net/irda/ma600.c
--- linux-2.6.clean/drivers/net/irda/ma600.c	2005-10-05 14:12:01.000000000 -0400
+++ linux-2.6.patched/drivers/net/irda/ma600.c	2005-10-06 11:49:03.000000000 -0400
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
@@ -243,10 +239,10 @@ static int ma600_change_speed(struct ird
 			/* if control byte != echo, I don't know what to do */
 			printk(KERN_WARNING "%s() control byte written != read!\n", __FUNCTION__);
 			printk(KERN_WARNING "control byte = 0x%c%c\n", 
-			       hexTbl[(byte>>4)&0x0f], hexTbl[byte&0x0f]);
+			       large_digits[(byte>>4)&0x0f], large_digits[byte&0x0f]);
 			printk(KERN_WARNING "byte echo = 0x%c%c\n", 
-			       hexTbl[(byte_echo>>4) & 0x0f], 
-			       hexTbl[byte_echo & 0x0f]);
+			       large_digits[(byte_echo>>4) & 0x0f], 
+			       large_digits[byte_echo & 0x0f]);
 		#ifndef NDEBUG
 		} else {
 			IRDA_DEBUG(2, "%s() control byte write read OK\n", __FUNCTION__);
diff -urp linux-2.6.clean/drivers/net/sk98lin/skge.c linux-2.6.patched/drivers/net/sk98lin/skge.c
--- linux-2.6.clean/drivers/net/sk98lin/skge.c	2005-10-05 14:12:01.000000000 -0400
+++ linux-2.6.patched/drivers/net/sk98lin/skge.c	2005-10-06 11:50:48.000000000 -0400
@@ -4810,7 +4810,6 @@ register int    i;
 int	haddr, addr;
 char	hex_buffer[180];
 char	asc_buffer[180];
-char	HEXCHAR[] = "0123456789ABCDEF";
 
 	addr = 0;
 	haddr = 0;
@@ -4823,9 +4822,9 @@ char	HEXCHAR[] = "0123456789ABCDEF";
 			asc_buffer[addr] = '.';
 		addr++;
 		asc_buffer[addr] = 0;
-		hex_buffer[haddr] = HEXCHAR[(*p & 0xf0) >> 4];
+		hex_buffer[haddr] = large_digits[(*p & 0xf0) >> 4];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[*p & 0x0f];
+		hex_buffer[haddr] = large_digits[*p & 0x0f];
 		haddr++;
 		hex_buffer[haddr] = ' ';
 		haddr++;
@@ -4858,7 +4857,6 @@ register int    i;
 int	haddr, addr;
 char	hex_buffer[180];
 char	asc_buffer[180];
-char	HEXCHAR[] = "0123456789ABCDEF";
 long	*p;
 int	l;
 
@@ -4869,21 +4867,21 @@ int	l;
 	p = (long*) pc;
 	for (i=0; i < size; ) {
 		l = (long) *p;
-		hex_buffer[haddr] = HEXCHAR[(l >> 28) & 0xf];
+		hex_buffer[haddr] = large_digits[(l >> 28) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[(l >> 24) & 0xf];
+		hex_buffer[haddr] = large_digits[(l >> 24) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[(l >> 20) & 0xf];
+		hex_buffer[haddr] = large_digits[(l >> 20) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[(l >> 16) & 0xf];
+		hex_buffer[haddr] = large_digits[(l >> 16) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[(l >> 12) & 0xf];
+		hex_buffer[haddr] = large_digits[(l >> 12) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[(l >> 8) & 0xf];
+		hex_buffer[haddr] = large_digits[(l >> 8) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[(l >> 4) & 0xf];
+		hex_buffer[haddr] = large_digits[(l >> 4) & 0xf];
 		haddr++;
-		hex_buffer[haddr] = HEXCHAR[l & 0x0f];
+		hex_buffer[haddr] = large_digits[l & 0x0f];
 		haddr++;
 		hex_buffer[haddr] = ' ';
 		haddr++;
diff -urp linux-2.6.clean/drivers/net/skfp/smt.c linux-2.6.patched/drivers/net/skfp/smt.c
--- linux-2.6.clean/drivers/net/skfp/smt.c	2005-10-05 14:12:02.000000000 -0400
+++ linux-2.6.patched/drivers/net/skfp/smt.c	2005-10-06 11:49:03.000000000 -0400
@@ -1731,7 +1731,7 @@ void fddi_send_antc(struct s_smc *smc, s
 #endif
 
 #ifdef	DEBUG
-#define hextoasc(x)	"0123456789abcdef"[x]
+#define hextoasc(x)	small_digits[x]
 
 char *addr_to_string(struct fddi_addr *addr)
 {
diff -urp linux-2.6.clean/drivers/net/wireless/strip.c linux-2.6.patched/drivers/net/wireless/strip.c
--- linux-2.6.clean/drivers/net/wireless/strip.c	2005-10-05 14:12:02.000000000 -0400
+++ linux-2.6.patched/drivers/net/wireless/strip.c	2005-10-06 11:49:03.000000000 -0400
@@ -404,8 +404,6 @@ static const StringDescriptor CommandStr
      (S)->battery_voltage.c[0]  && \
      memcmp(&(S)->true_dev_addr, zero_address.c, sizeof(zero_address)))
 
-static const char hextable[16] = "0123456789ABCDEF";
-
 static const MetricomAddress zero_address;
 static const MetricomAddress broadcast_address =
     { {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF} };
@@ -1292,13 +1290,13 @@ static __u8 *add_checksum(__u8 * buffer,
 	__u8 *p = buffer;
 	while (p < end)
 		sum += *p++;
-	end[3] = hextable[sum & 0xF];
+	end[3] = large_digits[sum & 0xF];
 	sum >>= 4;
-	end[2] = hextable[sum & 0xF];
+	end[2] = large_digits[sum & 0xF];
 	sum >>= 4;
-	end[1] = hextable[sum & 0xF];
+	end[1] = large_digits[sum & 0xF];
 	sum >>= 4;
-	end[0] = hextable[sum & 0xF];
+	end[0] = large_digits[sum & 0xF];
 	return (end + 4);
 }
 
@@ -1379,15 +1377,15 @@ static unsigned char *strip_make_packet(
 
 	*ptr++ = 0x0D;
 	*ptr++ = '*';
-	*ptr++ = hextable[haddr.c[2] >> 4];
-	*ptr++ = hextable[haddr.c[2] & 0xF];
-	*ptr++ = hextable[haddr.c[3] >> 4];
-	*ptr++ = hextable[haddr.c[3] & 0xF];
+	*ptr++ = large_digits[haddr.c[2] >> 4];
+	*ptr++ = large_digits[haddr.c[2] & 0xF];
+	*ptr++ = large_digits[haddr.c[3] >> 4];
+	*ptr++ = large_digits[haddr.c[3] & 0xF];
 	*ptr++ = '-';
-	*ptr++ = hextable[haddr.c[4] >> 4];
-	*ptr++ = hextable[haddr.c[4] & 0xF];
-	*ptr++ = hextable[haddr.c[5] >> 4];
-	*ptr++ = hextable[haddr.c[5] & 0xF];
+	*ptr++ = large_digits[haddr.c[4] >> 4];
+	*ptr++ = large_digits[haddr.c[4] & 0xF];
+	*ptr++ = large_digits[haddr.c[5] >> 4];
+	*ptr++ = large_digits[haddr.c[5] & 0xF];
 	*ptr++ = '*';
 	*ptr++ = key.c[0];
 	*ptr++ = key.c[1];
diff -urp linux-2.6.clean/drivers/pnp/pnpbios/rsparser.c linux-2.6.patched/drivers/pnp/pnpbios/rsparser.c
--- linux-2.6.clean/drivers/pnp/pnpbios/rsparser.c	2005-10-05 14:12:02.000000000 -0400
+++ linux-2.6.patched/drivers/pnp/pnpbios/rsparser.c	2005-10-06 11:49:03.000000000 -0400
@@ -475,14 +475,12 @@ pnpbios_parse_resource_option_data(unsig
  * Compatible Device IDs
  */
 
-#define HEX(id,a) hex[((id)>>a) & 15]
+#define HEX(id,a) small_digits[((id)>>a) & 15]
 #define CHAR(id,a) (0x40 + (((id)>>a) & 31))
 //
 
 void pnpid32_to_pnpid(u32 id, char *str)
 {
-	const char *hex = "0123456789abcdef";
-
 	id = be32_to_cpu(id);
 	str[0] = CHAR(id, 26);
 	str[1] = CHAR(id, 21);
diff -urp linux-2.6.clean/drivers/scsi/ibmmca.c linux-2.6.patched/drivers/scsi/ibmmca.c
--- linux-2.6.clean/drivers/scsi/ibmmca.c	2005-10-05 14:12:03.000000000 -0400
+++ linux-2.6.patched/drivers/scsi/ibmmca.c	2005-10-06 11:56:57.000000000 -0400
@@ -1007,12 +1007,11 @@ static char *ti_p(int dev)
 /* interpreter for logical device numbers (ldn) */
 static char *ti_l(int val)
 {
-	const char hex[16] = "0123456789abcdef";
 	static char answer[2];
 
 	answer[1] = (char) (0x0);
 	if (val <= MAX_LOG_DEV)
-		answer[0] = hex[val];
+		answer[0] = small_digits[val];
 	else
 		answer[0] = '-';
 	return (char *) &answer;
diff -urp linux-2.6.clean/drivers/scsi/ultrastor.c linux-2.6.patched/drivers/scsi/ultrastor.c
--- linux-2.6.clean/drivers/scsi/ultrastor.c	2005-10-05 14:12:04.000000000 -0400
+++ linux-2.6.patched/drivers/scsi/ultrastor.c	2005-10-06 11:49:03.000000000 -0400
@@ -869,8 +869,8 @@ static int ultrastor_abort(Scsi_Cmnd *SC
 	for (i = 0; i < 16; i++)
 	  {
 	    unsigned char p = inb(port0 + i);
-	    out[28 + i * 3] = "0123456789abcdef"[p >> 4];
-	    out[29 + i * 3] = "0123456789abcdef"[p & 15];
+	    out[28 + i * 3] = small_digits[p >> 4];
+	    out[29 + i * 3] = small_digits[p & 15];
 	    out[30 + i * 3] = ' ';
 	  }
 	out[28 + i * 3] = '\n';
diff -urp linux-2.6.clean/drivers/serial/sh-sci.c linux-2.6.patched/drivers/serial/sh-sci.c
--- linux-2.6.clean/drivers/serial/sh-sci.c	2005-10-05 14:12:04.000000000 -0400
+++ linux-2.6.patched/drivers/serial/sh-sci.c	2005-10-06 11:49:03.000000000 -0400
@@ -119,16 +119,14 @@ static int get_char(struct uart_port *po
 }
 
 /* Taken from sh-stub.c of GDB 4.18 */
-static const char hexchars[] = "0123456789abcdef";
-
 static __inline__ char highhex(int  x)
 {
-	return hexchars[(x >> 4) & 0xf];
+	return small_digits[(x >> 4) & 0xf];
 }
 
 static __inline__ char lowhex(int  x)
 {
-	return hexchars[x & 0xf];
+	return small_digits[x & 0xf];
 }
 
 #endif /* CONFIG_SH_STANDARD_BIOS || CONFIG_SH_KGDB */
diff -urp linux-2.6.clean/fs/udf/unicode.c linux-2.6.patched/fs/udf/unicode.c
--- linux-2.6.clean/fs/udf/unicode.c	2005-10-05 14:12:06.000000000 -0400
+++ linux-2.6.patched/fs/udf/unicode.c	2005-10-06 11:49:03.000000000 -0400
@@ -427,7 +427,6 @@ static int udf_translate_to_linux(uint8_
 	int extIndex = 0, newExtIndex = 0, hasExt = 0;
 	unsigned short valueCRC;
 	uint8_t curr;
-	const uint8_t hexChar[] = "0123456789ABCDEF";
 
 	if (udfName[0] == '.' && (udfLen == 1 ||
 		(udfLen == 2 && udfName[1] == '.')))
@@ -500,10 +499,10 @@ static int udf_translate_to_linux(uint8_
 			newIndex = 250;
 		newName[newIndex++] = CRC_MARK;
 		valueCRC = udf_crc(fidName, fidNameLen, 0);
-		newName[newIndex++] = hexChar[(valueCRC & 0xf000) >> 12];
-		newName[newIndex++] = hexChar[(valueCRC & 0x0f00) >> 8];
-		newName[newIndex++] = hexChar[(valueCRC & 0x00f0) >> 4];
-		newName[newIndex++] = hexChar[(valueCRC & 0x000f)];
+		newName[newIndex++] = large_digits[(valueCRC & 0xf000) >> 12];
+		newName[newIndex++] = large_digits[(valueCRC & 0x0f00) >> 8];
+		newName[newIndex++] = large_digits[(valueCRC & 0x00f0) >> 4];
+		newName[newIndex++] = large_digits[(valueCRC & 0x000f)];
 
 		if (hasExt)
 		{
diff -urp linux-2.6.clean/include/linux/kernel.h linux-2.6.patched/include/linux/kernel.h
--- linux-2.6.clean/include/linux/kernel.h	2005-10-05 14:12:08.000000000 -0400
+++ linux-2.6.patched/include/linux/kernel.h	2005-10-06 14:33:05.000000000 -0400
@@ -86,6 +86,8 @@ extern int cond_resched(void);
 	})
 
 extern struct notifier_block *panic_notifier_list;
+extern const unsigned char small_digits[];
+extern const unsigned char large_digits[];
 extern long (*panic_blink)(long time);
 NORET_TYPE void panic(const char * fmt, ...)
 	__attribute__ ((NORET_AND format (printf, 1, 2)));
diff -urp linux-2.6.clean/kernel/audit.c linux-2.6.patched/kernel/audit.c
--- linux-2.6.clean/kernel/audit.c	2005-10-05 14:12:10.000000000 -0400
+++ linux-2.6.patched/kernel/audit.c	2005-10-06 11:49:03.000000000 -0400
@@ -787,7 +787,6 @@ void audit_log_hex(struct audit_buffer *
 	int i, avail, new_len;
 	unsigned char *ptr;
 	struct sk_buff *skb;
-	static const unsigned char *hex = "0123456789ABCDEF";
 
 	BUG_ON(!ab->skb);
 	skb = ab->skb;
@@ -803,8 +802,8 @@ void audit_log_hex(struct audit_buffer *
 
 	ptr = skb->tail;
 	for (i=0; i<len; i++) {
-		*ptr++ = hex[(buf[i] & 0xF0)>>4]; /* Upper nibble */
-		*ptr++ = hex[buf[i] & 0x0F];	  /* Lower nibble */
+		*ptr++ = large_digits[(buf[i] & 0xF0)>>4]; /* Upper nibble */
+		*ptr++ = large_digits[buf[i] & 0x0F];	  /* Lower nibble */
 	}
 	*ptr = 0;
 	skb_put(skb, len << 1); /* new string is twice the old string */
diff -urp linux-2.6.clean/lib/vsprintf.c linux-2.6.patched/lib/vsprintf.c
--- linux-2.6.clean/lib/vsprintf.c	2005-10-05 14:12:10.000000000 -0400
+++ linux-2.6.patched/lib/vsprintf.c	2005-10-06 14:33:17.000000000 -0400
@@ -25,6 +25,12 @@
 
 #include <asm/div64.h>
 
+const unsigned char small_digits[] = "0123456789abcdefghijklmnopqrstuvwxyz";
+EXPORT_SYMBOL(small_digits);
+
+const unsigned char large_digits[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
+EXPORT_SYMBOL(large_digits);
+
 /**
  * simple_strtoul - convert a string to an unsigned long
  * @cp: The start of the string
@@ -146,8 +152,6 @@ static char * number(char * buf, char * 
 {
 	char c,sign,tmp[66];
 	const char *digits;
-	static const char small_digits[] = "0123456789abcdefghijklmnopqrstuvwxyz";
-	static const char large_digits[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
 	int i;
 
 	digits = (type & LARGE) ? large_digits : small_digits;
diff -urp linux-2.6.clean/net/ipv4/arp.c linux-2.6.patched/net/ipv4/arp.c
--- linux-2.6.clean/net/ipv4/arp.c	2005-10-05 14:12:11.000000000 -0400
+++ linux-2.6.patched/net/ipv4/arp.c	2005-10-06 11:49:03.000000000 -0400
@@ -1291,7 +1291,6 @@ static void arp_format_neigh_entry(struc
 				   struct neighbour *n)
 {
 	char hbuffer[HBUFFERLEN];
-	const char hexbuf[] = "0123456789ABCDEF";
 	int k, j;
 	char tbuf[16];
 	struct net_device *dev = n->dev;
@@ -1305,8 +1304,8 @@ static void arp_format_neigh_entry(struc
 	else {
 #endif
 	for (k = 0, j = 0; k < HBUFFERLEN - 3 && j < dev->addr_len; j++) {
-		hbuffer[k++] = hexbuf[(n->ha[j] >> 4) & 15];
-		hbuffer[k++] = hexbuf[n->ha[j] & 15];
+		hbuffer[k++] = large_digits[(n->ha[j] >> 4) & 15];
+		hbuffer[k++] = large_digits[n->ha[j] & 15];
 		hbuffer[k++] = ':';
 	}
 	hbuffer[--k] = 0;
diff -urp linux-2.6.clean/net/ipv4/netfilter/ipt_CLUSTERIP.c linux-2.6.patched/net/ipv4/netfilter/ipt_CLUSTERIP.c
--- linux-2.6.clean/net/ipv4/netfilter/ipt_CLUSTERIP.c	2005-10-05 14:12:11.000000000 -0400
+++ linux-2.6.patched/net/ipv4/netfilter/ipt_CLUSTERIP.c	2005-10-06 11:49:03.000000000 -0400
@@ -502,11 +502,10 @@ static void arp_print(struct arp_payload
 #define HBUFFERLEN 30
 	char hbuffer[HBUFFERLEN];
 	int j,k;
-	const char hexbuf[]= "0123456789abcdef";
 
 	for (k=0, j=0; k < HBUFFERLEN-3 && j < ETH_ALEN; j++) {
-		hbuffer[k++]=hexbuf[(payload->src_hw[j]>>4)&15];
-		hbuffer[k++]=hexbuf[payload->src_hw[j]&15];
+		hbuffer[k++]=small_digits[(payload->src_hw[j]>>4)&15];
+		hbuffer[k++]=small_digits[payload->src_hw[j]&15];
 		hbuffer[k++]=':';
 	}
 	hbuffer[--k]='\0';

--===============40862942948571379==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40862942948571379==--
