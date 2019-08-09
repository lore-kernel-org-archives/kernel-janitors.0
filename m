From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 Aug 2019 14:07:39 +0000
Subject: [PATCH] Btrfs: Fix an assert statement in __btrfs_map_block()
Message-Id: <20190809140739.GA3552@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Nikolay Borisov <nborisov@suse.com>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The btrfs_get_chunk_map() never returns NULL, it returns error pointers.

Fixes: 89b798ad1b42 ("btrfs: Use btrfs_get_io_geometry appropriately")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/btrfs/volumes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 6edd1d57e530..e69d135c7d3c 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -5818,7 +5818,7 @@ static int __btrfs_map_block(struct btrfs_fs_info *fs_info,
 		return ret;
 
 	em = btrfs_get_chunk_map(fs_info, logical, *length);
-	ASSERT(em);
+	ASSERT(!IS_ERR(em));
 	map = em->map_lookup;
 
 	*length = geom.len;
-- 
2.20.1
