From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Aug 2018 14:49:23 +0000
Subject: [PATCH] ieee802154: mcr20a: read out of bounds in mcr20a_set_channel()
Message-Id: <20180829144923.6p2omsbe2s343wea@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xue Liu <liuxuenetmail@gmail.com>
Cc: Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, "David S. Miller" <davem@davemloft.net>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "channel" variable can be any u8 value.  We need to make sure we
don't read outside of the PLL_INT[] or PLL_FRAC[] arrays.

Fixes: 8c6ad9cc5157 ("ieee802154: Add NXP MCR20A IEEE 802.15.4 transceiver driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This patch is obviously harmless, but it's from static analysis.  I'm
pretty sure this is required, but I can't swear.

diff --git a/drivers/net/ieee802154/mcr20a.c b/drivers/net/ieee802154/mcr20a.c
index e428277781ac..4f41d1d3588e 100644
--- a/drivers/net/ieee802154/mcr20a.c
+++ b/drivers/net/ieee802154/mcr20a.c
@@ -512,6 +512,9 @@ mcr20a_set_channel(struct ieee802154_hw *hw, u8 page, u8 channel)
 
 	dev_dbg(printdev(lp), "%s\n", __func__);
 
+	if (channel < 11 || channel - 11 >= ARRAY_SIZE(PLL_INT))
+		return -EINVAL;
+
 	/* freqency = ((PLL_INT+64) + (PLL_FRAC/65536)) * 32 MHz */
 	ret = regmap_write(lp->regmap_dar, DAR_PLL_INT0, PLL_INT[channel - 11]);
 	if (ret)
