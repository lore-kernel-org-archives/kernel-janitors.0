From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Mar 2018 18:26:16 +0000
Subject: [PATCH 2/2] net/usb/ax88179_178a: Delete three unnecessary variables in ax88179_chk_eee()
Message-Id: <019cc24b-d9c0-d782-35e8-f9f8be0534db@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, netdev@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>, "David S. Miller" <davem@davemloft.net>, Philippe Reynes <tremyfr@gmail.com>, Yuval Shaia <yuval.shaia@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Mar 2018 18:53:28 +0100

Use three values directly for a condition check without assigning them
to intermediate variables.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/usb/ax88179_178a.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index e4b0baa98e9a..3e83be232504 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -684,7 +684,7 @@ static int ax88179_chk_eee(struct usbnet *dev)
 
 	if (ecmd.duplex & DUPLEX_FULL) {
 		int eee_lp, eee_cap, eee_adv;
-		u32 lp, cap, adv, supported = 0;
+		u32 cap;
 
 		eee_cap = ax88179_phy_read_mmd_indirect(dev,
 							MDIO_PCS_EEE_ABLE,
@@ -708,12 +708,11 @@ static int ax88179_chk_eee(struct usbnet *dev)
 		if (eee_adv < 0)
 			goto set_inactive;
 
-		adv = mmd_eee_adv_to_ethtool_adv_t(eee_adv);
-		lp = mmd_eee_adv_to_ethtool_adv_t(eee_lp);
-		supported = (ecmd.speed = SPEED_1000) ?
-			     SUPPORTED_1000baseT_Full :
-			     SUPPORTED_100baseT_Full;
-		if (!(lp & adv & supported))
+		if (!(mmd_eee_adv_to_ethtool_adv_t(eee_lp) &
+		      mmd_eee_adv_to_ethtool_adv_t(eee_adv) &
+		      ((ecmd.speed = SPEED_1000)
+		       ? SUPPORTED_1000baseT_Full
+		       : SUPPORTED_100baseT_Full)))
 			goto set_inactive;
 
 		priv->eee_active = 1;
-- 
2.16.2

