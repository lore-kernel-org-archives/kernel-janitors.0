From: YueHaibing <yuehaibing@huawei.com>
Date: Sun, 21 Oct 2018 09:50:54 +0000
Subject: [PATCH -next] mvsas: Remove set but not used variable 'id'
Message-Id: <1540115454-160677-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/mvsas/mv_sas.c: In function 'mvs_work_queue':
drivers/scsi/mvsas/mv_sas.c:1909:31: warning:
 variable 'id' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit
20b09c2992fe ("[SCSI] mvsas: add support for 94xx; layout change; bug fixes")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/mvsas/mv_sas.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/mvsas/mv_sas.c b/drivers/scsi/mvsas/mv_sas.c
index 3df1428..ab50798 100644
--- a/drivers/scsi/mvsas/mv_sas.c
+++ b/drivers/scsi/mvsas/mv_sas.c
@@ -1906,8 +1906,6 @@ static void mvs_work_queue(struct work_struct *work)
 
 		if (phy->phy_event & PHY_PLUG_OUT) {
 			u32 tmp;
-			struct sas_identify_frame *id;
-			id = (struct sas_identify_frame *)phy->frame_rcvd;
 			tmp = MVS_CHIP_DISP->read_phy_ctl(mvi, phy_no);
 			phy->phy_event &= ~PHY_PLUG_OUT;
 			if (!(tmp & PHY_READY_MASK)) {
