From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Dec 2019 10:49:35 +0000
Subject: [PATCH 2/2] scsi: ufs: Simplify a condition
Message-Id: <20191213104935.wgpq2epaz6zh5zus@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20191213104828.7i64cpoof26rc4fw@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alim Akhtar <alim.akhtar@samsung.com>, Subhash Jadavani <subhashj@codeaurora.org>
Cc: Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bean Huo <beanhuo@micron.com>, Stanley Chu <stanley.chu@mediatek.com>, Can Guo <cang@codeaurora.org>, Bart Van Assche <bvanassche@acm.org>, Venkat Gopalakrishnan <venkatg@codeaurora.org>, Tomas Winkler <tomas.winkler@intel.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

We know that "check_for_bkops" is non-zero on this side of the ||
because it was checked on the other side.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/ufs/ufshcd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index bf981f0ea74c..c299c5feaf1a 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -7684,8 +7684,7 @@ static int ufshcd_link_state_transition(struct ufs_hba *hba,
 	 * turning off the link would also turn off the device.
 	 */
 	else if ((req_link_state = UIC_LINK_OFF_STATE) &&
-		   (!check_for_bkops || (check_for_bkops &&
-		    !hba->auto_bkops_enabled))) {
+		 (!check_for_bkops || !hba->auto_bkops_enabled)) {
 		/*
 		 * Let's make sure that link is in low power mode, we are doing
 		 * this currently by putting the link in Hibern8. Otherway to
-- 
2.11.0
