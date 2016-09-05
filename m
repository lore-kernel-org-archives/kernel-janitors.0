From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 05 Sep 2016 07:54:09 +0000
Subject: Re: [PATCH 3/4] perf/x86/cqm: One check and another variable less in intel_mbm_init()
Message-Id: <20160905075409.GT10153@twins.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <9d893198-dd12-14a8-74bd-02fc42de4bf4@users.sourceforge.net>
 <239ce590-bda1-1276-9723-5e7fee90d514@users.sourceforge.net>
In-Reply-To: <239ce590-bda1-1276-9723-5e7fee90d514@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: x86@kernel.org, Borislav Petkov <bp@suse.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Richard Cochran <rcochran@linutronix.de>, Stephane Eranian <eranian@google.com>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

On Sun, Sep 04, 2016 at 07:58:32PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 4 Sep 2016 19:06:33 +0200
> 
> 1. Adjust a jump target to eliminate an extra check at the end.
> 
> 2. Move a jump label according to the current Linux coding style convention.

WTF does that even mean?

> 
> 3. Return only constant values for the success or failure indication.
> 
> 4. Delete the local variable "ret" which became unnecessary with
>    this refactoring.

Also, 4 things should be 4 patches if anything.

> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/x86/events/intel/cqm.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/x86/events/intel/cqm.c b/arch/x86/events/intel/cqm.c
> index 29f756e..304caf53 100644
> --- a/arch/x86/events/intel/cqm.c
> +++ b/arch/x86/events/intel/cqm.c
> @@ -1637,7 +1637,7 @@ static const struct x86_cpu_id intel_mbm_total_match[] = {
>  
>  static int intel_mbm_init(void)
>  {
> -	int ret = 0, maxid = cqm_max_rmid + 1;
> +	int const maxid = cqm_max_rmid + 1;
>  
>  	mbm_socket_max = topology_max_packages();
>  	mbm_local = kmalloc_array(maxid * mbm_socket_max,
> @@ -1649,25 +1649,20 @@ static int intel_mbm_init(void)
>  	mbm_total = kmalloc_array(maxid * mbm_socket_max,
>  				  sizeof(*mbm_total),
>  				  GFP_KERNEL);
> -	if (!mbm_total) {
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> +	if (!mbm_total)
> +		goto free_mbm;
>  
>  	mbm_timers = kmalloc_array(mbm_socket_max,
>  				   sizeof(*mbm_timers),
>  				   GFP_KERNEL);
> -	if (!mbm_timers) {
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> -	mbm_hrtimer_init();
> +	if (!mbm_timers)
> +		goto free_mbm;
>  
> -out:
> -	if (ret)
> -		mbm_cleanup();
> -
> -	return ret;
> +	mbm_hrtimer_init();
> +	return 0;
> + free_mbm:

No!! no stupid indented labels.

> +	mbm_cleanup();
> +	return -ENOMEM;
>  }
