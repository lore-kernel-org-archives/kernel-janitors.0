From: Colin King <colin.king@canonical.com>
Date: Mon, 18 Sep 2017 12:01:57 +0000
Subject: [PATCH] xfs: remove redundant re-initialization of total_nr_pages
Message-Id: <20170918120157.30134-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Darrick J . Wong" <darrick.wong@oracle.com>, linux-xfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable total_nr_pages is being initialized and then updated with
the same value, this latter assignment is redundant and can be
removed.  Cleans up clang build warning:

Value stored to 'total_nr_pages' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/xfs/xfs_buf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index da14658da310..2f97c12ca75e 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -1258,8 +1258,6 @@ xfs_buf_ioapply_map(
 	int		size;
 	int		offset;
 
-	total_nr_pages = bp->b_page_count;
-
 	/* skip the pages in the buffer before the start offset */
 	page_index = 0;
 	offset = *buf_offset;
-- 
2.14.1

