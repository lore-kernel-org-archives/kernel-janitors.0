From: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
Date: Mon, 14 Sep 2015 03:29:06 +0000
Subject: Re: [PATCH 02/39] nilfs2: drop null test before destroy functions
Message-Id: <20150914.122906.1656489070901419863.konishi.ryusuke@lab.ntt.co.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
	<1442146532-9100-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 13 Sep 2015 14:14:55 +0200, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> Remove unneeded NULL test.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ expression x; @@
> -if (x != NULL)
>   \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Looks OK.  I'll queue this in my tree.

Thanks,
Ryusuke Konishi

> 
> ---
>  fs/nilfs2/super.c |   12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
> index f47585b..c69455a 100644
> --- a/fs/nilfs2/super.c
> +++ b/fs/nilfs2/super.c
> @@ -1405,14 +1405,10 @@ static void nilfs_destroy_cachep(void)
>  	 */
>  	rcu_barrier();
>  
> -	if (nilfs_inode_cachep)
> -		kmem_cache_destroy(nilfs_inode_cachep);
> -	if (nilfs_transaction_cachep)
> -		kmem_cache_destroy(nilfs_transaction_cachep);
> -	if (nilfs_segbuf_cachep)
> -		kmem_cache_destroy(nilfs_segbuf_cachep);
> -	if (nilfs_btree_path_cache)
> -		kmem_cache_destroy(nilfs_btree_path_cache);
> +	kmem_cache_destroy(nilfs_inode_cachep);
> +	kmem_cache_destroy(nilfs_transaction_cachep);
> +	kmem_cache_destroy(nilfs_segbuf_cachep);
> +	kmem_cache_destroy(nilfs_btree_path_cache);
>  }
>  
>  static int __init nilfs_init_cachep(void)
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-nilfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
