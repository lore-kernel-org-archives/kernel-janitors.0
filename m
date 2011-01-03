From: Dan Carpenter <error27@gmail.com>
Date: Mon, 03 Jan 2011 05:43:55 +0000
Subject: [patch] mac80211: potential null dereference in mesh forwarding
Message-Id: <20110103054355.GP1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The printk() is supposed to be ratelimited but we should always goto out
when fwd_skb is NULL.  Otherwise it gets dereferenced on the next line.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 5e9d3bc..dc8b566 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -1831,8 +1831,9 @@ ieee80211_rx_h_mesh_fwding(struct ieee80211_rx_data *rx)
 
 			fwd_skb = skb_copy(skb, GFP_ATOMIC);
 
-			if (!fwd_skb && net_ratelimit()) {
-				printk(KERN_DEBUG "%s: failed to clone mesh frame\n",
+			if (!fwd_skb) {
+				if (net_ratelimit())
+					printk(KERN_DEBUG "%s: failed to clone mesh frame\n",
 						   sdata->name);
 				goto out;
 			}
