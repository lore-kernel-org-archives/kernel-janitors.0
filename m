From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 21 Feb 2011 09:09:07 +0000
Subject: [PATCH 3/3] Staging: xgifb: Remove unused spinlock conditional compilation logic
Message-Id: <1298279347-8825-4-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

xgifb staging driver for XG20, XG21, XG40, XG42 frame buffer device
has a accelerator engine that never get used (XGIfb_accel is always 0).

Also the driver has a set of defines that hides the synchronization
mechanism used to access critical sections and a way to disable spinlocks
use at compile time.

In a earlier patch all the code that depends on the accelerator being active
was deleted because it was dead code. Since the only usage of this
synchronization defines were in that dead code, this patch removes all the
now unused spinlock conditional compilation logic.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/xgifb/XGI_accel.c |    3 ---
 drivers/staging/xgifb/XGI_accel.h |   14 --------------
 2 files changed, 0 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/xgifb/XGI_accel.c b/drivers/staging/xgifb/XGI_accel.c
index e6241fe..7c69e07 100644
--- a/drivers/staging/xgifb/XGI_accel.c
+++ b/drivers/staging/xgifb/XGI_accel.c
@@ -105,9 +105,6 @@ XGI310Sync(void)
 
 int XGIfb_initaccel(void)
 {
-#ifdef XGIFB_USE_SPINLOCKS
-    spin_lock_init(&xgi_video_info.lockaccel);
-#endif
     return(0);
 }
 
diff --git a/drivers/staging/xgifb/XGI_accel.h b/drivers/staging/xgifb/XGI_accel.h
index 5a0395b..3087e90 100644
--- a/drivers/staging/xgifb/XGI_accel.h
+++ b/drivers/staging/xgifb/XGI_accel.h
@@ -18,20 +18,6 @@
 #ifndef _XGIFB_ACCEL_H
 #define _XGIFB_ACCEL_H
 
-/* Guard accelerator accesses with spin_lock_irqsave? Works well without. */
-#undef XGIFB_USE_SPINLOCKS
-
-#ifdef XGIFB_USE_SPINLOCKS
-#include <linux/spinlock.h>
-#define CRITBEGIN  spin_lock_irqsave(&xgi_video_info.lockaccel), critflags);
-#define CRITEND	   spin_unlock_irqrestore(&xgi_video_info.lockaccel), critflags);
-#define CRITFLAGS  unsigned long critflags;
-#else
-#define CRITBEGIN
-#define CRITEND
-#define CRITFLAGS
-#endif
-
 /* Definitions for the XGI engine communication. */
 
 #define PATREGSIZE      384  /* Pattern register size. 384 bytes @ 0x8300 */
-- 
1.7.0.4

