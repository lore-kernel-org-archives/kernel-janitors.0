From: "Tobin C. Harding" <me@tobin.cc>
Date: Wed, 22 Feb 2017 06:42:00 +0000
Subject: [PATCH] proc:  Remove cast from memory allocation
Message-Id: <1487745720-16967-1-git-send-email-me@tobin.cc>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Seth Forshee <seth.forshee@canonical.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, "Eric W. Biederman" <ebiederm@xmission.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Tobin C. Harding" <me@tobin.cc>

Coccinelle emits WARNING: casting value returned by memory allocation
function to (struct proc_inode *) is useless.

Remove unnecessary cast.

Signed-off-by: Tobin C. Harding <me@tobin.cc>
---
 fs/proc/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/inode.c b/fs/proc/inode.c
index 842a5ff..1eb2326 100644
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
2.7.4

