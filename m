From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 30 Dec 2016 20:56:12 +0000
Subject: [PATCH] staging: r8192U_core: Use kmalloc_array() in rtl8192_usb_initendpoints()
Message-Id: <1dda87f1-8c49-ef2a-fa1c-0ebec5bca92c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Baoyou Xie <baoyou.xie@linaro.org>, Bhumika Goyal <bhumirks@gmail.com>, Binoy Jayan <binoy.jayan@linaro.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Nicholas Sim <nicholassimws@gmail.com>, Salah Triki <salah.triki@acm.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 30 Dec 2016 21:43:22 +0100

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/rtl8192u/r8192U_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index fdb03dccb449..e0791d357259 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -1682,8 +1682,9 @@ static short rtl8192_usb_initendpoints(struct net_device *dev)
 {
 	struct r8192_priv *priv = ieee80211_priv(dev);
 
-	priv->rx_urb = kmalloc(sizeof(struct urb *) * (MAX_RX_URB + 1),
-			       GFP_KERNEL);
+	priv->rx_urb = kmalloc_array(MAX_RX_URB + 1,
+				     sizeof(*priv->rx_urb),
+				     GFP_KERNEL);
 	if (!priv->rx_urb)
 		return -ENOMEM;
 
-- 
2.11.0

