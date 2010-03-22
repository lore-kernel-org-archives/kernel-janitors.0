From: Anton Vorontsov <avorontsov@ru.mvista.com>
Date: Mon, 22 Mar 2010 17:08:10 +0000
Subject: Re: [PATCH 02/24] power/ds2782: really clear i2c_clientdata on exit
Message-Id: <20100322170810.GA30325@oksana.dev.rtsoft.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de>
 <1269094385-16114-3-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1269094385-16114-3-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ryan Mallon <ryan-7Wk5F4Od5/oYd5yxfr4S2w@public.gmane.org>, Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Sat, Mar 20, 2010 at 03:12:43PM +0100, Wolfram Sang wrote:
> Probably due to a copy & paste bug, clientdata was set again to the data
> structure (which is freed immediately afterwards) when it should be NULLed.
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Ryan Mallon <ryan@bluewatersys.com>
> Cc: Anton Vorontsov <cbouatmailru@gmail.com>
> ---
>  drivers/power/ds2782_battery.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/power/ds2782_battery.c b/drivers/power/ds2782_battery.c
> index da14f37..6971b85 100644
> --- a/drivers/power/ds2782_battery.c
> +++ b/drivers/power/ds2782_battery.c
> @@ -236,7 +236,7 @@ static int ds2782_battery_remove(struct i2c_client *client)
>  	idr_remove(&battery_id, info->id);
>  	mutex_unlock(&battery_lock);
>  
> -	i2c_set_clientdata(client, info);
> +	i2c_set_clientdata(client, NULL);
[...]
> -	i2c_set_clientdata(client, info);
> +	i2c_set_clientdata(client, NULL);

Why is this needed? I'd vote for just removing set_clientdata in
fail/remove paths.

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
