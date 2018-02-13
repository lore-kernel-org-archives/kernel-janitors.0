From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Feb 2018 20:26:32 +0000
Subject: [PATCH 2/2] dma/ppc4xx: Improve a size determination in ppc440spe_adma_alloc_chan_resources()
Message-Id: <f6cc6095-0ec6-e9c4-176a-cd6af8c7ec4b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Feb 2018 20:54:30 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/ppc4xx/adma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index f4033367d59b..27ea48a2c1dc 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -1795,8 +1795,7 @@ static int ppc440spe_adma_alloc_chan_resources(struct dma_chan *chan)
 		db_sz = sizeof(struct xor_cb);
 
 	for (; i < (ppc440spe_chan->device->pool_size / db_sz); i++) {
-		slot = kzalloc(sizeof(struct ppc440spe_adma_desc_slot),
-			       GFP_KERNEL);
+		slot = kzalloc(sizeof(*slot), GFP_KERNEL);
 		if (!slot) {
 			printk(KERN_INFO "SPE ADMA Channel only initialized"
 				" %d descriptor slots", i--);
-- 
2.16.1

