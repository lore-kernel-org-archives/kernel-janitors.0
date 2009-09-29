From: Julia Lawall <julia@diku.dk>
Date: Tue, 29 Sep 2009 06:00:16 +0000
Subject: [PATCH] drivers/scsi/libsas: Use SAM_GOOD
Message-Id: <Pine.LNX.4.64.0909290759420.29620@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: djwong@us.ibm.com, James.Bottomley@suse.de, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The field stat->stat should be compared to SAM_GOOD, not SAM_STAT_GOOD, as
done elsewhere in the same function.  Both constants have the same value.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/scsi/libsas/sas_ata.c       |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/scsi/libsas/sas_ata.c b/drivers/scsi/libsas/sas_ata.c
index e155011..c77b3f9 100644
--- a/drivers/scsi/libsas/sas_ata.c
+++ b/drivers/scsi/libsas/sas_ata.c
@@ -112,7 +112,7 @@ static void sas_ata_task_done(struct sas_task *task)
 		dev->sata_dev.sstatus = resp->sstatus;
 		dev->sata_dev.serror = resp->serror;
 		dev->sata_dev.scontrol = resp->scontrol;
-	} else if (stat->stat != SAM_STAT_GOOD) {
+	} else if (stat->stat != SAM_GOOD) {
 		ac = sas_to_ata_err(stat);
 		if (ac) {
 			SAS_DPRINTK("%s: SAS error %x\n", __func__,
