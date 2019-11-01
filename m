From: Jeff Moyer <jmoyer@redhat.com>
Date: Fri, 01 Nov 2019 15:39:06 +0000
Subject: Re: [PATCH] iocost: don't nest spin_lock_irq in ioc_weight_write()
Message-Id: <x49d0ebd2sl.fsf@segfault.boston.devel.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191031105341.GA26612@mwanda>
In-Reply-To: <20191031105341.GA26612@mwanda> (Dan Carpenter's message of "Thu,
        31 Oct 2019 13:53:41 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> This code causes a static analysis warning:
>
>     block/blk-iocost.c:2113 ioc_weight_write() error: double lock 'irq'
>
> We disable IRQs in blkg_conf_prep() and re-enable them in
> blkg_conf_finish().  IRQ disable/enable should not be nested because
> that means the IRQs will be enabled at the first unlock instead of the
> second one.

Can you please also add a comment stating that irqs were disabled in
blkg_conf_prep?  Otherwise future readers will surely be scratching
their heads trying to figure out why we do things two different ways in
the same function.

Thanks!
Jeff

>
> Fixes: 7caa47151ab2 ("blkcg: implement blk-iocost")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  block/blk-iocost.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/block/blk-iocost.c b/block/blk-iocost.c
> index 2a3db80c1dce..a7ed434eae03 100644
> --- a/block/blk-iocost.c
> +++ b/block/blk-iocost.c
> @@ -2110,10 +2110,10 @@ static ssize_t ioc_weight_write(struct kernfs_open_file *of, char *buf,
>  			goto einval;
>  	}
>  
> -	spin_lock_irq(&iocg->ioc->lock);
> +	spin_lock(&iocg->ioc->lock);
>  	iocg->cfg_weight = v;
>  	weight_updated(iocg);
> -	spin_unlock_irq(&iocg->ioc->lock);
> +	spin_unlock(&iocg->ioc->lock);
>  
>  	blkg_conf_finish(&ctx);
>  	return nbytes;
