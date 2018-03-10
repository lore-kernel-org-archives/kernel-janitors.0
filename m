From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Mar 2018 18:24:21 +0000
Subject: [PATCH 1/2] net/usb/ax88179_178a: Use common code in ax88179_chk_eee()
Message-Id: <a7fff45f-4426-ec33-8b8d-caf1e3a9f0be@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, netdev@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>, "David S. Miller" <davem@davemloft.net>, Philippe Reynes <tremyfr@gmail.com>, Yuval Shaia <yuval.shaia@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Mar 2018 18:22:43 +0100

Adjust a jump target so that a bit of common code can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/usb/ax88179_178a.c | 34 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index f32261ecd215..e4b0baa98e9a 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -689,49 +689,37 @@ static int ax88179_chk_eee(struct usbnet *dev)
 		eee_cap = ax88179_phy_read_mmd_indirect(dev,
 							MDIO_PCS_EEE_ABLE,
 							MDIO_MMD_PCS);
-		if (eee_cap < 0) {
-			priv->eee_active = 0;
-			return false;
-		}
+		if (eee_cap < 0)
+			goto set_inactive;
 
 		cap = mmd_eee_cap_to_ethtool_sup_t(eee_cap);
-		if (!cap) {
-			priv->eee_active = 0;
-			return false;
-		}
+		if (!cap)
+			goto set_inactive;
 
 		eee_lp = ax88179_phy_read_mmd_indirect(dev,
 						       MDIO_AN_EEE_LPABLE,
 						       MDIO_MMD_AN);
-		if (eee_lp < 0) {
-			priv->eee_active = 0;
-			return false;
-		}
+		if (eee_lp < 0)
+			goto set_inactive;
 
 		eee_adv = ax88179_phy_read_mmd_indirect(dev,
 							MDIO_AN_EEE_ADV,
 							MDIO_MMD_AN);
-
-		if (eee_adv < 0) {
-			priv->eee_active = 0;
-			return false;
-		}
+		if (eee_adv < 0)
+			goto set_inactive;
 
 		adv = mmd_eee_adv_to_ethtool_adv_t(eee_adv);
 		lp = mmd_eee_adv_to_ethtool_adv_t(eee_lp);
 		supported = (ecmd.speed = SPEED_1000) ?
 			     SUPPORTED_1000baseT_Full :
 			     SUPPORTED_100baseT_Full;
-
-		if (!(lp & adv & supported)) {
-			priv->eee_active = 0;
-			return false;
-		}
+		if (!(lp & adv & supported))
+			goto set_inactive;
 
 		priv->eee_active = 1;
 		return true;
 	}
-
+set_inactive:
 	priv->eee_active = 0;
 	return false;
 }
-- 
2.16.2

