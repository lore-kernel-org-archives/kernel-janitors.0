From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Mon, 15 Mar 2004 19:04:27 +0000
Subject: [Kernel-janitors] [TRIVIAL] - init section cpufreq/longhaul.c.
Message-Id: <1079377449.28138.37.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1079377448.27947.35.camel@telecentrolivre>
In-Reply-To: <1079377448.27947.35.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi all,

Trivial patch...

diff -Nparu linux-2.6.4-bk4/arch/i386/kernel/cpu/cpufreq/longhaul.c linux-2.6.4-bk4~/arch/i386/kernel/cpu/cpufreq/longhaul.c
-- linux-2.6.4-bk4/arch/i386/kernel/cpu/cpufreq/longhaul.c	2004-03-15 13:30:32.000000000 -0300
+++ linux-2.6.4-bk4~/arch/i386/kernel/cpu/cpufreq/longhaul.c	2004-03-15 13:34:38.000000000 -0300
@@ -458,7 +458,7 @@ static int __init longhaul_cpu_init (str
 	return 0;
 }
 
-static int longhaul_cpu_exit(struct cpufreq_policy *policy)
+static int __exit longhaul_cpu_exit(struct cpufreq_policy *policy)
 {
 	cpufreq_frequency_table_put_attr(policy->cpu);
 	return 0;
-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
