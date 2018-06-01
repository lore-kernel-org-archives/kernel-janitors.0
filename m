From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Date: Fri, 01 Jun 2018 13:24:08 +0000
Subject: [PATCH] qtnfmac: fix NULL pointer dereference
Message-Id: <20180601132408.GA2572@embeddedor.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Igor Mitsyanko <imitsyanko@quantenna.com>, Avinash Patil <avinashp@quantenna.com>, Sergey Matyukevich <smatyukevich@quantenna.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, kernel-janitors@vger.kernel.org

In case *vif* is NULL at 655: if (!vif), the execution path jumps to
label out, where *vif* is dereferenced at 679:

if (vif->sta_state = QTNF_STA_CONNECTING)

Fix this by immediately returning when *vif* is NULL instead of
jumping to label out.

Addresses-Coverity-ID: 1469567 ("Dereference after null check")
Fixes: 480daa9cb62c ("qtnfmac: fix invalid STA state on EAPOL failure")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/net/wireless/quantenna/qtnfmac/cfg80211.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
index 220e2b7..ae0ca80 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
@@ -654,8 +654,7 @@ qtnf_disconnect(struct wiphy *wiphy, struct net_device *dev,
 	vif = qtnf_mac_get_base_vif(mac);
 	if (!vif) {
 		pr_err("MAC%u: primary VIF is not configured\n", mac->macid);
-		ret = -EFAULT;
-		goto out;
+		return -EFAULT;
 	}
 
 	if (vif->wdev.iftype != NL80211_IFTYPE_STATION) {
-- 
2.7.4

