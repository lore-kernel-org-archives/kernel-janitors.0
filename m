From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 23:33:38 +0000
Subject: [KJ] [PATCH 14/39] kernel/smp: replace schedule_timeout() with
Message-Id: <20050120233338.GA2600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2660684658545942=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============2660684658545942==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use ssleep() instead of schedule_timeout(). The original code uses
TASK_INTERRUPTIBLE, but does not check for signals, so I believe the change to
ssleep() is appropriate.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/kernel/power/smp.c	2005-01-15 16:55:45.000000000 -0800
+++ 2.6.11-rc1-kj/kernel/power/smp.c	2005-01-18 11:18:57.000000000 -0800
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/suspend.h>
 #include <linux/module.h>
+#include <linux/delay.h>
 #include <asm/atomic.h>
 #include <asm/tlbflush.h>
 
@@ -49,8 +50,7 @@ void disable_nonboot_cpus(void)
 	printk("Freezing CPUs (at %d)", smp_processor_id());
 	oldmask = current->cpus_allowed;
 	set_cpus_allowed(current, cpumask_of_cpu(0));
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(HZ);
+	ssleep(1);
 	printk("...");
 	BUG_ON(smp_processor_id() != 0);

--===============2660684658545942==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2660684658545942==--
