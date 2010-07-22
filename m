From: Wang Sheng-Hui <crosslonelyover@gmail.com>
Date: Thu, 22 Jul 2010 00:54:38 +0000
Subject: re: [PATCH] fix return value for mb_cache_shrink_fn when nr_to_scan
Message-Id: <4C4796CE.6080306@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C425273.5000702@gmail.com>
In-Reply-To: <4C425273.5000702@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Sandeen <sandeen@redhat.com>, agruen@suse.de, hch@infradead.org, linux-ext4 <linux-ext4@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kv

Sorry, missed that. Regerated and passed checkpatch.pl check. 
Please check it.


Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>
---
 fs/mbcache.c |   23 ++++++++++++-----------
 1 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/fs/mbcache.c b/fs/mbcache.c
index ec88ff3..603170e 100644
--- a/fs/mbcache.c
+++ b/fs/mbcache.c
@@ -201,21 +201,14 @@ mb_cache_shrink_fn(int nr_to_scan, gfp_t gfp_mask)
 {
 	LIST_HEAD(free_list);
 	struct list_head *l, *ltmp;
+	struct mb_cache *cache;
 	int count = 0;
 
-	spin_lock(&mb_cache_spinlock);
-	list_for_each(l, &mb_cache_list) {
-		struct mb_cache *cache -			list_entry(l, struct mb_cache, c_cache_list);
-		mb_debug("cache %s (%d)", cache->c_name,
-			  atomic_read(&cache->c_entry_count));
-		count += atomic_read(&cache->c_entry_count);
-	}
 	mb_debug("trying to free %d entries", nr_to_scan);
-	if (nr_to_scan = 0) {
-		spin_unlock(&mb_cache_spinlock);
+	if (nr_to_scan = 0)
 		goto out;
-	}
+
+	spin_lock(&mb_cache_spinlock);
 	while (nr_to_scan-- && !list_empty(&mb_cache_lru_list)) {
 		struct mb_cache_entry *ce  			list_entry(mb_cache_lru_list.next,
@@ -229,6 +222,14 @@ mb_cache_shrink_fn(int nr_to_scan, gfp_t gfp_mask)
 						   e_lru_list), gfp_mask);
 	}
 out:
+	spin_lock(&mb_cache_spinlock);
+	list_for_each_entry(cache, &mb_cache_list, c_cache_list) {
+		mb_debug("cache %s (%d)", cache->c_name,
+			  atomic_read(&cache->c_entry_count));
+		count += atomic_read(&cache->c_entry_count);
+	}
+	spin_unlock(&mb_cache_spinlock);
+
 	return (count / 100) * sysctl_vfs_cache_pressure;
 }
 
-- 
1.6.3.3
