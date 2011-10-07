From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Oct 2011 20:20:04 +0000
Subject: Re: [patch] trace: cleanup: make some types unsigned
Message-Id: <20111007202004.GI18470@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111007132744.GC31424@elgon.mountain>
 <1317994732.4729.39.camel@gandalf.stny.rr.com>
In-Reply-To: <1317994732.4729.39.camel@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 07, 2011 at 09:38:51AM -0400, Steven Rostedt wrote:
> On Fri, 2011-10-07 at 16:27 +0300, Dan Carpenter wrote:
> > The problem here is that I'm trying to silence a static checker
> > warning.  In replace_preds() we cap n_preds at MAX_FILTER_PRED but
> > we don't check for negative values.  It can't actually be negative
> > values, but the static checkers get confused.
> 
> I really hate to uglify code for the sake of static checkers.
> 
> This code may change in the near future, and the possibility that
> n_preds may become a possibility. Perhaps we should add a:
> 
> WARN_ON(n_preds < 0);
> 
> If in the future the count_preds() changes and incorrectly produces a
> negative number, or perhaps even overflows int, we wont catch it with
> unsigned.

I've sent a couple type changes to silence static checker warnings,
but I haven't been pushing it, because I'm interested to see what
people think about them first.  I didn't think unsigned int was
particularly ugly, but now that you point it out I guess it is
needlessly pedantic and longer to type.  So it's fine if you ignore
the patch.

Please don't add the WARN_ON().  WARN_ON()s are uglier than unsigned
ints.  WARN_ON() don't solve any problems, they just make debugging
the crash easier.  Are we going to crash here, and if so, do we
expect that debugging it will be difficult?  Probably not.

In theory, static checkers should be able to look at this code and
know that n_preds can't overflow.  So yeah.  Let's call this a
static checker bug and move on.

regards,
dan carpenter
