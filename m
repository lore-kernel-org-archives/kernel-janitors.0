From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Mar 2010 11:56:41 +0000
Subject: [patch] mac80211: remove unneed variable from
Message-Id: <20100324115641.GE21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>, "Luis R. Rodriguez" <lrodriguez@atheros.com>, Kalle Valo <kalle.valo@iki.fi>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We don't need "sdata" any more after:
	d84f323477260e773d5317ad7cbe50f76115cb47
	mac80211: remove dev_hold/put calls

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index cbe53ed..08e1f17 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -2010,14 +2010,12 @@ void ieee80211_tx_pending(unsigned long data)
 		while (!skb_queue_empty(&local->pending[i])) {
 			struct sk_buff *skb = __skb_dequeue(&local->pending[i]);
 			struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
-			struct ieee80211_sub_if_data *sdata;
 
 			if (WARN_ON(!info->control.vif)) {
 				kfree_skb(skb);
 				continue;
 			}
 
-			sdata = vif_to_sdata(info->control.vif);
 			spin_unlock_irqrestore(&local->queue_stop_reason_lock,
 						flags);
 
