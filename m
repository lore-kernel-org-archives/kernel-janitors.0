From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 19 Nov 2018 02:11:08 +0000
Subject: [PATCH -next] [SCSI] initio: remove set but not used variable 'prev'
Message-Id: <1542593468-169769-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/initio.c: In function 'initio_find_busy_scb':
drivers/scsi/initio.c:883:30: warning:
 variable 'prev' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit 72d39fea9017 ("[SCSI] initio:
Convert into a real Linux driver and update to modern style")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/initio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/initio.c b/drivers/scsi/initio.c
index 0a8d786c..acef1f2 100644
--- a/drivers/scsi/initio.c
+++ b/drivers/scsi/initio.c
@@ -880,17 +880,15 @@ static void initio_unlink_busy_scb(struct initio_host * host, struct scsi_ctrl_b
 
 struct scsi_ctrl_blk *initio_find_busy_scb(struct initio_host * host, u16 tarlun)
 {
-	struct scsi_ctrl_blk *tmp, *prev;
+	struct scsi_ctrl_blk *tmp;
 	u16 scbp_tarlun;
 
-
-	prev = tmp = host->first_busy;
+	tmp = host->first_busy;
 	while (tmp != NULL) {
 		scbp_tarlun = (tmp->lun << 8) | (tmp->target);
 		if (scbp_tarlun = tarlun) {	/* Unlink this SCB              */
 			break;
 		}
-		prev = tmp;
 		tmp = tmp->next;
 	}
 #if DEBUG_QUEUE
