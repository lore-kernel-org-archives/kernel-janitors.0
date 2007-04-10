From: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
Date: Tue, 10 Apr 2007 06:48:57 +0000
Subject: Re: [KJ] [PATCH] include KERN_* constant in printk() calls in
Message-Id: <20070410064857.GC24898@traven>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070409194151.GG4262@traven>
In-Reply-To: <20070409194151.GG4262@traven>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

El Mon, Apr 09, 2007 at 03:41:33PM -0600 Matthew Wilcox ha dit:

> On Mon, Apr 09, 2007 at 10:53:21PM +0200, Matthias Kaehlcke wrote:
> > here comes v0.02 of the patch, i hope it is more useful than the first
> > one
> 
> You've made the lines go beyond 80 columns.

thanks for your comment. i corrected this in v0.03

--

include KERN_* constant in printk() calls in mm/slab.c

Signed-off-by: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>

--

diff --git a/mm/slab.c b/mm/slab.c
index 4cbac24..d533f0d 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -2151,13 +2151,16 @@ kmem_cache_create (const char *name, size_t size, size_t align,
 		 */
 		res = probe_kernel_address(pc->name, tmp);
 		if (res) {
-			printk("SLAB: cache with size %d has lost its name\n",
+			printk(KERN_ERR
+			       "SLAB: cache with size %d has lost its name\n",
 			       pc->buffer_size);
 			continue;
 		}
 
 		if (!strcmp(pc->name, name)) {
-			printk("kmem_cache_create: duplicate cache %s\n", name);
+			printk(KERN_ERR
+			       "kmem_cache_create: duplicate cache %s\n",
+			       name);
 			dump_stack();
 			goto oops;
 		}
@@ -2294,7 +2297,9 @@ kmem_cache_create (const char *name, size_t size, size_t align,
 	left_over = calculate_slab_order(cachep, size, align, flags);
 
 	if (!cachep->num) {
-		printk("kmem_cache_create: couldn't create cache %s.\n", name);
+		printk(KERN_ERR
+		       "kmem_cache_create: couldn't create cache %s.\n",
+		       name);
 		kmem_cache_free(&cache_cache, cachep);
 		cachep = NULL;
 		goto oops;

-- 
Matthias Kaehlcke
Linux Application Developer
Barcelona

    C treats you like a consenting adult. Pascal treats you like a
          naughty child. Ada treats you like a criminal
                      (Bruce Powel Douglass)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
