From: Dan Carpenter <error27@gmail.com>
Date: Wed, 13 Oct 2010 19:19:55 +0000
Subject: [patch] gianfar: fix double lock typo
Message-Id: <20101013191954.GE6060@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sandeep Gopalpet <Sandeep.Kumar@freescale.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This should be a _restore() instead of a _save().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/gianfar_ethtool.c b/drivers/net/gianfar_ethtool.c
index ae8e5d3..5c566eb 100644
--- a/drivers/net/gianfar_ethtool.c
+++ b/drivers/net/gianfar_ethtool.c
@@ -538,7 +538,7 @@ static int gfar_set_rx_csum(struct net_device *dev, uint32_t data)
 
 		unlock_tx_qs(priv);
 		unlock_rx_qs(priv);
-		local_irq_save(flags);
+		local_irq_restore(flags);
 
 		for (i = 0; i < priv->num_rx_queues; i++)
 			gfar_clean_rx_ring(priv->rx_queue[i],
