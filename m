From: Steven Rostedt <rostedt@goodmis.org>
Date: Thu, 15 Nov 2012 21:05:50 +0000
Subject: Re: [patch] ftrace: clear bits properly in reset_iter_read()
Message-Id: <1353013550.7837.2.camel@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120609161027.GD6488@elgon.mountain>
	 <1339261076.13377.90.camel@gandalf.stny.rr.com>
In-Reply-To: <1339261076.13377.90.camel@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

(Doing my slow clean ups, I find lots of coins under the couch cushions)

On Sat, 2012-06-09 at 12:57 -0400, Steven Rostedt wrote:
> On Sat, 2012-06-09 at 19:10 +0300, Dan Carpenter wrote:
> > There is a typo here where '&' is used instead of '|' and it turns the
> > statement into a noop.  The original code is equivalent to:
> > 
> > 	iter->flags &= ~((1 << 2) & (1 << 4));
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > This is a static checker fix and I'm not super familiar with ftrace.
> > Please review carefully.
> > 
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index a008663..97da2dc 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> > @@ -2358,7 +2358,7 @@ static void reset_iter_read(struct ftrace_iterator *iter)
> >  {
> >  	iter->pos = 0;
> >  	iter->func_pos = 0;
> > -	iter->flags &= ~(FTRACE_ITER_PRINTALL & FTRACE_ITER_HASH);
> > +	iter->flags &= ~(FTRACE_ITER_PRINTALL | FTRACE_ITER_HASH);
> 
> Thanks! This is a real minor bug, but as it is a simple fix I will
> probably queue it up for 3.5 and stable. The reason that it has gone
> unnoticed for so long is that this would only show up if you did a lseek
> on the function list file. Which is not a common operation to do.
> 
> I checked the code and if someone were to do an lseek with these flags
> set then they would just get the hash list again (and not the function
> list). It's a bug, yes, but not a big one.
> 
> I'll queue it up on Monday.
> 

I just didn't say *which* Monday :-p

Bah, this got lost in a rebase somehow. Grumble, I should push this out
now as urgent.

-- Steve

> 
> >  }
> >  
> >  static void *t_start(struct seq_file *m, loff_t *pos)
> 


