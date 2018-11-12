From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 12 Nov 2018 02:23:47 +0000
Subject: [PATCH -next] block: drop pointless static qualifier in bd_mount()
Message-Id: <1541989427-104478-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Yue Haibing <yuehaibing@huawei.com>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Yue Haibing <yuehaibing@huawei.com>

There is no need to have the 'struct vfsmount *bd_mnt' variable static
since new value always be assigned before use it.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 fs/block_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 38b8ce0..4064622 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -810,7 +810,7 @@ static struct dentry *bd_mount(struct file_system_type *fs_type,
 void __init bdev_cache_init(void)
 {
 	int err;
-	static struct vfsmount *bd_mnt;
+	struct vfsmount *bd_mnt;
 
 	bdev_cachep = kmem_cache_create("bdev_cache", sizeof(struct bdev_inode),
 			0, (SLAB_HWCACHE_ALIGN|SLAB_RECLAIM_ACCOUNT|
