From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 09 Mar 2004 19:51:37 +0000
Subject: Re: [Kernel-janitors] [PATCH] - mm/slab.c : init section usage.
Message-Id: <20040309115137.026c23cc.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1077825651.31019.33.camel@telecentrolivre>
In-Reply-To: <1077825651.31019.33.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 26 Feb 2004 17:00:51 -0300 Luiz Fernando Capitulino wrote:

| 
| Hi all,
| 
| Trivial...
| 
| diff -X dontdiff -pNru linux-2.6.3-bk8/mm/slab.c linux-2.6.3-bk8~/mm/slab.c
| --- linux-2.6.3-bk8/mm/slab.c	2004-02-26 13:33:15.000000000 -0300
| +++ linux-2.6.3-bk8~/mm/slab.c	2004-02-26 13:08:03.000000000 -0300
| @@ -566,7 +566,7 @@ static void __slab_error(const char *fun
|   * Add the CPU number into the expiry time to minimize the possibility of the
|   * CPUs getting into lockstep and contending for the global cache chain lock.
|   */
| -static void start_cpu_timer(int cpu)
| +static void __init start_cpu_timer(int cpu)
|  {
|  	struct timer_list *rt = &per_cpu(reap_timers, cpu);
|  

I don't see how this is a good patch.  start_cpu_timer() can be
called from cpuup_callback():: case CPU_ONLINE, which I think can
happen after kernel init.  Anyone else check this?

--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
