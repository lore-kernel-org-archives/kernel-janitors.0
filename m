From: Nicholas Mc Guire <der.herr@hofr.at>
Date: Mon, 16 Dec 2013 17:24:11 +0000
Subject: [PATCH 6/6] consolidate spin_lock/unlock waiting with spin_unlock_wait
Message-Id: <20131216172411.GG15665@opentech.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



cpmac.c:
consolidate spin_lock/unlock waiting with spin_unlock_wait()

config: ar7_defconfig (CONFIG_CPMAC=y)
toolchain: gcc-4.4-mips-linux-gnu (emdebian wheezy)

Builds cpmac.o with unrelated warnings.
drivers/net/ethernet/ti/cpmac.c: In function 'cpmac_start_xmit':
drivers/net/ethernet/ti/cpmac.c:570: warning: comparison of distinct pointer types lacks a cast
drivers/net/ethernet/ti/cpmac.c:1243:2: warning: #warning FIXME: unhardcode gpio&reset bits
No runtime tests (no hardware available)

CC: Florian Fainelli <florian@openwrt.org>
Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
---
 drivers/net/ethernet/ti/cpmac.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpmac.c b/drivers/net/ethernet/ti/cpmac.c
index 2dc16b6..e62f812 100644
--- a/drivers/net/ethernet/ti/cpmac.c
+++ b/drivers/net/ethernet/ti/cpmac.c
@@ -579,8 +579,7 @@ static int cpmac_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		return NETDEV_TX_BUSY;
 	}
 
-	spin_lock(&priv->lock);
-	spin_unlock(&priv->lock);
+	spin_unlock_wait(&priv->lock);
 	desc->dataflags = CPMAC_SOP | CPMAC_EOP | CPMAC_OWN;
 	desc->skb = skb;
 	desc->data_mapping = dma_map_single(&dev->dev, skb->data, len,
-- 
1.7.2.5

