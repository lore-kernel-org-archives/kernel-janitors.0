From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Oct 2020 11:22:32 +0000
Subject: [PATCH] ext4: Fix an IS_ERR() vs NULL check
Message-Id: <20201023112232.GB282278@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>, Harshad Shirwadkar <harshadshirwadkar@gmail.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

The ext4_find_extent() function never returns NULL, it returns error
pointers.

Fixes: 44059e503b03 ("ext4: fast commit recovery path")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/ext4/extents.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index 6b33b9c86b00..a19d0e3a4126 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -5820,8 +5820,8 @@ int ext4_ext_replay_update_ex(struct inode *inode, ext4_lblk_t start,
 	int ret;
 
 	path = ext4_find_extent(inode, start, NULL, 0);
-	if (!path)
-		return -EINVAL;
+	if (IS_ERR(path))
+		return PTR_ERR(path);
 	ex = path[path->p_depth].p_ext;
 	if (!ex) {
 		ret = -EFSCORRUPTED;
-- 
2.28.0
