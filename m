From: Francois Romieu <romieu@fr.zoreil.com>
Date: Wed, 18 Feb 2004 21:48:34 +0000
Subject: Re: [Kernel-janitors] Re: 2.6.1: net/ipv4/fib_hash.c: check kme
Message-Id: <20040218224834.A21591@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040217095525.GD29263@conectiva.com.br>
In-Reply-To: <20040217095525.GD29263@conectiva.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Randy.Dunlap <rddunlap@osdl.org> :
[...]
> So, Arnaldo, does this mean that you like this patch?

Walter, do you see any logic error in the following version of your patch ?


kmem_cache_create leak.

Note: fib_hash_init() can be called many times.


 net/ipv4/fib_hash.c |   18 +++++++++++++-----
 1 files changed, 13 insertions(+), 5 deletions(-)

diff -puN net/ipv4/fib_hash.c~kj-fib_hash_init-bad-cache-free net/ipv4/fib_hash.c
--- linux-2.6.3-rc1-mm1/net/ipv4/fib_hash.c~kj-fib_hash_init-bad-cache-free	2004-02-18 22:26:40.000000000 +0100
+++ linux-2.6.3-rc1-mm1-fr/net/ipv4/fib_hash.c	2004-02-18 22:37:10.000000000 +0100
@@ -871,15 +871,18 @@ struct fib_table * __init fib_hash_init(
 {
 	struct fib_table *tb;
 
-	if (fn_hash_kmem = NULL)
+	tb = kmalloc(sizeof(struct fib_table) + sizeof(struct fn_hash), GFP_KERNEL);
+	if (!tb)
+		goto err_out;
+
+	if (!fn_hash_kmem) {
 		fn_hash_kmem = kmem_cache_create("ip_fib_hash",
 						 sizeof(struct fib_node),
 						 0, SLAB_HWCACHE_ALIGN,
 						 NULL, NULL);
-
-	tb = kmalloc(sizeof(struct fib_table) + sizeof(struct fn_hash), GFP_KERNEL);
-	if (tb = NULL)
-		return NULL;
+		if (!fn_hash_kmem)
+			goto err_free;
+	}
 
 	tb->tb_id = id;
 	tb->tb_lookup = fn_hash_lookup;
@@ -890,6 +893,11 @@ struct fib_table * __init fib_hash_init(
 	tb->tb_dump = fn_hash_dump;
 	memset(tb->tb_data, 0, sizeof(struct fn_hash));
 	return tb;
+
+err_free:
+	kfree(tb);
+err_out:
+	return NULL;
 }
 
 /* ------------------------------------------------------------------------ */

_
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
