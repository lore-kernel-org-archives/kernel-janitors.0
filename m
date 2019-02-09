From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Feb 2019 09:00:09 +0000
Subject: [PATCH] rsi: fix a typo in a debug message
Message-Id: <20190209090009.GA4865@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <amitkarwar@gmail.com>, Prameela Rani Garnepudi <prameela.j04cs@gmail.com>
Cc: Siva Rebbagondla <siva8118@gmail.com>, linux-wireless@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, kernel-janitors@vger.kernel.org

There is a \b (backspace) character in the message that wasn't intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/rsi/rsi_91x_mac80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_mac80211.c b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
index aded1ae4fad5..1dbc0fbbef3f 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mac80211.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
@@ -285,7 +285,7 @@ static void rsi_mac80211_cancel_hw_scan(struct ieee80211_hw *hw,
 			common->bgscan_en = false;
 		info.aborted = false;
 		ieee80211_scan_completed(adapter->hw, &info);
-		rsi_dbg(INFO_ZONE, "Back ground scan cancelled\b\n");
+		rsi_dbg(INFO_ZONE, "Back ground scan cancelled\n");
 	}
 	common->hwscan = NULL;
 	mutex_unlock(&common->mutex);
-- 
2.17.1
