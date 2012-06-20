From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Wed, 20 Jun 2012 10:56:44 +0000
Subject: [PATCH] netxen : Error return off by one for XG port.
Message-Id: <1340189578-18308-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sony.chacko@qlogic.com, rajesh.borundia@qlogic.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Santosh Nayak <santoshprasadnayak@gmail.com>

From: Santosh Nayak <santoshprasadnayak@gmail.com>

There are  NETXEN_NIU_MAX_XG_PORTS ports.
Port indexing starts from zero.
Hence we should also return error for  'port = NETXEN_NIU_MAX_XG_PORTS'.

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 .../ethernet/qlogic/netxen/netxen_nic_ethtool.c    |    4 ++--
 drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_ethtool.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_ethtool.c
index d4f179f..9103e3e 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_ethtool.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_ethtool.c
@@ -511,7 +511,7 @@ netxen_nic_get_pauseparam(struct net_device *dev,
 				break;
 		}
 	} else if (adapter->ahw.port_type = NETXEN_NIC_XGBE) {
-		if ((port < 0) || (port > NETXEN_NIU_MAX_XG_PORTS))
+		if ((port < 0) || (port >= NETXEN_NIU_MAX_XG_PORTS))
 			return;
 		pause->rx_pause = 1;
 		val = NXRD32(adapter, NETXEN_NIU_XG_PAUSE_CTL);
@@ -577,7 +577,7 @@ netxen_nic_set_pauseparam(struct net_device *dev,
 		}
 		NXWR32(adapter, NETXEN_NIU_GB_PAUSE_CTL, val);
 	} else if (adapter->ahw.port_type = NETXEN_NIC_XGBE) {
-		if ((port < 0) || (port > NETXEN_NIU_MAX_XG_PORTS))
+		if ((port < 0) || (port >= NETXEN_NIU_MAX_XG_PORTS))
 			return -EIO;
 		val = NXRD32(adapter, NETXEN_NIU_XG_PAUSE_CTL);
 		if (port = 0) {
diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c
index de96a94..946160f 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c
@@ -365,7 +365,7 @@ static int netxen_niu_disable_xg_port(struct netxen_adapter *adapter)
 	if (NX_IS_REVISION_P3(adapter->ahw.revision_id))
 		return 0;
 
-	if (port > NETXEN_NIU_MAX_XG_PORTS)
+	if (port >= NETXEN_NIU_MAX_XG_PORTS)
 		return -EINVAL;
 
 	mac_cfg = 0;
@@ -392,7 +392,7 @@ static int netxen_p2_nic_set_promisc(struct netxen_adapter *adapter, u32 mode)
 	u32 port = adapter->physical_port;
 	u16 board_type = adapter->ahw.board_type;
 
-	if (port > NETXEN_NIU_MAX_XG_PORTS)
+	if (port >= NETXEN_NIU_MAX_XG_PORTS)
 		return -EINVAL;
 
 	mac_cfg = NXRD32(adapter, NETXEN_NIU_XGE_CONFIG_0 + (0x10000 * port));
-- 
1.7.4.4

