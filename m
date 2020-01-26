From: Colin King <colin.king@canonical.com>
Date: Sun, 26 Jan 2020 15:17:47 +0000
Subject: [PATCH] scsi: mvsas: ensure loop counter phy_no  does not wrap and cause an infinite loop
Message-Id: <20200126151747.33320-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The loop counter phy_no is a u8 where as the upper limit of the loop
is a u32. In the event that upper limit is greater than 255 we end
up with an infinite loop since phy_no will wrap around an never reach
upper loop limit. Fix this by making phy_no a u32.

Addresses-Coverity: ("Infinite loop")
Fixes: 20b09c2992fe ("[SCSI] mvsas: add support for 94xx; layout change; bug fixes")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/mvsas/mv_sas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/mvsas/mv_sas.c b/drivers/scsi/mvsas/mv_sas.c
index a920eced92ec..9c03f23bde54 100644
--- a/drivers/scsi/mvsas/mv_sas.c
+++ b/drivers/scsi/mvsas/mv_sas.c
@@ -1940,7 +1940,7 @@ static void mvs_sig_time_out(struct timer_list *t)
 {
 	struct mvs_phy *phy = from_timer(phy, t, timer);
 	struct mvs_info *mvi = phy->mvi;
-	u8 phy_no;
+	u32 phy_no;
 
 	for (phy_no = 0; phy_no < mvi->chip->n_phy; phy_no++) {
 		if (&mvi->phy[phy_no] = phy) {
-- 
2.24.0
