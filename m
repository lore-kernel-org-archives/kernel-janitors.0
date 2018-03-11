From: Colin King <colin.king@canonical.com>
Date: Sun, 11 Mar 2018 16:42:33 +0000
Subject: [PATCH][next] lan743x: remove some redundant variables and assignments
Message-Id: <20180311164233.27139-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Whitehead <bryan.whitehead@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Function lan743x_phy_init assigns pointer 'netdev' but this is never read
and hence it can be removed. The return error code handling can also be
cleaned up to remove the variable 'ret'.

Function lan743x_phy_link_status_change assigns pointer 'phy' twice and
this is never read, so it also can be removed.

Finally, function lan743x_tx_napi_poll initializes pointer 'adapter'
and then re-assigns the same value into this pointer a little later on
so this second assignment is redundant and can be also removed.

Cleans up clang warnings:
drivers/net/ethernet/microchip/lan743x_main.c:951:2: warning: Value
stored to 'netdev' is never read
drivers/net/ethernet/microchip/lan743x_main.c:971:3: warning: Value
stored to 'phy' is never read
drivers/net/ethernet/microchip/lan743x_main.c:1583:26: warning: Value
stored to 'adapter' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 04022ec5ae1e..73ce3ee6a520 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -945,15 +945,7 @@ static void lan743x_phy_update_flowcontrol(struct lan743x_adapter *adapter,
 
 static int lan743x_phy_init(struct lan743x_adapter *adapter)
 {
-	struct net_device *netdev;
-	int ret;
-
-	netdev = adapter->netdev;
-	ret = lan743x_phy_reset(adapter);
-	if (ret)
-		return ret;
-
-	return 0;
+	return lan743x_phy_reset(adapter);
 }
 
 static void lan743x_phy_link_status_change(struct net_device *netdev)
@@ -964,11 +956,9 @@ static void lan743x_phy_link_status_change(struct net_device *netdev)
 	phy_print_status(phydev);
 	if (phydev->state = PHY_RUNNING) {
 		struct ethtool_link_ksettings ksettings;
-		struct lan743x_phy *phy = NULL;
 		int remote_advertisement = 0;
 		int local_advertisement = 0;
 
-		phy = &adapter->phy;
 		memset(&ksettings, 0, sizeof(ksettings));
 		phy_ethtool_get_link_ksettings(netdev, &ksettings);
 		local_advertisement = phy_read(phydev, MII_ADVERTISE);
@@ -1586,7 +1576,6 @@ static int lan743x_tx_napi_poll(struct napi_struct *napi, int weight)
 	u32 ioc_bit = 0;
 	u32 int_sts = 0;
 
-	adapter = tx->adapter;
 	ioc_bit = DMAC_INT_BIT_TX_IOC_(tx->channel_number);
 	int_sts = lan743x_csr_read(adapter, DMAC_INT_STS);
 	if (tx->vector_flags & LAN743X_VECTOR_FLAG_SOURCE_STATUS_W2C)
-- 
2.15.1

