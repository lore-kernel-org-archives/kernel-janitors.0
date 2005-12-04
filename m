From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:22:11 +0000
Subject: [KJ] [PATCH 17/21] polling loops: change exit condition to
Message-Id: <439236B3.5090503@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

S390
P:	Martin Schwidefsky
M:	schwidefsky@de.ibm.com
M:	linux390@de.ibm.com

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/s390/net/lcs.c linux-2.6.15-rc4/drivers/s390/net/lcs.c
--- linux-2.6.15-rc4-orig/drivers/s390/net/lcs.c	2005-12-03 15:22:34.000000000 +0100
+++ linux-2.6.15-rc4/drivers/s390/net/lcs.c	2005-12-03 16:53:10.000000000 +0100
@@ -1643,10 +1643,11 @@ lcs_detect(struct lcs_card *card)
 static int
 lcs_resetcard(struct lcs_card *card)
 {
-	int retries;
+	unsigned long end_time;
 
 	LCS_DBF_TEXT(2, trace, "rescard");
-	for (retries = 0; retries < 10; retries++) {
+	end_time = jiffies + msecs_to_jiffies(30000);
+	while (time_before(jiffies, end_time)) {
 		if (lcs_detect(card) = 0) {
 			netif_wake_queue(card->dev);
 			card->state = DEV_STATE_UP;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
