From: scameron@beardog.cce.hp.com
Date: Thu, 01 Apr 2010 16:33:56 +0000
Subject: Re: [patch] cciss: unlock on error path
Message-Id: <20100401163356.GQ12755@beardog.cce.hp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100401155404.GD5265@bicker>
In-Reply-To: <20100401155404.GD5265@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Mike Miller <mike.miller@hp.com>, Jens Axboe <jens.axboe@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, iss_storagedev@hp.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 01, 2010 at 06:54:04PM +0300, Dan Carpenter wrote:
> We take the spin_lock again in fail_all_cmds() so we need to unlock
> here.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> This was found by a static checker and I don't have the hardware myself.
> Please review carefully.
> 
> diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
> index 9e3af30..eb5ff05 100644
> --- a/drivers/block/cciss.c
> +++ b/drivers/block/cciss.c
> @@ -3341,6 +3341,7 @@ static irqreturn_t do_cciss_intr(int irq, void *dev_id)
>  					printk(KERN_WARNING
>  					       "cciss: controller cciss%d failed, stopping.\n",
>  					       h->ctlr);
> +					spin_unlock_irqrestore(CCISS_LOCK(h->ctlr), flags);
>  					fail_all_cmds(h->ctlr);
>  					return IRQ_HANDLED;
>  				}

Looks ok to me.  (Seems like I've seen this patch before).
It's pretty much a paranoid "never happen" case anyway.
To hit this, the hardware would have to return a tag that was marked as 
containing an index, and then the index would have to be out of bounds,
so either, it would have to be broken driver, broken firmware or
broken hardware.

Really, one of these days, the interrupt handler should probably be
cleaned up to be more like what's in the hpsa driver.

-- steve

