From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 07:51:56 +0000
Subject: [PATCH] rsi: remove set but not used variables 'info, vif'
Message-Id: <20190218075156.183879-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535707647-191888-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1535707647-191888-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <amitkarwar@gmail.com>, Siva Rebbagondla <siva8118@gmail.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/rsi/rsi_91x_main.c: In function 'rsi_prepare_skb':
drivers/net/wireless/rsi/rsi_91x_main.c:127:24: warning:
 variable 'vif' set but not used [-Wunused-but-set-variable]

drivers/net/wireless/rsi/rsi_91x_main.c:124:28: warning:
 variable 'info' set but not used [-Wunused-but-set-variable]

They're not used any more since 160ee2a11ce0 ("rsi: fill rx_params only once.")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/rsi/rsi_91x_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_main.c b/drivers/net/wireless/rsi/rsi_91x_main.c
index ca3a55ed72e4..29d83049c5f5 100644
--- a/drivers/net/wireless/rsi/rsi_91x_main.c
+++ b/drivers/net/wireless/rsi/rsi_91x_main.c
@@ -121,11 +121,8 @@ static struct sk_buff *rsi_prepare_skb(struct rsi_common *common,
 				       u32 pkt_len,
 				       u8 extended_desc)
 {
-	struct ieee80211_tx_info *info;
 	struct sk_buff *skb = NULL;
 	u8 payload_offset;
-	struct ieee80211_vif *vif;
-	struct ieee80211_hdr *wh;
 
 	if (WARN(!pkt_len, "%s: Dummy pkt received", __func__))
 		return NULL;
@@ -144,10 +141,7 @@ static struct sk_buff *rsi_prepare_skb(struct rsi_common *common,
 	payload_offset = (extended_desc + FRAME_DESC_SZ);
 	skb_put(skb, pkt_len);
 	memcpy((skb->data), (buffer + payload_offset), skb->len);
-	wh = (struct ieee80211_hdr *)skb->data;
-	vif = rsi_get_vif(common->priv, wh->addr1);
 
-	info = IEEE80211_SKB_CB(skb);
 	return skb;
 }
