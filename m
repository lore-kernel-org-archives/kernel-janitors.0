From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 16 Nov 2015 09:17:58 +0000
Subject: Re: [PATCH] x86: AMD-perf_event: Delete unnecessary checks before the function call "free_percpu"
Message-Id: <20151116091758.GO17308@twins.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54708B5E.2080302@users.sourceforge.net>
 <56498E25.50301@users.sourceforge.net>
In-Reply-To: <56498E25.50301@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Mon, Nov 16, 2015 at 09:04:53AM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 16 Nov 2015 09:00:20 +0100
> 
> The free_percpu() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the calls is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/x86/kernel/cpu/perf_event_amd_uncore.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/perf_event_amd_uncore.c b/arch/x86/kernel/cpu/perf_event_amd_uncore.c
> index cc6cedb..240ecee 100644
> --- a/arch/x86/kernel/cpu/perf_event_amd_uncore.c
> +++ b/arch/x86/kernel/cpu/perf_event_amd_uncore.c
> @@ -588,11 +588,9 @@ fail_online:
>  fail_l2:
>  	if (cpu_has_perfctr_nb)
>  		perf_pmu_unregister(&amd_nb_pmu);
> -	if (amd_uncore_l2)
> -		free_percpu(amd_uncore_l2);
> +	free_percpu(amd_uncore_l2);
>  fail_nb:
> -	if (amd_uncore_nb)
> -		free_percpu(amd_uncore_nb);
> +	free_percpu(amd_uncore_nb);


So I'm really in two minds about such patches; yes its correct. But at
the same time; this isn't a performance critical piece of code and the
additional condition isn't hurting anything.

Furthermore, I find the explicit test conceptually easier than
remembering that kfree() works this way (while many other resource
freeing functions do not).

And in error paths -- which aren't our best code by far -- obvious safe
is far preferred to clever.

Ingo, preference?
