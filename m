From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 28 Feb 2020 21:59:48 +0000
Subject: [PATCH] scsi: aha1740: Fix an errro handling path in 'aha1740_probe()'
Message-Id: <20200228215948.7473-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jejb@linux.ibm.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'dma_map_single()' fails, the ref counted 'shpnt' will be decremented
twice because 'scsi_host_put()' is called in the if block, and in the
error handling path.

Axe one of these calls.

Fixes: 1dc09e120c83 ("scsi: aha1740: stop using scsi_unregister")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/scsi/aha1740.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/aha1740.c b/drivers/scsi/aha1740.c
index da4150c17781..5a227c03895f 100644
--- a/drivers/scsi/aha1740.c
+++ b/drivers/scsi/aha1740.c
@@ -592,7 +592,6 @@ static int aha1740_probe (struct device *dev)
 					     DMA_BIDIRECTIONAL);
 	if (!host->ecb_dma_addr) {
 		printk (KERN_ERR "aha1740_probe: Couldn't map ECB, giving up\n");
-		scsi_host_put (shpnt);
 		goto err_host_put;
 	}
 	
-- 
2.20.1
