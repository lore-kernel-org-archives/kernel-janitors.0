From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Mar 2005 20:33:13 +0000
Subject: [KJ] [PATCH] drm/drm_os_linux: use
Message-Id: <20050302203313.GL2741@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86083127176890528=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86083127176890528==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Rather than use custom code in DRM_WAIT_ON() to do exactly
what wait_event_interruptible_timeout() does, use the function and just
change the return values appropriately.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-kj-v/drivers/char/drm/drm_os_linux.h	2005-03-01 23:38:26.000000000 -0800
+++ 2.6.11-kj/drivers/char/drm/drm_os_linux.h	2005-03-02 12:30:45.000000000 -0800
@@ -6,6 +6,7 @@
 
 #include <linux/interrupt.h>	/* For task queue support */
 #include <linux/delay.h>
+#include <linux/wait.h>
 
 /** File pointer type */
 #define DRMFILE                         struct file *
@@ -121,26 +122,12 @@ do { 									 \
 
 #define DRM_WAIT_ON( ret, queue, timeout, condition )		\
 do {								\
-	DECLARE_WAITQUEUE(entry, current);			\
-	unsigned long end = jiffies + (timeout);		\
-	add_wait_queue(&(queue), &entry);			\
-								\
-	for (;;) {						\
-		__set_current_state(TASK_INTERRUPTIBLE);	\
-		if (condition)					\
-			break;					\
-		if (time_after_eq(jiffies, end)) {		\
-			ret = -EBUSY;				\
-			break;					\
-		}						\
-		schedule_timeout((HZ/100 > 1) ? HZ/100 : 1);	\
-		if (signal_pending(current)) {			\
-			ret = -EINTR;				\
-			break;					\
-		}						\
-	}							\
-	__set_current_state(TASK_RUNNING);			\
-	remove_wait_queue(&(queue), &entry);			\
+	long __ret;						\
+	__ret = wait_event_interruptible_timeout(queue, condition, timeout); \
+	if (__ret == 0)						\
+		ret = -EBUSY;					\
+	else if (__ret == -ERESTARTSYS)				\
+		ret = -EINTR;					\
 } while (0)
 
 

--===============86083127176890528==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86083127176890528==--
