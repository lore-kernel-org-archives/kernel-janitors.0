From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Jun 2019 06:56:37 +0000
Subject: [PATCH] mm/slab: restore IRQs in kfree()
Message-Id: <20190613065637.GE16334@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Lameter <cl@linux.com>, Kees Cook <keescook@chromium.org>
Cc: Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

We added a new return here but we need to restore the IRQs before
we leave.

Fixes: 4f5d94fd4ed5 ("mm/slab: sanity-check page type when looking up cache")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 mm/slab.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/slab.c b/mm/slab.c
index 9e3eee5568b6..db01e9aae31b 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -3745,8 +3745,10 @@ void kfree(const void *objp)
 	local_irq_save(flags);
 	kfree_debugcheck(objp);
 	c = virt_to_cache(objp);
-	if (!c)
+	if (!c) {
+		local_irq_restore(flags);
 		return;
+	}
 	debug_check_no_locks_freed(objp, c->object_size);
 
 	debug_check_no_obj_freed(objp, c->object_size);
-- 
2.20.1
