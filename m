From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 12:50:51 +0000
Subject: [PATCH 2/2 net-next] net: ll_temac: remove an unnecessary condition
Message-Id: <20190503125051.GG29695@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190503125024.GF29695@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Esben Haabendal <esben@geanix.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "pdata->mdio_bus_id" is unsigned so this condition is always true.
This patch just removes it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/xilinx/ll_temac_mdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/ll_temac_mdio.c b/drivers/net/ethernet/xilinx/ll_temac_mdio.c
index c2a11703bc6d..a4667326f745 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_mdio.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_mdio.c
@@ -99,7 +99,7 @@ int temac_mdio_setup(struct temac_local *lp, struct platform_device *pdev)
 		of_address_to_resource(np, 0, &res);
 		snprintf(bus->id, MII_BUS_ID_SIZE, "%.8llx",
 			 (unsigned long long)res.start);
-	} else if (pdata && pdata->mdio_bus_id >= 0) {
+	} else if (pdata) {
 		snprintf(bus->id, MII_BUS_ID_SIZE, "%.8llx",
 			 pdata->mdio_bus_id);
 	}
-- 
2.18.0
