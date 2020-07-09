From: "Paul E. McKenney" <paulmck@kernel.org>
Date: Thu, 09 Jul 2020 14:36:30 +0000
Subject: Re: [PATCH] kernel/smp: Fix an off by one in csd_lock_wait_toolong()
Message-Id: <20200709143630.GY9247@paulmck-ThinkPad-P72>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200709104818.GC20875@mwanda>
 <20200709105906.GR597537@hirez.programming.kicks-ass.net>
 <20200709114900.b475kfqz3447zgfg@linutronix.de>
In-Reply-To: <20200709114900.b475kfqz3447zgfg@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Kaitao Cheng <pilgrimtao@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jul 09, 2020 at 01:49:00PM +0200, Sebastian Andrzej Siewior wrote:
> On 2020-07-09 12:59:06 [+0200], Peter Zijlstra wrote:
> > On Thu, Jul 09, 2020 at 01:48:18PM +0300, Dan Carpenter wrote:
> > > The __per_cpu_offset[] array has "nr_cpu_ids" elements so change the >
> > > >= to prevent a read one element beyond the end of the array.
> > > 
> > > Fixes: 0504bc41a62c ("kernel/smp: Provide CSD lock timeout diagnostics")
> > 
> > I don't have a copy of that patch in my inbox, even though it says Cc:
> > me.
> > 
> > Paul, where do you expect that patch to go? The version I see from my
> > next tree needs a _lot_ of work.
> 
> There is also
>  
>  https://lkml.kernel.org/r/20200705082603.GX3874@shao2-debian
>  https://lkml.kernel.org/r/00000000000042f21905a991ecea@google.com
> 
> it might be the same thing.

Same commit, different bug, but the fix should be in -next by now.
For these two reports, the problem was that I had debug-recording code
on the wrong side of a csd_unlock().

							Thanx, Paul
