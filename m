From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 11 Feb 2015 09:34:07 +0000
Subject: Re: [PATCH] fs: btrfs: free-space-cache.c: remove two unnecessary checks before calling kfree()
Message-Id: <alpine.DEB.2.10.1502111033450.2356@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1423646233-16637-1-git-send-email-baspeters93@gmail.com>
In-Reply-To: <1423646233-16637-1-git-send-email-baspeters93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bas Peters <baspeters93@gmail.com>
Cc: clm@fb.com, jbacik@fb.com, dsterba@suse.cz, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Wed, 11 Feb 2015, Bas Peters wrote:

> kfree checks whether the pointer it is passed is NULL. The two foregoing
> checks are therefore unnecessary.
>
> This issue was detected using Coccinelle.
>
> Signed-off-by: Bas Peters <baspeters93@gmail.com>
> ---
>  fs/btrfs/free-space-cache.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
> index d6c03f7..7d2d817 100644
> --- a/fs/btrfs/free-space-cache.c
> +++ b/fs/btrfs/free-space-cache.c
> @@ -1976,8 +1976,7 @@ new_bitmap:
>
>  out:
>  	if (info) {
> -		if (info->bitmap)
> -			kfree(info->bitmap);
> +		kfree(info->bitmap);
>  		kmem_cache_free(btrfs_free_space_cachep, info);
>  	}
>
> @@ -3427,8 +3426,7 @@ again:
>
>  	if (info)
>  		kmem_cache_free(btrfs_free_space_cachep, info);
> -	if (map)
> -		kfree(map);
> +	kfree(map);

A certain lack of parallelism arises in the latter case.

julia

>  	return 0;
>  }
>
> --
> 2.1.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
