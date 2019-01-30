From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 30 Jan 2019 09:13:16 +0000
Subject: Re: [PATCH] mm, swap: bounds check swap_info accesses to avoid NULL derefs
Message-Id: <20190130091316.GC2278@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190114222529.43zay6r242ipw5jb@ca-dmjordan1.us.oracle.com>
 <20190115002305.15402-1-daniel.m.jordan@oracle.com>
In-Reply-To: <20190115002305.15402-1-daniel.m.jordan@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Jordan <daniel.m.jordan@oracle.com>
Cc: akpm@linux-foundation.org, dan.carpenter@oracle.com, andrea.parri@amarulasolutions.com, shli@kernel.org, ying.huang@intel.com, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, osandov@fb.com, tj@kernel.org, ak@linux.intel.com, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, paulmck@linux.ibm.com, stern@rowland.harvard.edu, will.deacon@arm.com

On Mon, Jan 14, 2019 at 07:23:05PM -0500, Daniel Jordan wrote:
> Dan Carpenter reports a potential NULL dereference in
> get_swap_page_of_type:
> 
>   Smatch complains that the NULL checks on "si" aren't consistent.  This
>   seems like a real bug because we have not ensured that the type is
>   valid and so "si" can be NULL.
> 
> Add the missing check for NULL, taking care to use a read barrier to
> ensure CPU1 observes CPU0's updates in the correct order:
> 
>         CPU0                           CPU1
>         alloc_swap_info()              if (type >= nr_swapfiles)
>           swap_info[type] = p              /* handle invalid entry */
>           smp_wmb()                    smp_rmb()
>           ++nr_swapfiles               p = swap_info[type]
> 
> Without smp_rmb, CPU1 might observe CPU0's write to nr_swapfiles before
> CPU0's write to swap_info[type] and read NULL from swap_info[type].
> 
> Ying Huang noticed that other places don't order these reads properly.
> Introduce swap_type_to_swap_info to encourage correct usage.
> 
> Use READ_ONCE and WRITE_ONCE to follow the Linux Kernel Memory Model
> (see tools/memory-model/Documentation/explanation.txt).
> 
> This ordering need not be enforced in places where swap_lock is held
> (e.g. si_swapinfo) because swap_lock serializes updates to nr_swapfiles
> and the swap_info array.
> 
> This is a theoretical problem, no actual reports of it exist.
> 
> Fixes: ec8acf20afb8 ("swap: add per-partition lock for swapfile")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>

A few comments below, but:

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> +static struct swap_info_struct *swap_type_to_swap_info(int type)
> +{
> +	if (type >= READ_ONCE(nr_swapfiles))
> +		return NULL;
> +
> +	smp_rmb();	/* Pairs with smp_wmb in alloc_swap_info. */
> +	return READ_ONCE(swap_info[type]);
> +}

> @@ -2799,9 +2810,9 @@ static void *swap_start(struct seq_file *swap, loff_t *pos)
>  	if (!l)
>  		return SEQ_START_TOKEN;
>  
> -	for (type = 0; type < nr_swapfiles; type++) {
> +	for (type = 0; type < READ_ONCE(nr_swapfiles); type++) {
>  		smp_rmb();	/* read nr_swapfiles before swap_info[type] */
> -		si = swap_info[type];
> +		si = READ_ONCE(swap_info[type]);
>  		if (!(si->flags & SWP_USED) || !si->swap_map)
>  			continue;
>  		if (!--l)
> @@ -2821,9 +2832,9 @@ static void *swap_next(struct seq_file *swap, void *v, loff_t *pos)
>  	else
>  		type = si->type + 1;
>  
> -	for (; type < nr_swapfiles; type++) {
> +	for (; type < READ_ONCE(nr_swapfiles); type++) {
>  		smp_rmb();	/* read nr_swapfiles before swap_info[type] */
> -		si = swap_info[type];
> +		si = READ_ONCE(swap_info[type]);
>  		if (!(si->flags & SWP_USED) || !si->swap_map)
>  			continue;
>  		++*pos;

You could write those like:

	for (; (si = swap_type_to_swap_info(type)); type++)

> @@ -2930,14 +2941,14 @@ static struct swap_info_struct *alloc_swap_info(void)
>  	}
>  	if (type >= nr_swapfiles) {
>  		p->type = type;
> -		swap_info[type] = p;
> +		WRITE_ONCE(swap_info[type], p);
>  		/*
>  		 * Write swap_info[type] before nr_swapfiles, in case a
>  		 * racing procfs swap_start() or swap_next() is reading them.
>  		 * (We never shrink nr_swapfiles, we never free this entry.)
>  		 */
>  		smp_wmb();
> -		nr_swapfiles++;
> +		WRITE_ONCE(nr_swapfiles, nr_swapfiles + 1);
>  	} else {
>  		kvfree(p);
>  		p = swap_info[type];

It is also possible to write this with smp_load_acquire() /
smp_store_release(). ARM64/RISC-V might benefit from that, OTOH ARM
won't like that much.

Dunno what would be better.
