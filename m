From: Po Liu <Po.Liu@nxp.com>
Date: Thu, 07 May 2020 10:57:38 +0000
Subject: [net-next] net:enetc: bug fix for qos sfi operate space after freed
Message-Id: <20200507105738.29961-1-Po.Liu@nxp.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, dan.carpenter@oracle.com
Cc: davem@davemloft.net, claudiu.manoil@nxp.com, Po Liu <Po.Liu@nxp.com>

'Dan Carpenter' reported:
This code frees "sfi" and then dereferences it on the next line:
>                 kfree(sfi);
>                 clear_bit(sfi->index, epsfp.psfp_sfi_bitmap);

This "sfi->index" should be "index".

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Po Liu <Po.Liu@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc_qos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_qos.c b/drivers/net/ethernet/freescale/enetc/enetc_qos.c
index 48e589e9d0f7..77f110e24505 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_qos.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_qos.c
@@ -903,7 +903,7 @@ static void stream_filter_unref(struct enetc_ndev_priv *priv, u32 index)
 		enetc_streamfilter_hw_set(priv, sfi, false);
 		hlist_del(&sfi->node);
 		kfree(sfi);
-		clear_bit(sfi->index, epsfp.psfp_sfi_bitmap);
+		clear_bit(index, epsfp.psfp_sfi_bitmap);
 	}
 }
 
-- 
2.17.1
