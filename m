From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Feb 2021 09:49:44 +0000
Subject: [PATCH] net: dwc-xlgmac: Fix spelling mistake in function name
Message-Id: <20210204094944.51460-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jose Abreu <Jose.Abreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the function name alloc_channles_and_rings.
Fix this by renaming it to alloc_channels_and_rings.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/synopsys/dwc-xlgmac-desc.c | 2 +-
 drivers/net/ethernet/synopsys/dwc-xlgmac-net.c  | 2 +-
 drivers/net/ethernet/synopsys/dwc-xlgmac.h      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/synopsys/dwc-xlgmac-desc.c b/drivers/net/ethernet/synopsys/dwc-xlgmac-desc.c
index 8c4195a9a2cc..589797bad1f9 100644
--- a/drivers/net/ethernet/synopsys/dwc-xlgmac-desc.c
+++ b/drivers/net/ethernet/synopsys/dwc-xlgmac-desc.c
@@ -634,7 +634,7 @@ static int xlgmac_map_tx_skb(struct xlgmac_channel *channel,
 
 void xlgmac_init_desc_ops(struct xlgmac_desc_ops *desc_ops)
 {
-	desc_ops->alloc_channles_and_rings = xlgmac_alloc_channels_and_rings;
+	desc_ops->alloc_channels_and_rings = xlgmac_alloc_channels_and_rings;
 	desc_ops->free_channels_and_rings = xlgmac_free_channels_and_rings;
 	desc_ops->map_tx_skb = xlgmac_map_tx_skb;
 	desc_ops->map_rx_buffer = xlgmac_map_rx_buffer;
diff --git a/drivers/net/ethernet/synopsys/dwc-xlgmac-net.c b/drivers/net/ethernet/synopsys/dwc-xlgmac-net.c
index 26aa7f32151f..26d178f8616b 100644
--- a/drivers/net/ethernet/synopsys/dwc-xlgmac-net.c
+++ b/drivers/net/ethernet/synopsys/dwc-xlgmac-net.c
@@ -654,7 +654,7 @@ static int xlgmac_open(struct net_device *netdev)
 	pdata->rx_buf_size = ret;
 
 	/* Allocate the channels and rings */
-	ret = desc_ops->alloc_channles_and_rings(pdata);
+	ret = desc_ops->alloc_channels_and_rings(pdata);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/ethernet/synopsys/dwc-xlgmac.h b/drivers/net/ethernet/synopsys/dwc-xlgmac.h
index cab3e40a86b9..8598aaf3ec99 100644
--- a/drivers/net/ethernet/synopsys/dwc-xlgmac.h
+++ b/drivers/net/ethernet/synopsys/dwc-xlgmac.h
@@ -379,7 +379,7 @@ struct xlgmac_channel {
 } ____cacheline_aligned;
 
 struct xlgmac_desc_ops {
-	int (*alloc_channles_and_rings)(struct xlgmac_pdata *pdata);
+	int (*alloc_channels_and_rings)(struct xlgmac_pdata *pdata);
 	void (*free_channels_and_rings)(struct xlgmac_pdata *pdata);
 	int (*map_tx_skb)(struct xlgmac_channel *channel,
 			  struct sk_buff *skb);
-- 
2.29.2
