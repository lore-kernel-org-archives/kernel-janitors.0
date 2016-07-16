From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 16 Jul 2016 12:20:02 +0000
Subject: [patch v2] tools/vm/slabinfo: fix an unintentional printf
Message-Id: <20160716122001.GI32301@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@linux.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Colin Ian King <colin.king@canonical.com>, Laura Abbott <labbott@fedoraproject.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The curly braces are missing here so we print stuff unintentionally.

Fixes: 9da4714a2d44 ('slub: slabinfo update for cmpxchg handling')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Fix typo in git hash

diff --git a/tools/vm/slabinfo.c b/tools/vm/slabinfo.c
index 7cf6e17..b9d34b3 100644
--- a/tools/vm/slabinfo.c
+++ b/tools/vm/slabinfo.c
@@ -510,10 +510,11 @@ static void slab_stats(struct slabinfo *s)
 			s->alloc_node_mismatch, (s->alloc_node_mismatch * 100) / total);
 	}
 
-	if (s->cmpxchg_double_fail || s->cmpxchg_double_cpu_fail)
+	if (s->cmpxchg_double_fail || s->cmpxchg_double_cpu_fail) {
 		printf("\nCmpxchg_double Looping\n------------------------\n");
 		printf("Locked Cmpxchg Double redos   %lu\nUnlocked Cmpxchg Double redos %lu\n",
 			s->cmpxchg_double_fail, s->cmpxchg_double_cpu_fail);
+	}
 }
 
 static void report(struct slabinfo *s)
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
