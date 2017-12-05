From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Dec 2017 14:35:08 +0000
Subject: [PATCH] ath9k_htc: Add a sanity check in ath9k_htc_ampdu_action()
Message-Id: <20171205143508.qbnbm4d3wesguu2g@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Sujith <Sujith.Manoharan@atheros.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch generates a warning here:

    drivers/net/wireless/ath/ath9k/htc_drv_main.c:1688 ath9k_htc_ampdu_action()
    error: buffer overflow 'ista->tid_state' 8 <= 15

I don't know if it's a real bug or not but the other paths through this
function all ensure that "tid" is less than ATH9K_HTC_MAX_TID (8) so
checking here makes things more consistent.

Fixes: fb9987d0f748 ("ath9k_htc: Support for AR9271 chipset.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This might be fine.  I see lots of other drivers don't check tid.

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index f808e5833d7e..a82ad739ab80 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -1683,6 +1683,10 @@ static int ath9k_htc_ampdu_action(struct ieee80211_hw *hw,
 		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
 		break;
 	case IEEE80211_AMPDU_TX_OPERATIONAL:
+		if (tid >= ATH9K_HTC_MAX_TID) {
+			ret = -EINVAL;
+			break;
+		}
 		ista = (struct ath9k_htc_sta *) sta->drv_priv;
 		spin_lock_bh(&priv->tx.tx_lock);
 		ista->tid_state[tid] = AGGR_OPERATIONAL;
