From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Thu, 07 Dec 2017 21:52:25 +0000
Subject: Re: [PATCH] Scheduler: Removed first parameter from prepare_lock_switch
Message-Id: <20171207215225.v26vmzmnac3v6jfr@smtp.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205140200.4guikhmagltvoehm@smtp.gmail.com>
 <20171206121437.g7wsnqhx6oyycyqf@hirez.programming.kicks-ass.net>
 <20171206235019.vvpx467magnuk25d@smtp.gmail.com>
 <20171207083820.tpgeqcfoelnau637@hirez.programming.kicks-ass.net>
In-Reply-To: <20171207083820.tpgeqcfoelnau637@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> On Wed, Dec 06, 2017 at 09:50:19PM -0200, Rodrigo Siqueira wrote:
> > > Yes, this is correct. However it had me looking at that code and pretty
> > > much everything else is completely wrong :-)
> > > 
> > > That is, its functionally correct (probably), but the function name is
> > > not descriptive of what the function does and the comment is just plain
> > > wrong.
> > > 
> > > Also, since both functions are only used in core.c we should probably
> > > move them there.
> > 
> > I'm not sure I understood it completely. What do you mean for wrong? Will 
> > CONFIG_SMP a meaningless check here?
> 
> So the actual effective code is ok; including the #ifdef for SMP. But
> the comment is complete nonsense.
> 
> Look at the comments:
> 
>  - in finish_lock_switch() doing smp_store_release()
>  - before try_to_wake_up() describing migration/blocking
>  - in try_to_wake_up() doing smp_cond_load_acquire().
> 
> To get a feeling for what on_cpu actually does; it doesn't have anything
> much to do with SMP rebalancing code from interrupt contexts (although
> that too still cares through can_migrate_task() <- task_running()).
> 
> > How about moving 'prepare_lock_switch' code from sched.h to prepare_task_switch
> > in core.c?
> 
> With a rename; yes. Maybe something like 'acquire_task()' would do.
> 
> Then split the smp_store_release() out from finish_lock_switch() and
> call it release_task(), and place is near the new acquire_task()
> function -- don't forget to update all comments referring to
> finish_lock_switch().
> 
> This then leaves the actual rq->lock fiddling in finish_lock_switch();
> and that whole function too can be moved to core.c, somewhere near
> finish_task_switch() I think.

Got it! I am working on it.
