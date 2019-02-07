From: Colin King <colin.king@canonical.com>
Date: Thu, 07 Feb 2019 12:11:41 +0000
Subject: [PATCH] rsi:  fix indentation issue with a code block
Message-Id: <20190207121141.28336-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <amitkarwar@gmail.com>, Siva Rebbagondla <siva8118@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a block of code that is indented at the wrong level. Fix this
with extra tabbing.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/rsi/rsi_91x_mac80211.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_mac80211.c b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
index aded1ae4fad5..747d96e14bcd 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mac80211.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
@@ -810,15 +810,15 @@ static void rsi_mac80211_bss_info_changed(struct ieee80211_hw *hw,
 		adapter->ps_info.dtim_interval_duration = bss->dtim_period;
 		adapter->ps_info.listen_interval = conf->listen_interval;
 
-	/* If U-APSD is updated, send ps parameters to firmware */
-	if (bss->assoc) {
-		if (common->uapsd_bitmap) {
-			rsi_dbg(INFO_ZONE, "Configuring UAPSD\n");
-			rsi_conf_uapsd(adapter, vif);
+		/* If U-APSD is updated, send ps parameters to firmware */
+		if (bss->assoc) {
+			if (common->uapsd_bitmap) {
+				rsi_dbg(INFO_ZONE, "Configuring UAPSD\n");
+				rsi_conf_uapsd(adapter, vif);
+			}
+		} else {
+			common->uapsd_bitmap = 0;
 		}
-	} else {
-		common->uapsd_bitmap = 0;
-	}
 	}
 
 	if (changed & BSS_CHANGED_CQM) {
-- 
2.20.1
