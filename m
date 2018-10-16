From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 16 Oct 2018 02:35:16 +0000
Subject: [PATCH net-next] ath10k: fix copy-paste error in ath10k_qmi_setup_msa_resources()
Message-Id: <1539657316-35629-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, ath10k@lists.infradead.org

The return value from devm_memremap() is not checked correctly.
The test is done against a wrong variable. This patch fix it.

Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 56cb183..c2cbb41 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -931,7 +931,7 @@ static int ath10k_qmi_setup_msa_resources(struct ath10k_qmi *qmi, u32 msa_size)
 		qmi->msa_mem_size = resource_size(&r);
 		qmi->msa_va = devm_memremap(dev, qmi->msa_pa, qmi->msa_mem_size,
 					    MEMREMAP_WT);
-		if (!qmi->msa_pa) {
+		if (!qmi->msa_va) {
 			dev_err(dev, "failed to map memory region: %pa\n", &r.start);
 			return -EBUSY;
 		}
