From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Nov 2011 06:33:09 +0000
Subject: [patch] mac80211: use kfree_skb() instead of kfree()
Message-Id: <20111115063309.GB30827@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, Arik Nemtsov <arik@wizery.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

sk_buff structs should be freed using kfree_skb().

This was introduced recently in 029458212 "mac80211: Save probe
response data for bss".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index 12a6d4b..b34ca0c 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -474,7 +474,7 @@ static void ieee80211_do_stop(struct ieee80211_sub_if_data *sdata,
 		RCU_INIT_POINTER(sdata->u.ap.probe_resp, NULL);
 		synchronize_rcu();
 		kfree(old_beacon);
-		kfree(old_probe_resp);
+		kfree_skb(old_probe_resp);
 
 		/* down all dependent devices, that is VLANs */
 		list_for_each_entry_safe(vlan, tmpsdata, &sdata->u.ap.vlans,
