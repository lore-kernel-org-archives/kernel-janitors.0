From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Mar 2005 18:26:20 +0000
Subject: [KJ] [RFC][PATCH 3/5] ppc/pmac_cpufreq: use poll_event*() interface
Message-Id: <20050303182620.GF11600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28347657319831443=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28347657319831443==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description: Use new poll_event() interface to encapsulate sleep-loops.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-kj-v/arch/ppc/platforms/pmac_cpufreq.c	2005-03-01 23:38:10.000000000 -0800
+++ 2.6.11-kj/arch/ppc/platforms/pmac_cpufreq.c	2005-03-02 17:53:35.000000000 -0800
@@ -167,8 +167,6 @@ static unsigned int __pmac dfs_get_cpu_s
  */
 static int __pmac gpios_set_cpu_speed(int low_speed)
 {
-	int gpio;
-
 	/* If ramping up, set voltage first */
 	if (low_speed == 0) {
 		pmac_call_feature(PMAC_FTR_WRITE_GPIO, NULL, voltage_gpio, 0x05);
@@ -180,11 +178,8 @@ static int __pmac gpios_set_cpu_speed(in
 	pmac_call_feature(PMAC_FTR_WRITE_GPIO, NULL, frequency_gpio,
 			  low_speed ? 0x04 : 0x05);
 	udelay(200);
-	do {
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(1);
-		gpio = pmac_call_feature(PMAC_FTR_READ_GPIO, NULL, slew_done_gpio, 0);
-	} while((gpio & 0x02) == 0);
+	/* check every millisecond until true */
+	poll_event(((pmac_call_feature(PMAC_FTR_READ_GPIO, NULL, slew_done_gpio, 0) & 0x02) != 0), 1);
 
 	/* If ramping down, set voltage last */
 	if (low_speed == 1) {

--===============28347657319831443==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28347657319831443==--
