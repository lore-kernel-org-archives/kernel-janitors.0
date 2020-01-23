From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 00:51:17 +0000
Subject: [PATCH] wcn36xx: rockchip: fix spelling mistake "to" -> "too"
Message-Id: <20200123005117.2833765-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gKalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a wcn36xx_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/wcn36xx/smd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireless/ath/wcn36xx/smd.c
index 523550f94a3f..77269ac7f352 100644
--- a/drivers/net/wireless/ath/wcn36xx/smd.c
+++ b/drivers/net/wireless/ath/wcn36xx/smd.c
@@ -1620,7 +1620,7 @@ int wcn36xx_smd_send_beacon(struct wcn36xx *wcn, struct ieee80211_vif *vif,
 	msg_body.beacon_length6 = msg_body.beacon_length + 6;
 
 	if (msg_body.beacon_length > BEACON_TEMPLATE_SIZE) {
-		wcn36xx_err("Beacon is to big: beacon size=%d\n",
+		wcn36xx_err("Beacon is too big: beacon size=%d\n",
 			      msg_body.beacon_length);
 		ret = -ENOMEM;
 		goto out;
-- 
2.24.0
