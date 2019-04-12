From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Apr 2019 10:57:33 +0000
Subject: [PATCH][next] orangefs: remove redundant code
Message-Id: <20190412105733.25976-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check of inode->i_state & I_DIRTY_PAGES is redundant as it
just does the same actions as the following code when the condition
is false.  Although it shows the intention of what to do when
I_DIRTY_PAGES is set I think removing the redunant check is preferable.

Addresses-Coverity: ("Identical code for different branches")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/orangefs/orangefs-utils.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/orangefs/orangefs-utils.c b/fs/orangefs/orangefs-utils.c
index 523e7f9fc2e9..d4b7ae763186 100644
--- a/fs/orangefs/orangefs-utils.c
+++ b/fs/orangefs/orangefs-utils.c
@@ -253,10 +253,6 @@ int orangefs_inode_getattr(struct inode *inode, int flags)
 			write_inode_now(inode, 1);
 			goto again;
 		}
-		if (inode->i_state & I_DIRTY_PAGES) {
-			spin_unlock(&inode->i_lock);
-			return 0;
-		}
 		spin_unlock(&inode->i_lock);
 		return 0;
 	}
-- 
2.20.1
