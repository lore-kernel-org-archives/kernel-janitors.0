From: Adir Kuhn <adirkuhn@gmail.com>
Date: Tue, 05 May 2015 01:51:31 +0000
Subject: [PATCH 3/4] fs: ext4: dir: Added a blank line after declaration
Message-Id: <1430790692-5679-4-git-send-email-adirkuhn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Added blank line after declaration

Signed-off-by: Adir Kuhn <adirkuhn@gmail.com>
---
 fs/ext4/dir.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index 89fa42b..5c730bd 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -388,6 +388,7 @@ static void free_rb_tree_fname(struct rb_root *root)
 	rbtree_postorder_for_each_entry_safe(fname, next, root, rb_hash)
 		while (fname) {
 			struct fname *old = fname;
+
 			fname = fname->next;
 			kfree(old);
 		}
--
2.1.4

