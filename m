From: Jiri Kosina <jkosina@suse.cz>
Date: Wed, 10 Aug 2011 12:17:28 +0000
Subject: Re: [patch] USB: serial: remove duplicate returns
Message-Id: <alpine.LNX.2.00.1108101417150.32288@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110806143126.GE10373@mwanda>
In-Reply-To: <20110806143126.GE10373@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 6 Aug 2011, Dan Carpenter wrote:

> This small untidiness with two returns in a row was copy and pasted
> into mos7720.c and mos7840.c.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
> index 40abedb..3524a10 100644
> --- a/drivers/usb/serial/mos7720.c
> +++ b/drivers/usb/serial/mos7720.c
> @@ -2006,7 +2006,6 @@ static int mos7720_ioctl(struct tty_struct *tty,
>  		dbg("%s (%d) TIOCSERGETLSR", __func__,  port->number);
>  		return get_lsr_info(tty, mos7720_port,
>  					(unsigned int __user *)arg);
> -		return 0;
>  
>  	/* FIXME: These should be using the mode methods */
>  	case TIOCMBIS:
> diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> index 7b50aa1..c72abd5 100644
> --- a/drivers/usb/serial/mos7840.c
> +++ b/drivers/usb/serial/mos7840.c
> @@ -2263,7 +2263,6 @@ static int mos7840_ioctl(struct tty_struct *tty,
>  	case TIOCSERGETLSR:
>  		dbg("%s (%d) TIOCSERGETLSR", __func__, port->number);
>  		return mos7840_get_lsr_info(tty, argp);
> -		return 0;
>  
>  	case TIOCGSERIAL:
>  		dbg("%s (%d) TIOCGSERIAL", __func__, port->number);

Doesn't seem to be in linux-next as of today, so I have picked it up.

Thanks,

-- 
Jiri Kosina
SUSE Labs
