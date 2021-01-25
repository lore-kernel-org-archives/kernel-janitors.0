From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Mon, 25 Jan 2021 01:41:41 +0000
Subject: [PATCH] btrfs: remove repeated word
Message-Id: <20210125014141.GA10137@fedora>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: clm@fb.com, josef@toxicpanda.com, dsterba@suse.com
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Comment for processed extent end of range has an
unnecessary "in". Eradicate it.

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 fs/btrfs/extent_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 7f689ad7709c..2dc98eeb3c93 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -2775,7 +2775,7 @@ struct processed_extent {
 	struct btrfs_inode *inode;
 	/* Start of the range in @inode */
 	u64 start;
-	/* End of the range in in @inode */
+	/* End of the range in @inode */
 	u64 end;
 	bool uptodate;
 };
-- 
2.29.2
