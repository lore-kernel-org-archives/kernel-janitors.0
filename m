From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 19:14:18 +0000
Subject: [KJ] [PATCH 9/20] w1/w1: remove interruptible_sleep_on_timeout()
Message-Id: <20050202191418.GK2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61287434371506389=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============61287434371506389==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Replace deprecated interruptible_sleep_on_timeout() with direct
wait-queue usage. Ideally, I would use wait_event_interruptible_timeout();
however, there is no condition to sleep on here, unless I was to use the
try_to_freeze() call as one. That is not the case in the current code, though,
and I'm not sure it can/should be. Since timeout is a jiffies-unit variable,
change the type to unsigned long. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/w1/w1.c	2005-01-24 09:34:16.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/w1/w1.c	2005-02-02 11:11:21.000000000 -0800
@@ -32,6 +32,7 @@
 #include <linux/device.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
+#include <linux/wait.h>
 
 #include "w1.h"
 #include "w1_io.h"
@@ -646,10 +647,12 @@ void w1_destroy_master_attributes(struct
 
 int w1_control(void *data)
 {
+	DEFINE_WAIT(wait);
 	struct w1_slave *sl;
 	struct w1_master *dev;
 	struct list_head *ent, *ment, *n, *mn;
-	int err, have_to_wait = 0, timeout;
+	int err, have_to_wait = 0;
+	unsigned long timeout;
 
 	daemonize("w1_control");
 	allow_signal(SIGTERM);
@@ -659,7 +662,9 @@ int w1_control(void *data)
 
 		timeout = w1_timeout*HZ;
 		do {
-			timeout = interruptible_sleep_on_timeout(&w1_control_wait, timeout);
+			prepare_to_wait(&w1_control_wait, &wait, TASK_INTERRUPTIBLE);
+			timeout = schedule_timeout(timeout);
+			finish_wait(&w1_control_wait, &wait);
 			try_to_freeze(PF_FREEZE);
 		} while (!signal_pending(current) && (timeout > 0));
 
@@ -720,6 +725,7 @@ int w1_control(void *data)
 
 int w1_process(void *data)
 {
+	DEFINE_WAIT(wait);
 	struct w1_master *dev = (struct w1_master *) data;
 	unsigned long timeout;
 	struct list_head *ent, *n;
@@ -731,7 +737,9 @@ int w1_process(void *data)
 	while (!dev->need_exit) {
 		timeout = w1_timeout*HZ;
 		do {
-			timeout = interruptible_sleep_on_timeout(&dev->kwait, timeout);
+			prepare_to_wait(&w1_control_wait, &wait, TASK_INTERRUPTIBLE);
+			timeout = schedule_timeout(timeout);
+			finish_wait(&w1_control_wait, &wait);
 			try_to_freeze(PF_FREEZE);
 		} while (!signal_pending(current) && (timeout > 0));
 

--===============61287434371506389==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61287434371506389==--
