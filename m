From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Apr 2017 19:10:41 +0000
Subject: [PATCH -next] net: phy: test the right variable in phy_write_mmd()
Message-Id: <20170414191041.GA27478@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Russell King <rmk+kernel@armlinux.org.uk>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a copy and paste buglet.  We meant to test for ->write_mmd but
we test for ->read_mmd.

Fixes: 1ee6b9bc6206 ("net: phy: make phy_(read|write)_mmd() generic MMD accessors")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 357a4d0d7641..6739b738bbaf 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -76,7 +76,7 @@ int phy_write_mmd(struct phy_device *phydev, int devad, u32 regnum, u16 val)
 	if (regnum > (u16)~0 || devad > 32)
 		return -EINVAL;
 
-	if (phydev->drv->read_mmd) {
+	if (phydev->drv->write_mmd) {
 		ret = phydev->drv->write_mmd(phydev, devad, regnum, val);
 	} else if (phydev->is_c45) {
 		u32 addr = MII_ADDR_C45 | (devad << 16) | (regnum & 0xffff);
