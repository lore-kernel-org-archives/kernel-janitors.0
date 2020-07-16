From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 16 Jul 2020 20:52:42 +0000
Subject: [PATCH] net: alteon: Avoid some useless memset
Message-Id: <20200716205242.326486-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, kuba@kernel.org, jes@trained-monkey.org
Cc: linux-acenic@sunsite.dk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Avoid a memset after a call to 'dma_alloc_coherent()'.
This is useless since
commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")

Replace a kmalloc+memset with a corresponding kzalloc.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/alteon/acenic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/alteon/acenic.c b/drivers/net/ethernet/alteon/acenic.c
index 99431c9a899b..ac86fcae1582 100644
--- a/drivers/net/ethernet/alteon/acenic.c
+++ b/drivers/net/ethernet/alteon/acenic.c
@@ -1151,7 +1151,7 @@ static int ace_init(struct net_device *dev)
 	/*
 	 * Get the memory for the skb rings.
 	 */
-	if (!(ap->skb = kmalloc(sizeof(struct ace_skb), GFP_KERNEL))) {
+	if (!(ap->skb = kzalloc(sizeof(struct ace_skb), GFP_KERNEL))) {
 		ecode = -EAGAIN;
 		goto init_error;
 	}
@@ -1172,9 +1172,6 @@ static int ace_init(struct net_device *dev)
 	ap->last_mini_rx = 0;
 #endif
 
-	memset(ap->info, 0, sizeof(struct ace_info));
-	memset(ap->skb, 0, sizeof(struct ace_skb));
-
 	ecode = ace_load_firmware(dev);
 	if (ecode)
 		goto init_error;
-- 
2.25.1
