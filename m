From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 22 Mar 2018 02:09:51 +0000
Subject: [PATCH -next] staging: mt7621-eth: fix return value check in mtk_connect_phy_node()
Message-Id: <1521684591-77182-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1521684579-76660-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1521684579-76660-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Crispin <blogic@openwrt.org>, Michael Lee <igvtee@gmail.com>, NeilBrown <neil@brown.name>, Felix Fietkau <nbd@openwrt.org>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org

In case of error, the function of_phy_connect() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: e3cbf478f846 ("staging: mt7621-eth: add the drivers core files")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/staging/mt7621-eth/mdio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-eth/mdio.c b/drivers/staging/mt7621-eth/mdio.c
index 96ecda9..9d71307 100644
--- a/drivers/staging/mt7621-eth/mdio.c
+++ b/drivers/staging/mt7621-eth/mdio.c
@@ -82,10 +82,10 @@ int mtk_connect_phy_node(struct mtk_eth *eth, struct mtk_mac *mac,
 
 	phydev = of_phy_connect(eth->netdev[mac->id], phy_node,
 				mtk_phy_link_adjust, 0, phy_mode);
-	if (IS_ERR(phydev)) {
+	if (!phydev) {
 		dev_err(eth->dev, "could not connect to PHY\n");
 		eth->phy->phy_node[port] = NULL;
-		return PTR_ERR(phydev);
+		return -ENODEV;
 	}
 
 	phydev->supported &= PHY_GBIT_FEATURES;

