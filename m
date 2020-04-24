From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 24 Apr 2020 15:45:27 +0000
Subject: [PATCH v2] ipw2x00: Remove a memory allocation failure log message
Message-Id: <20200424154527.27309-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stas.yakovlev@gmail.com, kvalo@codeaurora.org, davem@davemloft.net
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Axe a memory allocation failure log message. This message is useless and
incorrect (vmalloc is not used here for the memory allocation)

This has been like that since the very beginning of this driver in
commit 43f66a6ce8da ("Add ipw2200 wireless driver.")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: remove a useless empty line
---
 drivers/net/wireless/intel/ipw2x00/ipw2200.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2200.c b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
index 60b5e08dd6df..30c4f041f565 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2200.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
@@ -3770,10 +3770,8 @@ static int ipw_queue_tx_init(struct ipw_priv *priv,
 	struct pci_dev *dev = priv->pci_dev;
 
 	q->txb = kmalloc_array(count, sizeof(q->txb[0]), GFP_KERNEL);
-	if (!q->txb) {
-		IPW_ERROR("vmalloc for auxiliary BD structures failed\n");
+	if (!q->txb)
 		return -ENOMEM;
-	}
 
 	q->bd  	    pci_alloc_consistent(dev, sizeof(q->bd[0]) * count, &q->q.dma_addr);
-- 
2.20.1
