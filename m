From: Ming Lei <ming.lei@redhat.com>
Date: Mon, 07 Sep 2020 07:19:46 +0000
Subject: Re: [PATCH] blk-mq: Fix refcounting leak in __blk_mq_register_dev()
Message-Id: <20200907071946.GA1058569@T590>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200905125206.GE183976@mwanda>
In-Reply-To: <20200905125206.GE183976@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Sep 05, 2020 at 03:52:06PM +0300, Dan Carpenter wrote:
> There is a kobject_add() hidden in the call to kobject_add().
> 
> 	ret = kobject_add(q->mq_kobj, kobject_get(&dev->kobj), "%s", "mq");
>                                       ^^^^^^^^^^^^^^^^^^^^^^^
> 
> It needs to be release on the error path.
> 
> Fixes: 320ae51feed5 ("blk-mq: new multi-queue block IO queueing mechanism")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  block/blk-mq-sysfs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/block/blk-mq-sysfs.c b/block/blk-mq-sysfs.c
> index 062229395a50..5a63659163c1 100644
> --- a/block/blk-mq-sysfs.c
> +++ b/block/blk-mq-sysfs.c
> @@ -321,7 +321,7 @@ int __blk_mq_register_dev(struct device *dev, struct request_queue *q)
>  
>  	ret = kobject_add(q->mq_kobj, kobject_get(&dev->kobj), "%s", "mq");
>  	if (ret < 0)
> -		goto out;
> +		goto out_kobj;
>  
>  	kobject_uevent(q->mq_kobj, KOBJ_ADD);
>  
> @@ -333,8 +333,7 @@ int __blk_mq_register_dev(struct device *dev, struct request_queue *q)
>  
>  	q->mq_sysfs_init_done = true;
>  
> -out:
> -	return ret;
> +	return 0;
>  
>  unreg:
>  	while (--i >= 0)
> @@ -342,6 +341,7 @@ int __blk_mq_register_dev(struct device *dev, struct request_queue *q)
>  
>  	kobject_uevent(q->mq_kobj, KOBJ_REMOVE);
>  	kobject_del(q->mq_kobj);
> +out_kobj:
>  	kobject_put(&dev->kobj);
>  	return ret;
>  }
> -- 
> 2.28.0
> 

Looks good fix:

Reviewed-by: Ming Lei <ming.lei@redhat.com>

-- 
Ming
