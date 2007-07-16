From: acripps <acripps@gmail.com>
Date: Mon, 16 Jul 2007 14:06:11 +0000
Subject: [KJ] [third][PATCH 2/4][2.6 drivers/net/lp46e.c:]replace SIZE macros
Message-Id: <20070716141811.30653.94596.sendpatchset@shcherbakov.homelinux.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is a simple cleanup patch to remove the SIZE macro and use the identical
ARRAY_SIZE(x) macro defined in kernel.h
Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>

diff --git a/drivers/net/lp486e.c b/drivers/net/lp486e.c
index 5fc18da..408ae6e 100644
--- a/drivers/net/lp486e.c
+++ b/drivers/net/lp486e.c
@@ -515,8 +515,6 @@ CLEAR_INT(void) {
 	outb(0, IOADDR+8);
 }
 
-#define SIZE(x)	(sizeof(x)/sizeof((x)[0]))
-
 #if 0
 /* selftest or dump */
 static void
@@ -532,7 +530,7 @@ i596_port_do(struct net_device *dev, int portcmd, char *cmdname) {
 	mdelay(30);             /* random, unmotivated */
 
 	printk("lp486e i82596 %s result:\n", cmdname);
-	for (m = SIZE(lp->dump.dump); m && lp->dump.dump[m-1] = 0; m--)
+	for (m = ARRAY_SIZE(lp->dump.dump); m && lp->dump.dump[m-1] = 0; m--)
 		;
 	for (i = 0; i < m; i++) {
 		printk(" %04x", lp->dump.dump[i]);
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
