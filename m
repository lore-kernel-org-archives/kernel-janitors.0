From: Colin King <colin.king@canonical.com>
Date: Sat, 26 May 2018 15:00:19 +0000
Subject: [PATCH] rsi: fix spelling mistake "Uknown" -> "Unknown"
Message-Id: <20180526150019.10288-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in rsi_dbg message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/rsi/rsi_91x_mac80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_mac80211.c b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
index bfa7569c85bb..2ca7464b7fa3 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mac80211.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
@@ -1103,7 +1103,7 @@ static int rsi_mac80211_ampdu_action(struct ieee80211_hw *hw,
 		break;
 
 	default:
-		rsi_dbg(ERR_ZONE, "%s: Uknown AMPDU action\n", __func__);
+		rsi_dbg(ERR_ZONE, "%s: Unknown AMPDU action\n", __func__);
 		break;
 	}
 
-- 
2.17.0

