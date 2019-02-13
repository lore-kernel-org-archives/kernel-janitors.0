From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 13 Feb 2019 01:49:17 +0000
Subject: [PATCH] libertas_tf: remove set but not used variable 'flags'
Message-Id: <20190213014917.164506-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Colin Ian King <colin.king@canonical.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/marvell/libertas_tf/main.c: In function 'lbtf_rx':
drivers/net/wireless/marvell/libertas_tf/main.c:554:15: warning:
 variable 'flags' set but not used [-Wunused-but-set-variable]

It never used and can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/marvell/libertas_tf/main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/marvell/libertas_tf/main.c b/drivers/net/wireless/marvell/libertas_tf/main.c
index a7cb7d06e5e6..d36962528838 100644
--- a/drivers/net/wireless/marvell/libertas_tf/main.c
+++ b/drivers/net/wireless/marvell/libertas_tf/main.c
@@ -551,7 +551,6 @@ int lbtf_rx(struct lbtf_private *priv, struct sk_buff *skb)
 	struct ieee80211_rx_status stats;
 	struct rxpd *prxpd;
 	int need_padding;
-	unsigned int flags;
 	struct ieee80211_hdr *hdr;
 
 	lbtf_deb_enter(LBTF_DEB_RX);
@@ -572,7 +571,6 @@ int lbtf_rx(struct lbtf_private *priv, struct sk_buff *skb)
 	skb_pull(skb, sizeof(struct rxpd));
 
 	hdr = (struct ieee80211_hdr *)skb->data;
-	flags = le32_to_cpu(*(__le32 *)(skb->data + 4));
 
 	need_padding = ieee80211_is_data_qos(hdr->frame_control);
 	need_padding ^= ieee80211_has_a4(hdr->frame_control);
