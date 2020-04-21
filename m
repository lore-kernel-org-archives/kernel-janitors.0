From: Colin King <colin.king@canonical.com>
Date: Tue, 21 Apr 2020 12:47:03 +0000
Subject: [PATCH][next] btrfs: fix check for memory allocation failure of ret->path
Message-Id: <20200421124703.149466-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, linux-btrfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the memory allocation failure check for ret->path is checking
that ret is null rather than ret->path.  Fix this by checking ret->path
instead.

Addresses-Coverity: ("Dereference null return")
Fixes: bd8bdc532152 ("btrfs: backref: introduce the skeleton of btrfs_backref_iter")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/btrfs/backref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/backref.c b/fs/btrfs/backref.c
index 60a69f7c0b36..78e6c9a64212 100644
--- a/fs/btrfs/backref.c
+++ b/fs/btrfs/backref.c
@@ -2307,7 +2307,7 @@ struct btrfs_backref_iter *btrfs_backref_iter_alloc(
 		return NULL;
 
 	ret->path = btrfs_alloc_path();
-	if (!ret) {
+	if (!ret->path) {
 		kfree(ret);
 		return NULL;
 	}
-- 
2.25.1
