From: Colin King <colin.king@canonical.com>
Date: Wed, 21 Oct 2020 13:23:26 +0000
Subject: [PATCH][next] ext4: remove redundant assignment of variable ex
Message-Id: <20201021132326.148052-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ex is assigned a variable that is not being read, the assignment
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ext4/extents.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index 6b33b9c86b00..80fac488769c 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -5993,7 +5993,6 @@ int ext4_ext_replay_set_iblocks(struct inode *inode)
 			kfree(path);
 			break;
 		}
-		ex = path2[path2->p_depth].p_ext;
 		for (i = 0; i <= max(path->p_depth, path2->p_depth); i++) {
 			cmp1 = cmp2 = 0;
 			if (i <= path->p_depth)
-- 
2.27.0
