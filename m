From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Feb 2019 18:32:10 +0000
Subject: [PATCH] btrfs: drop the lock on error in btrfs_dev_replace_cancel()
Message-Id: <20190211183209.GA13934@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Anand Jain <anand.jain@oracle.com>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

We should drop the lock on this error path.  This is from static
analysis and I don't know if it's possible to hit this error path in
real life.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/btrfs/dev-replace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/dev-replace.c b/fs/btrfs/dev-replace.c
index 13863354ff9d..ee193c5222b2 100644
--- a/fs/btrfs/dev-replace.c
+++ b/fs/btrfs/dev-replace.c
@@ -862,6 +862,7 @@ int btrfs_dev_replace_cancel(struct btrfs_fs_info *fs_info)
 			btrfs_destroy_dev_replace_tgtdev(tgt_device);
 		break;
 	default:
+		up_write(&dev_replace->rwsem);
 		result = -EINVAL;
 	}
 
-- 
2.17.1
