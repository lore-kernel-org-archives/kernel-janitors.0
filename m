From: Colin King <colin.king@canonical.com>
Date: Thu, 07 May 2020 16:43:18 +0000
Subject: [PATCH][next] ath11k: remove redundant initialization of pointer info
Message-Id: <20200507164318.56570-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer info is being assigned twice, once at the start of the function
and secondly when it is just about to be accessed. Remove the redundant
initialization and keep the original assignment to info that is close
to the memcpy that uses it.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index d9117ebf2809..1a7e5817e5c8 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3692,7 +3692,7 @@ static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
 int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
 {
 	struct sk_buff *msdu = skb;
-	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(msdu);
+	struct ieee80211_tx_info *info;
 	struct ath11k *ar = ctx;
 	struct ath11k_base *ab = ar->ab;
 
-- 
2.25.1
