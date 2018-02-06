From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 06 Feb 2018 20:17:17 +0000
Subject: [PATCH] cxgb4: Fix error handling path in 'init_one()'
Message-Id: <20180206201717.27412-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: ganeshgr@chelsio.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Commit baf5086840ab1 ("cxgb4: restructure VF mgmt code") has reordered
some code but an error handling label has not been updated accordingly.
So fix it and free 'adapter' if 't4_wait_dev_ready()' fails.

Fixes: baf5086840ab1 ("cxgb4: restructure VF mgmt code")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
index 725643b4a8ab..79bffaa3c1af 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
@@ -5125,7 +5125,7 @@ static int init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	adapter->regs = regs;
 	err = t4_wait_dev_ready(regs);
 	if (err < 0)
-		goto out_unmap_bar0;
+		goto out_free_adapter;
 
 	/* We control everything through one PF */
 	whoami = readl(regs + PL_WHOAMI_A);
-- 
2.14.1


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

