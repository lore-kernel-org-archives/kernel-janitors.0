From: "Paul E. McKenney" <paulmck@kernel.org>
Date: Thu, 09 Jul 2020 14:32:54 +0000
Subject: Re: [PATCH] kernel/smp: Fix an off by one in csd_lock_wait_toolong()
Message-Id: <20200709143254.GX9247@paulmck-ThinkPad-P72>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200709104818.GC20875@mwanda>
 <20200709105906.GR597537@hirez.programming.kicks-ass.net>
In-Reply-To: <20200709105906.GR597537@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Kaitao Cheng <pilgrimtao@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jul 09, 2020 at 12:59:06PM +0200, Peter Zijlstra wrote:
> On Thu, Jul 09, 2020 at 01:48:18PM +0300, Dan Carpenter wrote:
> > The __per_cpu_offset[] array has "nr_cpu_ids" elements so change the >
> > >= to prevent a read one element beyond the end of the array.
> > 
> > Fixes: 0504bc41a62c ("kernel/smp: Provide CSD lock timeout diagnostics")

Good catch, will apply, thank you!

> I don't have a copy of that patch in my inbox, even though it says Cc:
> me.

I wasn't going to bother you with it until a bit after v5.9-rc1.
But it appears that this don't-bother-you strategy failed.

> Paul, where do you expect that patch to go? The version I see from my
> next tree needs a _lot_ of work.

I expect it to go nowhere until at least the v5.10 merge window.

							Thanx, Paul

> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  kernel/smp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/kernel/smp.c b/kernel/smp.c
> > index 78b602cae6c2..f49966713ac3 100644
> > --- a/kernel/smp.c
> > +++ b/kernel/smp.c
> > @@ -171,7 +171,7 @@ static __always_inline bool csd_lock_wait_toolong(call_single_data_t *csd, u64 t
> >  		*bug_id = atomic_inc_return(&csd_bug_count);
> >  	cpu = csd_lock_wait_getcpu(csd);
> >  	smp_mb(); // No stale cur_csd values!
> > -	if (WARN_ONCE(cpu < 0 || cpu > nr_cpu_ids, "%s: cpu = %d\n", __func__, cpu))
> > +	if (WARN_ONCE(cpu < 0 || cpu >= nr_cpu_ids, "%s: cpu = %d\n", __func__, cpu))
> >  		cpu_cur_csd = READ_ONCE(per_cpu(cur_csd, 0));
> >  	else
> >  		cpu_cur_csd = READ_ONCE(per_cpu(cur_csd, cpu));
> > -- 
> > 2.27.0
> > 
