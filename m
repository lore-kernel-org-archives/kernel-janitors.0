From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 18 Jan 2005 00:18:19 +0000
Subject: [KJ] [PATCH 18/21] ppc64/rtasd: replace schedule_timeout() with
Message-Id: <20050118001819.GA24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47414272902014643=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============47414272902014643==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying. 

Description: Replace schedule_timeout() with msleep()/ssleep(). In both cases,
the current code sleeps in TASK_INTERRUPTIBLE but does not account for early
wakeups due to signals being caught; therefore I have used TASK_UNINTERRUPTIBLE
sleeps in both cases. The second sleep is slightly more difficult to convert as
rtas_event_scan_rate is variable. I have left it as a msleep() call, although
ssleep() may be more appropriate.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/arch/ppc64/kernel/rtasd.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/arch/ppc64/kernel/rtasd.c	2005-01-15 17:28:50.000000000 -0800
@@ -19,6 +19,7 @@
 #include <linux/vmalloc.h>
 #include <linux/spinlock.h>
 #include <linux/cpu.h>
+#include <linux/delay.h>
 
 #include <asm/uaccess.h>
 #include <asm/io.h>
@@ -444,8 +445,7 @@ static int rtasd(void *unused)
 		DEBUG("watchdog scheduled on cpu %d\n", smp_processor_id());
 
 		do_event_scan(event_scan);
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ);
+		ssleep(1);
 	}
 	unlock_cpu_hotplug();
 
@@ -466,8 +466,7 @@ static int rtasd(void *unused)
 		 * one second since some machines have problems if we
 		 * call event-scan too quickly). */
 		unlock_cpu_hotplug();
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout((HZ*60/rtas_event_scan_rate) / 2);
+		msleep(30000/rtas_event_scan_rate);
 		lock_cpu_hotplug();
 
 		cpu = next_cpu(cpu, cpu_online_map);

--===============47414272902014643==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47414272902014643==--
