From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Mon, 31 May 2010 16:58:18 +0000
Subject: Re: [PATCH 12/27] drivers/ieee1394: Use memdup_user
Message-Id: <4C03EAAA.6050603@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005221021460.13021@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005221021460.13021@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote on 2010-05-22:
...
> --- a/drivers/ieee1394/video1394.c
> +++ b/drivers/ieee1394/video1394.c
> @@ -1045,14 +1045,9 @@ static long video1394_ioctl(struct file *file,
>  			if (get_user(qv, &p->packet_sizes))
>  				return -EFAULT;
>  
> -			psizes = kmalloc(buf_size, GFP_KERNEL);
> -			if (!psizes)
> -				return -ENOMEM;
> -
> -			if (copy_from_user(psizes, qv, buf_size)) {
> -				kfree(psizes);
> -				return -EFAULT;
> -			}
> +			psizes = memdup_user(qv, buf_size);
> +			if (IS_ERR(psizes))
> +				return PTR_ERR(psizes);
>  		}
>  
>  		spin_lock_irqsave(&d->lock,flags);

Committed to linux1394-2.6.git now, thanks.  (Because akpm said that it
is worth it regardless of video1394 being at its end of life.)
-- 
Stefan Richter
-===-=-=- -=-= ==http://arcgraph.de/sr/
