From: Colin King <colin.king@canonical.com>
Date: Mon, 18 Nov 2019 11:48:35 +0000
Subject: [PATCH][next] net: phy: dp83869: fix return of uninitialized variable ret
Message-Id: <20191118114835.39494-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, Dan Murphy <dmurphy@ti.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where the call to phy_interface_is_rgmii returns zero
the variable ret is left uninitialized and this is returned at
the end of the function dp83869_configure_rgmii.  Fix this by
returning 0 instead of the uninitialized value in ret.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 01db923e8377 ("net: phy: dp83869: Add TI dp83869 phy")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/phy/dp83869.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/dp83869.c b/drivers/net/phy/dp83869.c
index fcd418716c10..1c7a7c57dec3 100644
--- a/drivers/net/phy/dp83869.c
+++ b/drivers/net/phy/dp83869.c
@@ -239,7 +239,7 @@ static int dp83869_configure_rgmii(struct phy_device *phydev,
 			       dp83869->io_impedance &
 			       DP83869_IO_MUX_CFG_IO_IMPEDANCE_CTRL);
 
-	return ret;
+	return 0;
 }
 
 static int dp83869_configure_mode(struct phy_device *phydev,
-- 
2.24.0
