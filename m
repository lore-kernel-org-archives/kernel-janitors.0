From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 17 Jul 2016 07:03:24 +0000
Subject: [PATCH] drivers: atm: nicstar: Use the correct function to free some resources
Message-Id: <1468739004-3471-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: 3chas3@gmail.com
Cc: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In 'get_scq', 'dma_alloc_coherent' has been used to allocate some
resources, so we need to free them using 'dma_free_coherent' instead
of 'kfree'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/atm/nicstar.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/atm/nicstar.c b/drivers/atm/nicstar.c
index ddc4ceb..700ed15 100644
--- a/drivers/atm/nicstar.c
+++ b/drivers/atm/nicstar.c
@@ -874,7 +874,8 @@ static scq_info *get_scq(ns_dev *card, int size, u32 scd)
 	scq->skb = kmalloc(sizeof(struct sk_buff *) *
 			   (size / NS_SCQE_SIZE), GFP_KERNEL);
 	if (!scq->skb) {
-		kfree(scq->org);
+		dma_free_coherent(&card->pcidev->dev,
+				  2 * size, scq->org, scq->dma);
 		kfree(scq);
 		return NULL;
 	}
-- 
2.7.4


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

