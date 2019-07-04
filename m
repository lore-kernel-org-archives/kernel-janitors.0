From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Jul 2019 23:03:03 +0000
Subject: [PATCH][next][V2] btrfs: fix memory leak of path on error return path
Message-Id: <20190704230303.5583-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if the allocation of roots or tmp_ulist fails the error handling
does not free up the allocation of path causing a memory leak. Fix this and
other similar leaks by moving the call of btrfs_free_path from label out
to label out_free_ulist.

Kudos to David Sterba for spotting the issue in my original fix and
providing the correct way to fix the leak.

Addresses-Coverity: ("Resource leak")
Fixes: 5911c8fe05c5 ("btrfs: fiemap: preallocate ulists for btrfs_check_shared")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: move the btrfs_free_path to the out_free_ulist label as suggested by
    David Sterba as the correct fix.

---
 fs/btrfs/extent_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 1eb671c16ff1..31127f6d2971 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4766,11 +4766,11 @@ int extent_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		ret = emit_last_fiemap_cache(fieinfo, &cache);
 	free_extent_map(em);
 out:
-	btrfs_free_path(path);
 	unlock_extent_cached(&BTRFS_I(inode)->io_tree, start, start + len - 1,
 			     &cached_state);
 
 out_free_ulist:
+	btrfs_free_path(path);
 	ulist_free(roots);
 	ulist_free(tmp_ulist);
 	return ret;
-- 
2.20.1
