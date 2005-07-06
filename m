From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Wed, 06 Jul 2005 02:03:41 +0000
Subject: Re: [KJ] [PATCH 2.6.13-rc1 9/17] fix sparse warnings (__nocast type)
Message-Id: <200507060203.41994.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031857.08600.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031857.08600.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sunday 03 July 2005 22:36, Alexey Dobriyan wrote:
> On Sunday 03 July 2005 22:57, Alexey Dobriyan wrote:
> > --- linux-2.6-git.orig/include/linux/reiserfs_fs.h
> > +++ linux-2.6-git/include/linux/reiserfs_fs.h
> > @@ -2008,7 +2008,7 @@
> >  void * reiserfs_kmalloc (size_t size, int flags, struct super_block * s);
> >  void reiserfs_kfree (const void * vp, size_t size, struct super_block * s);
> >  #else
> > -static inline void *reiserfs_kmalloc(size_t size, int flags,
> > +static inline void *reiserfs_kmalloc(size_t size, unsigned int __nocast flags,
> >  					struct super_block *s)
> 
> You forget to patch the prototype 3 lines above and fs/reiserfs/fix_node.c
> 

"and fs/reiserfs/fix_node.c"


Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem: fs/reiserfs/fix_node.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>



 fs/reiserfs/fix_node.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-git/fs/reiserfs/fix_node.c
=================================--- linux-git.orig/fs/reiserfs/fix_node.c	2005-07-06 00:35:29.000000000 +0000
+++ linux-git/fs/reiserfs/fix_node.c	2005-07-06 01:50:50.000000000 +0000
@@ -1967,7 +1967,7 @@
 }
 
 #ifdef CONFIG_REISERFS_CHECK
-void * reiserfs_kmalloc (size_t size, int flags, struct super_block * s)
+void * reiserfs_kmalloc (size_t size, unsigned int __nocast flags, struct super_block * s)
 {
     void * vp;
     static size_t malloced;

--


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
