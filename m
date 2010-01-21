From: Julia Lawall <julia@diku.dk>
Date: Thu, 21 Jan 2010 18:12:47 +0000
Subject: Re: Lots of bugs with current->state = TASK_*INTERRUPTIBLE
Message-Id: <Pine.LNX.4.64.1001211912010.13529@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1263932978.31321.53.camel@gandalf.stny.rr.com>
 <Pine.LNX.4.64.1001192155490.28583@ask.diku.dk>  <1263935333.4561.26.camel@frodo>
  <Pine.LNX.4.64.1001211145480.13529@ask.diku.dk> <1264095094.31321.283.camel@gandalf.stny.rr.com>
In-Reply-To: <1264095094.31321.283.camel@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, linux-arch@vger.kernel.org, Greg KH <greg@kroah.com>, Andy Whitcroft <apw@canonical.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>

On Thu, 21 Jan 2010, Steven Rostedt wrote:

> On Thu, 2010-01-21 at 11:47 +0100, Julia Lawall wrote:
> > What about something like the following (drivers/macintosh/adb.c):
> > 
> >         add_wait_queue(&state->wait_queue, &wait);
> >         current->state = TASK_INTERRUPTIBLE;
> > 
> > 	for (;;) {
> > 	        req = state->completed;
> >                 if (req != NULL)
> >                         state->completed = req->next;
> >                 else if (atomic_read(&state->n_pending) = 0)
> >                         ret = -EIO;
> > 		if (req != NULL || ret != 0)
> > 			break;
> > 
> >                 if (file->f_flags & O_NONBLOCK) {
> >                         ret = -EAGAIN;
> >                         break;
> > 		}
> >                 if (signal_pending(current)) {
> >                         ret = -ERESTARTSYS;
> >                         break;
> >                 }
> >                 spin_unlock_irqrestore(&state->lock, flags);
> >                 schedule();
> >         	spin_lock_irqsave(&state->lock, flags);
> >         }
> > 
> >         current->state = TASK_RUNNING;
> >         remove_wait_queue(&state->wait_queue, &wait);
> > 
> > There is a call to schedule eventually after the first current->state 
> > assignment, but it is not right after.
> 
> I looked at this code in a bit more detail. Seems that it does not need
> the set_current_state(), because all activities between the state of the
> task and the variables being checked (state->n_pending, et al) are under
> the state->lock.
> 
> But there should be a comment stating that above the assignment of
> current->state. Something like:
> 
> 	/*
> 	 * No need for the set_current_state() memory barrier since
> 	 * all checks between state and wakeups are done under the
> 	 * state->lock.
> 	 */
> 	current->state = TASK_INTERRUPTIBLE;
> 
> 
> But I'd rather have the author of this code write that.

As far as I can tell, state is something that is local to this driver.  So 
is the point that a lock is taken, or that interrupts are turned off?

julia
