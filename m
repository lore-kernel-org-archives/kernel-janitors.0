From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Nov 2020 21:55:18 +0000
Subject: [PATCH] hfsplus: remove pr_err message on ENOSPC file extend error
Message-Id: <20201106215518.390664-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently ENOSPC errors that are triggered from extending a file
are spamming the kernel log with messages.  Since ENOSPC is being
returned there is enough information to userspace to inform why
the extend is failing and the error message is unnecessary and
just more logging noise.  This is particularly noticeable when
exercising a full hfs filesystem with stress-ng file stress tests.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/hfsplus/extents.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
index a930ddd15681..6cc30482c82c 100644
--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -446,13 +446,9 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 	int res;
 
 	if (sbi->alloc_file->i_size * 8 <
-	    sbi->total_blocks - sbi->free_blocks + 8) {
+	    sbi->total_blocks - sbi->free_blocks + 8)
 		/* extend alloc file */
-		pr_err("extend alloc file! (%llu,%u,%u)\n",
-		       sbi->alloc_file->i_size * 8,
-		       sbi->total_blocks, sbi->free_blocks);
 		return -ENOSPC;
-	}
 
 	mutex_lock(&hip->extents_lock);
 	if (hip->alloc_blocks = hip->first_blocks)
-- 
2.28.0
