From: Colin King <colin.king@canonical.com>
Date: Tue, 02 Jul 2019 14:10:28 +0000
Subject: [PATCH][next] btrfs: fix memory leak of path on error return path
Message-Id: <20190702141028.11566-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if the allocation of roots or tmp_ulist fails the error handling
does not free up the allocation of path causing a memory leak. Fix this by
freeing path with a call to btrfs_free_path before taking the error return
path.

Addresses-Coverity: ("Resource leak")
Fixes: 5911c8fe05c5 ("btrfs: fiemap: preallocate ulists for btrfs_check_shared")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/btrfs/extent_io.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 1eb671c16ff1..d7f37a33d597 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4600,6 +4600,7 @@ int extent_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	tmp_ulist = ulist_alloc(GFP_KERNEL);
 	if (!roots || !tmp_ulist) {
 		ret = -ENOMEM;
+		btrfs_free_path(path);
 		goto out_free_ulist;
 	}
 
-- 
2.20.1
