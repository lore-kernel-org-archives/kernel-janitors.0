From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 24 Nov 2018 10:47:58 +0000
Subject: [PATCH v2 -next] scsi: dpt_i2o: remove set but not used variable 'pHba'
Message-Id: <1543056478-66284-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/dpt_i2o.c: In function 'adpt_slave_configure':
drivers/scsi/dpt_i2o.c:414:12: warning:
 variable 'pHba' set but not used [-Wunused-but-set-variable]

It never used since git history start.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2:fix patch title
---
 drivers/scsi/dpt_i2o.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/dpt_i2o.c b/drivers/scsi/dpt_i2o.c
index d5a474d..be6f3db 100644
--- a/drivers/scsi/dpt_i2o.c
+++ b/drivers/scsi/dpt_i2o.c
@@ -411,9 +411,6 @@ static void adpt_inquiry(adpt_hba* pHba)
 static int adpt_slave_configure(struct scsi_device * device)
 {
 	struct Scsi_Host *host = device->host;
-	adpt_hba* pHba;
-
-	pHba = (adpt_hba *) host->hostdata[0];
 
 	if (host->can_queue && device->tagged_supported) {
 		scsi_change_queue_depth(device,
