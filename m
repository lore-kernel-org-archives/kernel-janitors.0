From: Jeff Moyer <jmoyer@redhat.com>
Date: Mon, 04 Nov 2019 11:59:32 +0000
Subject: Re: [PATCH] iocost: add a comment about locking in ioc_weight_write()
Message-Id: <x491runq2cb.fsf@segfault.boston.devel.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191104101811.GA20821@mwanda>
In-Reply-To: <20191104101811.GA20821@mwanda> (Dan Carpenter's message of "Mon,
        4 Nov 2019 13:18:11 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> It wasn't very clear that blkg_conf_prep() disables IRQ and that they
> are enabled in blkg_conf_finish() so this patch adds a comment about it.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Jeff Moyer <jmoyer@redhat.com>

Thanks, Dan!

> ---
> I don't know if it's too late to fold this in with the previous patch?
>
>  block/blk-iocost.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/block/blk-iocost.c b/block/blk-iocost.c
> index a7ed434eae03..c5a8703ca6aa 100644
> --- a/block/blk-iocost.c
> +++ b/block/blk-iocost.c
> @@ -2095,6 +2095,7 @@ static ssize_t ioc_weight_write(struct kernfs_open_file *of, char *buf,
>  		return nbytes;
>  	}
>  
> +	/* blkg_conf_prep() takes the q->queue_lock and disables IRQs */
>  	ret = blkg_conf_prep(blkcg, &blkcg_policy_iocost, buf, &ctx);
>  	if (ret)
>  		return ret;
> @@ -2115,6 +2116,7 @@ static ssize_t ioc_weight_write(struct kernfs_open_file *of, char *buf,
>  	weight_updated(iocg);
>  	spin_unlock(&iocg->ioc->lock);
>  
> +	/* blkg_conf_finish() unlocks the q->queue_lock and enables IRQs */
>  	blkg_conf_finish(&ctx);
>  	return nbytes;
