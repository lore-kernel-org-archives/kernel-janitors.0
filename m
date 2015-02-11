From: Bas Peters <baspeters93@gmail.com>
Date: Wed, 11 Feb 2015 11:58:45 +0000
Subject: [PATCH] fs: proc: inode.c: remove unnecessary type cast
Message-Id: <1423655925-15853-1-git-send-email-baspeters93@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org
Cc: Bas Peters <baspeters93@gmail.com>, oleg@redhat.com, adobriyan@gmail.com, gorcunov@openvz.org, ebiederm@xmission.com, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Issue was detected using Coccinelle.

Signed-off-by: Bas Peters <baspeters93@gmail.com>
---
 fs/proc/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/inode.c b/fs/proc/inode.c
index 8420a2f..e16ee87 100644
--- a/fs/proc/inode.c
+++ b/fs/proc/inode.c
@@ -57,7 +57,7 @@ static struct inode *proc_alloc_inode(struct super_block *sb)
 	struct proc_inode *ei;
 	struct inode *inode;
 
-	ei = (struct proc_inode *)kmem_cache_alloc(proc_inode_cachep, GFP_KERNEL);
+	ei = kmem_cache_alloc(proc_inode_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
 	ei->pid = NULL;
-- 
2.1.0

