From: Julia Lawall <julia@diku.dk>
Date: Wed, 12 Aug 2009 14:51:09 +0000
Subject: [PATCH] drivers/usb/host: Correct use of.and &
Message-Id: <Pine.LNX.4.64.0908121650450.8540@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Correct priority problem in the use of ! and &.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@ expression E; constant C; @@
- !E & C
+ !(E & C)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/host/isp1362-hcd.c      |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/isp1362-hcd.c b/drivers/usb/host/isp1362-hcd.c
index 16ba1ea..e35d828 100644
--- a/drivers/usb/host/isp1362-hcd.c
+++ b/drivers/usb/host/isp1362-hcd.c
@@ -1075,8 +1075,10 @@ static irqreturn_t isp1362_irq(struct usb_hcd *hcd)
 		isp1362_clr_mask16(isp1362_hcd, HCBUFSTAT, HCBUFSTAT_ISTL0_FULL);
 		DBG(1, "%s: ISTL0\n", __func__);
 		WARN_ON((int)!!isp1362_hcd->istl_flip);
-		WARN_ON(isp1362_read_reg16(isp1362_hcd, HCBUFSTAT) & HCBUFSTAT_ISTL0_ACTIVE);
-		WARN_ON(!isp1362_read_reg16(isp1362_hcd, HCBUFSTAT) & HCBUFSTAT_ISTL0_DONE);
+		WARN_ON(isp1362_read_reg16(isp1362_hcd, HCBUFSTAT) &
+			HCBUFSTAT_ISTL0_ACTIVE);
+		WARN_ON(!(isp1362_read_reg16(isp1362_hcd, HCBUFSTAT) &
+			HCBUFSTAT_ISTL0_DONE));
 		isp1362_hcd->irqenb &= ~HCuPINT_ISTL0;
 	}
 
@@ -1087,8 +1089,10 @@ static irqreturn_t isp1362_irq(struct usb_hcd *hcd)
 		isp1362_clr_mask16(isp1362_hcd, HCBUFSTAT, HCBUFSTAT_ISTL1_FULL);
 		DBG(1, "%s: ISTL1\n", __func__);
 		WARN_ON(!(int)isp1362_hcd->istl_flip);
-		WARN_ON(isp1362_read_reg16(isp1362_hcd, HCBUFSTAT) & HCBUFSTAT_ISTL1_ACTIVE);
-		WARN_ON(!isp1362_read_reg16(isp1362_hcd, HCBUFSTAT) & HCBUFSTAT_ISTL1_DONE);
+		WARN_ON(isp1362_read_reg16(isp1362_hcd, HCBUFSTAT) &
+			HCBUFSTAT_ISTL1_ACTIVE);
+		WARN_ON(!(isp1362_read_reg16(isp1362_hcd, HCBUFSTAT) &
+			HCBUFSTAT_ISTL1_DONE));
 		isp1362_hcd->irqenb &= ~HCuPINT_ISTL1;
 	}
 
