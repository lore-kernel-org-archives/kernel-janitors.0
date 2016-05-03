From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 May 2016 07:49:00 +0000
Subject: [patch] usb: dwc3: gadget: fix mask and shift order in DWC3_DCFG_NUMP()
Message-Id: <20160503074900.GA9816@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In the original DWC3_DCFG_NUMP() was always zero.  It looks like the
intent was to shift first and then do the mask.

Fixes: 2a58f9c12bb3 ('usb: dwc3: gadget: disable automatic calculation of ACK TP NUMP')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 186a886..7ddf944 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -277,7 +277,7 @@
 #define DWC3_DCFG_FULLSPEED1	(3 << 0)
 
 #define DWC3_DCFG_NUMP_SHIFT	17
-#define DWC3_DCFG_NUMP(n)	(((n) & 0x1f) >> DWC3_DCFG_NUMP_SHIFT)
+#define DWC3_DCFG_NUMP(n)	(((n) >> DWC3_DCFG_NUMP_SHIFT) & 0x1f)
 #define DWC3_DCFG_NUMP_MASK	(0x1f << DWC3_DCFG_NUMP_SHIFT)
 #define DWC3_DCFG_LPM_CAP	(1 << 22)
 
