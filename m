From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 Oct 2019 10:55:01 +0000
Subject: [PATCH] btrfs: clean up locking name in scrub_enumerate_chunks()
Message-Id: <20191031105501.GB26612@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "&fs_info->dev_replace.rwsem" and "&dev_replace->rwsem" refer to
the same lock but Smatch is not clever enough to figure that out so it
leads to static checker warnings.  It's better to use it consistently
anyway.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/btrfs/scrub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
index 4a5a4e4ef707..06494304ab80 100644
--- a/fs/btrfs/scrub.c
+++ b/fs/btrfs/scrub.c
@@ -3620,7 +3620,7 @@ int scrub_enumerate_chunks(struct scrub_ctx *sctx,
 			break;
 		}
 
-		down_write(&fs_info->dev_replace.rwsem);
+		down_write(&dev_replace->rwsem);
 		dev_replace->cursor_right = found_key.offset + length;
 		dev_replace->cursor_left = found_key.offset;
 		dev_replace->item_needs_writeback = 1;
@@ -3661,10 +3661,10 @@ int scrub_enumerate_chunks(struct scrub_ctx *sctx,
 
 		scrub_pause_off(fs_info);
 
-		down_write(&fs_info->dev_replace.rwsem);
+		down_write(&dev_replace->rwsem);
 		dev_replace->cursor_left = dev_replace->cursor_right;
 		dev_replace->item_needs_writeback = 1;
-		up_write(&fs_info->dev_replace.rwsem);
+		up_write(&dev_replace->rwsem);
 
 		if (ro_set)
 			btrfs_dec_block_group_ro(cache);
-- 
2.20.1
