From: Colin King <colin.king@canonical.com>
Date: Sat, 21 Dec 2019 00:40:46 +0000
Subject: [PATCH] ath11k: ensure ts.flags is initialized before bit-wise or'ing in values
Message-Id: <20191221004046.15859-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Anilkumar Kolli <akolli@codeaurora.org>, Manikanta Pubbisetty <mpubbise@codeaurora.org>, Sven Eckelmann <seckelmann@datto.com>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the structure ts is not inititalized and ts.flags contains
garbage values from the stack.  This is being passed into function
ath11k_dp_tx_status_parse that bit-wise or'ing in settings into the
ts.flags field.  To avoid flags (and other fields) from containing
garbage, initialize the structure to zero before use.

Addresses-Coverity: ("Uninitialized scalar variable)"
Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 918305dda106..04ad1a20e459 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -461,7 +461,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	int hal_ring_id = dp->tx_ring[ring_id].tcl_comp_ring.ring_id;
 	struct hal_srng *status_ring = &ab->hal.srng_list[hal_ring_id];
 	struct sk_buff *msdu;
-	struct hal_tx_status ts;
+	struct hal_tx_status ts = { 0 };
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
 	u32 *desc;
 	u32 msdu_id;
-- 
2.24.0
