From: mikal@stillhq.com
Date: Thu, 18 Mar 2004 01:03:58 +0000
Subject: [Kernel-janitors] [Trivial Patch] kernel-doc comment tweak
Message-Id: <200403180103.i2I13wN31109@diskbox.stillhq.com>
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





diff -Nur linux-2.6.2-rc1-cset-20040125_0129/arch/i386/kernel/cpu/cpufreq/longrun.c linux-2.6.2-rc1-cset-20040125_0129-params/arch/i386/kernel/cpu/cpufreq/longrun.c
--- linux-2.6.2-rc1-cset-20040125_0129/arch/i386/kernel/cpu/cpufreq/longrun.c	2004-01-26 09:24:46.000000000 +1100
+++ linux-2.6.2-rc1-cset-20040125_0129-params/arch/i386/kernel/cpu/cpufreq/longrun.c	2004-01-27 08:51:34.000000000 +1100
@@ -57,7 +57,7 @@
 
 /**
  * longrun_set_policy - sets a new CPUFreq policy
- * @policy - new policy
+ * @policy: new policy
  *
  * Sets a new CPUFreq policy on LongRun-capable processors. This function
  * has to be called with cpufreq_driver locked.
@@ -106,6 +106,7 @@
 
 /**
  * longrun_verify_poliy - verifies a new CPUFreq policy
+ * @policy: the policy to verify
  *
  * Validates a new CPUFreq policy. This function has to be called with 
  * cpufreq_driver locked.
@@ -130,6 +131,8 @@
 
 /**
  * longrun_determine_freqs - determines the lowest and highest possible core frequency
+ * @low_freq: an int to put the lowest frequency into
+ * @high_freq: an int to put the highest frequency into
  *
  * Determines the lowest and highest possible core frequencies on this CPU.
  * This is necessary to calculate the performance percentage according to
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
