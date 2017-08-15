From: Colin King <colin.king@canonical.com>
Date: Tue, 15 Aug 2017 07:51:02 +0000
Subject: [PATCH] btrfs: remove redundant check on ret being non-zero
Message-Id: <20170815075102.19094-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error return variable ret is initialized to zero and then is
checked to see if it is non-zero in the if-block that follows it.
It is therefore impossible for ret to be non-zero after the if-block
hence the check is redundant and can be removed.

Detected by CoverityScan, CID#1021040 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/btrfs/tree-log.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/btrfs/tree-log.c b/fs/btrfs/tree-log.c
index 3a11ae63676e..f05fcc67efa6 100644
--- a/fs/btrfs/tree-log.c
+++ b/fs/btrfs/tree-log.c
@@ -1143,8 +1143,6 @@ static inline int __add_inode_ref(struct btrfs_trans_handle *trans,
 				goto again;
 			}
 			kfree(victim_name);
-			if (ret)
-				return ret;
 next:
 			cur_offset += victim_name_len + sizeof(*extref);
 		}
-- 
2.11.0

