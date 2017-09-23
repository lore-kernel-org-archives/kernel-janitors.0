From: Chandan Rajendra <chandan@linux.vnet.ibm.com>
Date: Sat, 23 Sep 2017 03:53:41 +0000
Subject: Re: [PATCH] ovl: Return -ENOMEM if an allocation fails ovl_lookup()
Message-Id: <1680634.zEmtb0eVgD@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170922204518.cqagl2vlh7jiwt6y@mwanda>
In-Reply-To: <20170922204518.cqagl2vlh7jiwt6y@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Saturday, September 23, 2017 2:15:18 AM IST Dan Carpenter wrote:
> The error code is missing here so it means we return ERR_PTR(0) or NULL.
> The other error paths all return an error code so this probably should
> as well.
> 
> Fixes: 02b69b284cd7 ("ovl: lookup redirects")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
> index c3addd1114f1..beb8a988df51 100644
> --- a/fs/overlayfs/namei.c
> +++ b/fs/overlayfs/namei.c
> @@ -634,6 +634,7 @@ struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
>  		}
> 
>  		if (d.redirect) {
> +			err = -ENOMEM;
>  			upperredirect = kstrdup(d.redirect, GFP_KERNEL);
>  			if (!upperredirect)
>  				goto out_put_upper;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-unionfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

The patch looks good.

Reviewed-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>

-- 
chandan

