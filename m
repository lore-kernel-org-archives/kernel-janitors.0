From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 18 Jan 2005 00:20:13 +0000
Subject: [KJ] [PATCH 19/21] ppc64/smp: replace schedule_timeout() with
Message-Id: <20050118002013.GB24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14941483608615558=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============14941483608615558==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying. 

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The current code is not incorrect; however using msleep()
encourages using real time-unit sleeps and keeps the kernel consistent.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/arch/ppc64/kernel/smp.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/arch/ppc64/kernel/smp.c	2005-01-15 17:30:16.000000000 -0800
@@ -459,8 +459,7 @@ int __devinit __cpu_up(unsigned int cpu)
 		 * hotplug case.  Wait five seconds.
 		 */
 		for (c = 25; c && !cpu_callin_map[cpu]; c--) {
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/5);
+			msleep(200);
 		}
 #endif
 

--===============14941483608615558==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14941483608615558==--
