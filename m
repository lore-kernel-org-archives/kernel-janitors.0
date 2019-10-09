From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 09 Oct 2019 12:31:11 +0000
Subject: [PATCH -next] mm/z3fold.c: remove set but not used variable 'newpage'
Message-Id: <20191009123111.80425-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vitaly Wool <vitaly.wool@konsulko.com>, Henry
 Burns <henryburns@google.com>, Shakeel Butt <shakeelb@google.com>, Stephen
 Rothwell <sfr@canb.auug.org.au>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

mm/z3fold.c: In function 'compact_single_buddy':
mm/z3fold.c:693:16: warning:
 variable 'newpage' set but not used [-Wunused-but-set-variable]

mm/z3fold.c:664:13: warning:
 variable 'bud' set but not used [-Wunused-but-set-variable]

It is never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 mm/z3fold.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/mm/z3fold.c b/mm/z3fold.c
index 25713a4a7186..d48d0ec3bcdd 100644
--- a/mm/z3fold.c
+++ b/mm/z3fold.c
@@ -661,7 +661,6 @@ static struct z3fold_header *compact_single_buddy(struct z3fold_header *zhdr)
 	struct z3fold_pool *pool = zhdr_to_pool(zhdr);
 	void *p = zhdr;
 	unsigned long old_handle = 0;
-	enum buddy bud;
 	size_t sz = 0;
 	struct z3fold_header *new_zhdr = NULL;
 	int first_idx = __idx(zhdr, FIRST);
@@ -673,24 +672,20 @@ static struct z3fold_header *compact_single_buddy(struct z3fold_header *zhdr)
 	 * the page lock is already taken
 	 */
 	if (zhdr->first_chunks && zhdr->slots->slot[first_idx]) {
-		bud = FIRST;
 		p += ZHDR_SIZE_ALIGNED;
 		sz = zhdr->first_chunks << CHUNK_SHIFT;
 		old_handle = (unsigned long)&zhdr->slots->slot[first_idx];
 	} else if (zhdr->middle_chunks && zhdr->slots->slot[middle_idx]) {
-		bud = MIDDLE;
 		p += zhdr->start_middle << CHUNK_SHIFT;
 		sz = zhdr->middle_chunks << CHUNK_SHIFT;
 		old_handle = (unsigned long)&zhdr->slots->slot[middle_idx];
 	} else if (zhdr->last_chunks && zhdr->slots->slot[last_idx]) {
-		bud = LAST;
 		p += PAGE_SIZE - (zhdr->last_chunks << CHUNK_SHIFT);
 		sz = zhdr->last_chunks << CHUNK_SHIFT;
 		old_handle = (unsigned long)&zhdr->slots->slot[last_idx];
 	}
 
 	if (sz > 0) {
-		struct page *newpage;
 		enum buddy new_bud = HEADLESS;
 		short chunks = size_to_chunks(sz);
 		void *q;
@@ -699,7 +694,6 @@ static struct z3fold_header *compact_single_buddy(struct z3fold_header *zhdr)
 		if (!new_zhdr)
 			return NULL;
 
-		newpage = virt_to_page(new_zhdr);
 		if (WARN_ON(new_zhdr = zhdr))
 			goto out_fail;
