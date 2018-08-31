From: Colin King <colin.king@canonical.com>
Date: Fri, 31 Aug 2018 14:05:38 +0000
Subject: [PATCH] hfs: fix array out of bounds read of array extent
Message-Id: <20180831140538.31566-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org, dhowells@redhat.com, viro@zeniv.linux.org.uk
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently extent and index i are both being incremented causing
an array out of bounds read on extent[i]. Fix this by removing
the extraneous increment of extent.

Detected by CoverityScan, CID#711541 ("Out of bounds read")

Fixes: d1081202f1d0 ("HFS rewrite")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/hfs/extent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
index 5d0182654580..636cdfcecb26 100644
--- a/fs/hfs/extent.c
+++ b/fs/hfs/extent.c
@@ -300,7 +300,7 @@ int hfs_free_fork(struct super_block *sb, struct hfs_cat_file *file, int type)
 		return 0;
 
 	blocks = 0;
-	for (i = 0; i < 3; extent++, i++)
+	for (i = 0; i < 3; i++)
 		blocks += be16_to_cpu(extent[i].count);
 
 	res = hfs_free_extents(sb, extent, blocks, blocks);
-- 
2.17.1
