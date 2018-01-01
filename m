From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 Jan 2018 17:18:52 +0000
Subject: [PATCH] LiquidIO: Delete two error messages for a failed memory allocation in octeon_setup_interrupt
Message-Id: <94411e3f-3709-3b76-537d-d189cf14cdb4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Derek Chickles <derek.chickles@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, Satanand Burla <satananda.burla@caviumnetworks.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 Jan 2018 18:14:49 +0100

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/cavium/liquidio/lio_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_core.c b/drivers/net/ethernet/cavium/liquidio/lio_core.c
index 32ae63b6f20e..012829de76b7 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_core.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_core.c
@@ -915,10 +915,8 @@ int octeon_setup_interrupt(struct octeon_device *oct, u32 num_ioqs)
 		/* allocate storage for the names assigned to each irq */
 		oct->irq_name_storage  			kcalloc(num_interrupts, INTRNAMSIZ, GFP_KERNEL);
-		if (!oct->irq_name_storage) {
-			dev_err(&oct->pci_dev->dev, "Irq name storage alloc failed...\n");
+		if (!oct->irq_name_storage)
 			return -ENOMEM;
-		}
 
 		queue_irq_names = oct->irq_name_storage;
 
@@ -930,7 +928,6 @@ int octeon_setup_interrupt(struct octeon_device *oct, u32 num_ioqs)
 					    sizeof(struct msix_entry),
 					    GFP_KERNEL);
 		if (!oct->msix_entries) {
-			dev_err(&oct->pci_dev->dev, "Memory Alloc failed...\n");
 			kfree(oct->irq_name_storage);
 			oct->irq_name_storage = NULL;
 			return -ENOMEM;
-- 
2.15.1

