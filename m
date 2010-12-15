From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 15 Dec 2010 12:48:26 +0000
Subject: Re: question about schedule_timeout
Message-Id: <20101215124825.GD21909@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1012151256280.8557@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1012151256280.8557@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Dec 15, 2010 at 12:58:49PM +0100, Julia Lawall wrote:
> I am wondering about the interaction between schedule_timeout and 
> functions like local_irq_save, that turn off interrupts.  To my 
> understanding, with schedule_timeout one sleeps until a timer interrupt is 
> received.  But how can that be received if interrupts have been turned 
> off?  I find this mostly in older code, but there are still some 
> occurrences, and even in older code, I'm not sure to understand how it 
> could have worked.

My memory was that interrupts were reenabled when you called schedule(),
then restored when schedule() returned to you.  That turns out not to
be true today, and I don't know whether it was ever true.

What actually happens is this:

asmlinkage void __sched schedule(void)
{
...
        preempt_disable();
...
        raw_spin_lock_irq(&rq->lock);
...
                raw_spin_unlock_irq(&rq->lock);
...
        preempt_enable_no_resched();
}

(there are two paths which lead to the rq->lock being dropped, the other one
is slightly more complex than this).

So in plain english, if you call schedule(), or schedule_timeout(),
when it returns interrupts will be enabled.  It's almost certainly
a bug, and it'd be good to put a test for it in schedule(), possibly
under DEBUG_SPINLOCK_SLEEP.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
