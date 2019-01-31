From: Daniel Jordan <daniel.m.jordan@oracle.com>
Date: Thu, 31 Jan 2019 02:00:20 +0000
Subject: Re: [PATCH] mm, swap: bounds check swap_info accesses to avoid NULL derefs
Message-Id: <20190131020020.h25czxccz74c4b7f@ca-dmjordan1.us.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190114222529.43zay6r242ipw5jb@ca-dmjordan1.us.oracle.com>
 <20190115002305.15402-1-daniel.m.jordan@oracle.com>
 <20190130091316.GC2278@hirez.programming.kicks-ass.net>
In-Reply-To: <20190130091316.GC2278@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Daniel Jordan <daniel.m.jordan@oracle.com>, akpm@linux-foundation.org, dan.carpenter@oracle.com, andrea.parri@amarulasolutions.com, shli@kernel.org, ying.huang@intel.com, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, osandov@fb.com, tj@kernel.org, ak@linux.intel.com, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, paulmck@linux.ibm.com, stern@rowland.harvard.edu, will.deacon@arm.com

On Wed, Jan 30, 2019 at 10:13:16AM +0100, Peter Zijlstra wrote:
> On Mon, Jan 14, 2019 at 07:23:05PM -0500, Daniel Jordan wrote:
> 
> A few comments below, but:
> 
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Thanks.

> > @@ -2799,9 +2810,9 @@ static void *swap_start(struct seq_file *swap, loff_t *pos)
> >  	if (!l)
> >  		return SEQ_START_TOKEN;
> >  
> > -	for (type = 0; type < nr_swapfiles; type++) {
> > +	for (type = 0; type < READ_ONCE(nr_swapfiles); type++) {
> >  		smp_rmb();	/* read nr_swapfiles before swap_info[type] */
> > -		si = swap_info[type];
> > +		si = READ_ONCE(swap_info[type]);
> >  		if (!(si->flags & SWP_USED) || !si->swap_map)
> >  			continue;
> >  		if (!--l)
> > @@ -2821,9 +2832,9 @@ static void *swap_next(struct seq_file *swap, void *v, loff_t *pos)
> >  	else
> >  		type = si->type + 1;
> >  
> > -	for (; type < nr_swapfiles; type++) {
> > +	for (; type < READ_ONCE(nr_swapfiles); type++) {
> >  		smp_rmb();	/* read nr_swapfiles before swap_info[type] */
> > -		si = swap_info[type];
> > +		si = READ_ONCE(swap_info[type]);
> >  		if (!(si->flags & SWP_USED) || !si->swap_map)
> >  			continue;
> >  		++*pos;
> 
> You could write those like:
> 
> 	for (; (si = swap_type_to_swap_info(type)); type++)

That's clever, and way better than the ugly iterator macro I wrote and then
deleted in disgust.

> > @@ -2930,14 +2941,14 @@ static struct swap_info_struct *alloc_swap_info(void)
> >  	}
> >  	if (type >= nr_swapfiles) {
> >  		p->type = type;
> > -		swap_info[type] = p;
> > +		WRITE_ONCE(swap_info[type], p);
> >  		/*
> >  		 * Write swap_info[type] before nr_swapfiles, in case a
> >  		 * racing procfs swap_start() or swap_next() is reading them.
> >  		 * (We never shrink nr_swapfiles, we never free this entry.)
> >  		 */
> >  		smp_wmb();
> > -		nr_swapfiles++;
> > +		WRITE_ONCE(nr_swapfiles, nr_swapfiles + 1);
> >  	} else {
> >  		kvfree(p);
> >  		p = swap_info[type];
> 
> It is also possible to write this with smp_load_acquire() /
> smp_store_release(). ARM64/RISC-V might benefit from that, OTOH ARM
> won't like that much.
> 
> Dunno what would be better.

I just left it as-is for now.
