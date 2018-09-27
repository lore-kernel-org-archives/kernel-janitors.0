From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 27 Sep 2018 13:32:10 +0000
Subject: [PATCH -next] scsi: ufs-qcom: Remove set but not used variable 'val'
Message-Id: <1538055130-40899-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/ufs/ufs-qcom.c: In function 'ufs_qcom_pwr_change_notify':
drivers/scsi/ufs/ufs-qcom.c:919:6: warning:
 variable 'val' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/ufs/ufs-qcom.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 3dc4501c..0fe957d 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -916,7 +916,6 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 				struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
-	u32 val;
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct ufs_qcom_dev_params ufs_qcom_cap;
 	int ret = 0;
@@ -985,8 +984,6 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 			ret = -EINVAL;
 		}
 
-		val = ~(MAX_U32 << dev_req_params->lane_tx);
-
 		/* cache the power mode parameters to use internally */
 		memcpy(&host->dev_req_params,
 				dev_req_params, sizeof(*dev_req_params));
