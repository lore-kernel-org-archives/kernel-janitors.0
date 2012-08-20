From: Sage Weil <sage@inktank.com>
Date: Mon, 20 Aug 2012 22:33:28 +0000
Subject: Re: [patch] ceph: divide by zero bug in __validate_layout()
Message-Id: <alpine.DEB.2.00.1208201532410.32470@cobra.newdream.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120818155638.GC22424@elgon.mountain>
In-Reply-To: <20120818155638.GC22424@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

I've applied a slightly different fix to the ceph tree that just skips the 
mod if stripe_unit is 0 but doesn't return EINVAL, since passing 0 is 
valid (it means 'do not change').

Thanks!
sage


On Sat, 18 Aug 2012, Dan Carpenter wrote:

> If "l->stripe_unit" is zero the the mod on the next line will cause a
> divide by zero bug.  This comes from the copy_from_user() in
> ceph_ioctl_set_layout_policy()
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/ceph/ioctl.c b/fs/ceph/ioctl.c
> index 8e3fb69..81ec22b 100644
> --- a/fs/ceph/ioctl.c
> +++ b/fs/ceph/ioctl.c
> @@ -42,6 +42,7 @@ static long __validate_layout(struct ceph_mds_client *mdsc,
>  	/* validate striping parameters */
>  	if ((l->object_size & ~PAGE_MASK) ||
>  	    (l->stripe_unit & ~PAGE_MASK) ||
> +	    (l->stripe_unit = 0) ||
>  	    ((unsigned)l->object_size % (unsigned)l->stripe_unit))
>  		return -EINVAL;
>  
> --
> To unsubscribe from this list: send the line "unsubscribe ceph-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
