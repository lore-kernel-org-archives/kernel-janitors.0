From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 18 Jan 2005 00:21:30 +0000
Subject: [KJ] [PATCH 20/21] ppc64/traps: replace schedule_timeout() with
Message-Id: <20050118002130.GC24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============047898895820560838=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============047898895820560838==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying. 

Description:  Use ssleep() instead of schedule_timeout() to guarantee the task
delays as expected. The current code is not incorrect, but using ssleep()
encourages specifying delays in real time-units and consistency across the
kernel.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/arch/ppc64/kernel/traps.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/arch/ppc64/kernel/traps.c	2005-01-15 17:30:39.000000000 -0800
@@ -29,6 +29,7 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/delay.h>
 #include <asm/kdebug.h>
 
 #include <asm/pgtable.h>
@@ -137,8 +138,7 @@ int die(const char *str, struct pt_regs 
 
 	if (panic_on_oops) {
 		printk(KERN_EMERG "Fatal exception: panic in 5 seconds\n");
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(5 * HZ);
+		ssleep(5);
 		panic("Fatal exception");
 	}
 	do_exit(SIGSEGV);

--===============047898895820560838==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============047898895820560838==--
