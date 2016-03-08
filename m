From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 Mar 2016 12:05:46 +0000
Subject: [patch] block-dev: checking for NULL instead of IS_ERR()
Message-Id: <20160308120546.GB28684@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, Shaohua Li <shli@fb.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This should be an IS_ERR() check.  mount_pseudo() returns error pointers
and this function should return the error pointer to its caller as well.

Fixes: 3684aa7099e0 ('block-dev: enable writeback cgroup support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 3172c4e..2de969e 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -577,7 +577,7 @@ static struct dentry *bd_mount(struct file_system_type *fs_type,
 {
 	struct dentry *dent;
 	dent = mount_pseudo(fs_type, "bdev:", &bdev_sops, NULL, BDEVFS_MAGIC);
-	if (dent)
+	if (!IS_ERR(dent))
 		dent->d_sb->s_iflags |= SB_I_CGROUPWB;
 	return dent;
 }
