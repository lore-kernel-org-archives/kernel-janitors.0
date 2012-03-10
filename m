From: walter harms <wharms@bfs.de>
Date: Sat, 10 Mar 2012 09:38:27 +0000
Subject: Re: [patch] spi: release lock on error path in spi_pump_messages()
Message-Id: <4F5B2113.3060103@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120310085729.GB4647@elgon.mountain>
In-Reply-To: <20120310085729.GB4647-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



Am 10.03.2012 09:57, schrieb Dan Carpenter:
> We should release the lock here and enable IRQs before returning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 5ae1e84..ab1bdce 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -535,6 +535,7 @@ static void spi_pump_messages(struct kthread_work *work)
>  			if (ret) {
>  				dev_err(&master->dev,
>  					"failed to unprepare transfer hardware\n");
> +				spin_unlock_irqrestore(&master->queue_lock, flags);
>  				return;
>  			}
>  		}


hi Dan,
do you want to protect dev_err() by a spn_lock ?

re,
 wh

> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
