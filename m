From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 26 May 2018 09:34:22 +0000
Subject: [PATCH -next] scsi: hisi_sas: fix a typo in hisi_sas_task_prep()
Message-Id: <1527327262-68989-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix a typo in hisi_sas_task_prep().

Fixes: 7eee4b921822 ("scsi: hisi_sas: relocate smp sg map")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/scsi/hisi_sas/hisi_sas_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/hisi_sas/hisi_sas_main.c b/drivers/scsi/hisi_sas/hisi_sas_main.c
index 39f694e..6d37965 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_main.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_main.c
@@ -390,7 +390,7 @@ static int hisi_sas_task_prep(struct sas_task *task,
 			}
 			n_elem_resp = dma_map_sg(dev, &task->smp_task.smp_resp,
 						 1, DMA_FROM_DEVICE);
-			if (!n_elem_req) {
+			if (!n_elem_resp) {
 				rc = -ENOMEM;
 				goto err_out_dma_unmap;
 			}

