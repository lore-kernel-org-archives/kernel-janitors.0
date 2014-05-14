From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 May 2014 16:16:44 +0000
Subject: [patch] mm: fix some indenting in cmpxchg_double_slab()
Message-Id: <20140514161644.GF18082@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Lameter <cl@linux-foundation.org>
Cc: Pekka Enberg <penberg@kernel.org>, Matt Mackall <mpm@selenic.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

The return statement goes with the cmpxchg_double() condition so it
needs to be indented another tab.

Also these days the fashion is to line function parameters up, and it
looks nicer that way because then the "freelist_new" is not at the same
indent level as the "return 1;".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/mm/slub.c b/mm/slub.c
index fdf0fe4..d96faa2 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -382,9 +382,9 @@ static inline bool __cmpxchg_double_slab(struct kmem_cache *s, struct page *page
     defined(CONFIG_HAVE_ALIGNED_STRUCT_PAGE)
 	if (s->flags & __CMPXCHG_DOUBLE) {
 		if (cmpxchg_double(&page->freelist, &page->counters,
-			freelist_old, counters_old,
-			freelist_new, counters_new))
-		return 1;
+				   freelist_old, counters_old,
+				   freelist_new, counters_new))
+			return 1;
 	} else
 #endif
 	{
@@ -418,9 +418,9 @@ static inline bool cmpxchg_double_slab(struct kmem_cache *s, struct page *page,
     defined(CONFIG_HAVE_ALIGNED_STRUCT_PAGE)
 	if (s->flags & __CMPXCHG_DOUBLE) {
 		if (cmpxchg_double(&page->freelist, &page->counters,
-			freelist_old, counters_old,
-			freelist_new, counters_new))
-		return 1;
+				   freelist_old, counters_old,
+				   freelist_new, counters_new))
+			return 1;
 	} else
 #endif
 	{
