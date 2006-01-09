From: carlos neira <cneira@srb.cl>
Date: Mon, 09 Jan 2006 11:04:38 +0000
Subject: [KJ] 8139too.c
Message-Id: <200601091104.39196.cneira@srb.cl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_HNkwDnnQ2W8kUGD"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_HNkwDnnQ2W8kUGD
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

greetings :
patch: linux-2.6.15-rc7/drivers/net/8139too.c

This patch uses wait_event_interruptible instead of  slep_on_interruptible , 
compiled ok  , using it right now.
Please some comments if i messed something up .



-- 
"Employ your time in improving yourself by other men's writings, so that you 
shall gain easily what others have labored hard for."
Socrates

--Boundary-00=_HNkwDnnQ2W8kUGD
Content-Type: text/x-diff;
  charset="us-ascii";
  name="8139too.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="8139too.patch"

diff -urN /usr/src/linux-2.6.15-rc7/drivers/net/8139too.c /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/net/8139too.c
--- /usr/src/linux-2.6.15-rc7/drivers/net/8139too.c	2005-12-24 20:47:48.000000000 -0300
+++ /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/net/8139too.c	2006-01-08 20:57:01.000000000 -0300
@@ -111,6 +111,7 @@
 #include <asm/io.h>
 #include <asm/uaccess.h>
 #include <asm/irq.h>
+#include<linux/wait.h>
 
 #define RTL8139_DRIVER_NAME   DRV_NAME " Fast Ethernet driver " DRV_VERSION
 #define PFX DRV_NAME ": "
@@ -1599,18 +1600,21 @@
 	struct net_device *dev = data;
 	struct rtl8139_private *tp = netdev_priv(dev);
 	unsigned long timeout;
-
+	wait_queue_head_t  rlq;
+	init_waitqueue_head(&rlq);
+	int gotsignal ;
 	daemonize("%s", dev->name);
 	allow_signal(SIGTERM);
 
 	while (1) {
 		timeout = next_tick;
 		do {
-			timeout = interruptible_sleep_on_timeout (&tp->thr_wait, timeout);
-			/* make swsusp happy with our thread */
-			try_to_freeze();
-		} while (!signal_pending (current) && (timeout > 0));
+		  
+		 gotsignal = wait_event_interruptible(rlq,timeout > 0);	
+		  
+		} while (gotsignal != 0  && (timeout > 0));
 
+		
 		if (signal_pending (current)) {
 			flush_signals(current);
 		}

--Boundary-00=_HNkwDnnQ2W8kUGD
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_HNkwDnnQ2W8kUGD--
