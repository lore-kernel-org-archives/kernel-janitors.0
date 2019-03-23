From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 23 Mar 2019 02:15:59 +0000
Subject: [PATCH -next] pm8001: remove set but not used variables 'param, sas_ha'
Message-Id: <20190323021559.113157-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/pm8001/pm8001_hwi.c: In function 'mpi_smp_completion':
drivers/scsi/pm8001/pm8001_hwi.c:2901:6: warning:
 variable 'param' set but not used [-Wunused-but-set-variable]

drivers/scsi/pm8001/pm8001_hwi.c: In function 'pm8001_bytes_dmaed':
drivers/scsi/pm8001/pm8001_hwi.c:3247:24: warning:
 variable 'sas_ha' set but not used [-Wunused-but-set-variable]

They're never used since introduction, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/pm8001/pm8001_hwi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/scsi/pm8001/pm8001_hwi.c b/drivers/scsi/pm8001/pm8001_hwi.c
index e0fee3d91d23..e4209091c1da 100644
--- a/drivers/scsi/pm8001/pm8001_hwi.c
+++ b/drivers/scsi/pm8001/pm8001_hwi.c
@@ -2898,7 +2898,6 @@ static void mpi_sata_event(struct pm8001_hba_info *pm8001_ha , void *piomb)
 static void
 mpi_smp_completion(struct pm8001_hba_info *pm8001_ha, void *piomb)
 {
-	u32 param;
 	struct sas_task *t;
 	struct pm8001_ccb_info *ccb;
 	unsigned long flags;
@@ -2913,7 +2912,6 @@ mpi_smp_completion(struct pm8001_hba_info *pm8001_ha, void *piomb)
 	tag = le32_to_cpu(psmpPayload->tag);
 
 	ccb = &pm8001_ha->ccb_info[tag];
-	param = le32_to_cpu(psmpPayload->param);
 	t = ccb->task;
 	ts = &t->task_status;
 	pm8001_dev = ccb->device;
@@ -3244,11 +3242,9 @@ void pm8001_bytes_dmaed(struct pm8001_hba_info *pm8001_ha, int i)
 {
 	struct pm8001_phy *phy = &pm8001_ha->phy[i];
 	struct asd_sas_phy *sas_phy = &phy->sas_phy;
-	struct sas_ha_struct *sas_ha;
 	if (!phy->phy_attached)
 		return;
 
-	sas_ha = pm8001_ha->sas;
 	if (sas_phy->phy) {
 		struct sas_phy *sphy = sas_phy->phy;
 		sphy->negotiated_linkrate = sas_phy->linkrate;
