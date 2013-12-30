From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 30 Dec 2013 17:23:33 +0000
Subject: [PATCH 3/11] mac80211: use ether_addr_equal_64bits
Message-Id: <1388427307-8691-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388427307-8691-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388427307-8691-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Ether_addr_equal_64bits is more efficient than ether_addr_equal, and can be
used when each argument is an array within a structure that contains at
least two bytes of data beyond the array.

The structures involved are:
ieee80211_hdr defined in include/linux/ieee80211.h and
p54_common defined in drivers/net/wireless/p54/p54.h

This was done using Coccinelle (http://coccinelle.lip6.fr/).

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch used is rather long and can be found in message 0 of
this patch series.

 drivers/net/wireless/p54/txrx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/p54/txrx.c b/drivers/net/wireless/p54/txrx.c
index f95de0d..b7cc7c2 100644
--- a/drivers/net/wireless/p54/txrx.c
+++ b/drivers/net/wireless/p54/txrx.c
@@ -308,7 +308,7 @@ static void p54_pspoll_workaround(struct p54_common *priv, struct sk_buff *skb)
 		return;
 
 	/* only consider beacons from the associated BSSID */
-	if (!ether_addr_equal(hdr->addr3, priv->bssid))
+	if (!ether_addr_equal_64bits(hdr->addr3, priv->bssid))
 		return;
 
 	tim = p54_find_ie(skb, WLAN_EID_TIM);

