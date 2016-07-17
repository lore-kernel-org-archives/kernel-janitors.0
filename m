From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 17 Jul 2016 06:15:50 +0000
Subject: [PATCH] net: ti: cpmac: Use the correct function to free some resources.
Message-Id: <1468736150-30111-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: florian@openwrt.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In 'cpmac_open', 'dma_alloc_coherent' has been used to allocate some
resources, so we need to free them using 'dma_free_coherent' instead
of 'kfree'.

Also, we don't need to free these resources if the allocation has failed.
So I have slighly modified the goto label in this case.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

---
Un-compiled (I don't have the configuration for that) and un-tested
---
 drivers/net/ethernet/ti/cpmac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/cpmac.c b/drivers/net/ethernet/ti/cpmac.c
index 7eef45e..56c8920 100644
--- a/drivers/net/ethernet/ti/cpmac.c
+++ b/drivers/net/ethernet/ti/cpmac.c
@@ -1032,8 +1032,10 @@ fail_desc:
 			kfree_skb(priv->rx_head[i].skb);
 		}
 	}
+	dma_free_coherent(&dev->dev, sizeof(struct cpmac_desc) * size,
+			  priv->desc_ring, priv->dma_ring);
+
 fail_alloc:
-	kfree(priv->desc_ring);
 	iounmap(priv->regs);
 
 fail_remap:
-- 
2.7.4


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

