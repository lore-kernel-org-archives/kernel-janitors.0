From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jun 2014 06:56:26 +0000
Subject: [patch] amd-xgbe: unwind on error in xgbe_mdio_register()
Message-Id: <20140611065626.GC16443@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a typo here so we return directly instead of unwinding.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-mdio.c b/drivers/net/ethernet/amd/xgbe/xgbe-mdio.c
index 52bbdbf..ea7a5d6 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-mdio.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-mdio.c
@@ -367,7 +367,7 @@ int xgbe_mdio_register(struct xgbe_prv_data *pdata)
 
 	if (!phydev->drv || (phydev->drv->phy_id = 0)) {
 		netdev_err(netdev, "phy_id not valid\n");
-		return -ENODEV;
+		ret = -ENODEV;
 		goto err_phy_connect;
 	}
 	DBGPR("  phy_connect_direct succeeded for PHY %s, link=%d\n",
