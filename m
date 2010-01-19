From: Julia Lawall <julia@diku.dk>
Date: Tue, 19 Jan 2010 20:58:28 +0000
Subject: Re: Lots of bugs with current->state = TASK_*INTERRUPTIBLE
Message-Id: <Pine.LNX.4.64.1001192155490.28583@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1263932978.31321.53.camel@gandalf.stny.rr.com>
In-Reply-To: <1263932978.31321.53.camel@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, linux-arch@vger.kernel.org, Greg KH <greg@kroah.com>, Andy Whitcroft <apw@canonical.com>

> Anyway, this looks like a good janitorial work. Anything that assigns
> state outside the rq locks to something other than TASK_RUNNING and that
> is not before a schedule() (perhaps even those) should be converted to:
> 
> 	set_current_task(<state>).

Does "not before a schedule" mean not before a schedule_timeout as well?

Also, I assume you mean set_current_state?

julia
