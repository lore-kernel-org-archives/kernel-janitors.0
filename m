From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 28 Jul 2004 18:24:21 +0000
Subject: [Kernel-janitors] [PATCH] pcmcia/synclink_cs: replace
Message-Id: <20040728182421.GL1935@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============015490275293998712=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============015490275293998712==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

-Nish

Applys-to: 2.6.7

Description: Uses msecs_to_jiffies() instead of the custom
jiffies_from_ms().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/char/pcmcia/synclink_cs.c	2004-06-15 22:19:13.000000000 -0700
+++ linux-dev/drivers/char/pcmcia/synclink_cs.c	2004-07-28 10:59:21.000000000 -0700
@@ -41,6 +41,7 @@
 #include <linux/signal.h>
 #include <linux/sched.h>
 #include <linux/timer.h>
+#include <linux/time.h>
 #include <linux/interrupt.h>
 #include <linux/pci.h>
 #include <linux/tty.h>
@@ -448,8 +449,6 @@ static int tx_abort(MGSLPC_INFO *info);
 static int set_rxenable(MGSLPC_INFO *info, int enable);
 static int wait_events(MGSLPC_INFO *info, int __user *mask);
 
-#define jiffies_from_ms(a) ((((a) * HZ)/1000)+1)
-
 static MGSLPC_INFO *mgslpc_device_list = NULL;
 static int mgslpc_device_count = 0;
 
@@ -3665,7 +3664,7 @@ void tx_start(MGSLPC_INFO *info)
 		} else {
 			info->tx_active = 1;
 			tx_ready(info);
-			info->tx_timer.expires = jiffies + jiffies_from_ms(5000);
+			info->tx_timer.expires = jiffies + msecs_to_jiffies(5000);
 			add_timer(&info->tx_timer);	
 		}
 	}
@@ -4124,7 +4123,7 @@ BOOLEAN irq_test(MGSLPC_INFO *info)
 	end_time=100;
 	while(end_time-- && !info->irq_occurred) {
 		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(jiffies_from_ms(10));
+		schedule_timeout(msecs_to_jiffies(10));
 	}
 	
 	info->testing_irq = FALSE;

--===============015490275293998712==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============015490275293998712==--
