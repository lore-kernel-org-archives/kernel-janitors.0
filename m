From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Feb 2020 07:31:57 +0000
Subject: Re: [PATCH][next] clone3: fix an unsigned args.cgroup comparison to less than zero
Message-Id: <20200224073157.GB3286@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200222001513.43099-1-colin.king@canonical.com>
 <20200222121801.cu4dfnk4z5xd5uc2@wittgenstein>
In-Reply-To: <20200222121801.cu4dfnk4z5xd5uc2@wittgenstein>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Colin King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel-mentees@lists.linuxfoundation.org, Ingo Molnar <mingo@kernel.org>, Christian Brauner <christian@brauner.io>

On Sat, Feb 22, 2020 at 01:18:01PM +0100, Christian Brauner wrote:
> On Sat, Feb 22, 2020 at 12:15:13AM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The less than zero comparison of args.cgroup is aways false because
> > args.cgroup is a u64 and can never be less than zero.  I believe the
> > correct check is to cast args.cgroup to a s64 first to ensure an
> > invalid value is not copied to kargs->cgroup.
> > 
> > Addresses-Coverity: ("Unsigned compared against 0")
> > Fixes: ef2c41cf38a7 ("clone3: allow spawning processes into cgroups")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Thanks, Colin.
> Dan has reported this issue a few days prior on the janitors list so he
> likely should get a 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> too.

Colin found it independently so no need for a Reported-by.

> diff --git a/kernel/fork.c b/kernel/fork.c
> index 2diff --git a/kernel/fork.c b/kernel/fork.c
> index 2853e258fe1f..dca4dde3b5b2 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2618,7 +2618,8 @@ noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
>                      !valid_signal(args.exit_signal)))
>                 return -EINVAL;
> 
> -       if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
> +       if ((args.flags & CLONE_INTO_CGROUP) &&
> +           (args.cgroup > INT_MAX || (s64)args.cgroup < 0))

If we're capping it at INT_MAX then the check for negative isn't
required and static analysis tools know it's not so they might complain.

regards,
dan carpenter
