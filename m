From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 00:41:43 +0000
Subject: [KJ] [PATCH 30/34] sbus/bpp: remove sleep_on() usage
Message-Id: <20050126004143.GV12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66545125651006087=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============66545125651006087==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait-queue directly instead of the deprecated sleep_on()
function. This required adding a local wait-queue.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/sbus/char/bpp.c	2005-01-24 09:34:12.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/sbus/char/bpp.c	2005-01-25 16:38:44.000000000 -0800
@@ -20,6 +20,7 @@
 #include <linux/timer.h>
 #include <linux/ioport.h>
 #include <linux/major.h>
+#include <linux/wait.h>
 #include <linux/devfs_fs_kernel.h>
 
 #include <asm/uaccess.h>
@@ -302,11 +303,14 @@ static void bpp_wake_up(unsigned long va
 
 static void snooze(unsigned long snooze_time, unsigned minor)
 {
+      DEFINE_WAIT(wait);
       init_timer(&instances[minor].timer_list);
       instances[minor].timer_list.expires = jiffies + snooze_time + 1;
       instances[minor].timer_list.data    = minor;
       add_timer(&instances[minor].timer_list);
-      sleep_on (&instances[minor].wait_queue);
+      prepare_to_wait(&instances[minor].wait_queue, &wait, TASK_UNINTERRUPTIBLE);
+      schedule();
+      finish_wait(&instances[minor].wait_queue, &wait);
 }
 
 static int wait_for(unsigned short set, unsigned short clr,

--===============66545125651006087==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66545125651006087==--
