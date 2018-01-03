From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 Jan 2018 14:40:59 +0000
Subject: [PATCH] ps3_gelic_net: Delete an error message for a failed memory allocation in gelic_descr_prepare
Message-Id: <9613bfbf-11cc-1e66-484a-84fcda022861@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 Jan 2018 14:50:59 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index 88d74aef218a..644b875e324c 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -395,8 +395,6 @@ static int gelic_descr_prepare_rx(struct gelic_card *card,
 	descr->skb = dev_alloc_skb(bufsize + GELIC_NET_RXBUF_ALIGN - 1);
 	if (!descr->skb) {
 		descr->buf_addr = 0; /* tell DMAC don't touch memory */
-		dev_info(ctodev(card),
-			 "%s:allocate skb failed !!\n", __func__);
 		return -ENOMEM;
 	}
 	descr->buf_size = cpu_to_be32(bufsize);
-- 
2.15.1

