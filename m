From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 23:56:34 +0000
Subject: [KJ] [PATCH 20/39] net/ip_vs_sync: replace schedule_timeout() with
Message-Id: <20050120235634.GI2600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75860382216453193=="
List-Id: <kernel-janitors.vger.kernel.org>
To: davem@davemloft.net, kuznet@ms2.inr.ac.ru, jmorris@redhat.com, yoshfuji@linux-ipv6.org, kaber@coreworks.de
Cc: netdev@oss.sgi.com, kernel-janitors@lists.osdl.org

--===============75860382216453193==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use ssleep() instead of schedule_timeout() to guarantee the task
delays as expected. The first two replacements use TASK_INTERRUPTIBLE but do not
check for signals, so ssleep() should be appropriate.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/net/ipv4/ipvs/ip_vs_sync.c	2005-01-15 16:55:44.000000000 -0800
+++ 2.6.11-rc1-kj/net/ipv4/ipvs/ip_vs_sync.c	2005-01-18 13:03:21.000000000 -0800
@@ -23,7 +23,7 @@
 #include <linux/slab.h>
 #include <linux/net.h>
 #include <linux/completion.h>
-
+#include <linux/delay.h>
 #include <linux/skbuff.h>
 #include <linux/in.h>
 #include <linux/igmp.h>                 /* for ip_mc_join_group */
@@ -647,8 +647,7 @@ static void sync_master_loop(void)
 		if (stop_master_sync)
 			break;
 
-		__set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ);
+		ssleep(1);
 	}
 
 	/* clean up the sync_buff queue */
@@ -705,8 +704,7 @@ static void sync_backup_loop(void)
 		if (stop_backup_sync)
 			break;
 
-		__set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ);
+		ssleep(1);
 	}
 
 	/* release the sending multicast socket */
@@ -818,8 +816,7 @@ static int fork_sync_thread(void *startu
 	if ((pid = kernel_thread(sync_thread, startup, 0)) < 0) {
 		IP_VS_ERR("could not create sync_thread due to %d... "
 			  "retrying.\n", pid);
-		current->state = TASK_UNINTERRUPTIBLE;
-		schedule_timeout(HZ);
+		ssleep(1);
 		goto repeat;
 	}
 
@@ -853,8 +850,7 @@ int start_sync_thread(int state, char *m
 	if ((pid = kernel_thread(fork_sync_thread, &startup, 0)) < 0) {
 		IP_VS_ERR("could not create fork_sync_thread due to %d... "
 			  "retrying.\n", pid);
-		current->state = TASK_UNINTERRUPTIBLE;
-		schedule_timeout(HZ);
+		ssleep(1);
 		goto repeat;
 	}
 

--===============75860382216453193==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75860382216453193==--
