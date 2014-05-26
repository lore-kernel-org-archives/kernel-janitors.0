From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 26 May 2014 09:31:05 +0000
Subject: [PATCH] fs: namei: Remove unnecessary check for NULL before iput()
Message-Id: <1401096665-1537-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

iput() already checks for the inode being NULL, thus it's unnecessary to
check before calling.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 fs/namei.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 3220693..7be7cc2 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3741,8 +3741,7 @@ exit2:
 		dput(dentry);
 	}
 	mutex_unlock(&nd.path.dentry->d_inode->i_mutex);
-	if (inode)
-		iput(inode);	/* truncate the inode here */
+	iput(inode);	/* truncate the inode here */
 	inode = NULL;
 	if (delegated_inode) {
 		error = break_deleg_wait(&delegated_inode);
-- 
1.7.9.5


