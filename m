From: Francois Romieu <romieu@fr.zoreil.com>
Date: Thu, 19 Feb 2004 00:33:25 +0000
Subject: Re: [Kernel-janitors] Re: 2.6.1: net/ipv4/fib_hash.c: check kme
Message-Id: <20040219013325.A23097@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040217095525.GD29263@conectiva.com.br>
In-Reply-To: <20040217095525.GD29263@conectiva.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Arnaldo Carvalho de Melo <acme@conectiva.com.br> :
> Seems ok. But I'm picky... see below

Funny: I thought about it as well first :o)


kmem_cache_create leak.

Note: fib_hash_init() can be called many times.


 net/ipv4/fib_hash.c |   19 ++++++++++++++-----
 1 files changed, 14 insertions(+), 5 deletions(-)

diff -puN net/ipv4/fib_hash.c~janitor-fib_hash_init-bad-cache-free net/ipv4/fib_hash.c
--- linux-2.6.3/net/ipv4/fib_hash.c~janitor-fib_hash_init-bad-cache-free	2004-02-18 23:40:02.000000000 +0100
+++ linux-2.6.3-fr/net/ipv4/fib_hash.c	2004-02-19 01:17:01.000000000 +0100
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
@@ -889,7 +892,13 @@ struct fib_table * __init fib_hash_init(
 	tb->tb_select_default = fn_hash_select_default;
 	tb->tb_dump = fn_hash_dump;
 	memset(tb->tb_data, 0, sizeof(struct fn_hash));
+err_out:
 	return tb;
+
+err_free:
+	kfree(tb);
+	tb = NULL;
+	goto err_out;
 }
 
 /* ------------------------------------------------------------------------ */

_

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
