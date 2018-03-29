From: Colin King <colin.king@canonical.com>
Date: Thu, 29 Mar 2018 16:59:49 +0000
Subject: [PATCH] ath10k: fix spelling mistake: "tiggers" -> "triggers"
Message-Id: <20180329165949.29155-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 9649bb752bbd..2f991f79a90f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -7719,7 +7719,7 @@ ath10k_wmi_fw_pdev_tx_stats_fill(const struct ath10k_fw_stats_pdev *pdev,
 	len += scnprintf(buf + len, buf_len - len, "%30s %10d\n",
 			 "HW rate", pdev->data_rc);
 	len += scnprintf(buf + len, buf_len - len, "%30s %10d\n",
-			 "Sched self tiggers", pdev->self_triggers);
+			 "Sched self triggers", pdev->self_triggers);
 	len += scnprintf(buf + len, buf_len - len, "%30s %10d\n",
 			 "Dropped due to SW retries",
 			 pdev->sw_retry_failure);
-- 
2.15.1

