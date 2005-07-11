From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 11 Jul 2005 18:30:30 +0000
Subject: [KJ] [UPDATE PATCH 10/14] drm/i830_irq: use
Message-Id: <20050711183030.GC2603@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============053943120272798462=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============053943120272798462==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08.07.2005 [17:14:12 -0700], Nishanth Aravamudan wrote:
> From: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> Description: Replace custom wait-queue usage with
> wait_event_interruptible_timeout(). This required some more complex
> return code evaluation, but simplifies the loop itself to one statement.

Freaking typos...

Description: Replace custom wait-queue usage with
wait_event_interruptible_timeout(). This required some more complex
return code evaluation, but simplifies the loop itself to one statement.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

---

 i830_irq.c |   45 ++++++++++++++++++---------------------------
 1 files changed, 18 insertions(+), 27 deletions(-)

diff -urp 2.6.13-rc2-kj/drivers/char/drm/i830_irq.c 2.6.13-rc2-kj-dev/drivers/char/drm/i830_irq.c
--- 2.6.13-rc2-kj/drivers/char/drm/i830_irq.c	2005-07-06 07:57:03.000000000 -0700
+++ 2.6.13-rc2-kj-dev/drivers/char/drm/i830_irq.c	2005-07-08 13:51:07.000000000 -0700
@@ -32,6 +32,7 @@
 #include "i830_drv.h"
 #include <linux/interrupt.h>	/* For task queue support */
 #include <linux/delay.h>
+#include <linux/wait.h>		/* For wait_event */
 
 
 irqreturn_t i830_driver_irq_handler( DRM_IRQ_ARGS )
@@ -77,9 +78,7 @@ int i830_wait_irq(drm_device_t *dev, int
 {
   	drm_i830_private_t *dev_priv = 
 	   (drm_i830_private_t *)dev->dev_private;
-	DECLARE_WAITQUEUE(entry, current);
-	unsigned long end = jiffies + HZ*3;
-	int ret = 0;
+	int ret;
 
 	DRM_DEBUG("%s\n", __FUNCTION__);
 
@@ -88,31 +87,23 @@ int i830_wait_irq(drm_device_t *dev, int
 
 	dev_priv->sarea_priv->perf_boxes |= I830_BOX_WAIT;
 
-	add_wait_queue(&dev_priv->irq_queue, &entry);
+	ret = wait_event_interruptible_timeout(dev_priv->irq_queue,
+			(atomic_read(&dev_priv->irq_received) >= irq_nr),
+			HZ*3);
+
+	if (ret == 0) {
+		DRM_ERROR("timeout iir %x imr %x ier %x hwstam %x\n",
+				I830_READ16( I830REG_INT_IDENTITY_R ),
+				I830_READ16( I830REG_INT_MASK_R ),
+				I830_READ16( I830REG_INT_ENABLE_R ),
+				I830_READ16( I830REG_HWSTAM ));
+
+		ret = -EBUSY;	/* Lockup?  Missed irq? */
+	} else if (ret == -ERESTARTSYS) {
+		ret = -EINTR;	/* interrupted */
+	} else
+		ret = 0;	/* condition */
 
-	for (;;) {
-		__set_current_state(TASK_INTERRUPTIBLE);
-	   	if (atomic_read(&dev_priv->irq_received) >= irq_nr) 
-		   break;
-		if((signed)(end - jiffies) <= 0) {
-			DRM_ERROR("timeout iir %x imr %x ier %x hwstam %x\n",
-				  I830_READ16( I830REG_INT_IDENTITY_R ),
-				  I830_READ16( I830REG_INT_MASK_R ),
-				  I830_READ16( I830REG_INT_ENABLE_R ),
-				  I830_READ16( I830REG_HWSTAM ));
-
-		   	ret = -EBUSY;	/* Lockup?  Missed irq? */
-			break;
-		}
-	      	schedule_timeout(HZ*3);
-	      	if (signal_pending(current)) {
-		   	ret = -EINTR;
-			break;
-		}
-	}
-
-	__set_current_state(TASK_RUNNING);
-	remove_wait_queue(&dev_priv->irq_queue, &entry);
 	return ret;
 }
 

--===============053943120272798462==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============053943120272798462==--
