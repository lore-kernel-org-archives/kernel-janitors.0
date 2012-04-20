From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2012 14:03:48 +0000
Subject: Re: [patch] tracing: Remove an unneeded check
Message-Id: <20120420140348.GQ6498@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420063145.GA22649@elgon.mountain>
 <1334929881.28106.77.camel@gandalf.stny.rr.com>
In-Reply-To: <1334929881.28106.77.camel@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 20, 2012 at 09:51:21AM -0400, Steven Rostedt wrote:
> On Fri, 2012-04-20 at 09:31 +0300, Dan Carpenter wrote:
> > memcpy() returns a pointer to "bug".  Hopefully, it's not NULL here or
> > we would already have Oopsed.
> 
> You're right that the ret is useless, and the real bug was already fixed
> (the possibility that buf could be an invalid pointer).
> 
> Not only is this needed, but also get rid of the ret < 0 check in
> tracing_splice_read_pipe().
> 

We still return -EBUSY so we need the check.

regards,
dan carpenter

