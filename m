From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 23 Apr 2015 05:43:27 +0000
Subject: Re: [PATCH 08/15] adfs:Remove unneeded kmem_cache_alloc() return value cast
Message-Id: <alpine.DEB.2.10.1504230741410.2812@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1429767245-32453-9-git-send-email-firogm@gmail.com>
In-Reply-To: <1429767245-32453-9-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sorry to be picky, but normally people put a space after the colon.  Also,
the subject line could be shorter: Remove unneeded cast.  The description
part of the subject doesn't have to be unique, just the whole thing,
asfter the [PATCH] part.

julia

On Thu, 23 Apr 2015, Firo Yang wrote:

> kmem_cache_alloc() returns a void pointer - no need to cast it in
> fs/adfs/super.c::adfs_alloc_inode()
>
> Signed-off-by: Firo Yang <firogm@gmail.com>
> ---
>  fs/adfs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/adfs/super.c b/fs/adfs/super.c
> index a19c31d..4d4a0df 100644
> --- a/fs/adfs/super.c
> +++ b/fs/adfs/super.c
> @@ -242,7 +242,7 @@ static struct kmem_cache *adfs_inode_cachep;
>  static struct inode *adfs_alloc_inode(struct super_block *sb)
>  {
>  	struct adfs_inode_info *ei;
> -	ei = (struct adfs_inode_info *)kmem_cache_alloc(adfs_inode_cachep, GFP_KERNEL);
> +	ei = kmem_cache_alloc(adfs_inode_cachep, GFP_KERNEL);
>  	if (!ei)
>  		return NULL;
>  	return &ei->vfs_inode;
> --
> 2.1.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
