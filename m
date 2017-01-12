From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jan 2017 18:46:32 +0000
Subject: [patch net-next] stmmac: indent an if statement
Message-Id: <20170112184631.GA12157@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, jpinto <Joao.Pinto@synopsys.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The break statement should be indented one more tab.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index ac32f9e..4daa8a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -191,7 +191,7 @@ static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
 		for_each_child_of_node(np, plat->mdio_node) {
 			if (of_device_is_compatible(plat->mdio_node,
 						    "snps,dwmac-mdio"))
-			break;
+				break;
 		}
 	}
 
