From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 23:59:43 +0000
Subject: [KJ] [PATCH 22/39] net/resources: replace schedule_timeout() with
Message-Id: <20050120235943.GK2600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37890218342754678=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37890218342754678==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The current code uses TASK_INTERRUPTIBLE, but does not check
for signals, so I believe the change to msleep() should be ok.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/net/atm/resources.c	2005-01-15 16:55:44.000000000 -0800
+++ 2.6.11-rc1-kj/net/atm/resources.c	2005-01-18 11:34:31.000000000 -0800
@@ -16,6 +16,7 @@
 #include <linux/kernel.h> /* for barrier */
 #include <linux/module.h>
 #include <linux/bitops.h>
+#include <linux/delay.h>
 #include <net/sock.h>	 /* for struct sock */
 
 #include "common.h"
@@ -137,8 +138,7 @@ void atm_dev_deregister(struct atm_dev *
 
         warning_time = jiffies;
         while (atomic_read(&dev->refcnt) != 1) {
-                current->state = TASK_INTERRUPTIBLE;
-                schedule_timeout(HZ / 4);
+                msleep(250);
                 if ((jiffies - warning_time) > 10 * HZ) {
                         printk(KERN_EMERG "atm_dev_deregister: waiting for "
                                "dev %d to become free. Usage count = %d\n",

--===============37890218342754678==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37890218342754678==--
