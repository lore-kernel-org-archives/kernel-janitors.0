From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 23:41:58 +0000
Subject: [KJ] [PATCH 16/39] net/aarp: replace schedule_timeout() with
Message-Id: <20050120234158.GD2600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73798671930671578=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============73798671930671578==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The current code is not wrong, but it does not account for
early return due to signals, so I think msleep() should be appropriate.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/net/appletalk/aarp.c	2005-01-15 16:55:44.000000000 -0800
+++ 2.6.11-rc1-kj/net/appletalk/aarp.c	2005-01-18 11:33:38.000000000 -0800
@@ -35,6 +35,7 @@
 #include <net/datalink.h>
 #include <net/psnap.h>
 #include <linux/atalk.h>
+#include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
@@ -462,8 +463,7 @@ void aarp_probe_network(struct atalk_ifa
 			aarp_send_probe(atif->dev, &atif->address);
 
 			/* Defer 1/10th */
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(HZ / 10);
+			msleep(100);
 
 			if (atif->status & ATIF_PROBE_FAIL)
 				break;
@@ -510,9 +510,8 @@ int aarp_proxy_probe_network(struct atal
 		aarp_send_probe(atif->dev, sa);
 
 		/* Defer 1/10th */
-		current->state = TASK_INTERRUPTIBLE;
 		write_unlock_bh(&aarp_lock);
-		schedule_timeout(HZ / 10);
+		msleep(100);
 		write_lock_bh(&aarp_lock);
 
 		if (entry->status & ATIF_PROBE_FAIL)

--===============73798671930671578==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73798671930671578==--
