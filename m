From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Thu, 09 Jul 2020 11:49:00 +0000
Subject: Re: [PATCH] kernel/smp: Fix an off by one in csd_lock_wait_toolong()
Message-Id: <20200709114900.b475kfqz3447zgfg@linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200709104818.GC20875@mwanda>
 <20200709105906.GR597537@hirez.programming.kicks-ass.net>
In-Reply-To: <20200709105906.GR597537@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Paul E. McKenney" <paulmck@kernel.org>, Kaitao Cheng <pilgrimtao@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2020-07-09 12:59:06 [+0200], Peter Zijlstra wrote:
> On Thu, Jul 09, 2020 at 01:48:18PM +0300, Dan Carpenter wrote:
> > The __per_cpu_offset[] array has "nr_cpu_ids" elements so change the >
> > >= to prevent a read one element beyond the end of the array.
> > 
> > Fixes: 0504bc41a62c ("kernel/smp: Provide CSD lock timeout diagnostics")
> 
> I don't have a copy of that patch in my inbox, even though it says Cc:
> me.
> 
> Paul, where do you expect that patch to go? The version I see from my
> next tree needs a _lot_ of work.

There is also
 
 https://lkml.kernel.org/r/20200705082603.GX3874@shao2-debian
 https://lkml.kernel.org/r/00000000000042f21905a991ecea@google.com

it might be the same thing.

Sebastian
