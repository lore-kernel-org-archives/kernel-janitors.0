From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Feb 2012 07:30:55 +0000
Subject: [patch] Btrfs: silence a compiler warning
Message-Id: <20120222073055.GB7389@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Gcc warns that "ret" can be used uninitialized.  It can't actually be
used uninitialized because btrfs_num_copies() always returns 1 or more.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/btrfs/check-integrity.c b/fs/btrfs/check-integrity.c
index 064b29b..c053e90 100644
--- a/fs/btrfs/check-integrity.c
+++ b/fs/btrfs/check-integrity.c
@@ -643,7 +643,7 @@ static struct btrfsic_dev_state *btrfsic_dev_state_hashtable_lookup(
 static int btrfsic_process_superblock(struct btrfsic_state *state,
 				      struct btrfs_fs_devices *fs_devices)
 {
-	int ret;
+	int ret = 0;
 	struct btrfs_super_block *selected_super;
 	struct list_head *dev_head = &fs_devices->devices;
 	struct btrfs_device *device;
