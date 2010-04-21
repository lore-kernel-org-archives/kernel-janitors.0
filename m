From: Sage Weil <sage@newdream.net>
Date: Wed, 21 Apr 2010 23:41:07 +0000
Subject: Re: [patch] ceph: d_obtain_alias() returns ERR_PTR()
Message-Id: <Pine.LNX.4.64.1004211640270.5794@cobra.newdream.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100421103113.GC29647@bicker>
In-Reply-To: <20100421103113.GC29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 21 Apr 2010, Dan Carpenter wrote:
> d_obtain_alias() doesn't return NULL, it returns an ERR_PTR().

Thanks, put this in the queue.

sage



> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/fs/ceph/export.c b/fs/ceph/export.c
> index 9d67572..192ec40 100644
> --- a/fs/ceph/export.c
> +++ b/fs/ceph/export.c
> @@ -93,11 +93,11 @@ static struct dentry *__fh_to_dentry(struct super_block *sb,
>  		return ERR_PTR(-ESTALE);
>  
>  	dentry = d_obtain_alias(inode);
> -	if (!dentry) {
> +	if (IS_ERR(dentry)) {
>  		pr_err("fh_to_dentry %llx -- inode %p but ENOMEM\n",
>  		       fh->ino, inode);
>  		iput(inode);
> -		return ERR_PTR(-ENOMEM);
> +		return dentry;
>  	}
>  	err = ceph_init_dentry(dentry);
>  
> @@ -149,11 +149,11 @@ static struct dentry *__cfh_to_dentry(struct super_block *sb,
>  	}
>  
>  	dentry = d_obtain_alias(inode);
> -	if (!dentry) {
> +	if (IS_ERR(dentry)) {
>  		pr_err("cfh_to_dentry %llx -- inode %p but ENOMEM\n",
>  		       cfh->ino, inode);
>  		iput(inode);
> -		return ERR_PTR(-ENOMEM);
> +		return dentry;
>  	}
>  	err = ceph_init_dentry(dentry);
>  	if (err < 0) {
> @@ -202,11 +202,11 @@ static struct dentry *ceph_fh_to_parent(struct super_block *sb,
>  		return ERR_PTR(-ESTALE);
>  
>  	dentry = d_obtain_alias(inode);
> -	if (!dentry) {
> +	if (IS_ERR(dentry)) {
>  		pr_err("fh_to_parent %llx -- inode %p but ENOMEM\n",
>  		       cfh->ino, inode);
>  		iput(inode);
> -		return ERR_PTR(-ENOMEM);
> +		return dentry;
>  	}
>  	err = ceph_init_dentry(dentry);
>  	if (err < 0) {
> --
> To unsubscribe from this list: send the line "unsubscribe ceph-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
