From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Feb 2020 12:37:30 +0000
Subject: Re: [PATCH][next] clone3: fix an unsigned args.cgroup comparison to less than zero
Message-Id: <20200224123730.GB3308@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200222001513.43099-1-colin.king@canonical.com>
 <20200222121801.cu4dfnk4z5xd5uc2@wittgenstein>
 <20200224073157.GB3286@kadam>
 <20200224122503.2m4oc5wgg2oqpjsi@wittgenstein>
In-Reply-To: <20200224122503.2m4oc5wgg2oqpjsi@wittgenstein>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Colin King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel-mentees@lists.linuxfoundation.org, Ingo Molnar <mingo@kernel.org>, Christian Brauner <christian@brauner.io>

On Mon, Feb 24, 2020 at 01:25:03PM +0100, Christian Brauner wrote:
> On Mon, Feb 24, 2020 at 10:31:57AM +0300, Dan Carpenter wrote:
> > On Sat, Feb 22, 2020 at 01:18:01PM +0100, Christian Brauner wrote:
> > > On Sat, Feb 22, 2020 at 12:15:13AM +0000, Colin King wrote:
> > > > From: Colin Ian King <colin.king@canonical.com>
> > > diff --git a/kernel/fork.c b/kernel/fork.c
> > > index 2diff --git a/kernel/fork.c b/kernel/fork.c
> > > index 2853e258fe1f..dca4dde3b5b2 100644
> > > --- a/kernel/fork.c
> > > +++ b/kernel/fork.c
> > > @@ -2618,7 +2618,8 @@ noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
> > >                      !valid_signal(args.exit_signal)))
> > >                 return -EINVAL;
> > > 
> > > -       if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
> > > +       if ((args.flags & CLONE_INTO_CGROUP) &&
> > > +           (args.cgroup > INT_MAX || (s64)args.cgroup < 0))
> > 
> > If we're capping it at INT_MAX then the check for negative isn't
> > required and static analysis tools know it's not so they might complain.
> 
> It isn't, but it's easier to understand for the reader. But I don't care
> that much and if it's trouble for tools than fine.

It's not trouble for tools, (the tools parse it correctly), it's trouble
for me looking at the static checker warnings...

regards,
dan carpenter
