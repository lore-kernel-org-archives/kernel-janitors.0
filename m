From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 02 Jun 2010 06:57:11 +0000
Subject: Re: [patch] input/tps6507x-ts: a couple work queue cleanups
Message-Id: <20100602065711.GB3713@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100601152744.GN5483@bicker>
In-Reply-To: <20100601152744.GN5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Todd Fischer <todd.fischer@ridgerun.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Tue, Jun 01, 2010 at 05:27:45PM +0200, Dan Carpenter wrote:
> 1) Use msecs_to_jiffies() instead of calculating by hand.
> 2) Call cancel_delayed_work_sync() instead of cancel_delayed_work() 
>    followed by a separate flush_workqueue().
> 3) Remove the "tsc->wq = 0;"  Sparse complains about that because
>    tsc->wq is a pointer, not an int.  It's not needed because we just
>    free the pointer anyway.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 

Applied the patch, thank you, but more cleanups needed.

> diff --git a/drivers/input/touchscreen/tps6507x-ts.c b/drivers/input/touchscreen/tps6507x-ts.c
> index 5de80a1..5b70a14 100644
> --- a/drivers/input/touchscreen/tps6507x-ts.c
> +++ b/drivers/input/touchscreen/tps6507x-ts.c
> @@ -221,7 +221,7 @@ done:
>  
>  	if (poll) {
>  		schd = queue_delayed_work(tsc->wq, &tsc->work,
> -					  tsc->poll_period * HZ / 1000);
> +					  msecs_to_jiffies(tsc->poll_period));
>  		if (schd)


I think the driver author misunderstood the return values of
queue_delayed_work().

>  			tsc->polling = 1;
>  		else {
> @@ -326,7 +326,7 @@ static int tps6507x_ts_probe(struct platform_device *pdev)
>  		goto err2;
>  
>  	schd = queue_delayed_work(tsc->wq, &tsc->work,
> -				  tsc->poll_period * HZ / 1000);
> +				  msecs_to_jiffies(tsc->poll_period));
>  
>  	if (schd)
>  		tsc->polling = 1;
> @@ -339,10 +339,8 @@ static int tps6507x_ts_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err2:
> -	cancel_delayed_work(&tsc->work);
> -	flush_workqueue(tsc->wq);
> +	cancel_delayed_work_sync(&tsc->work);
>  	destroy_workqueue(tsc->wq);
> -	tsc->wq = 0;
>  	input_free_device(input_dev);
>  err1:
>  	kfree(tsc);
> @@ -360,10 +358,8 @@ static int __devexit tps6507x_ts_remove(struct platform_device *pdev)
>  	if (!tsc)
>  		return 0;
>  
> -	cancel_delayed_work(&tsc->work);
> -	flush_workqueue(tsc->wq);
> +	cancel_delayed_work_sync(&tsc->work);
>  	destroy_workqueue(tsc->wq);
> -	tsc->wq = 0;
>  
>  	input_free_device(input_dev);

This should be input_unregister_device().

I also question the production utility of a driver that continuously
poll device every 30 ms... I think that it was merged prematurely,
without adequate review ;(

-- 
Dmitry
