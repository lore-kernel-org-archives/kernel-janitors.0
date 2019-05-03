From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 12:50:24 +0000
Subject: [PATCH 1/2 net-next] net: ll_temac: Fix an NULL vs IS_ERR() check in temac_open()
Message-Id: <20190503125024.GF29695@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Esben Haabendal <esben@geanix.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Andrew Lunn <andrew@lunn.ch>, Yang Wei <yang.wei9@zte.com.cn>, YueHaibing <yuehaibing@huawei.com>, Luis Chamberlain <mcgrof@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The phy_connect() function doesn't return NULL pointers.  It returns
error pointers on error, so I have updated the check.

Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/xilinx/ll_temac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
index 1003ee14c833..bcb97fbf5b54 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_main.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
@@ -927,9 +927,9 @@ static int temac_open(struct net_device *ndev)
 	} else if (strlen(lp->phy_name) > 0) {
 		phydev = phy_connect(lp->ndev, lp->phy_name, temac_adjust_link,
 				     lp->phy_interface);
-		if (!phydev) {
+		if (IS_ERR(phydev)) {
 			dev_err(lp->dev, "phy_connect() failed\n");
-			return -ENODEV;
+			return PTR_ERR(phydev);
 		}
 		phy_start(phydev);
 	}
-- 
2.18.0
