From: Bas Peters <baspeters93@gmail.com>
Date: Wed, 11 Feb 2015 09:17:13 +0000
Subject: [PATCH] fs: btrfs: free-space-cache.c: remove two unnecessary checks before calling kfree()
Message-Id: <1423646233-16637-1-git-send-email-baspeters93@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: clm@fb.com, jbacik@fb.com, dsterba@suse.cz
Cc: Bas Peters <baspeters93@gmail.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

kfree checks whether the pointer it is passed is NULL. The two foregoing
checks are therefore unnecessary.

This issue was detected using Coccinelle.

Signed-off-by: Bas Peters <baspeters93@gmail.com>
---
 fs/btrfs/free-space-cache.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
index d6c03f7..7d2d817 100644
--- a/fs/btrfs/free-space-cache.c
+++ b/fs/btrfs/free-space-cache.c
@@ -1976,8 +1976,7 @@ new_bitmap:
 
 out:
 	if (info) {
-		if (info->bitmap)
-			kfree(info->bitmap);
+		kfree(info->bitmap);
 		kmem_cache_free(btrfs_free_space_cachep, info);
 	}
 
@@ -3427,8 +3426,7 @@ again:
 
 	if (info)
 		kmem_cache_free(btrfs_free_space_cachep, info);
-	if (map)
-		kfree(map);
+	kfree(map);
 	return 0;
 }
 
-- 
2.1.0

