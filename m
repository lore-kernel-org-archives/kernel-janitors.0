From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Jul 2018 12:53:14 +0000
Subject: [PATCH] ocfs2: dlmglue: remove redundant check of null tmp_oh
Message-Id: <20180731125314.21733-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@oss.oracle.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A null tmp_oh is already being checked earlier and always leads to
an early return.  Thus the check for a null tmp_oh at the end of
function ocfs2_inode_lock_tracker is redundant and can be replaced
with a return 1 instead.

Detected by CoverityScan, CID#1468855 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ocfs2/dlmglue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
index 040ddb6e7dab..5f85ce03ca7f 100644
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
2.17.1

