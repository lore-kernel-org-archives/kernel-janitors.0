From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 01 Feb 2017 08:52:15 +0000
Subject: [patch net-next] ethernet: aquantia: fix dma_mapping_error test
Message-Id: <20170201085215.GB31514@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, David VomLehn <vomlehn@texas.net>
Cc: Dmitry Bezrukov <Dmitry.Bezrukov@aquantia.com>, Pavel Belous <Pavel.Belous@aquantia.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

dma_mapping_error() returns 1 if there is an error and 0 if not.

Fixes: 018423e90bee ("net: ethernet: aquantia: Add ring support code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ring.c b/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
index 817c145520c8..dea9e9bbb8e7 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
@@ -298,9 +298,10 @@ int aq_ring_rx_fill(struct aq_ring_s *self)
 					buff->page, 0,
 					AQ_CFG_RX_FRAME_MAX, DMA_FROM_DEVICE);
 
-		err = dma_mapping_error(aq_nic_get_dev(self->aq_nic), buff->pa);
-		if (err < 0)
+		if (dma_mapping_error(aq_nic_get_dev(self->aq_nic), buff->pa)) {
+			err = -ENOMEM;
 			goto err_exit;
+		}
 
 		buff = NULL;
 	}
