From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 May 2020 20:47:21 +0000
Subject: [PATCH net-next] enetc: Fix use after free in stream_filter_unref()
Message-Id: <20200505204721.GA51853@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Claudiu Manoil <claudiu.manoil@nxp.com>, Po Liu <Po.Liu@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This code frees "sfi" and then dereferences it on the next line.

Fixes: 888ae5a3952b ("net: enetc: add tc flower psfp offload driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/freescale/enetc/enetc_qos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_qos.c b/drivers/net/ethernet/freescale/enetc/enetc_qos.c
index 48e589e9d0f7c..10d79eb46c2e8 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_qos.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_qos.c
@@ -902,8 +902,8 @@ static void stream_filter_unref(struct enetc_ndev_priv *priv, u32 index)
 	if (z) {
 		enetc_streamfilter_hw_set(priv, sfi, false);
 		hlist_del(&sfi->node);
-		kfree(sfi);
 		clear_bit(sfi->index, epsfp.psfp_sfi_bitmap);
+		kfree(sfi);
 	}
 }
 
-- 
2.26.2
