From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Dec 2020 08:31:19 +0000
Subject: [PATCH 1/2] ath11k: Fix error code in ath11k_core_suspend()
Message-Id: <X9nF17L2/EKOSbn/@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Carl Huang <cjhuang@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

The "if (!ret)" condition is inverted and it should be "if (ret)".  It
means that we return success when we had intended to return an error
code.

Fixes: d1b0c33850d2 ("ath11k: implement suspend for QCA6390 PCI devices")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index b97c38b9a270..350b7913622c 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -185,7 +185,7 @@ int ath11k_core_suspend(struct ath11k_base *ab)
 	ath11k_hif_ce_irq_disable(ab);
 
 	ret = ath11k_hif_suspend(ab);
-	if (!ret) {
+	if (ret) {
 		ath11k_warn(ab, "failed to suspend hif: %d\n", ret);
 		return ret;
 	}
-- 
2.29.2
