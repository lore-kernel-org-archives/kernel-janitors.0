From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Mar 2019 23:56:35 +0000
Subject: [PATCH] net: sis900: fix indentation issues, remove some spaces
Message-Id: <20190314235635.11667-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniele Venzano <venza@brownhat.org>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several statements that contain extra spacing in
the indentation; clean this up by removing spaces. Also
add { } braces on if statement to keep to kernel coding
style.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/sis/sis900.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/sis/sis900.c b/drivers/net/ethernet/sis/sis900.c
index 6073387511f8..67f9bb6e941b 100644
--- a/drivers/net/ethernet/sis/sis900.c
+++ b/drivers/net/ethernet/sis/sis900.c
@@ -730,10 +730,10 @@ static u16 sis900_default_phy(struct net_device * net_dev)
 		status = mdio_read(net_dev, phy->phy_addr, MII_STATUS);
 
 		/* Link ON & Not select default PHY & not ghost PHY */
-		 if ((status & MII_STAT_LINK) && !default_phy &&
-					(phy->phy_types != UNKNOWN))
-		 	default_phy = phy;
-		 else {
+		if ((status & MII_STAT_LINK) && !default_phy &&
+		    (phy->phy_types != UNKNOWN)) {
+			default_phy = phy;
+		} else {
 			status = mdio_read(net_dev, phy->phy_addr, MII_CONTROL);
 			mdio_write(net_dev, phy->phy_addr, MII_CONTROL,
 				status | MII_CNTL_AUTO | MII_CNTL_ISOLATE);
@@ -741,7 +741,7 @@ static u16 sis900_default_phy(struct net_device * net_dev)
 				phy_home = phy;
 			else if(phy->phy_types = LAN)
 				phy_lan = phy;
-		 }
+		}
 	}
 
 	if (!default_phy && phy_home)
-- 
2.20.1
