From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Mon, 15 Mar 2004 19:04:08 +0000
Subject: [Kernel-janitors] [TRIVIAL] - init section cpufreq/longrun.c.
Message-Id: <1079377448.27947.35.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi all,

Trivial patch...

diff -Nparu linux-2.6.4-bk4/arch/i386/kernel/cpu/cpufreq/longrun.c linux-2.6.4-bk4~/arch/i386/kernel/cpu/cpufreq/longrun.c
-- linux-2.6.4-bk4/arch/i386/kernel/cpu/cpufreq/longrun.c	2004-03-11 14:20:23.000000000 -0300
+++ linux-2.6.4-bk4~/arch/i386/kernel/cpu/cpufreq/longrun.c	2004-03-15 13:54:45.000000000 -0300
@@ -33,7 +33,7 @@ static unsigned int longrun_low_freq, lo
  * Reads the current LongRun policy by access to MSR_TMTA_LONGRUN_FLAGS
  * and MSR_TMTA_LONGRUN_CTRL
  */
-static void longrun_get_policy(struct cpufreq_policy *policy)
+static void __init longrun_get_policy(struct cpufreq_policy *policy)
 {
 	u32 msr_lo, msr_hi;
 
-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
