From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Feb 2019 09:02:55 +0000
Subject: [PATCH] btrfs: Silence a static checker locking warning
Message-Id: <20190209090254.GC4865@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Jeff Mahoney <jeffm@suse.com>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Back in the day, before commit 0b246afa62b0 ("btrfs: root->fs_info
cleanup, add fs_info convenience variables") then we used to take
different locks.  But now it's just one lock and the static checkers
think we can call down_read(&fs_info->subvol_sem); twice in a row which
would lead to a deadlock.

That code is several years old now so presumably both (old_ino =
BTRFS_FIRST_FREE_OBJECTID) and (new_ino = BTRFS_FIRST_FREE_OBJECTID)
conditions can't be true at the same time or the bug would have showed
up in testing.  I have re-written the code though to make it cleaner and
to silence the static checkers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/btrfs/inode.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 9b0e3e2d589c..039a12f51cd7 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -9423,9 +9423,8 @@ static int btrfs_rename_exchange(struct inode *old_dir,
 	btrfs_init_log_ctx(&ctx_dest, new_inode);
 
 	/* close the race window with snapshot create/destroy ioctl */
-	if (old_ino = BTRFS_FIRST_FREE_OBJECTID)
-		down_read(&fs_info->subvol_sem);
-	if (new_ino = BTRFS_FIRST_FREE_OBJECTID)
+	if (old_ino = BTRFS_FIRST_FREE_OBJECTID ||
+	    new_ino = BTRFS_FIRST_FREE_OBJECTID)
 		down_read(&fs_info->subvol_sem);
 
 	/*
@@ -9644,9 +9643,8 @@ static int btrfs_rename_exchange(struct inode *old_dir,
 		ret = ret ? ret : ret2;
 	}
 out_notrans:
-	if (new_ino = BTRFS_FIRST_FREE_OBJECTID)
-		up_read(&fs_info->subvol_sem);
-	if (old_ino = BTRFS_FIRST_FREE_OBJECTID)
+	if (new_ino = BTRFS_FIRST_FREE_OBJECTID ||
+	    old_ino = BTRFS_FIRST_FREE_OBJECTID)
 		up_read(&fs_info->subvol_sem);
 
 	return ret;
-- 
2.17.1
