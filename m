From: Dan Carpenter <error27@gmail.com>
Date: Wed, 13 Oct 2010 09:36:19 +0000
Subject: [patch -next] pch_gbe: fix if condition in set_settings()
Message-Id: <20101013093619.GC6060@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Masayuki Ohtake <masa-korg@dsn.okisemi.com>, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

There were no curly braces in this if condition so it always enabled full
duplex.

And ecmd->speed is an unsigned short so it is never equal to -1.  The
effect is that mii_ethtool_sset() fails with -EINVAL and an error is
printed to dmesg.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/pch_gbe/pch_gbe_ethtool.c b/drivers/net/pch_gbe/pch_gbe_ethtool.c
index e06c6ae..c8cc32c 100644
--- a/drivers/net/pch_gbe/pch_gbe_ethtool.c
+++ b/drivers/net/pch_gbe/pch_gbe_ethtool.c
@@ -113,9 +113,10 @@ static int pch_gbe_set_settings(struct net_device *netdev,
 
 	pch_gbe_hal_write_phy_reg(hw, MII_BMCR, BMCR_RESET);
 
-	if (ecmd->speed = -1)
+	if (ecmd->speed = USHRT_MAX) {
 		ecmd->speed = SPEED_1000;
 		ecmd->duplex = DUPLEX_FULL;
+	}
 	ret = mii_ethtool_sset(&adapter->mii, ecmd);
 	if (ret) {
 		pr_err("Error: mii_ethtool_sset\n");
