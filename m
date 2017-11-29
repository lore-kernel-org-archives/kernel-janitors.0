From: Colin King <colin.king@canonical.com>
Date: Wed, 29 Nov 2017 18:58:03 +0000
Subject: [PATCH] mbcache: remove redundant comparison of unsigned long with < 0
Message-Id: <20171129185803.25015-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The comparison of c_entry_count < 0 is never true because c_entry_count
is an unsigned long and hence cannot be negative.  Hence the 'unlikely'
comparison is redundant and can be removed.

Detected by CoverityScan, CID#1462298 ("Macro compares unsigned to 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/mbcache.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/mbcache.c b/fs/mbcache.c
index b8b8b9ced9f8..d818fd236787 100644
--- a/fs/mbcache.c
+++ b/fs/mbcache.c
@@ -269,9 +269,6 @@ static unsigned long mb_cache_count(struct shrinker *shrink,
 	struct mb_cache *cache = container_of(shrink, struct mb_cache,
 					      c_shrink);
 
-	/* Unlikely, but not impossible */
-	if (unlikely(cache->c_entry_count < 0))
-		return 0;
 	return cache->c_entry_count;
 }
 
-- 
2.14.1

