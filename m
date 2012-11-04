From: Vyacheslav Dubeyko <slava@dubeyko.com>
Date: Sun, 04 Nov 2012 10:49:10 +0000
Subject: Re: [PATCH 2/16] fs/hfsplus/bnode.c: use WARN
Message-Id: <FAC63AFE-A6FD-43BB-B34B-3324F930278B@dubeyko.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr> <1351940317-14812-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351940317-14812-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On Nov 3, 2012, at 1:58 PM, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Use WARN rather than printk followed by WARN_ON(1), for conciseness.
> 
> A simplified version of the semantic patch that makes this transformation
> is as follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression list es;
> @@
> 
> -printk(
> +WARN(1,
>  es);
> -WARN_ON(1);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> fs/hfsplus/bnode.c |    3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/hfsplus/bnode.c b/fs/hfsplus/bnode.c
> index 5c125ce..7a92c2c 100644
> --- a/fs/hfsplus/bnode.c
> +++ b/fs/hfsplus/bnode.c
> @@ -588,8 +588,7 @@ struct hfs_bnode *hfs_bnode_create(struct hfs_btree *tree, u32 num)
> 	node = hfs_bnode_findhash(tree, num);
> 	spin_unlock(&tree->hash_lock);
> 	if (node) {
> -		printk(KERN_CRIT "new node %u already hashed?\n", num);
> -		WARN_ON(1);
> +		WARN(1, KERN_CRIT "new node %u already hashed?\n", num);
> 		return node;
> 	}
> 	node = __hfs_bnode_create(tree, num);
> 

Looks good.

Reviewed-by: Vyacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Vyacheslav Dubeyko.


> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

