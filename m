From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 18:21:25 +0000
Subject: [KJ] [PATCH 1/22] arm/cpu-sa1110: replace schedule_timeout() with
Message-Id: <20050117182125.GA24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65824191632929385=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============65824191632929385==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. Neither signals nor wait-queue events are important at this
point in the code, I believe.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc1-kj-v/arch/arm/mach-sa1100/cpu-sa1110.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/arch/arm/mach-sa1100/cpu-sa1110.c	2005-01-15 17:10:24.000000000 -0800
@@ -271,8 +271,7 @@ static int sa1110_target(struct cpufreq_
 	 */
 	sdram_set_refresh(2);
 	if (!irqs_disabled()) {
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(20 * HZ / 1000);
+		msleep(20);
 	} else {
 		mdelay(20);
 	}

--===============65824191632929385==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65824191632929385==--
