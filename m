From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 15 Sep 2017 19:56:08 +0000
Subject: [PATCH] scsi: fdomain: Fix a resource leak in an error handling path in '__fdomain_16x0_detect()'
Message-Id: <20170915195608.26865-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: faith@cs.unc.edu, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

All error handling paths 'goto fail' in this function.
If 'scsi_register()' fails, we should also go there, otherwise a
'pci_dev_put(pdev)' will be missing.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
In order to keep consistance with the rest of the file, I've ignored
checkpatch warnings about spaces vs tabs and indent.
---
 drivers/scsi/fdomain.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/fdomain.c b/drivers/scsi/fdomain.c
index ebbe5a3e665d..0dac03a9c6ed 100644
--- a/drivers/scsi/fdomain.c
+++ b/drivers/scsi/fdomain.c
@@ -960,10 +960,9 @@ struct Scsi_Host *__fdomain_16x0_detect(struct scsi_host_template *tpnt )
    get resources.  */
 
    shpnt = scsi_register( tpnt, 0 );
-   if(shpnt = NULL) {
-	release_region(port_base, 0x10);
-   	return NULL;
-   }
+   if (shpnt = NULL)
+      goto fail;
+
    shpnt->irq = interrupt_level;
    shpnt->io_port = port_base;
    shpnt->n_io_port = 0x10;
-- 
2.11.0

