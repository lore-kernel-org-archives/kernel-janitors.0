From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 26 Feb 2004 20:00:51 +0000
Subject: [Kernel-janitors] [PATCH] - mm/slab.c : init section usage.
Message-Id: <1077825651.31019.33.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi all,

Trivial...

diff -X dontdiff -pNru linux-2.6.3-bk8/mm/slab.c linux-2.6.3-bk8~/mm/slab.c
--- linux-2.6.3-bk8/mm/slab.c	2004-02-26 13:33:15.000000000 -0300
+++ linux-2.6.3-bk8~/mm/slab.c	2004-02-26 13:08:03.000000000 -0300
@@ -566,7 +566,7 @@ static void __slab_error(const char *fun
  * Add the CPU number into the expiry time to minimize the possibility of the
  * CPUs getting into lockstep and contending for the global cache chain lock.
  */
-static void start_cpu_timer(int cpu)
+static void __init start_cpu_timer(int cpu)
 {
 	struct timer_list *rt = &per_cpu(reap_timers, cpu);
 

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
