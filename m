From: Colin King <colin.king@canonical.com>
Date: Fri, 11 May 2018 14:05:32 +0000
Subject: [PATCH][ocfs2-next] ocfs2: remove redundant check that tmp_oh is not null
Message-Id: <20180511140532.22552-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@oss.oracle.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an earlier check and return if tmp_oh is null, hence the
finaly check to see if it is not null is redundant and can be
replaced with return 1 instead.

Detected by CoverityScan, CIK#1468855 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ocfs2/dlmglue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
index e0a1574314e1..c34fd27a41f3 100644
--- a/fs/ocfs2/dlmglue.c
+++ b/fs/ocfs2/dlmglue.c
@@ -2695,7 +2695,7 @@ int ocfs2_inode_lock_tracker(struct inode *inode,
 			return status;
 		}
 	}
-	return tmp_oh ? 1 : 0;
+	return 1;
 }
 
 void ocfs2_inode_unlock_tracker(struct inode *inode,
-- 
2.17.0

