From: "Rafael J. Wysocki" <rjw@sisk.pl>
Date: Wed, 21 Sep 2011 19:02:30 +0000
Subject: Re: [patch] suspend: off by one in pm_suspend()
Message-Id: <201109212102.30516.rjw@sisk.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110920070336.GA19289@elgon.mountain>
In-Reply-To: <20110920070336.GA19289@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday, September 20, 2011, Dan Carpenter wrote:
> In enter_state() we use "state" as an offset for the pm_states[]
> array.  The pm_states[] array only has PM_SUSPEND_MAX elements so
> this test is off by one.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to linux-pm/linux-next, will be pushed for 3.2.

Thanks,
Rafael


> diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
> index 1d58583..4953dc0 100644
> --- a/kernel/power/suspend.c
> +++ b/kernel/power/suspend.c
> @@ -321,7 +321,7 @@ int enter_state(suspend_state_t state)
>  int pm_suspend(suspend_state_t state)
>  {
>  	int ret;
> -	if (state > PM_SUSPEND_ON && state <= PM_SUSPEND_MAX) {
> +	if (state > PM_SUSPEND_ON && state < PM_SUSPEND_MAX) {
>  		ret = enter_state(state);
>  		if (ret) {
>  			suspend_stats.fail++;
> 
> 

