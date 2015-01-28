From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 28 Jan 2015 10:22:08 +0000
Subject: [PATCH] scsi: missing iounmap for mvi->regs_ex
Message-Id: <20150128102208.GA16509@devel.8.8.4.4>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JBottomley@parallels.com
Cc: hch@lst.de, hare@suse.de, michaelc@cs.wisc.edu, martin.petersen@oracle.com, daeseok.youn@gmail.com, ben@decadent.org.uk, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It also need to call iounmap() when it fails to get res_start and
res_len from pci_resource_start{len}(pdev, bar).

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/scsi/mvsas/mv_init.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/mvsas/mv_init.c b/drivers/scsi/mvsas/mv_init.c
index 53030b0..2508db2 100644
--- a/drivers/scsi/mvsas/mv_init.c
+++ b/drivers/scsi/mvsas/mv_init.c
@@ -348,15 +348,15 @@ int mvs_ioremap(struct mvs_info *mvi, int bar, int bar_ex)
 	else
 		mvi->regs = ioremap_nocache(res_start, res_len);
 
-	if (!mvi->regs) {
-		if (mvi->regs_ex && (res_flag_ex & IORESOURCE_MEM))
-			iounmap(mvi->regs_ex);
-		mvi->regs_ex = NULL;
+	if (!mvi->regs)
 		goto err_out;
-	}
 
 	return 0;
 err_out:
+	if (mvi->regs_ex && (res_flag_ex & IORESOURCE_MEM))
+		iounmap(mvi->regs_ex);
+	mvi->regs_ex = NULL;
+
 	return -1;
 }
 
-- 
1.7.1

