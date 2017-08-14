From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Aug 2017 09:35:02 +0000
Subject: [PATCH 1/2] kmemleak: Delete an error message for a failed memory allocation in two functions
Message-Id: <986426ab-4ca9-ee56-9712-d06c25a2ed1a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <301bc8c9-d9f6-87be-ce1d-dc614e82b45b@users.sourceforge.net>
In-Reply-To: <301bc8c9-d9f6-87be-ce1d-dc614e82b45b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Aug 2017 10:50:22 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 mm/kmemleak.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 7780cd83a495..c6c798d90b2e 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -555,7 +555,6 @@ static struct kmemleak_object *create_object(unsigned long ptr, size_t size,
 
 	object = kmem_cache_alloc(object_cache, gfp_kmemleak_mask(gfp));
 	if (!object) {
-		pr_warn("Cannot allocate a kmemleak_object structure\n");
 		kmemleak_disable();
 		return NULL;
 	}
@@ -775,10 +774,8 @@ static void add_scan_area(unsigned long ptr, size_t size, gfp_t gfp)
 	}
 
 	area = kmem_cache_alloc(scan_area_cache, gfp_kmemleak_mask(gfp));
-	if (!area) {
-		pr_warn("Cannot allocate a scan area\n");
+	if (!area)
 		goto out;
-	}
 
 	spin_lock_irqsave(&object->lock, flags);
 	if (size = SIZE_MAX) {
-- 
2.14.0

