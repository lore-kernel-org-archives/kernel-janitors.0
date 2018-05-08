From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 08 May 2018 06:39:47 +0000
Subject: [PATCH] net: aquantia: Fix an error handling path in 'aq_pci_probe()'
Message-Id: <20180508063947.11317-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, igor.russkikh@aquantia.com, pavel.belous@aquantia.com, weiyongjun1@huawei.com, dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The position of 2 labels should be swapped in order to release resources
in the correct order and avoid leaks.

Fixes: 23ee07ad3c2f ("net: aquantia: Cleanup pci functions module")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
The order of 'pci_release_regions()' and 'free_netdev()' is in reverse
order in the 'aq_pci_remove()' function.
I don't know if done on purpose and/or needed, so I've left it as-is.
---
 drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
index ecc6306f940f..b7f6b5a68b33 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
@@ -298,9 +298,9 @@ static int aq_pci_probe(struct pci_dev *pdev,
 	kfree(self->aq_hw);
 err_ioremap:
 	free_netdev(ndev);
-err_pci_func:
-	pci_release_regions(pdev);
 err_ndev:
+	pci_release_regions(pdev);
+err_pci_func:
 	pci_disable_device(pdev);
 	return err;
 }
-- 
2.17.0

