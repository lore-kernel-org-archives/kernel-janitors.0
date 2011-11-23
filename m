From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 23 Nov 2011 07:03:31 +0000
Subject: Re: [patch] isdn: make sure strings are null terminated
Message-Id: <1322031811.1298.38.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111123064204.GA6871@elgon.mountain>
In-Reply-To: <20111123064204.GA6871@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Karsten Keil <isdn@linux-pingi.de>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Le mercredi 23 novembre 2011 à 09:42 +0300, Dan Carpenter a écrit :
> These strings come from the user.  We strcpy() them inside
> cf_command() so we should check that they are NULL terminated and
> return an error if not.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/isdn/divert/divert_procfs.c b/drivers/isdn/divert/divert_procfs.c
> index 33ec9e4..0c16687 100644
> --- a/drivers/isdn/divert/divert_procfs.c
> +++ b/drivers/isdn/divert/divert_procfs.c
> @@ -242,6 +242,10 @@ static int isdn_divert_ioctl_unlocked(struct file *file, uint cmd, ulong arg)
>  		case IIOCDOCFINT:
>  			if (!divert_if.drv_to_name(dioctl.cf_ctrl.drvid))
>  				return (-EINVAL);	/* invalid driver */
> +			if (strlen(dioctl.cf_ctrl.msn) >= sizeof(dioctl.cf_ctrl.msn))
> +				return -EINVAL;

This looks buggy.

If string is not null terminated, how strlen() will stop you from going
out of bounds, and trigger some run time checker ?

strnlen() would be more effective...

> +			if (strlen(dioctl.cf_ctrl.fwd_nr) >= sizeof(dioctl.cf_ctrl.fwd_nr))
> +				return -EINVAL;
>  			if ((i = cf_command(dioctl.cf_ctrl.drvid,
>  					    (cmd = IIOCDOCFACT) ? 1 : (cmd = IIOCDOCFDIS) ? 0 : 2,
>  					    dioctl.cf_ctrl.cfproc,
> --



