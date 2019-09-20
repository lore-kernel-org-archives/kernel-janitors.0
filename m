From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 20 Sep 2019 19:45:33 +0000
Subject: [PATCH] ieee802154: mcr20a: simplify a bit 'mcr20a_handle_rx_read_buf_complete()'
Message-Id: <20190920194533.5886-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: liuxuenetmail@gmail.com, alex.aring@gmail.com, stefan@datenfreihafen.org, davem@davemloft.net
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Use a 'skb_put_data()' variant instead of rewritting it.
The __skb_put_data variant is safe here. It is obvious that the skb can
not overflow. It has just been allocated a few lines above with the same
'len'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ieee802154/mcr20a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ieee802154/mcr20a.c b/drivers/net/ieee802154/mcr20a.c
index 17f2300e63ee..8dc04e2590b1 100644
--- a/drivers/net/ieee802154/mcr20a.c
+++ b/drivers/net/ieee802154/mcr20a.c
@@ -800,7 +800,7 @@ mcr20a_handle_rx_read_buf_complete(void *context)
 	if (!skb)
 		return;
 
-	memcpy(skb_put(skb, len), lp->rx_buf, len);
+	__skb_put_data(skb, lp->rx_buf, len);
 	ieee802154_rx_irqsafe(lp->hw, skb, lp->rx_lqi[0]);
 
 	print_hex_dump_debug("mcr20a rx: ", DUMP_PREFIX_OFFSET, 16, 1,
-- 
2.20.1
