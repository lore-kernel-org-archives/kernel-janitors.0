From: Colin King <colin.king@canonical.com>
Date: Wed, 13 Nov 2019 09:55:48 +0000
Subject: [PATCH][next] net: sfp: fix spelling mistake "requies" -> "requires"
Message-Id: <20191113095548.27704-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/phy/sfp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index f9b8051c4247..b0f88c2c0153 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -1465,7 +1465,7 @@ static int sfp_module_parse_power(struct sfp *sfp)
 	 */
 	if (sfp->id.ext.diagmon & SFP_DIAGMON_ADDRMODE && power_mW > 1000) {
 		dev_warn(sfp->dev,
-			 "Address Change Sequence not supported but module requies %u.%uW, module may not be functional\n",
+			 "Address Change Sequence not supported but module requires %u.%uW, module may not be functional\n",
 			 power_mW / 1000, (power_mW / 100) % 10);
 		return 0;
 	}
-- 
2.20.1
