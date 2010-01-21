From: Frederic Weisbecker <fweisbec@gmail.com>
Date: Thu, 21 Jan 2010 10:53:14 +0000
Subject: Re: Lots of bugs with current->state = TASK_*INTERRUPTIBLE
Message-Id: <20100121105311.GB5017@nowhere>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1263932978.31321.53.camel@gandalf.stny.rr.com> <Pine.LNX.4.64.1001192155490.28583@ask.diku.dk> <1263935333.4561.26.camel@frodo> <Pine.LNX.4.64.1001211145480.13529@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1001211145480.13529@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, linux-arch@vger.kernel.org, Greg KH <greg@kroah.com>, Andy Whitcroft <apw@canonical.com>

On Thu, Jan 21, 2010 at 11:47:41AM +0100, Julia Lawall wrote:
> What about something like the following (drivers/macintosh/adb.c):
> 
>         add_wait_queue(&state->wait_queue, &wait);
>         current->state = TASK_INTERRUPTIBLE;
> 
> 	for (;;) {
> 	        req = state->completed;
>                 if (req != NULL)
>                         state->completed = req->next;
>                 else if (atomic_read(&state->n_pending) = 0)
>                         ret = -EIO;
> 		if (req != NULL || ret != 0)
> 			break;
> 
>                 if (file->f_flags & O_NONBLOCK) {
>                         ret = -EAGAIN;
>                         break;
> 		}
>                 if (signal_pending(current)) {
>                         ret = -ERESTARTSYS;
>                         break;
>                 }
>                 spin_unlock_irqrestore(&state->lock, flags);
>                 schedule();
>         	spin_lock_irqsave(&state->lock, flags);
>         }
> 
>         current->state = TASK_RUNNING;
>         remove_wait_queue(&state->wait_queue, &wait);
> 
> There is a call to schedule eventually after the first current->state 
> assignment, but it is not right after.



Looks fine as spin_unlock includes a memory barrier, IIRC.

