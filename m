From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 21 Feb 2011 17:16:44 +0000
Subject: [PATCH 2/2] Staging: xgifb: Remove unused spinlock in struct video_info
Message-Id: <1298308605-31690-3-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

xgifb framebuffer driver had an option to use an accelerator engine that never
got used (XGIfb_accel was always 0).

An earlier patchset removed the code relevant to the accelerator.
Since this spinlock was used only for that code, it can be deleted as well.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/xgifb/XGIfb.h |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/xgifb/XGIfb.h b/drivers/staging/xgifb/XGIfb.h
index bb4640a..b6715ba 100644
--- a/drivers/staging/xgifb/XGIfb.h
+++ b/drivers/staging/xgifb/XGIfb.h
@@ -1,6 +1,5 @@
 #ifndef _LINUX_XGIFB
 #define _LINUX_XGIFB
-#include <linux/spinlock.h>
 #include <asm/ioctl.h>
 #include <asm/types.h>
 
@@ -190,8 +189,6 @@ struct video_info{
         unsigned long  XGI310_AccelDepth;
         unsigned long  CommandReg;
 
-        spinlock_t     lockaccel;
-
         unsigned int   pcibus;
         unsigned int   pcislot;
         unsigned int   pcifunc;
-- 
1.7.0.4

