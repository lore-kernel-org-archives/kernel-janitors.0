From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 18 Oct 2018 03:58:34 +0000
Subject: [PATCH -next] scsi: hisi_sas: Fix missing unlock on error in hisi_sas_phy_read32()
Message-Id: <1539835114-60506-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add the missing unlock before return from function hisi_sas_phy_read32()
in the error handling case.

Fixes: 784b46b7cba0 ("scsi: hisi_sas: Use block layer tag instead for IPTT")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
index 70d6b28..cc36b64 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
@@ -806,8 +806,10 @@ static u32 hisi_sas_phy_read32(struct hisi_hba *hisi_hba,
 	while (1) {
 		start = find_next_zero_bit(bitmap,
 					hisi_hba->slot_index_count, start);
-		if (start >= end)
+		if (start >= end) {
+			spin_unlock_irqrestore(&hisi_hba->lock, flags);
 			return -SAS_QUEUE_FULL;
+		}
 		/*
 		  * SAS IPTT bit0 should be 1, and SATA IPTT bit0 should be 0.
 		  */
