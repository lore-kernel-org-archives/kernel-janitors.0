From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 09 Jan 2019 02:56:46 +0000
Subject: [PATCH -next] mm, compaction: remove set but not used variables 'a, b, c'
Message-Id: <1547002967-6127-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

mm/compaction.c: In function 'compact_zone':
mm/compaction.c:2063:22: warning:
 variable 'c' set but not used [-Wunused-but-set-variable]
mm/compaction.c:2063:19: warning:
 variable 'b' set but not used [-Wunused-but-set-variable]
mm/compaction.c:2063:16: warning:
 variable 'a' set but not used [-Wunused-but-set-variable]

This never used since 94d5992baaa5 ("mm, compaction: finish pageblock
scanning on contention")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 mm/compaction.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index f73fe07..529f19a 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2060,7 +2060,6 @@ bool compaction_zonelist_suitable(struct alloc_context *ac, int order,
 	unsigned long last_migrated_pfn;
 	const bool sync = cc->mode != MIGRATE_ASYNC;
 	bool update_cached;
-	unsigned long a, b, c;
 
 	cc->migratetype = gfpflags_to_migratetype(cc->gfp_mask);
 	ret = compaction_suitable(cc->zone, cc->order, cc->alloc_flags,
@@ -2106,10 +2105,6 @@ bool compaction_zonelist_suitable(struct alloc_context *ac, int order,
 			cc->whole_zone = true;
 	}
 
-	a = cc->migrate_pfn;
-	b = cc->free_pfn;
-	c = (cc->free_pfn - cc->migrate_pfn) / pageblock_nr_pages;
-
 	last_migrated_pfn = 0;
 
 	/*
