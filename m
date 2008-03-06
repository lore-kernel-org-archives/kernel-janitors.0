From: Jesper Nilsson <jesper.nilsson@axis.com>
Date: Thu, 06 Mar 2008 18:08:04 +0000
Subject: Re: [PATCH] arch/cris: Use mutex_unlock rather than spin_unlock
Message-Id: <20080306180804.GJ27716@axis.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0803061823370.1669@pc-041.diku.dk>
In-Reply-To: <Pine.LNX.4.58.0803061823370.1669@pc-041.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: mikael.starvik@axis.com, dev-etrax@axis.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Mar 06, 2008 at 06:24:05PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> It looks at least odd to apply spin_unlock to a mutex.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @def@
> declarer DEFINE_MUTEX;
> identifier m;
> @@
> 
> DEFINE_MUTEX(m);
> 
> @@
> identifier def.m;
> @@
> 
> (
> - spin_lock(&m)
> + mutex_lock(&m)
> |
> - spin_unlock(&m)
> + mutex_unlock(&m)
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  arch/cris/arch-v10/drivers/pcf8563.c |    2 +-
>  arch/cris/arch-v32/drivers/pcf8563.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff -u -p a/arch/cris/arch-v10/drivers/pcf8563.c b/arch/cris/arch-v10/drivers/pcf8563.c
> --- a/arch/cris/arch-v10/drivers/pcf8563.c 2008-02-10 22:34:04.000000000 +0100
> +++ b/arch/cris/arch-v10/drivers/pcf8563.c 2008-03-05 22:06:18.000000000 +0100
> @@ -233,7 +233,7 @@ int pcf8563_ioctl(struct inode *inode, s
> 
>  		if (copy_to_user((struct rtc_time *) arg, &tm,
>  				 sizeof tm)) {
> -			spin_unlock(&rtc_lock);
> +			mutex_unlock(&rtc_lock);
>  			return -EFAULT;
>  		}
> 
> diff -u -p a/arch/cris/arch-v32/drivers/pcf8563.c b/arch/cris/arch-v32/drivers/pcf8563.c
> --- a/arch/cris/arch-v32/drivers/pcf8563.c 2008-02-10 22:34:04.000000000 +0100
> +++ b/arch/cris/arch-v32/drivers/pcf8563.c 2008-03-05 22:06:18.000000000 +0100
> @@ -229,7 +229,7 @@ int pcf8563_ioctl(struct inode *inode, s
> 
>  		if (copy_to_user((struct rtc_time *) arg, &tm,
>  				 sizeof tm)) {
> -			spin_unlock(&rtc_lock);
> +			mutex_unlock(&rtc_lock);
>  			return -EFAULT;
>  		}
> 

Quite correct, I'll add it to my queue.

Thanks,

/^JN - Jesper Nilsson
--
               Jesper Nilsson -- jesper.nilsson@axis.com
