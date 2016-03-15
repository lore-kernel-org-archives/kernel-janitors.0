From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Mar 2016 07:19:04 +0000
Subject: [patch 2/2 net-next] mediatek: unlock on error in mtk_tx_map()
Message-Id: <20160315071904.GI13560@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd@openwrt.org>, John Crispin <blogic@openwrt.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org

There was a missing unlock on the error path.

Fixes: 656e705243fd ('net-next: mediatek: add support for MT7623 ethernet')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 9759fe5..c2c2e206 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -661,6 +661,8 @@ err_dma:
 		itxd = mtk_qdma_phys_to_virt(ring, itxd->txd2);
 	} while (itxd != txd);
 
+	spin_unlock_irqrestore(&eth->page_lock, flags);
+
 	return -ENOMEM;
 }
 
