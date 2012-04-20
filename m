From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 20 Apr 2012 14:26:12 +0000
Subject: Re: [patch] tracing: Remove an unneeded check
Message-Id: <1334931972.28106.80.camel@gandalf.stny.rr.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420063145.GA22649@elgon.mountain>
	 <1334929881.28106.77.camel@gandalf.stny.rr.com>
	 <20120420140348.GQ6498@mwanda>
In-Reply-To: <20120420140348.GQ6498@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2012-04-20 at 17:03 +0300, Dan Carpenter wrote:
> On Fri, Apr 20, 2012 at 09:51:21AM -0400, Steven Rostedt wrote:
> > On Fri, 2012-04-20 at 09:31 +0300, Dan Carpenter wrote:
> > > memcpy() returns a pointer to "bug".  Hopefully, it's not NULL here or
> > > we would already have Oopsed.
> > 
> > You're right that the ret is useless, and the real bug was already fixed
> > (the possibility that buf could be an invalid pointer).
> > 
> > Not only is this needed, but also get rid of the ret < 0 check in
> > tracing_splice_read_pipe().
> > 
> 
> We still return -EBUSY so we need the check.

Hmm, you're right. I need to take a deeper look at this code. It looks
like it can be cleaned up a bit more (the splice code).

OK, your patch is good as is. I'll add it in my 3.5 queue, and add a
mental note to look at this code again.

Thanks,

-- Steve


