From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:14:57 +0000
Subject: [PATCH 04/39] debugobjects: drop null test before destroy functions
Message-Id: <1442146532-9100-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression x; @@
-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 lib/debugobjects.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/debugobjects.c b/lib/debugobjects.c
index 547f7f9..7bf529f 100644
--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -1089,8 +1089,7 @@ void __init debug_objects_mem_init(void)
 
 	if (!obj_cache || debug_objects_replace_static_objects()) {
 		debug_objects_enabled = 0;
-		if (obj_cache)
-			kmem_cache_destroy(obj_cache);
+		kmem_cache_destroy(obj_cache);
 		pr_warn("out of memory.\n");
 	} else
 		debug_objects_selftest();

