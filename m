From: Colin King <colin.king@canonical.com>
Date: Mon, 17 Aug 2020 22:40:42 +0000
Subject: [PATCH] net: mscc: ocelot: remove duplicate "the the" phrase in Kconfig text
Message-Id: <20200817224042.5826-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The Kconfig help text contains the phrase "the the" in the help
text. Fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/ocelot/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/ocelot/Kconfig b/drivers/net/dsa/ocelot/Kconfig
index f121619d81fe..2d23ccef7d0e 100644
--- a/drivers/net/dsa/ocelot/Kconfig
+++ b/drivers/net/dsa/ocelot/Kconfig
@@ -9,7 +9,7 @@ config NET_DSA_MSCC_FELIX
 	select NET_DSA_TAG_OCELOT
 	select FSL_ENETC_MDIO
 	help
-	  This driver supports network switches from the the Vitesse /
+	  This driver supports network switches from the Vitesse /
 	  Microsemi / Microchip Ocelot family of switching cores that are
 	  connected to their host CPU via Ethernet.
 	  The following switches are supported:
-- 
2.27.0
