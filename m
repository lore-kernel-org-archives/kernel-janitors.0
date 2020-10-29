From: Valentin Schneider <valentin.schneider@arm.com>
Date: Thu, 29 Oct 2020 15:29:18 +0000
Subject: Re: [PATCH][next] sched/debug: fix memory corruption caused by multiple small reads of flags
Message-Id: <jhjft5xoxtd.mognet@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201029151103.373410-1-colin.king@canonical.com>
In-Reply-To: <20201029151103.373410-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 29/10/20 15:11, Colin King wrote:
> Detected by running 'stress-ng --procfs 0' on 5.10-rc1; example splat:
>

That's definitely what I'll need to run next time I lay my dirty hands on
procfs.

> Link: https://bugzilla.kernel.org/show_bug.cgi?id 9919
> Reported-by: Jeff Bastian <jbastian@redhat.com>
> Fixes: 5b9f8ff7b320 ("sched/debug: Output SD flag names rather than their values")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>

> ---
>  kernel/sched/debug.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index 0655524..2357921 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -251,7 +251,7 @@ static int sd_ctl_doflags(struct ctl_table *table, int write,
>       unsigned long flags = *(unsigned long *)table->data;
>       size_t data_size = 0;
>       size_t len = 0;
> -	char *tmp;
> +	char *tmp, *buf;
>       int idx;
>
>       if (write)
> @@ -269,17 +269,17 @@ static int sd_ctl_doflags(struct ctl_table *table, int write,
>               return 0;
>       }
>
> -	tmp = kcalloc(data_size + 1, sizeof(*tmp), GFP_KERNEL);
[...]
> -	tmp += *ppos;
[...]
> -	kfree(tmp);

Yeah, that's downright sloppy :( I can't remember which one it was in a
hurry, but I was "inspired" by another proc handler somewhere; I'll try to
find out if there's any issue in that one or if I really cannot shift the
blame elsewhere.
