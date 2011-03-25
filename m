From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 25 Mar 2011 15:04:10 +0000
Subject: Re: [Xen-devel] [patch 2/2] xen-gntdev: unlock on error path in
Message-Id: <20110325150410.GF27651@dumpdata.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110319054543.GE2008@bicker>
In-Reply-To: <20110319054543.GE2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, kernel-janitors@vger.kernel.org, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org

On Sat, Mar 19, 2011 at 08:45:43AM +0300, Dan Carpenter wrote:
> We should unlock here and also decrement the number of &map->users.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> I'm not very familiar with this code.  Please review carefully.

It looks right. -EINVAL is still returned so that is OK. Put it
on the rc1 train.
> 
> diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
> index 017ce60..b0f9e8f 100644
> --- a/drivers/xen/gntdev.c
> +++ b/drivers/xen/gntdev.c
> @@ -662,7 +662,7 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
>  	if (map->flags) {
>  		if ((vma->vm_flags & VM_WRITE) &&
>  				(map->flags & GNTMAP_readonly))
> -			return -EINVAL;
> +			goto out_unlock_put;
>  	} else {
>  		map->flags = GNTMAP_host_map;
>  		if (!(vma->vm_flags & VM_WRITE))
> @@ -700,6 +700,8 @@ unlock_out:
>  	spin_unlock(&priv->lock);
>  	return err;
>  
> +out_unlock_put:
> +	spin_unlock(&priv->lock);
>  out_put_map:
>  	if (use_ptemod)
>  		map->vma = NULL;
> 
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xensource.com
> http://lists.xensource.com/xen-devel
