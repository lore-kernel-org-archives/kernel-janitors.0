From: Steven Rostedt <rostedt@goodmis.org>
Date: Tue, 19 Jan 2010 21:08:53 +0000
Subject: Re: Lots of bugs with current->state = TASK_*INTERRUPTIBLE
Message-Id: <1263935333.4561.26.camel@frodo>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1263932978.31321.53.camel@gandalf.stny.rr.com>
	 <Pine.LNX.4.64.1001192155490.28583@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1001192155490.28583@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, linux-arch@vger.kernel.org, Greg KH <greg@kroah.com>, Andy Whitcroft <apw@canonical.com>

On Tue, 2010-01-19 at 21:58 +0100, Julia Lawall wrote:
> > Anyway, this looks like a good janitorial work. Anything that assigns
> > state outside the rq locks to something other than TASK_RUNNING and that
> > is not before a schedule() (perhaps even those) should be converted to:
> > 
> > 	set_current_task(<state>).
> 
> Does "not before a schedule" mean not before a schedule_timeout as well?

Yep.

> 
> Also, I assume you mean set_current_state?

Yep!

Thanks!

-- Steve


