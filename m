From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:03 +0000
Subject: [PATCH 10/39] atm: he: drop null test before destroy functions
Message-Id: <1442146532-9100-11-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression x; @@
-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/atm/he.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/atm/he.c b/drivers/atm/he.c
index a8da3a5..0f5cb37 100644
--- a/drivers/atm/he.c
+++ b/drivers/atm/he.c
@@ -1578,9 +1578,7 @@ he_stop(struct he_dev *he_dev)
 
 	kfree(he_dev->rbpl_virt);
 	kfree(he_dev->rbpl_table);
-
-	if (he_dev->rbpl_pool)
-		dma_pool_destroy(he_dev->rbpl_pool);
+	dma_pool_destroy(he_dev->rbpl_pool);
 
 	if (he_dev->rbrq_base)
 		dma_free_coherent(&he_dev->pci_dev->dev, CONFIG_RBRQ_SIZE * sizeof(struct he_rbrq),
@@ -1594,8 +1592,7 @@ he_stop(struct he_dev *he_dev)
 		dma_free_coherent(&he_dev->pci_dev->dev, CONFIG_TBRQ_SIZE * sizeof(struct he_tbrq),
 				  he_dev->tpdrq_base, he_dev->tpdrq_phys);
 
-	if (he_dev->tpd_pool)
-		dma_pool_destroy(he_dev->tpd_pool);
+	dma_pool_destroy(he_dev->tpd_pool);
 
 	if (he_dev->pci_dev) {
 		pci_read_config_word(he_dev->pci_dev, PCI_COMMAND, &command);

