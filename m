From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Dec 2018 19:41:46 +0000
Subject: [PATCH][V2] drivers/net: appletalk/cops: remove redundant if statement and mask
Message-Id: <20181224194146.11511-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The two different assignments for pkt_len are actually the same and
so the if statement is redundant and can be removed.  Masking a u8
return value from inb() with 0xFF is also redundant and can also be
emoved.

Similarly, the two different outb calls are identical as the mask
of 0xff on the second outb is redundant since a u8 is being written,
so the if statement is also redundant and can be also removed.

Detected by CoverityScan, CID#1475639 ("Identical code for different
branches")

---

V2: Remove the if statement for the outb calls, thanks to David
Miller for spotting this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/appletalk/cops.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/net/appletalk/cops.c b/drivers/net/appletalk/cops.c
index bb49f6e40a19..494663a18ce0 100644
--- a/drivers/net/appletalk/cops.c
+++ b/drivers/net/appletalk/cops.c
@@ -777,10 +777,7 @@ static void cops_rx(struct net_device *dev)
         }
 
         /* Get response length. */
-	if(lp->board=DAYNA)
-        	pkt_len = inb(ioaddr) & 0xFF;
-	else
-		pkt_len = inb(ioaddr) & 0x00FF;
+	pkt_len = inb(ioaddr);
         pkt_len |= (inb(ioaddr) << 8);
         /* Input IO code. */
         rsp_type=inb(ioaddr);
@@ -892,10 +889,7 @@ static netdev_tx_t cops_send_packet(struct sk_buff *skb,
 
 	/* Output IO length. */
 	outb(skb->len, ioaddr);
-	if(lp->board = DAYNA)
-               	outb(skb->len >> 8, ioaddr);
-	else
-		outb((skb->len >> 8)&0x0FF, ioaddr);
+	outb(skb->len >> 8, ioaddr);
 
 	/* Output IO code. */
 	outb(LAP_WRITE, ioaddr);
-- 
2.19.1
