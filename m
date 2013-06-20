From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Jun 2013 08:08:58 +0000
Subject: [patch] ext4: signedness bug breaks ext4_inode_touch_time_cmp()
Message-Id: <20130620080858.GA15095@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>, Zheng Liu <wenqing.lz@taobao.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

"diff" is unsigned so this doesn't sort the LRU list correctly.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This was introduced in 6480bad916be "ext4: improve extent cache shrink
mechanism to avoid to burn CPU time"

diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
index e0190f6..79e097d 100644
--- a/fs/ext4/extents_status.c
+++ b/fs/ext4/extents_status.c
@@ -880,7 +880,7 @@ static int ext4_inode_touch_time_cmp(void *priv, struct list_head *a,
 				     struct list_head *b)
 {
 	struct ext4_inode_info *eia, *eib;
-	unsigned long diff;
+	long diff;
 
 	eia = list_entry(a, struct ext4_inode_info, i_es_lru);
 	eib = list_entry(b, struct ext4_inode_info, i_es_lru);
