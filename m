From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 07 Aug 2018 08:59:35 +0000
Subject: Re: [PATCH] rtmutex: Drop pointless static qualifier in rt_mutex_adjust_prio_chain()
Message-Id: <alpine.DEB.2.20.1808071058100.3351@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533632163-93769-1-git-send-email-maowenan@huawei.com>
In-Reply-To: <1533632163-93769-1-git-send-email-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Tue, 7 Aug 2018, Mao Wenan wrote:

> There is no need to have the 'T *v' variable static
> since new value always be assigned before use it.

The code is:

		static int prev_max;

		/*
		 * Print this only once. If the admin changes the limit,
		 * print a new message when reaching the limit again.
		 */
		if (prev_max != max_lock_depth) {

So it is referenced before it is initialized.

julia


>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  kernel/locking/rtmutex.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
> index 2823d41..ba70db8 100644
> --- a/kernel/locking/rtmutex.c
> +++ b/kernel/locking/rtmutex.c
> @@ -472,7 +472,7 @@ static int rt_mutex_adjust_prio_chain(struct task_struct *task,
>  	 * We limit the lock chain length for each invocation.
>  	 */
>  	if (++depth > max_lock_depth) {
> -		static int prev_max;
> +		int prev_max;
>
>  		/*
>  		 * Print this only once. If the admin changes the limit,
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
