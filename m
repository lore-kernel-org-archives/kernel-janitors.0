From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Date: Thu, 31 May 2018 06:41:41 +0000
Subject: Re: [PATCH] Btrfs: checking for NULL instead of IS_ERR
Message-Id: <d51ba220-ca4c-c79e-51c9-1f3a21ecbde6@jp.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180531062111.374pq6lxrmdffun6@kili.mountain>
In-Reply-To: <20180531062111.374pq6lxrmdffun6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks again.

David, could you apply this on top of my v7 patch in for-next tree?

Regards,
Tomohiro Misono

On 2018/05/31 15:21, Dan Carpenter wrote:
> memdup_user() returns error pointers, it doesn't return NULL.
> 
> Fixes: 01141b08dee5 ("btrfs: Add unprivileged ioctl which returns subvolume's ROOT_REF")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> index ff5018587bd9..d8dd4504bdab 100644
> --- a/fs/btrfs/ioctl.c
> +++ b/fs/btrfs/ioctl.c
> @@ -2791,9 +2791,9 @@ static noinline int btrfs_ioctl_get_subvol_rootref(struct file *file,
>  		return -ENOMEM;
>  
>  	rootrefs = memdup_user(argp, sizeof(*rootrefs));
> -	if (!rootrefs) {
> +	if (IS_ERR(rootrefs)) {
>  		btrfs_free_path(path);
> -		return -ENOMEM;
> +		return PTR_ERR(rootrefs);
>  	}
>  
>  	inode = file_inode(file);
> 
> 

