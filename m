From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 05 Oct 2005 12:07:51 +0000
Subject: [KJ] Re: [PATCH] reiserfs: fix gfp flags type
Message-Id: <20051005120750.GA4565@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85784255672107079=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============85784255672107079==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 04, 2005 at 08:07:15PM -0700, Randy.Dunlap wrote:
> Fix nocast sparse warnings in reiserfs:
> fs/reiserfs/fix_node.c:2030:21: warning: implicit cast to nocast type

Correct patch is already in -kj:
fs_reiserfs_fix_node_c_fix_sparse_warnings___nocast_type.patch

> --- linux-2614-rc2-git6/fs/reiserfs/fix_node.c~reiser_gfpmask
> +++ linux-2614-rc2-git6/fs/reiserfs/fix_node.c
> @@ -2022,7 +2022,8 @@ static int get_neighbors(struct tree_bal
>  }
>  
>  #ifdef CONFIG_REISERFS_CHECK
> -void *reiserfs_kmalloc(size_t size, int flags, struct super_block *s)
> +void *reiserfs_kmalloc(size_t size, unsigned int __nocast flags,
> +			struct super_block *s)


--===============85784255672107079==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85784255672107079==--
