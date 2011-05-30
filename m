From: Richard Cochran <richardcochran@gmail.com>
Date: Mon, 30 May 2011 06:16:40 +0000
Subject: Re: [patch 2/2] ptp: fix some locking bugs in ptp_read()
Message-Id: <20110530061640.GB3166@riccoc20.at.omicron.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110529195407.GB3099@shale.localdomain>
In-Reply-To: <20110529195407.GB3099@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Richard Cochran <richard.cochran@omicron.at>, "David S. Miller" <davem@davemloft.net>, John Stultz <john.stultz@linaro.org>, Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On Sun, May 29, 2011 at 10:54:07PM +0300, Dan Carpenter wrote:
> There was an unlock missing on an error path, and a double unlock on
> another error path.
 
Sloppy, sloppy me.

Again, please take this for 3.0-rc2.

Thanks,
Richard

> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
> index 93fa22d..e7f301da2 100644
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -130,8 +130,10 @@ ssize_t ptp_read(struct posix_clock *pc,
>  		return -ERESTARTSYS;
>  	}
>  
> -	if (ptp->defunct)
> +	if (ptp->defunct) {
> +		mutex_unlock(&ptp->tsevq_mux);
>  		return -ENODEV;
> +	}
>  
>  	spin_lock_irqsave(&queue->lock, flags);
>  
> @@ -151,10 +153,8 @@ ssize_t ptp_read(struct posix_clock *pc,
>  
>  	mutex_unlock(&ptp->tsevq_mux);
>  
> -	if (copy_to_user(buf, event, cnt)) {
> -		mutex_unlock(&ptp->tsevq_mux);
> +	if (copy_to_user(buf, event, cnt))
>  		return -EFAULT;
> -	}
>  
>  	return cnt;
>  }
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
