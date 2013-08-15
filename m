From: Steven Whitehouse <swhiteho@redhat.com>
Date: Thu, 15 Aug 2013 09:49:52 +0000
Subject: Re: [patch] GFS2: alloc_workqueue() doesn't return an ERR_PTR
Message-Id: <1376560192.2719.13.camel@menhir>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130815075443.GA19280@elgon.mountain>
In-Reply-To: <20130815075443.GA19280@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On Thu, 2013-08-15 at 10:54 +0300, Dan Carpenter wrote:
> alloc_workqueue() returns a NULL on error, it doesn't return an ERR_PTR.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
Thanks, I've added this to the gfs2 git tree,

Steve.

> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index a9d8caf..5433777 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -1844,14 +1844,14 @@ int __init gfs2_glock_init(void)
>  
>  	glock_workqueue = alloc_workqueue("glock_workqueue", WQ_MEM_RECLAIM |
>  					  WQ_HIGHPRI | WQ_FREEZABLE, 0);
> -	if (IS_ERR(glock_workqueue))
> -		return PTR_ERR(glock_workqueue);
> +	if (!glock_workqueue)
> +		return -ENOMEM;
>  	gfs2_delete_workqueue = alloc_workqueue("delete_workqueue",
>  						WQ_MEM_RECLAIM | WQ_FREEZABLE,
>  						0);
> -	if (IS_ERR(gfs2_delete_workqueue)) {
> +	if (!gfs2_delete_workqueue) {
>  		destroy_workqueue(glock_workqueue);
> -		return PTR_ERR(gfs2_delete_workqueue);
> +		return -ENOMEM;
>  	}
>  
>  	register_shrinker(&glock_shrinker);


