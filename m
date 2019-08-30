From: Colin King <colin.king@canonical.com>
Date: Fri, 30 Aug 2019 11:16:21 +0000
Subject: [PATCH] ocfs2: remove deadcode on variable tmp_oh check
Message-Id: <20190830111621.8929-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, ocfs2-devel@oss.oracle.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

At the end of cfs2_inode_lock_tracker tmp_oh is true because an
earlier check on tmp_oh being false returns out of the function.
Since tmp_oh is true, the function will always return 1 so remove
the redundant check and return of 0.

Addresses-Coverity: ("Logically dead code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ocfs2/dlmglue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
index ad594fef2ab0..ff0cf851c9e6 100644
--- a/fs/ocfs2/dlmglue.c
+++ b/fs/ocfs2/dlmglue.c
@@ -2712,7 +2712,7 @@ int ocfs2_inode_lock_tracker(struct inode *inode,
 			return status;
 		}
 	}
-	return tmp_oh ? 1 : 0;
+	return 1;
 }
 
 void ocfs2_inode_unlock_tracker(struct inode *inode,
-- 
2.20.1
