From: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
Date: Mon, 09 Apr 2007 19:41:51 +0000
Subject: [KJ] [PATCH] include KERN_* constant in printk() calls in mm/slab.c
Message-Id: <20070409194151.GG4262@traven>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

this is my first janitorial. please let me know your suggestions if
you notice something incorrect or improvable.

the patch is against v2.6.21-rc6

---

include KERN_* constant in printk() calls in mm/slab.c

Signed-off-by: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>

---

diff --git a/mm/slab.c b/mm/slab.c
index 4cbac24..616c240 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -1732,9 +1732,9 @@ static void dump_line(char *data, int offset, int limit)
 			error = data[offset + i];
 			bad_count++;
 		}
-		printk(" %02x", (unsigned char)data[offset + i]);
+		printk(KERN_ERR " %02x", (unsigned char)data[offset + i]);
 	}
-	printk("\n");
+	printk(KERN_ERR "\n");
 
 	if (bad_count = 1) {
 		error ^= POISON_FREE;
@@ -1770,7 +1770,7 @@ static void print_objinfo(struct kmem_cache *cachep, void *objp, int lines)
 			*dbg_userword(cachep, objp));
 		print_symbol("(%s)",
 				(unsigned long)*dbg_userword(cachep, objp));
-		printk("\n");
+		printk(KERN_ERR "\n");
 	}
 	realobj = (char *)objp + obj_offset(cachep);
 	size = obj_size(cachep);
@@ -2151,13 +2151,13 @@ kmem_cache_create (const char *name, size_t size, size_t align,
 		 */
 		res = probe_kernel_address(pc->name, tmp);
 		if (res) {
-			printk("SLAB: cache with size %d has lost its name\n",
+			printk(KERN_WARNING "SLAB: cache with size %d has lost its name\n",
 			       pc->buffer_size);
 			continue;
 		}
 
 		if (!strcmp(pc->name, name)) {
-			printk("kmem_cache_create: duplicate cache %s\n", name);
+			printk(KERN_WARNING "kmem_cache_create: duplicate cache %s\n", name);
 			dump_stack();
 			goto oops;
 		}
@@ -2294,7 +2294,7 @@ kmem_cache_create (const char *name, size_t size, size_t align,
 	left_over = calculate_slab_order(cachep, size, align, flags);
 
 	if (!cachep->num) {
-		printk("kmem_cache_create: couldn't create cache %s.\n", name);
+		printk(KERN_WARNING "kmem_cache_create: couldn't create cache %s.\n", name);
 		kmem_cache_free(&cache_cache, cachep);
 		cachep = NULL;
 		goto oops;
@@ -2929,10 +2929,10 @@ bad:
 		     i < sizeof(*slabp) + cachep->num * sizeof(kmem_bufctl_t);
 		     i++) {
 			if (i % 16 = 0)
-				printk("\n%03x:", i);
-			printk(" %02x", ((unsigned char *)slabp)[i]);
+				printk(KERN_ERR "\n%03x:", i);
+			printk(KERN_ERR " %02x", ((unsigned char *)slabp)[i]);
 		}
-		printk("\n");
+		printk(KERN_ERR "\n");
 		BUG();
 	}
 }


-- 
Matthias Kaehlcke
Linux Application Developer
Barcelona

      El trabajo es el refugio de los que no tienen nada que hacer
                            (Oscar Wilde)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
