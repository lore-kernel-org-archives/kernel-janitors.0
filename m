From: mikal@stillhq.com
Date: Thu, 18 Mar 2004 01:04:01 +0000
Subject: [Kernel-janitors] [Trivial Patch] kernel-doc comment tweak
Message-Id: <200403180104.i2I141n31133@diskbox.stillhq.com>
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





diff -Nur linux-2.6.2-rc1-cset-20040125_0129/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux-2.6.2-rc1-cset-20040125_0129-params/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-2.6.2-rc1-cset-20040125_0129/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-01-26 09:24:46.000000000 +1100
+++ linux-2.6.2-rc1-cset-20040125_0129-params/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-01-27 08:51:36.000000000 +1100
@@ -67,6 +67,7 @@
 /**
  * speedstep_set_state - set the SpeedStep state
  * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
+ * @notify: whether to call cpufreq_notify_transition for CPU speed changes
  *
  *   Tries to change the SpeedStep state. 
  */
@@ -241,6 +242,8 @@
 /**
  * speedstep_setpolicy - set a new CPUFreq policy
  * @policy: new policy
+ * @target_freq: the target frequency
+ * @relation: how that frequency relates to achieved frequency (CPUFREQ_RELATION_L or CPUFREQ_RELATION_H)
  *
  * Sets a new CPUFreq policy.
  */
@@ -261,7 +264,7 @@
 
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
