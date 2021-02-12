From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Feb 2021 11:36:27 +0000
Subject: [PATCH][next] ath11k: debugfs: Fix spelling mistake "Opportunies" -> "Opportunities"
Message-Id: <20210212113627.212787-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in some debug text, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
index e13684343ec3..ec93f14e6d2a 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
@@ -3851,7 +3851,7 @@ htt_print_pdev_obss_pd_stats_tlv_v(const void *tag_buf,
 			   htt_stats_buf->num_non_srg_ppdu_tried);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "Non-SRG success PPDU = %u\n",
 			   htt_stats_buf->num_non_srg_ppdu_success);
-	len += HTT_DBG_OUT(buf + len, buf_len - len, "SRG Opportunies = %u\n",
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "SRG Opportunities = %u\n",
 			   htt_stats_buf->num_srg_opportunities);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "SRG tried PPDU = %u\n",
 			   htt_stats_buf->num_srg_ppdu_tried);
-- 
2.30.0
