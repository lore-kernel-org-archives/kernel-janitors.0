From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Aug 2020 07:47:29 +0000
Subject: [PATCH][next] ath11k: fix spelling mistake "moniter" -> "monitor"
Message-Id: <20200819074729.48591-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an ath11k_warn warning message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 0a3cfa716390..0ba234ad99b2 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -1097,7 +1097,7 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 						       DP_RX_BUFFER_SIZE, &tlv_filter);
 
 		if (ret) {
-			ath11k_warn(ab, "failed to set rx filter for moniter status ring\n");
+			ath11k_warn(ab, "failed to set rx filter for monitor status ring\n");
 			goto out;
 		}
 	}
-- 
2.27.0
