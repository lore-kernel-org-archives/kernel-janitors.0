From: Stefano Stabellini <sstabellini@kernel.org>
Date: Tue, 05 Dec 2017 18:29:47 +0000
Subject: Re: [Xen-devel] [PATCH 2/2] xen/pvcalls: Fix a check in pvcalls_front_remove()
Message-Id: <alpine.DEB.2.10.1712051029410.3403@sstabellini-ThinkPad-X260>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 5 Dec 2017, Dan Carpenter wrote:
> bedata->ref can't be less than zero because it's unsigned.  This affects
> certain error paths in probe.  We first set ->ref = -1 and then we set
> it to a valid value later.
> 
> Fixes: 219681909913 ("xen/pvcalls: connect to the backend")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
> index 40caa92bff33..d1e1d8d2b9d5 100644
> --- a/drivers/xen/pvcalls-front.c
> +++ b/drivers/xen/pvcalls-front.c
> @@ -1103,7 +1103,7 @@ static int pvcalls_front_remove(struct xenbus_device *dev)
>  			kfree(map);
>  		}
>  	}
> -	if (bedata->ref >= 0)
> +	if (bedata->ref != -1)
>  		gnttab_end_foreign_access(bedata->ref, 0, 0);
>  	kfree(bedata->ring.sring);
>  	kfree(bedata);
> 
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel
