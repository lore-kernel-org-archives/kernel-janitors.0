From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Dec 2018 16:58:41 +0000
Subject: [PATCH] drivers/net: appletalk/cops: remove redundant if statement and mask
Message-Id: <20181222165841.18288-1-colin.king@canonical.com>
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
emoved.  Remove the redundant code.

Detected by CoverityScan, CID#1475639 ("Identical code for different
branches")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/appletalk/cops.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/appletalk/cops.c b/drivers/net/appletalk/cops.c
index bb49f6e40a19..64c74002fe8b 100644
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
-- 
2.19.1
