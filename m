From: matt mooney <mfm@muteddisk.com>
Date: Fri, 06 May 2011 10:47:47 +0000
Subject: [PATCH 07/16] staging: usbip: usbip_event.c: coding style cleanup
Message-Id: <abed1c2c2d74725f88e5f1e2c3dd9bf83cb2bae7.1304676742.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1304676742.git.mfm@muteddisk.com>
In-Reply-To: <cover.1304676742.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix a few alignment issues and remove extraneous lines.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/usbip_event.c |   18 ++++++------------
 1 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/usbip/usbip_event.c b/drivers/staging/usbip/usbip_event.c
index f4b287e..8861e3b 100644
--- a/drivers/staging/usbip/usbip_event.c
+++ b/drivers/staging/usbip/usbip_event.c
@@ -17,8 +17,8 @@
  * USA.
  */
 
-#include "usbip_common.h"
 #include <linux/kthread.h>
+#include "usbip_common.h"
 
 static int event_handler(struct usbip_device *ud)
 {
@@ -36,21 +36,18 @@ static int event_handler(struct usbip_device *ud)
 		 */
 		if (ud->event & USBIP_EH_SHUTDOWN) {
 			ud->eh_ops.shutdown(ud);
-
 			ud->event &= ~USBIP_EH_SHUTDOWN;
 		}
 
 		/* Reset the device. */
 		if (ud->event & USBIP_EH_RESET) {
 			ud->eh_ops.reset(ud);
-
 			ud->event &= ~USBIP_EH_RESET;
 		}
 
 		/* Mark the device as unusable. */
 		if (ud->event & USBIP_EH_UNUSABLE) {
 			ud->eh_ops.unusable(ud);
-
 			ud->event &= ~USBIP_EH_UNUSABLE;
 		}
 
@@ -68,13 +65,14 @@ static int event_handler_loop(void *data)
 
 	while (!kthread_should_stop()) {
 		wait_event_interruptible(ud->eh_waitq,
-					usbip_event_happened(ud) ||
-					kthread_should_stop());
+					 usbip_event_happened(ud) ||
+					 kthread_should_stop());
 		usbip_dbg_eh("wakeup\n");
 
 		if (event_handler(ud) < 0)
 			break;
 	}
+
 	return 0;
 }
 
@@ -86,9 +84,10 @@ int usbip_start_eh(struct usbip_device *ud)
 	ud->eh = kthread_run(event_handler_loop, ud, "usbip_eh");
 	if (IS_ERR(ud->eh)) {
 		printk(KERN_WARNING
-			"Unable to start control thread\n");
+		       "Unable to start control thread\n");
 		return PTR_ERR(ud->eh);
 	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(usbip_start_eh);
@@ -106,11 +105,8 @@ EXPORT_SYMBOL_GPL(usbip_stop_eh);
 void usbip_event_add(struct usbip_device *ud, unsigned long event)
 {
 	spin_lock(&ud->lock);
-
 	ud->event |= event;
-
 	wake_up(&ud->eh_waitq);
-
 	spin_unlock(&ud->lock);
 }
 EXPORT_SYMBOL_GPL(usbip_event_add);
@@ -120,10 +116,8 @@ int usbip_event_happened(struct usbip_device *ud)
 	int happened = 0;
 
 	spin_lock(&ud->lock);
-
 	if (ud->event != 0)
 		happened = 1;
-
 	spin_unlock(&ud->lock);
 
 	return happened;
-- 
1.7.5.1

