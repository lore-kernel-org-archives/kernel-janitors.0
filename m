From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 22 Feb 2017 21:08:44 +0000
Subject: Re: [PATCH v2] ncpfs: Remove cast from memory allocation
Message-Id: <alpine.DEB.2.20.1702222207440.2041@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1487797394-30306-1-git-send-email-me@tobin.cc>
In-Reply-To: <1487797394-30306-1-git-send-email-me@tobin.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Tobin C. Harding" <me@tobin.cc>
Cc: Petr Vandrovec <petr@vandrovec.name>, Jan Kara <jack@suse.cz>, Miklos Szeredi <mszeredi@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Thu, 23 Feb 2017, Tobin C. Harding wrote:

> Coccinelle emits WARNING: casting value returned by memory allocation
> function to (struct ncp_inode_info *) is useless.
>
> Remove unnecessary cast.
>
> Changes since v1:
>  - Fix up typo

Changes since v1 goes below the ---.  When this ends up in the git
history, no one will care about the changes since v1, because v1 won't be
part of the history.

julia

>
> Signed-off-by: Tobin C. Harding <me@tobin.cc>
> ---
>
> Kernel built successfully with patch applied.
>
>  fs/ncpfs/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ncpfs/inode.c b/fs/ncpfs/inode.c
> index 7eb89c2..7a9ed33 100644
> --- a/fs/ncpfs/inode.c
> +++ b/fs/ncpfs/inode.c
> @@ -52,7 +52,7 @@ static struct kmem_cache * ncp_inode_cachep;
>  static struct inode *ncp_alloc_inode(struct super_block *sb)
>  {
>  	struct ncp_inode_info *ei;
> -	ei = (struct ncp_inode_info *)kmem_cache_alloc(ncp_inode_cachep, GFP_KERNEL);
> +	ei = kmem_cache_alloc(ncp_inode_cachep, GFP_KERNEL);
>  	if (!ei)
>  		return NULL;
>  	return &ei->vfs_inode;
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
