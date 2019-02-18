From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 18 Feb 2019 13:59:00 +0000
Subject: [PATCH] fs: drop pointless static qualifier in bd_mount()
Message-Id: <20190218135900.132676-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no need to have the struct vfsmount *bd_mnt with static
since new value always be assigned before use it.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 fs/block_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 58a4c1217fa8..dcf54494c79e 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -847,7 +847,7 @@ EXPORT_SYMBOL_GPL(blockdev_superblock);
 void __init bdev_cache_init(void)
 {
 	int err;
-	static struct vfsmount *bd_mnt;
+	struct vfsmount *bd_mnt;
 
 	bdev_cachep = kmem_cache_create("bdev_cache", sizeof(struct bdev_inode),
 			0, (SLAB_HWCACHE_ALIGN|SLAB_RECLAIM_ACCOUNT|
-- 
2.20.1
