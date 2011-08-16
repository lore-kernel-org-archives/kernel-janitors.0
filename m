From: Ali Bahar <ali@internetdog.org>
Date: Tue, 16 Aug 2011 01:42:27 +0000
Subject: Re: [patch] rtl8712: don't just return -EFAULT in
Message-Id: <20110816014227.GA28730@internetdog.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Aug 06, 2011 at 07:27:48AM -0700, Dan Carpenter wrote:
> There were some curly braces missing so the original code in
> wpa_supplicant_ioctl() pretty much always returned -EFAULT without
> doing anything.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> index 40e6b5c..c380a30 100644
> --- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> +++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> @@ -2072,9 +2072,10 @@ static int wpa_supplicant_ioctl(struct net_device *dev, struct iw_point *p)
>  	param = (struct ieee_param *)_malloc(p->length);
>  	if (param = NULL)
>  		return -ENOMEM;
> -	if (copy_from_user(param, p->pointer, p->length))
> +	if (copy_from_user(param, p->pointer, p->length)) {
>  		kfree((u8 *)param);
>  		return -EFAULT;
> +	}

Ouch! (Now emacs would've caught this! ;-))
My reading of the code suggests that (not surprisingly) this path does
not get executed. The frequent case is to go thru wext-core's
"standard" handler, instead of the above. If so, then that'd explain
why I've not noticed this bug during testing.

Good catch.

thanks,
ali


>  	switch (param->cmd) {
>  	case IEEE_CMD_SET_WPA_PARAM:
>  		ret = wpa_set_param(dev, param->u.wpa_param.name,
