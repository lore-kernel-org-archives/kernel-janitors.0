From: Colin King <colin.king@canonical.com>
Date: Wed, 27 Mar 2019 16:15:20 +0000
Subject: [PATCH] net: phy: mdio-bcm-unimac: remove redundant !timeout check
Message-Id: <20190327161520.23064-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for zero timeout is always true at the end of the proceeding
while loop; the only other exit path in the loop is if the unimac MDIO
is not busy.  Remove the redundant zero timeout check and always
return -ETIMEDOUT on this timeout return path.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/phy/mdio-bcm-unimac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/phy/mdio-bcm-unimac.c b/drivers/net/phy/mdio-bcm-unimac.c
index 3a592629dc7e..4a28fb29adaa 100644
--- a/drivers/net/phy/mdio-bcm-unimac.c
+++ b/drivers/net/phy/mdio-bcm-unimac.c
@@ -92,10 +92,7 @@ static int unimac_mdio_poll(void *wait_func_data)
 		usleep_range(1000, 2000);
 	} while (--timeout);
 
-	if (!timeout)
-		return -ETIMEDOUT;
-
-	return 0;
+	return -ETIMEDOUT;
 }
 
 static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
-- 
2.20.1
