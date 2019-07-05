From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jul 2019 14:50:26 +0000
Subject: [PATCH] mm/slab: One function call less in verify_redzone_free()
Message-Id: <90ca26d4-cc94-d7db-5ab4-ed04b29ced19@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Pekka Enberg <penberg@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jul 2019 16:40:09 +0200

Avoid an extra function call by using a ternary operator instead of
a conditional statement for a string literal selection.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 mm/slab.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/slab.c b/mm/slab.c
index 9df370558e5d..849b5c276588 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -2701,10 +2701,10 @@ static inline void verify_redzone_free(struct kmem_cache *cache, void *obj)
 	if (redzone1 == RED_ACTIVE && redzone2 == RED_ACTIVE)
 		return;

-	if (redzone1 == RED_INACTIVE && redzone2 == RED_INACTIVE)
-		slab_error(cache, "double free detected");
-	else
-		slab_error(cache, "memory outside object was overwritten");
+	slab_error(cache,
+		   redzone1 == RED_INACTIVE && redzone2 == RED_INACTIVE
+		   ? "double free detected"
+		   : "memory outside object was overwritten");

 	pr_err("%px: redzone 1:0x%llx, redzone 2:0x%llx\n",
 	       obj, redzone1, redzone2);
--
2.22.0
