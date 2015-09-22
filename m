From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Sep 2015 12:32:07 +0000
Subject: [patch] cxlflash: a couple off by one bugs
Message-Id: <20150922123206.GC27407@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@odin.com>
Cc: "Manoj N. Kumar" <manoj@linux.vnet.ibm.com>, Wen Xiong <wenxiong@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>, "Matthew R. Ochs" <mrochs@linux.vnet.ibm.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

The "> MAX_CONTEXT" should be ">= MAX_CONTEXT".  Otherwise we go one
step beyond the end of the cfg->ctx_tbl[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/cxlflash/superpipe.c b/drivers/scsi/cxlflash/superpipe.c
index f1b62ce..05e0ecf 100644
--- a/drivers/scsi/cxlflash/superpipe.c
+++ b/drivers/scsi/cxlflash/superpipe.c
@@ -1315,7 +1315,7 @@ static int cxlflash_disk_attach(struct scsi_device *sdev,
 	}
 
 	ctxid = cxl_process_element(ctx);
-	if (unlikely((ctxid > MAX_CONTEXT) || (ctxid < 0))) {
+	if (unlikely((ctxid >= MAX_CONTEXT) || (ctxid < 0))) {
 		dev_err(dev, "%s: ctxid (%d) invalid!\n", __func__, ctxid);
 		rc = -EPERM;
 		goto err1;
@@ -1440,7 +1440,7 @@ static int recover_context(struct cxlflash_cfg *cfg, struct ctx_info *ctxi)
 	}
 
 	ctxid = cxl_process_element(ctx);
-	if (unlikely((ctxid > MAX_CONTEXT) || (ctxid < 0))) {
+	if (unlikely((ctxid >= MAX_CONTEXT) || (ctxid < 0))) {
 		dev_err(dev, "%s: ctxid (%d) invalid!\n", __func__, ctxid);
 		rc = -EPERM;
 		goto err1;
