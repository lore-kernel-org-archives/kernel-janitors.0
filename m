From: mikal@stillhq.com
Date: Thu, 18 Mar 2004 01:04:01 +0000
Subject: [Kernel-janitors] [Trivial Patch] kernel-doc comment tweak
Message-Id: <200403180104.i2I141H31141@diskbox.stillhq.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200403180103.i2I13vI31101@diskbox.stillhq.com>
In-Reply-To: <200403180103.i2I13vI31101@diskbox.stillhq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Correct kernel-doc comment with incorrect parameters documented

Meta data:
Author: Michael Still
Email: mikal@stillhq.com
Kernel version: applies to 2.6.5-rc1





diff -Nur linux-2.6.2-rc1-cset-20040125_0129/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux-2.6.2-rc1-cset-20040125_0129-params/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-2.6.2-rc1-cset-20040125_0129/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004-01-26 09:24:46.000000000 +1100
+++ linux-2.6.2-rc1-cset-20040125_0129-params/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004-01-29 08:19:29.000000000 +1100
@@ -90,10 +90,12 @@
 
 /**
  * speedstep_smi_get_freqs - get SpeedStep preferred & current freq.
+ * @low: the low frequency value is placed here
+ * @high: the high frequency value is placed here
+ *
  * Only available on later SpeedStep-enabled systems, returns false results or
  * even hangs [cf. bugme.osdl.org # 1422] on earlier systems. Empirical testing
  * shows that the latter occurs if !(ist_info.event & 0xFFFF).
- *
  */
 static int speedstep_smi_get_freqs (unsigned int *low, unsigned int *high)
 {
@@ -141,6 +143,7 @@
 /**
  * speedstep_set_state - set the SpeedStep state
  * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
+ * @notify: whether to call cpufreq_notify_transition
  *
  */
 static void speedstep_set_state (unsigned int state, unsigned int notify)
@@ -224,7 +227,7 @@
 
 /**
  * speedstep_verify - verifies a new CPUFreq policy
- * @freq: new policy
+ * @policy: new policy
  *
  * Limit must be within speedstep_low_freq and speedstep_high_freq, with
  * at least one border included.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
