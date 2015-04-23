From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 07:48:21 +0000
Subject: [PATCH v2 02/15] procfs: Remove unnecessary cast proc alloc codes
Message-Id: <1429775314-4171-3-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove unnecessary cast of allocation return value in
fs/proc/inode.c::proc_alloc_inode().

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 fs/proc/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/inode.c b/fs/proc/inode.c
index 7697b66..08a7235 100644
--- a/fs/proc/inode.c
+++ b/fs/proc/inode.c
@@ -58,7 +58,7 @@ static struct inode *proc_alloc_inode(struct super_block *sb)
 	struct proc_inode *ei;
 	struct inode *inode;
 
-	ei = (struct proc_inode *)kmem_cache_alloc(proc_inode_cachep, GFP_KERNEL);
+	ei = kmem_cache_alloc(proc_inode_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
 	ei->pid = NULL;
-- 
2.1.0

