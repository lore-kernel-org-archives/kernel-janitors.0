From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Mar 2016 07:18:49 +0000
Subject: [patch 1/2 net-next] mediatek: checking for IS_ERR() instead of NULL
Message-Id: <20160315071849.GH13560@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd@openwrt.org>, John Crispin <blogic@openwrt.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org

of_phy_connect() returns NULL on error, it never returns error pointers.

Fixes: 656e705243fd ('net-next: mediatek: add support for MT7623 ethernet')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index ba3afa5..9759fe5 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -186,9 +186,9 @@ static int mtk_phy_connect_node(struct mtk_eth *eth, struct mtk_mac *mac,
 
 	phydev = of_phy_connect(eth->netdev[mac->id], phy_node,
 				mtk_phy_link_adjust, 0, phy_mode);
-	if (IS_ERR(phydev)) {
+	if (!phydev) {
 		dev_err(eth->dev, "could not connect to PHY\n");
-		return PTR_ERR(phydev);
+		return -ENODEV;
 	}
 
 	dev_info(eth->dev,
