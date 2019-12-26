From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 26 Dec 2019 15:33:35 +0000
Subject: [PATCH] scsi: aha1740: avoid a duplicated 'scsi_host_put()' call
Message-Id: <20191226153335.9151-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jejb@linux.ibm.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'dma_map_single()' fails, 'scsi_host_put (shpnt)' will be called twice.
Once in the 'if' block, and once in the error handling path.
Axe one of this call.

Fixes: 1dc09e120c83 ("scsi: aha1740: stop using scsi_unregister")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I'm not sure of the commit used in the Fixes tag. This commit has made
obvious the redundant scsi_host_put call, but it was already hidden in
'scsi_unregister()' ('scsi_unregister()' is not part of the kernel anymore,
but see 4.8.17 for example:
https://elixir.bootlin.com/linux/v4.8.17/source/drivers/scsi/hosts.c#L552)
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
