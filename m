From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Dec 2019 10:48:28 +0000
Subject: [PATCH 1/2] scsi: ufs: Unlock on a couple error paths
Message-Id: <20191213104828.7i64cpoof26rc4fw@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>
Cc: Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bean Huo <beanhuo@micron.com>, Stanley Chu <stanley.chu@mediatek.com>, Can Guo <cang@codeaurora.org>, Venkat Gopalakrishnan <venkatg@codeaurora.org>, Tomas Winkler <tomas.winkler@intel.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

We introduced a few new error paths, but we can't return directly, we
first have to unlock "hba->clk_scaling_lock" first.

Fixes: a276c19e3e98 ("scsi: ufs: Avoid busy-waiting by eliminating tag conflicts")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/ufs/ufshcd.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index e5cd57e68c46..bf981f0ea74c 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -2617,8 +2617,10 @@ static int ufshcd_exec_dev_cmd(struct ufs_hba *hba,
 	 * the maximum wait time is bounded by SCSI request timeout.
 	 */
 	req = blk_get_request(q, REQ_OP_DRV_OUT, 0);
-	if (IS_ERR(req))
-		return PTR_ERR(req);
+	if (IS_ERR(req)) {
+		err = PTR_ERR(req);
+		goto out_unlock;
+	}
 	tag = req->tag;
 	WARN_ON_ONCE(!ufshcd_valid_tag(hba, tag));
 
@@ -2646,6 +2648,7 @@ static int ufshcd_exec_dev_cmd(struct ufs_hba *hba,
 
 out_put_tag:
 	blk_put_request(req);
+out_unlock:
 	up_read(&hba->clk_scaling_lock);
 	return err;
 }
@@ -5854,8 +5857,10 @@ static int ufshcd_issue_devman_upiu_cmd(struct ufs_hba *hba,
 	down_read(&hba->clk_scaling_lock);
 
 	req = blk_get_request(q, REQ_OP_DRV_OUT, 0);
-	if (IS_ERR(req))
-		return PTR_ERR(req);
+	if (IS_ERR(req)) {
+		err = PTR_ERR(req);
+		goto out_unlock;
+	}
 	tag = req->tag;
 	WARN_ON_ONCE(!ufshcd_valid_tag(hba, tag));
 
@@ -5934,6 +5939,7 @@ static int ufshcd_issue_devman_upiu_cmd(struct ufs_hba *hba,
 	}
 
 	blk_put_request(req);
+out_unlock:
 	up_read(&hba->clk_scaling_lock);
 	return err;
 }
-- 
2.11.0
