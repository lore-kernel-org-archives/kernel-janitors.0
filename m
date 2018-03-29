From: Colin King <colin.king@canonical.com>
Date: Thu, 29 Mar 2018 15:38:18 +0000
Subject: [PATCH] cw1200: fix spelling mistake: "Mailformed" -> "Malformed"
Message-Id: <20180329153818.29538-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solomon Peachy <pizza@shaftnet.org>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in wiphy_warn warning message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/st/cw1200/txrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/st/cw1200/txrx.c b/drivers/net/wireless/st/cw1200/txrx.c
index e9050b41157a..f7b1b0062db3 100644
--- a/drivers/net/wireless/st/cw1200/txrx.c
+++ b/drivers/net/wireless/st/cw1200/txrx.c
@@ -1069,7 +1069,7 @@ void cw1200_rx_cb(struct cw1200_common *priv,
 	}
 
 	if (skb->len < sizeof(struct ieee80211_pspoll)) {
-		wiphy_warn(priv->hw->wiphy, "Mailformed SDU rx'ed. Size is lesser than IEEE header.\n");
+		wiphy_warn(priv->hw->wiphy, "Malformed SDU rx'ed. Size is lesser than IEEE header.\n");
 		goto drop;
 	}
 
-- 
2.15.1

