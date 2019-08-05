From: Colin King <colin.king@canonical.com>
Date: Mon, 05 Aug 2019 10:47:32 +0000
Subject: [PATCH][btrfs-next] btrfs: fix spelling mistake "aliged" -> "aligned"
Message-Id: <20190805104732.26738-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an extent_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/btrfs/tree-checker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index 375396781fba..3d69e0f6e894 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -1043,7 +1043,7 @@ static int check_extent_item(struct extent_buffer *leaf,
 		}
 		if (!IS_ALIGNED(key->offset, fs_info->sectorsize)) {
 			extent_err(leaf, slot,
-			"invalid extent length, have %llu expect aliged to %u",
+			"invalid extent length, have %llu expect aligned to %u",
 				   key->offset, fs_info->sectorsize);
 			return -EUCLEAN;
 		}
-- 
2.20.1
