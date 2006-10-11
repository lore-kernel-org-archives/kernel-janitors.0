From: Amol Lad <amol@verismonetworks.com>
Date: Wed, 11 Oct 2006 13:19:39 +0000
Subject: [KJ] [PATCH 3/4] drivers/net/sis900.c: Replacing yield() with a
Message-Id: <1160572059.19143.341.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel Janitors <kernel-janitors@lists.osdl.org>

*Please check if the timout value is ok or it should be increased*

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/net/sis900.c linux-2.6.19-rc1/drivers/net/sis900.c
--- linux-2.6.19-rc1-orig/drivers/net/sis900.c	2006-10-05 14:00:48.000000000 +0530
+++ linux-2.6.19-rc1/drivers/net/sis900.c	2006-10-11 17:57:02.000000000 +0530
@@ -664,7 +664,7 @@ static int __init sis900_mii_probe(struc
 
 	if(status & MII_STAT_LINK){
 		while (poll_bit) {
-			yield();
+			schedule_timeout_interruptible(1);
 
 			poll_bit ^= (mdio_read(net_dev, sis_priv->cur_phy, MII_STATUS) & poll_bit);
 			if (time_after_eq(jiffies, timeout)) {


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
