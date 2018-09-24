From: Josh Abraham <j.abraham1776@gmail.com>
Date: Mon, 24 Sep 2018 01:29:03 +0000
Subject: [PATCH] scsi: ufs: use PTR_ERR_OR_ZERO in ufs_hisi_get_resource()
Message-Id: <20180924012903.GA24400@josh-ThinkPad-T460s>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180913030711.GA12975@josh-ThinkPad-T460s>
In-Reply-To: <20180913030711.GA12975@josh-ThinkPad-T460s>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vinholikatti@gmail.com
Cc: jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, j.abraham1776@gmail.com, kernel-janitors@vger.kernel.org

This patch uses PTR_ERR_OR_ZERO instead of IF_ERR() return PTR_ERR().

Signed-off-by: Joshua Abraham <j.abraham1776@gmail.com>
---
 drivers/scsi/ufs/ufs-hisi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-hisi.c b/drivers/scsi/ufs/ufs-hisi.c
index 46df707e6f2c..e79499469cb3 100644
--- a/drivers/scsi/ufs/ufs-hisi.c
+++ b/drivers/scsi/ufs/ufs-hisi.c
@@ -505,10 +505,8 @@ static int ufs_hisi_get_resource(struct ufs_hisi_host *host)
 	/* get resource of ufs sys ctrl */
 	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	host->ufs_sys_ctrl = devm_ioremap_resource(dev, mem_res);
-	if (IS_ERR(host->ufs_sys_ctrl))
-		return PTR_ERR(host->ufs_sys_ctrl);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(host->ufs_sys_ctrl);
 }
 
 static void ufs_hisi_set_pm_lvl(struct ufs_hba *hba)
-- 
2.17.1
