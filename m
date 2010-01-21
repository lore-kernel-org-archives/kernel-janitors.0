From: Frederic Weisbecker <fweisbec@gmail.com>
Date: Thu, 21 Jan 2010 10:59:42 +0000
Subject: Re: Lots of bugs with current->state = TASK_*INTERRUPTIBLE
Message-Id: <20100121105940.GC5017@nowhere>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1263932978.31321.53.camel@gandalf.stny.rr.com> <Pine.LNX.4.64.1001192155490.28583@ask.diku.dk> <1263935333.4561.26.camel@frodo> <Pine.LNX.4.64.1001211145480.13529@ask.diku.dk> <20100121105311.GB5017@nowhere> <1264071413.4283.1155.camel@laptop>
In-Reply-To: <1264071413.4283.1155.camel@laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Julia Lawall <julia@diku.dk>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-arch@vger.kernel.org, Greg KH <greg@kroah.com>, Andy Whitcroft <apw@canonical.com>

On Thu, Jan 21, 2010 at 11:56:53AM +0100, Peter Zijlstra wrote:
> On Thu, 2010-01-21 at 11:53 +0100, Frederic Weisbecker wrote:
> 
> > Looks fine as spin_unlock includes a memory barrier, IIRC.
> 
> It doesn't actually, see Documentation/memory-barriers.txt
> 


Doh!

