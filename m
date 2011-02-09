From: Dan Carpenter <error27@gmail.com>
Date: Wed, 09 Feb 2011 23:24:12 +0000
Subject: [patch] ext4: off by one check in ext4_groupinfo_create_slab()
Message-Id: <20110209232412.GC4384@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>, sandeen@redhat.com
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

If cache_index = NR_GRPINFO_CACHES then we read past the end of the
ext4_groupinfo_caches[] array a couple lines later.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index 02cff4a..d1fe09a 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -2438,7 +2438,7 @@ static int ext4_groupinfo_create_slab(size_t size)
 	int cache_index = blocksize_bits - EXT4_MIN_BLOCK_LOG_SIZE;
 	struct kmem_cache *cachep;
 
-	if (cache_index > NR_GRPINFO_CACHES)
+	if (cache_index >= NR_GRPINFO_CACHES)
 		return -EINVAL;
 
 	if (unlikely(cache_index < 0))
