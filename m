From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 23:53:52 +0000
Subject: [KJ] [PATCH 19/39] net/dev: replace schedule_timeout() with msleep()
Message-Id: <20050120235352.GH2600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3314243549875473=="
List-Id: <kernel-janitors.vger.kernel.org>
To: netdev@oss.sgi.com
Cc: linux-net@vger.kernel.org, kernel-janitors@lists.osdl.org

--===============3314243549875473==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The current code uses TASK_INTERRUPTIBLE, but does not
respond to signals, so msleep() should be ok.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/net/core/dev.c	2005-01-15 16:55:44.000000000 -0800
+++ 2.6.11-rc1-kj/net/core/dev.c	2005-01-18 12:59:16.000000000 -0800
@@ -108,6 +108,7 @@
 #include <linux/kallsyms.h>
 #include <linux/netpoll.h>
 #include <linux/rcupdate.h>
+#include <linux/delay.h>
 #ifdef CONFIG_NET_RADIO
 #include <linux/wireless.h>		/* Note : will define WIRELESS_EXT */
 #include <net/iw_handler.h>
@@ -2899,8 +2900,7 @@ static void netdev_wait_allrefs(struct n
 			rebroadcast_time = jiffies;
 		}
 
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(HZ / 4);
+		msleep(250);
 
 		if (time_after(jiffies, warning_time + 10 * HZ)) {
 			printk(KERN_EMERG "unregister_netdevice: "

--===============3314243549875473==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3314243549875473==--
