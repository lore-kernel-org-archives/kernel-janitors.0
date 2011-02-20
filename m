From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 20 Feb 2011 16:53:18 +0000
Subject: [PATCH 2/2] Staging: xgifb: Removes CRIT[FLAGS | BEGIN | END] defines and conditional spinlock compi
Message-Id: <1298220798-2942-3-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1298220798-2942-1-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1298220798-2942-1-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Bill Pemberton <wfp5p@virginia.edu>, Arnaud Patard <apatard@mandriva.com>, Randy Dunlap <randy.dunlap@oracle.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Javier Martinez Canillas <martinez.javier@gmail.com>


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/xgifb/XGI_accel.h |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/xgifb/XGI_accel.h b/drivers/staging/xgifb/XGI_accel.h
index 5a0395b..786ac24 100644
--- a/drivers/staging/xgifb/XGI_accel.h
+++ b/drivers/staging/xgifb/XGI_accel.h
@@ -18,19 +18,8 @@
 #ifndef _XGIFB_ACCEL_H
 #define _XGIFB_ACCEL_H
 
-/* Guard accelerator accesses with spin_lock_irqsave? Works well without. */
-#undef XGIFB_USE_SPINLOCKS
 
-#ifdef XGIFB_USE_SPINLOCKS
 #include <linux/spinlock.h>
-#define CRITBEGIN  spin_lock_irqsave(&xgi_video_info.lockaccel), critflags);
-#define CRITEND	   spin_unlock_irqrestore(&xgi_video_info.lockaccel), critflags);
-#define CRITFLAGS  unsigned long critflags;
-#else
-#define CRITBEGIN
-#define CRITEND
-#define CRITFLAGS
-#endif
 
 /* Definitions for the XGI engine communication. */
 
-- 
1.7.2.3

