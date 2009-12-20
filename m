From: Julia Lawall <julia@diku.dk>
Date: Sun, 20 Dec 2009 19:39:00 +0000
Subject: [PATCH] kernel/cred.c: Use kmem_cache_free
Message-Id: <Pine.LNX.4.64.0912202038380.29948@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Free memory allocated using kmem_cache_zalloc using kmem_cache_free rather
than kfree.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,E,c;
@@

 x = \(kmem_cache_alloc\|kmem_cache_zalloc\|kmem_cache_alloc_node\)(c,...)
 ... when != x = E
     when != &x
?-kfree(x)
+kmem_cache_free(c,x)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 kernel/cred.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/kernel/cred.c b/kernel/cred.c
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -224,7 +224,7 @@ struct cred *cred_alloc_blank(void)
 #ifdef CONFIG_KEYS
 	new->tgcred = kzalloc(sizeof(*new->tgcred), GFP_KERNEL);
 	if (!new->tgcred) {
-		kfree(new);
+		kmem_cache_free(cred_jar, new);
 		return NULL;
 	}
 	atomic_set(&new->tgcred->usage, 1);
