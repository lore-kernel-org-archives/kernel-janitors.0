From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 14:39:34 +0000
Subject: [PATCH] ext3: Remove redundant unlikely()
Message-Id: <1291905574-32355-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 fs/ext3/namei.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ext3/namei.c b/fs/ext3/namei.c
index bce9dce..268f776 100644
--- a/fs/ext3/namei.c
+++ b/fs/ext3/namei.c
@@ -1047,7 +1047,7 @@ static struct dentry *ext3_lookup(struct inode * dir, struct dentry *dentry, str
 			return ERR_PTR(-EIO);
 		}
 		inode = ext3_iget(dir->i_sb, ino);
-		if (unlikely(IS_ERR(inode))) {
+		if (IS_ERR(inode)) {
 			if (PTR_ERR(inode) = -ESTALE) {
 				ext3_error(dir->i_sb, __func__,
 						"deleted inode referenced: %lu",
-- 
1.7.0.4

