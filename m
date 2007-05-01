From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 01 May 2007 16:43:27 +0000
Subject: [KJ] [PATCH] drivers/net/dm9000: Convert to generic boolean
Message-Id: <20070501164058.5121.57783.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tori@unhappy.mine.nu
Cc: netdev@vger.kernel.org, kernel-janitors@lists.osdl.org, Richard Knutsson <ricknu-0@student.ltu.se>

Convert to generic boolean.

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---
Compile-tested with all(yes|mod|no)config on x86(|_64) & sparc(|64)
Diffed against Linus' git-tree.


diff --git a/drivers/net/dm9000.c b/drivers/net/dm9000.c
index 8cc1174..6fb3815 100644
--- a/drivers/net/dm9000.c
+++ b/drivers/net/dm9000.c
@@ -77,9 +77,6 @@
 
 #define DM9000_PHY		0x40	/* PHY address 0x01 */
 
-#define TRUE			1
-#define FALSE			0
-
 #define CARDNAME "dm9000"
 #define PFX CARDNAME ": "
 
@@ -896,7 +893,7 @@ dm9000_rx(struct net_device *dev)
 	struct dm9000_rxhdr rxhdr;
 	struct sk_buff *skb;
 	u8 rxbyte, *rdptr;
-	int GoodPacket;
+	bool GoodPacket;
 	int RxLen;
 
 	/* Check packet ready or not */
@@ -918,7 +915,7 @@ dm9000_rx(struct net_device *dev)
 			return;
 
 		/* A packet ready now  & Get status/length */
-		GoodPacket = TRUE;
+		GoodPacket = true;
 		writeb(DM9000_MRCMD, db->io_addr);
 
 		(db->inblk)(db->io_data, &rxhdr, sizeof(rxhdr));
@@ -927,7 +924,7 @@ dm9000_rx(struct net_device *dev)
 
 		/* Packet Status check */
 		if (RxLen < 0x40) {
-			GoodPacket = FALSE;
+			GoodPacket = false;
 			PRINTK1("Bad Packet received (runt)\n");
 		}
 
@@ -936,7 +933,7 @@ dm9000_rx(struct net_device *dev)
 		}
 
 		if (rxhdr.RxStatus & 0xbf00) {
-			GoodPacket = FALSE;
+			GoodPacket = false;
 			if (rxhdr.RxStatus & 0x100) {
 				PRINTK1("fifo error\n");
 				db->stats.rx_fifo_errors++;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
