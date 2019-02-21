From: Colin King <colin.king@canonical.com>
Date: Thu, 21 Feb 2019 12:35:49 +0000
Subject: [PATCH][next] rsi: fix missing null pointer check from a failed ieee80211_probereq_get call
Message-Id: <20190221123549.7294-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <amitkarwar@gmail.com>, Siva Rebbagondla <siva8118@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to ieee80211_probereq_get can return NULL if a skb allocation
fails, so add a null pointer check and free an earlier skb on the error
exit return path.

Fixes: 7fdcb8e12660 ("rsi: add support for hardware scan offload")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/rsi/rsi_91x_mgmt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/rsi/rsi_91x_mgmt.c b/drivers/net/wireless/rsi/rsi_91x_mgmt.c
index 8c17842ac507..844f2fac298f 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mgmt.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mgmt.c
@@ -1726,6 +1726,10 @@ int rsi_send_bgscan_probe_req(struct rsi_common *common,
 
 	probereq_skb = ieee80211_probereq_get(common->priv->hw, vif->addr, ssid,
 					      ssid_len, scan_req->ie_len);
+	if (!probereq_skb) {
+		dev_kfree_skb(skb);
+		return -ENOMEM;
+	}
 
 	memcpy(&skb->data[frame_len], probereq_skb->data, probereq_skb->len);
 
-- 
2.20.1
