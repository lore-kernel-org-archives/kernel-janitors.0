From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 18 Jan 2005 00:15:22 +0000
Subject: [KJ] [PATCH 17/21] ppc64/pSeries_smp: replace schedule_timeout()
Message-Id: <20050118001522.GZ24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92130230926708512=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92130230926708512==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying. 

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The current code is not incorrect, but msleep() is clearer
in terms of the length of delay and helps make the kernel consistent.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/arch/ppc64/kernel/pSeries_smp.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/arch/ppc64/kernel/pSeries_smp.c	2005-01-15 17:21:12.000000000 -0800
@@ -107,8 +107,7 @@ void pSeries_cpu_die(unsigned int cpu)
 		cpu_status = query_cpu_stopped(pcpu);
 		if (cpu_status == 0 || cpu_status == -1)
 			break;
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ/5);
+		msleep(200);
 	}
 	if (cpu_status != 0) {
 		printk("Querying DEAD? cpu %i (%i) shows %i\n",

--===============92130230926708512==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92130230926708512==--
