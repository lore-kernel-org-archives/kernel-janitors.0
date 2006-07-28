From: Jeff Garzik <jeff@garzik.org>
Date: Fri, 28 Jul 2006 08:51:04 +0000
Subject: Re: [KJ] [patch] fix common mistake in polling loops
Message-Id: <44C9CFF8.2080503@garzik.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com>
In-Reply-To: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zed 0xff <zed.0xff@gmail.com>
Cc: kernel-janitors@osdl.org, linux-kernel@vger.kernel.org

Zed 0xff wrote:
> b/drivers/block/sx8.c
> --- a/drivers/block/sx8.c    2006-07-27 21:56:05.000000000 +0600
> +++ b/drivers/block/sx8.c    2006-07-28 00:52:33.000000000 +0600
> @@ -550,21 +550,23 @@ static struct carm_request *carm_get_spe
>     unsigned long flags;
>     struct carm_request *crq = NULL;
>     struct request *rq;
> -    int tries = 5000;
> +    unsigned long timeout= jiffies + msecs_to_jiffies(50000);
> 
> -    while (tries-- > 0) {
> +    for(;;) {
>         spin_lock_irqsave(&host->lock, flags);
>         crq = carm_get_request(host);
>         spin_unlock_irqrestore(&host->lock, flags);
> 
>         if (crq)
>             break;
> +
> +        if (time_after(timeout, jiffies)) {
> +            return NULL;
> +        }
> +       
>         msleep(10);
>     }
> 
> -    if (!crq)
> -        return NULL;
> -


NAK:
* [minor] broken whitespace
* [minor] adding braces to singleton C statements
* [major] makes a simple loop much more annoying to read

There is no critical hard deadline for this loop, as with most error 
handling loops.

Since error handling code is exercised much less frequently than regular 
code, I would rather KISS.

	Jeff


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
