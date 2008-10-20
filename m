From: Randy Dunlap <rdunlap@xenotime.net>
Date: Mon, 20 Oct 2008 16:42:15 +0000
Subject: Re: [PATCH] kernel: a few readability changes for nice values
Message-Id: <20081020094215.73d4433e.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a91986340810162050n6cdfe617nf9aa90620cc79084@mail.gmail.com>
In-Reply-To: <a91986340810162050n6cdfe617nf9aa90620cc79084@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 16 Oct 2008 20:50:51 -0700 Mike Steiner wrote:

> From: Mike Steiner <mike65536@gmail.com>
> Replaced raw nice values with constants and added macro to wrap
> range check with a descriptive name.
> Signed-off-by: Mike Steiner <mike65536@gmail.com>
> ---
> FYI, this is my first kernel patch. I ran checkpatch.pl on it and fixed the
> errors, except for 2 concerning spaces around "<" and ">" because it would
> make the code less readable.
> diff -up linux-2.6.27.1/kernel/sched.c new/kernel/sched.c
> --- linux-2.6.27.1/kernel/sched.c	2008-10-15 16:02:53.000000000 -0700
> +++ new/kernel/sched.c	2008-10-16 20:37:27.000000000 -0700
> @@ -24,6 +24,7 @@
>   *  2007-07-01  Group scheduling enhancements by Srivatsa Vaddagiri
>   *  2007-11-29  RT balancing improvements by Steven Rostedt, Gregory Haskins,
>   *              Thomas Gleixner, Mike Kravetz
> + *  2008-10-16  A few readability changes for nice values by Mike Steiner
>   */
> 
>  #include <linux/mm.h>
> @@ -77,13 +78,21 @@
> 
>  #include "sched_cpupri.h"
> 
> +#define MIN_NICE (-20)
> +#define MAX_NICE  (19)

Hm, I recall trying to do this about 5 years ago.  Never went anywhere.
Maybe I wasn't persistent enough.

> +
> +/*
> + * If n is outside of range [a...z], use closest value in range.
> + */
> +#define CONSTRAIN_TO_RANGE(a, n, z) ((n)<(a) ? (a) : ((n)>(z) ? (z) : (n)))

As used (below), those macro args are not subject to side effects,
but they could be in general.  (E.g., if the 'n' parameter was "nice++".)

There are at least 2 ways to fix that.  The older way (in linux-kernel land)
is to use local variables in the macro (see include/linux/kernel.h, for the
abs(), clamp() [oh, you should probably use clamp() instead of adding a new
macro], min(), max(), etc., for how to do that.

The newer (and more preferred way currently) is to make constrain() an inline
function so that its parameters won't be evaluated more than one time (vs. the
macro, where the parameters could be evaluated more than one time if locals
are not used).  As Andrew Morton says it, write in C, not in cpp (C preprocessor)
language.  [paraphrasing]


> +
>  /*
>   * Convert user-nice values [ -20 ... 0 ... 19 ]
>   * to static priority [ MAX_RT_PRIO..MAX_PRIO-1 ],
>   * and back.
>   */
> -#define NICE_TO_PRIO(nice)	(MAX_RT_PRIO + (nice) + 20)
> -#define PRIO_TO_NICE(prio)	((prio) - MAX_RT_PRIO - 20)
> +#define NICE_TO_PRIO(nice)	((nice) - MIN_NICE + MAX_RT_PRIO)
> +#define PRIO_TO_NICE(prio)	((prio) - MAX_RT_PRIO + MIN_NICE)
>  #define TASK_NICE(p)		PRIO_TO_NICE((p)->static_prio)
> 
>  /*
> @@ -4877,7 +4886,7 @@ void set_user_nice(struct task_struct *p
>  	unsigned long flags;
>  	struct rq *rq;
> 
> -	if (TASK_NICE(p) = nice || nice < -20 || nice > 19)
> +	if (TASK_NICE(p) = nice || nice < MIN_NICE || nice > MAX_NICE)
>  		return;
>  	/*
>  	 * We have to be careful, if called from sys_setpriority(),
> @@ -4951,16 +4960,11 @@ asmlinkage long sys_nice(int increment)
>  	 * We don't have to worry. Conceptually one call occurs first
>  	 * and we have a single winner.
>  	 */
> -	if (increment < -40)
> -		increment = -40;
> -	if (increment > 40)
> -		increment = 40;
> +	increment = CONSTRAIN_TO_RANGE(-40, increment, 40);
> 
>  	nice = PRIO_TO_NICE(current->static_prio) + increment;
> -	if (nice < -20)
> -		nice = -20;
> -	if (nice > 19)
> -		nice = 19;
> +
> +	nice = CONSTRAIN_TO_RANGE(MIN_NICE, nice, MAX_NICE);
> 
>  	if (increment < 0 && !can_nice(current, nice))
>  		return -EPERM;
> --

---
~Randy
