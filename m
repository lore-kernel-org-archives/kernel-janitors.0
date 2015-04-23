From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 05:34:03 +0000
Subject: [PATCH 13/15] block: Do not do pointless kmalloc return value cast in cciss driver.
Message-Id: <1429767245-32453-14-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There's no need to cast the, void *, return value of kmalloc() when
assigning to a pointer variable in drivers/block/cciss_scsi.c::
cciss_scsi_setup.

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 drivers/block/cciss_scsi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/block/cciss_scsi.c b/drivers/block/cciss_scsi.c
index ecd845c..6e17d47 100644
--- a/drivers/block/cciss_scsi.c
+++ b/drivers/block/cciss_scsi.c
@@ -704,8 +704,7 @@ cciss_scsi_setup(ctlr_info_t *h)
 	struct cciss_scsi_adapter_data_t * shba;
 
 	ccissscsi[h->ctlr].ndevices = 0;
-	shba = (struct cciss_scsi_adapter_data_t *)
-		kmalloc(sizeof(*shba), GFP_KERNEL);	
+	shba = kmalloc(sizeof(*shba), GFP_KERNEL);
 	if (shba = NULL)
 		return;
 	shba->scsi_host = NULL;
-- 
2.1.0

