From: Christian Brauner <christian.brauner@ubuntu.com>
Date: Sat, 22 Feb 2020 12:18:01 +0000
Subject: Re: [PATCH][next] clone3: fix an unsigned args.cgroup comparison to less than zero
Message-Id: <20200222121801.cu4dfnk4z5xd5uc2@wittgenstein>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200222001513.43099-1-colin.king@canonical.com>
In-Reply-To: <20200222001513.43099-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel-mentees@lists.linuxfoundation.org, Ingo Molnar <mingo@kernel.org>, Christian Brauner <christian@brauner.io>

On Sat, Feb 22, 2020 at 12:15:13AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The less than zero comparison of args.cgroup is aways false because
> args.cgroup is a u64 and can never be less than zero.  I believe the
> correct check is to cast args.cgroup to a s64 first to ensure an
> invalid value is not copied to kargs->cgroup.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: ef2c41cf38a7 ("clone3: allow spawning processes into cgroups")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, Colin.
Dan has reported this issue a few days prior on the janitors list so he
likely should get a 
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
too. I've been sending Dan's bug report to the kernel-mentee list too in
case someone wanted to fix it there. So I'm Ccing them again here so
they know someone's working on this!

> ---
>  kernel/fork.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 67a5d691ffa8..98513a122dd1 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2635,7 +2635,7 @@ noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
>  		     !valid_signal(args.exit_signal)))
>  		return -EINVAL;
>  
> -	if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
> +	if ((args.flags & CLONE_INTO_CGROUP) && (s64)args.cgroup < 0)

I think my code here needs a little more fixing. I'm doing

	if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
		return -EINVAL;

and then later

	*kargs = (struct kernel_clone_args){
		.cgroup		= args.cgroup,
	};

blindly casting from a u64 in struct clone_args to an int in struct
kernel_clone_args. I think we want to check that we're within a sane
range. Maybe something like:

diff --git a/kernel/fork.c b/kernel/fork.c
index 2diff --git a/kernel/fork.c b/kernel/fork.c
index 2853e258fe1f..dca4dde3b5b2 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2618,7 +2618,8 @@ noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
                     !valid_signal(args.exit_signal)))
                return -EINVAL;

-       if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
+       if ((args.flags & CLONE_INTO_CGROUP) &&
+           (args.cgroup > INT_MAX || (s64)args.cgroup < 0))
                return -EINVAL;

        *kargs = (struct kernel_clone_args){

Christian
