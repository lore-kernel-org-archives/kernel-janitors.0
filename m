From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Dec 2017 17:04:01 +0000
Subject: [PATCH][next] wcn36xx: remove redundant assignment to msg_body.min_ch_time
Message-Id: <20171219170401.15154-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eugene Krasnikov <k.eugene.e@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

msg_body.min_ch_time is being assigned twice; remove the redundant
first assignment.

Detected by CoverityScan, CID#1463042 ("Unused Value")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/wcn36xx/smd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireless/ath/wcn36xx/smd.c
index 2914618a0335..bab2eca5fcac 100644
--- a/drivers/net/wireless/ath/wcn36xx/smd.c
+++ b/drivers/net/wireless/ath/wcn36xx/smd.c
@@ -625,7 +625,6 @@ int wcn36xx_smd_start_hw_scan(struct wcn36xx *wcn, struct ieee80211_vif *vif,
 	INIT_HAL_MSG(msg_body, WCN36XX_HAL_START_SCAN_OFFLOAD_REQ);
 
 	msg_body.scan_type = WCN36XX_HAL_SCAN_TYPE_ACTIVE;
-	msg_body.min_ch_time = 30;
 	msg_body.min_ch_time = 100;
 	msg_body.scan_hidden = 1;
 	memcpy(msg_body.mac, vif->addr, ETH_ALEN);
-- 
2.14.1

