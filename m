From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 19 Nov 2013 21:28:19 +0000
Subject: Re: [patch] Input: hp_sdc_rtc - unlock on error in hp_sdc_rtc_read_i8042timer()
Message-Id: <20131119212819.GB25784@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131114081808.GA8150@elgon.mountain>
In-Reply-To: <20131114081808.GA8150@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Helge Deller <deller@gmx.de>, David Howells <dhowells@redhat.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 14, 2013 at 11:18:08AM +0300, Dan Carpenter wrote:
> The transaction task here is hp_sdc_tasklet() and it releases the lock.
> The problem is if we aren't able to queue the transaction then we need
> to release the lock ourselves.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you.

> 
> diff --git a/drivers/input/misc/hp_sdc_rtc.c b/drivers/input/misc/hp_sdc_rtc.c
> index 86b8228..45e0e3e 100644
> --- a/drivers/input/misc/hp_sdc_rtc.c
> +++ b/drivers/input/misc/hp_sdc_rtc.c
> @@ -180,7 +180,10 @@ static int64_t hp_sdc_rtc_read_i8042timer (uint8_t loadcmd, int numreg)
>  	if (WARN_ON(down_interruptible(&i8042tregs)))
>  		return -1;
>  
> -	if (hp_sdc_enqueue_transaction(&t)) return -1;
> +	if (hp_sdc_enqueue_transaction(&t)) {
> +		up(&i8042tregs);
> +		return -1;
> +	}
>  	
>  	/* Sleep until results come back. */
>  	if (WARN_ON(down_interruptible(&i8042tregs)))

-- 
Dmitry
