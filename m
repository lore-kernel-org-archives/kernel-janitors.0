From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Sat, 16 Feb 2013 13:01:22 +0000
Subject: [PATCH] staging: wlan-ng: hfa384x.h: fix for error reported by smatch
Message-Id: <1361019682-15655-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: garrickhe@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing header include for 'struct urb' datatypes to avoid
potential build issues. Found using smatch.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/wlan-ng/hfa384x.h |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/wlan-ng/hfa384x.h b/drivers/staging/wlan-ng/hfa384x.h
index 04c0433..3dfa85c 100644
--- a/drivers/staging/wlan-ng/hfa384x.h
+++ b/drivers/staging/wlan-ng/hfa384x.h
@@ -59,6 +59,7 @@
 #define HFA384x_FIRMWARE_VERSION(a, b, c) (((a) << 16) + ((b) << 8) + (c))
 
 #include <linux/if_ether.h>
+#include <linux/usb.h>
 
 /*--- Mins & Maxs -----------------------------------*/
 #define	HFA384x_PORTID_MAX		((u16)7)
-- 
1.7.9.5

