From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Mar 2020 11:30:06 +0000
Subject: [PATCH] lib/stackdepot.c: fix a condition in stack_depot_fetch()
Message-Id: <20200312113006.GA20562@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Potapenko <glider@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Miles Chen <miles.chen@mediatek.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should check for a NULL pointer first before adding the offset.
Otherwise if the pointer is NULL and the offset is non-zero, it will
lead to an Oops.

Fixes: d45048e65a59 ("lib/stackdepot.c: check depot_index before accessing the stack slab")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 lib/stackdepot.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index da5d1880bf34..2caffc64e4c8 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -207,18 +207,16 @@ unsigned int stack_depot_fetch(depot_stack_handle_t handle,
 	size_t offset = parts.offset << STACK_ALLOC_ALIGN;
 	struct stack_record *stack;
 
+	*entries = NULL;
 	if (parts.slabindex > depot_index) {
 		WARN(1, "slab index %d out of bounds (%d) for stack id %08x\n",
 			parts.slabindex, depot_index, handle);
-		*entries = NULL;
 		return 0;
 	}
 	slab = stack_slabs[parts.slabindex];
-	stack = slab + offset;
-	if (!stack) {
-		*entries = NULL;
+	if (!slab)
 		return 0;
-	}
+	stack = slab + offset;
 
 	*entries = stack->entries;
 	return stack->size;
-- 
2.20.1
