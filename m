From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 15 Aug 2017 20:18:14 +0000
Subject: [PATCH] scsi: cxlflash: Fix an error handling path in 'cxlflash_disk_attach()'
Message-Id: <20170815201814.12929-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: manoj@linux.vnet.ibm.com, mrochs@linux.vnet.ibm.com, ukrishn@linux.vnet.ibm.com, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'rc' is known to be 0 at this point.
If 'create_context()' fails, returns -ENOMEM instead of 0 which means
success.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/scsi/cxlflash/superpipe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/cxlflash/superpipe.c b/drivers/scsi/cxlflash/superpipe.c
index ad0f9968ccfb..08da593cb2f6 100644
--- a/drivers/scsi/cxlflash/superpipe.c
+++ b/drivers/scsi/cxlflash/superpipe.c
@@ -1390,6 +1390,7 @@ static int cxlflash_disk_attach(struct scsi_device *sdev,
 	if (unlikely(!ctxi)) {
 		dev_err(dev, "%s: Failed to create context ctxid=%d\n",
 			__func__, ctxid);
+		rc = -ENOMEM;
 		goto err;
 	}
 
-- 
2.11.0

