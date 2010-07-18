From: Wang Sheng-Hui <crosslonelyover@gmail.com>
Date: Sun, 18 Jul 2010 06:36:59 +0000
Subject: Re: [PATCH] fix return value for mb_cache_shrink_fn when nr_to_scan
Message-Id: <4C42A10B.2080904@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C425273.5000702@gmail.com> <4C427DC8.6020504@redhat.com> <20100718060106.GA579@infradead.org>
In-Reply-To: <20100718060106.GA579@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Eric Sandeen <sandeen@redhat.com>, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, linux-mm@kvack.org, linux-ext4 <linux-ext4@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, a.gruenbacher@computer.org

于 2010-7-18 14:01, Christoph Hellwig 写道:
> On Sat, Jul 17, 2010 at 11:06:32PM -0500, Eric Sandeen wrote:
>> +	/* Count remaining entries */
>> +	spin_lock(&mb_cache_spinlock);
>> +	list_for_each(l,&mb_cache_list) {
>> +		struct mb_cache *cache >> +			list_entry(l, struct mb_cache, c_cache_list);
>
> This should be using list_for_each_entry.
>

I regenerated the patch. Please check it.

Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>
---
  fs/mbcache.c |   22 +++++++++++-----------
  1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/mbcache.c b/fs/mbcache.c
index ec88ff3..5697d9e 100644
--- a/fs/mbcache.c
+++ b/fs/mbcache.c
@@ -201,21 +201,13 @@ mb_cache_shrink_fn(int nr_to_scan, gfp_t gfp_mask)
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
  	while (nr_to_scan-- && !list_empty(&mb_cache_lru_list)) {
  		struct mb_cache_entry *ce   			list_entry(mb_cache_lru_list.next,
@@ -229,6 +221,14 @@ mb_cache_shrink_fn(int nr_to_scan, gfp_t gfp_mask)
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
1.7.1.1



-- 
Thanks and Regards,
shenghui
