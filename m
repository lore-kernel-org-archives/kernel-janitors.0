From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 17 Jul 2017 17:42:41 +0000
Subject: [PATCH] atm: zatm: Fix an error handling path in 'zatm_init_one()'
Message-Id: <20170717174241.18935-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 3chas3@gmail.com
Cc: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'dma_set_mask_and_coherent()' fails, we must undo the previous
'pci_request_regions()' call.
Adjust corresponding 'goto' to jump at the right place of the error
handling path.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/atm/zatm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/atm/zatm.c b/drivers/atm/zatm.c
index 292dec18ffb8..07bdd51b3b9a 100644
--- a/drivers/atm/zatm.c
+++ b/drivers/atm/zatm.c
@@ -1613,7 +1613,7 @@ static int zatm_init_one(struct pci_dev *pci_dev,
 
 	ret = dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(32));
 	if (ret < 0)
-		goto out_disable;
+		goto out_release;
 
 	zatm_dev->pci_dev = pci_dev;
 	dev->dev_data = zatm_dev;
-- 
2.11.0

