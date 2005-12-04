From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:13:50 +0000
Subject: [KJ] [PATCH 3/21] polling loops: change exit condition to
Message-Id: <439234BE.70306@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

BLOCK LAYER
P:	Jens Axboe
M:	axboe@suse.de

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/block/sx8.c linux-2.6.15-rc4/drivers/block/sx8.c
--- linux-2.6.15-rc4-orig/drivers/block/sx8.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/block/sx8.c	2005-12-03 16:53:10.000000000 +0100
@@ -570,9 +570,10 @@ static struct carm_request *carm_get_spe
 	unsigned long flags;
 	struct carm_request *crq = NULL;
 	struct request *rq;
-	int tries = 5000;
+	unsigned long end_time;
 
-	while (tries-- > 0) {
+	end_time = jiffies + msecs_to_jiffies(50000);
+	while (time_before(jiffies, end_time)) {
 		spin_lock_irqsave(&host->lock, flags);
 		crq = carm_get_request(host);
 		spin_unlock_irqrestore(&host->lock, flags);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
