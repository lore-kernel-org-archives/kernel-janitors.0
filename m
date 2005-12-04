From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:22:38 +0000
Subject: [KJ] [PATCH 18/21] polling loops: change exit condition to
Message-Id: <439236CE.1030806@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

UltraSPARC (sparc64):
P:	David S. Miller
M:	davem@davemloft.net
P:	Eddie C. Dost
M:	ecd@brainaid.de
P:	Jakub Jelinek
M:	jj@sunsite.ms.mff.cuni.cz
P:	Anton Blanchard
M:	anton@samba.org

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/sbus/char/bbc_i2c.c linux-2.6.15-rc4/drivers/sbus/char/bbc_i2c.c
--- linux-2.6.15-rc4-orig/drivers/sbus/char/bbc_i2c.c	2005-11-20 16:53:27.000000000 +0100
+++ linux-2.6.15-rc4/drivers/sbus/char/bbc_i2c.c	2005-12-03 16:53:10.000000000 +0100
@@ -181,12 +181,13 @@ void bbc_i2c_detach(struct bbc_i2c_clien
 static int wait_for_pin(struct bbc_i2c_bus *bp, u8 *status)
 {
 	DECLARE_WAITQUEUE(wait, current);
-	int limit = 32;
 	int ret = 1;
+	unsigned long end_time;
 
 	bp->waiting = 1;
 	add_wait_queue(&bp->wq, &wait);
-	while (limit-- > 0) {
+	end_time = jiffies + msecs_to_jiffies(32 * 250);
+	while (time_before(jiffies, end_time)) {
 		u8 val;
 
 		set_current_state(TASK_INTERRUPTIBLE);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
