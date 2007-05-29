From: Aaron Cripps <acripps@gmail.com>
Date: Tue, 29 May 2007 21:11:50 +0000
Subject: [KJ] Re: [PATCH ARRAY_SIZE 2/4] kernel 2.6 size macro clean ups in
Message-Id: <465C99E6.7010400@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080907080108090808040702"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080907080108090808040702
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------080907080108090808040702
Content-Type: text/plain;
 name="lp486e_ArraySize.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lp486e_ArraySize.patch"

Replaced SIZE(x) macro with the more descriptive ARRAY_SIZE(arr) macro
defined in kernel.h
Also removed 22 lines of code that will never be compiled because of
preprocessor directive: #if 0
compile tested, no compile time issues found.
Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>


diff -Nuar linux-2.6/drivers/net/lp486e.c linux-2.6-patched/drivers/net/lp486e.c
--- linux-2.6/drivers/net/lp486e.c	2007-05-22 20:31:03.000000000 -0230
+++ linux-2.6-patched/drivers/net/lp486e.c	2007-05-25 22:43:16.000000000 -0230
@@ -515,33 +515,6 @@
 	outb(0, IOADDR+8);
 }
 
-#define SIZE(x)	(sizeof(x)/sizeof((x)[0]))
-
-#if 0
-/* selftest or dump */
-static void
-i596_port_do(struct net_device *dev, int portcmd, char *cmdname) {
-	struct i596_private *lp = dev->priv;
-	u16 *outp;
-	int i, m;
-
-	memset((void *)&(lp->dump), 0, sizeof(struct i596_dump));
-	outp = &(lp->dump.dump[0]);
-
-	PORT(va_to_pa(outp), portcmd);
-	mdelay(30);             /* random, unmotivated */
-
-	printk("lp486e i82596 %s result:\n", cmdname);
-	for (m = SIZE(lp->dump.dump); m && lp->dump.dump[m-1] == 0; m--)
-		;
-	for (i = 0; i < m; i++) {
-		printk(" %04x", lp->dump.dump[i]);
-		if (i%8 == 7)
-			printk("\n");
-	}
-	printk("\n");
-}
-#endif
 
 static int
 i596_scp_setup(struct net_device *dev) {


--------------080907080108090808040702
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--------------080907080108090808040702--
