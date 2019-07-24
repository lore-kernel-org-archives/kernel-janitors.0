From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 24 Jul 2019 06:25:45 +0000
Subject: [PATCH wireless-drivers-next v2] mwifiex: use eth_broadcast_addr() to assign broadcast address
Message-Id: <20190724062545.119041-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <878sso0yzx.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <878sso0yzx.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvalo@codeaurora.org, amitkarwar@gmail.com, nishants@marvell.com, gbhat@marvell.com, huxinming820@gmail.com
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This patch is to use eth_broadcast_addr() to assign broadcast address
insetad of memcpy().

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v1->v2: change subject from net-next to wireless-drivers-next.
 
 drivers/net/wireless/marvell/mwifiex/tdls.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/tdls.c b/drivers/net/wireless/marvell/mwifiex/tdls.c
index 18e654d..0931304 100644
--- a/drivers/net/wireless/marvell/mwifiex/tdls.c
+++ b/drivers/net/wireless/marvell/mwifiex/tdls.c
@@ -731,7 +731,6 @@ mwifiex_construct_tdls_action_frame(struct mwifiex_private *priv,
 				    u16 status_code, struct sk_buff *skb)
 {
 	struct ieee80211_mgmt *mgmt;
-	u8 bc_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	int ret;
 	u16 capab;
 	struct ieee80211_ht_cap *ht_cap;
@@ -765,7 +764,7 @@ mwifiex_construct_tdls_action_frame(struct mwifiex_private *priv,
 		memmove(pos + ETH_ALEN, &mgmt->u.action.category,
 			sizeof(mgmt->u.action.u.tdls_discover_resp));
 		/* init address 4 */
-		memcpy(pos, bc_addr, ETH_ALEN);
+		eth_broadcast_addr(pos);
 
 		ret = mwifiex_tdls_append_rates_ie(priv, skb);
 		if (ret) {
-- 
2.7.4
