From: Peter Zijlstra <peterz@infradead.org>
Date: Thu, 15 Feb 2018 16:52:12 +0000
Subject: Re: [PATCH-next] sched/headers: Clean up <linux/sched.h>
Message-Id: <20180215165212.GB25181@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180215154318.15894-1-chrisadr@gentoo.org>
In-Reply-To: <20180215154318.15894-1-chrisadr@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christopher Diaz Riveros <chrisadr@gentoo.org>
Cc: mingo@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 15, 2018 at 10:43:18AM -0500, Christopher Diaz Riveros wrote:
> @@ -183,7 +183,7 @@ extern void io_schedule_finish(int token);
>  extern long io_schedule_timeout(long timeout);
>  extern void io_schedule(void);
>  
> -/**
> +/*
>   * struct prev_cputime - snapshot of system and user cputime
>   * @utime: time spent in user mode
>   * @stime: time spent in system mode
> @@ -200,7 +200,7 @@ struct prev_cputime {
>  #endif
>  };
>  
> -/**
> +/*
>   * struct task_cputime - collected CPU time counts
>   * @utime:		time spent in user mode, in nanoseconds
>   * @stime:		time spent in kernel mode, in nanoseconds

Why, are those not valid kerneldoc comments?

> @@ -437,20 +437,28 @@ struct sched_dl_entity {
>  	 * during sched_setattr(), they will remain the same until
>  	 * the next sched_setattr().
>  	 */
> -	u64				dl_runtime;	/* Maximum runtime for each instance	*/
> -	u64				dl_deadline;	/* Relative deadline of each instance	*/
> -	u64				dl_period;	/* Separation of two instances (period) */
> -	u64				dl_bw;		/* dl_runtime / dl_period		*/
> -	u64				dl_density;	/* dl_runtime / dl_deadline		*/
> +	/* Maximum runtime for each instance	*/
> +	u64				dl_runtime;
> +	/* Relative deadline of each instance	*/
> +	u64				dl_deadline;
> +	/* Separation of two instances (period) */
> +	u64				dl_period;
> +	/* dl_runtime / dl_period		*/
> +	u64				dl_bw;
> +	/* dl_runtime / dl_deadline		*/
> +	u64				dl_density;

That's a whole lot less readable :/
