From: Dan Carpenter <error27@gmail.com>
Date: Sat, 29 May 2010 09:44:10 +0000
Subject: [patch 4/11] btrfs: btrfs_read_fs_root_no_name() returns ERR_PTRs
Message-Id: <20100529094410.GE5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-btrfs@vger.kernel.org
Cc: Yan Zheng <zheng.yan@oracle.com>, Josef Bacik <josef@redhat.com>, Jens Axboe <jens.axboe@oracle.com>, Christoph Hellwig <hch@lst.de>, kernel-janitors@vger.kernel.org, Chris Mason <chris.mason@oracle.com>

btrfs_read_fs_root_no_name() returns ERR_PTRs on error so I added a
check for that.  It's not clear to me if it can also return NULL
pointers or not so I left the original NULL pointer check as is.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 73895ba..34f7c37 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -1985,6 +1985,10 @@ struct btrfs_root *open_ctree(struct super_block *sb,
 	fs_info->fs_root = btrfs_read_fs_root_no_name(fs_info, &location);
 	if (!fs_info->fs_root)
 		goto fail_trans_kthread;
+	if (IS_ERR(fs_info->fs_root)) {
+		err = PTR_ERR(fs_info->fs_root);
+		goto fail_trans_kthread;
+	}
 
 	if (!(sb->s_flags & MS_RDONLY)) {
 		down_read(&fs_info->cleanup_work_sem);
