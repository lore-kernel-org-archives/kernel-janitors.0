From: Mel Gorman <mgorman@suse.de>
Date: Tue, 31 Jul 2012 10:24:06 +0000
Subject: Re: [next:akpm 121/309] include/linux/page-flags.h:462:2: error: implicit declaration of function 'V
Message-Id: <20120731102406.GM612@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120722163512.GC13376@localhost>
In-Reply-To: <20120722163512.GC13376@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 30, 2012 at 04:48:14PM +0000, Luck, Tony wrote:
> >> Looks like include/linux/page-flags.h (which uses VM_BUG_ON) needs to have a
> >> 
> >> #include <linux/mmdebug.h>
> >> 
> >> to make sure it sees the define.
> >> 
> >
> > There should be a patch in-flight to Andrew's tree that fixes this.
> 
> Can you check ... it is still broken in linux-next today (tag = next-20120730)
> 

I can, and it looks like it got lost. I had to litter Andrew's inbox with
a number of build fixes so it's my own fault.

Andrew, can you pick this patch up please? It's a fix for the patch
"mm: sl[au]b: add knowledge of PFMEMALLOC reserve pages". When merged,
it may collide with the patch immediately after it but the resolution is
straight-forward and the end result is the same. Thanks.

---8<---
buildfix: mm: sl[au]b: add knowledge of PFMEMALLOC reserve pages

Fix build error for bisection reasons.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Mel Gorman <mgorman@suse.de>
---
 include/linux/page-flags.h |    1 +
 mm/slub.c                  |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index e66eb0d..b5d1384 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 #include <linux/bug.h>
+#include <linux/mmdebug.h>
 #ifndef __GENERATING_BOUNDS_H
 #include <linux/mm_types.h>
 #include <generated/bounds.h>
diff --git a/mm/slub.c b/mm/slub.c
index 7fcea20..50cc139 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2327,7 +2327,7 @@ redo:
 
 	object = c->freelist;
 	page = c->page;
-	if (unlikely(!object || !node_match(page, node)
+	if (unlikely(!object || !node_match(page, node) ||
 					!pfmemalloc_match(page, gfpflags)))
 		object = __slab_alloc(s, gfpflags, node, addr, c);
 
