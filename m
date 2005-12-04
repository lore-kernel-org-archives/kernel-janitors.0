From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:18:36 +0000
Subject: [KJ] [PATCH 10/21] polling loops: change exit condition to
Message-Id: <439235DC.8070900@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ISDN SUBSYSTEM
P:	Karsten Keil
M:	kkeil@suse.de
P:	Kai Germaschewski
M:	kai.germaschewski@gmx.de

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/isdn/hysdn/boardergo.c linux-2.6.15-rc4/drivers/isdn/hysdn/boardergo.c
--- linux-2.6.15-rc4-orig/drivers/isdn/hysdn/boardergo.c	2005-11-20 16:53:15.000000000 +0100
+++ linux-2.6.15-rc4/drivers/isdn/hysdn/boardergo.c	2005-12-03 16:53:10.000000000 +0100
@@ -329,14 +329,16 @@ static int
 ergo_waitpofready(struct HYSDN_CARD *card)
 {
 	tErgDpram *dpr = card->dpram;	/* pointer to DPRAM structure */
-	int timecnt = 10000 / 50;	/* timeout is 10 secs max. */
+	unsigned long end_time;
 	ulong flags;
 	int msg_size;
 	int i;
 
 	if (card->debug_flags & LOG_POF_CARD)
 		hysdn_addlog(card, "ERGO: waiting for pof ready");
-	while (timecnt--) {
+
+	end_time = jiffies + msecs_to_jiffies(10000); /* timeout is 10 secs max. */
+	while (time_before(jiffies, end_time)) {
 		/* wait until timeout  */
 
 		if (dpr->ToPcFlag) {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
