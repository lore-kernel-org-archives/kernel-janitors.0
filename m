From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 03 May 2020 20:06:47 +0000
Subject: [PATCH] ext4: Fix a typo in a comment
Message-Id: <20200503200647.154701-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tytso@mit.edu, adilger.kernel@dilger.ca
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/extnets/extents/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/ext4/extents.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index f2b577b315a0..779a0687858a 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -4490,7 +4490,7 @@ static long ext4_zero_range(struct file *file, loff_t offset,
 	inode_lock(inode);
 
 	/*
-	 * Indirect files do not support unwritten extnets
+	 * Indirect files do not support unwritten extents
 	 */
 	if (!(ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))) {
 		ret = -EOPNOTSUPP;
-- 
2.25.1
