From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 Dec 2020 11:01:44 +0000
Subject: [PATCH net] atm: idt77252: call pci_disable_device() on error path
Message-Id: <X93dmC4NX0vbTpGp@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>
Cc: chas williams - CONTRACTOR <chas@cmf.nrl.navy.mil>, "David S. Miller" <davem@davemloft.net>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This error path needs to disable the pci device before returning.

Fixes: ede58ef28e10 ("atm: remove deprecated use of pci api")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/atm/idt77252.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/atm/idt77252.c b/drivers/atm/idt77252.c
index 65a3886f68c9..5f0472c18bcb 100644
--- a/drivers/atm/idt77252.c
+++ b/drivers/atm/idt77252.c
@@ -3607,7 +3607,7 @@ static int idt77252_init_one(struct pci_dev *pcidev,
 
 	if ((err = dma_set_mask_and_coherent(&pcidev->dev, DMA_BIT_MASK(32)))) {
 		printk("idt77252: can't enable DMA for PCI device at %s\n", pci_name(pcidev));
-		return err;
+		goto err_out_disable_pdev;
 	}
 
 	card = kzalloc(sizeof(struct idt77252_dev), GFP_KERNEL);
-- 
2.29.2
