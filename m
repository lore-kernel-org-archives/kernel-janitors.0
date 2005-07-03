From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 03 Jul 2005 22:36:11 +0000
Subject: Re: [KJ] [PATCH 2.6.13-rc1 9/17] fix sparse warnings (__nocast type)
Message-Id: <200507040236.11982.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031857.08600.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031857.08600.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sunday 03 July 2005 22:57, Victor Fusco wrote:
> --- linux-2.6-git.orig/include/linux/reiserfs_fs.h
> +++ linux-2.6-git/include/linux/reiserfs_fs.h
> @@ -2008,7 +2008,7 @@
>  void * reiserfs_kmalloc (size_t size, int flags, struct super_block * s);
>  void reiserfs_kfree (const void * vp, size_t size, struct super_block * s);
>  #else
> -static inline void *reiserfs_kmalloc(size_t size, int flags,
> +static inline void *reiserfs_kmalloc(size_t size, unsigned int __nocast flags,
>  					struct super_block *s)

You forget to patch the prototype 3 lines above and fs/reiserfs/fix_node.c
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
