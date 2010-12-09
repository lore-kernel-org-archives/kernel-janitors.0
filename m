From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 14:39:00 +0000
Subject: [PATCH] ext2: Remove redundant unlikely()
Message-Id: <1291905540-32296-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 fs/ext2/namei.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ext2/namei.c b/fs/ext2/namei.c
index f8aecd2..2e1d834 100644
--- a/fs/ext2/namei.c
+++ b/fs/ext2/namei.c
@@ -67,7 +67,7 @@ static struct dentry *ext2_lookup(struct inode * dir, struct dentry *dentry, str
 	inode = NULL;
 	if (ino) {
 		inode = ext2_iget(dir->i_sb, ino);
-		if (unlikely(IS_ERR(inode))) {
+		if (IS_ERR(inode)) {
 			if (PTR_ERR(inode) = -ESTALE) {
 				ext2_error(dir->i_sb, __func__,
 						"deleted inode referenced: %lu",
-- 
1.7.0.4

