From: mikal@stillhq.com
Date: Thu, 18 Mar 2004 01:03:57 +0000
Subject: [Kernel-janitors] [Trivial Patch] kernel-doc comment tweak
Message-Id: <200403180103.i2I13vI31101@diskbox.stillhq.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Correct kernel-doc comment with incorrect parameters documented

Meta data:
Author: Michael Still
Email: mikal@stillhq.com
Kernel version: applies to 2.6.5-rc1





diff -Nur linux-2.6.2-rc1-cset-20040125_0129/arch/i386/kernel/cpu/cpufreq/elanfreq.c linux-2.6.2-rc1-cset-20040125_0129-params/arch/i386/kernel/cpu/cpufreq/elanfreq.c
--- linux-2.6.2-rc1-cset-20040125_0129/arch/i386/kernel/cpu/cpufreq/elanfreq.c	2004-01-26 09:24:46.000000000 +1100
+++ linux-2.6.2-rc1-cset-20040125_0129-params/arch/i386/kernel/cpu/cpufreq/elanfreq.c	2004-01-29 08:19:24.000000000 +1100
@@ -165,7 +165,8 @@
 
 
 /**
- *	elanfreq_validatespeed: test if frequency range is valid 
+ *	elanfreq_validatespeed: test if frequency range is valid
+ *      @policy: the policy to validate
  *
  *	This function checks if a given frequency range in kHz is valid 
  *      for the hardware supported by the driver. 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
