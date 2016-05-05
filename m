From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 May 2016 13:19:44 +0000
Subject: [patch 2/2] netxen: reversed condition in netxen_nic_set_link_parameters()
Message-Id: <20160505131944.GC3038@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manish Chopra <manish.chopra@qlogic.com>
Cc: Sony Chacko <sony.chacko@qlogic.com>, Rajesh Borundia <rajesh.borundia@qlogic.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that we are using "autoneg" without
initializing it.  The problem is the ->phy_read() condition is reversed
so we only set this on error instead of success.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c
index a320541..2b10f1b 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c
@@ -1944,7 +1944,7 @@ void netxen_nic_set_link_parameters(struct netxen_adapter *adapter)
 				if (adapter->phy_read &&
 				    adapter->phy_read(adapter,
 						      NETXEN_NIU_GB_MII_MGMT_ADDR_AUTONEG,
-						      &autoneg) != 0)
+						      &autoneg) = 0)
 					adapter->link_autoneg = autoneg;
 			} else
 				goto link_down;
