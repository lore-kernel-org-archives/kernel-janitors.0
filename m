From: Nikola Pajkovsky <n.pajkovsky@gmail.com>
Date: Sun, 19 Feb 2012 18:51:42 +0000
Subject: [PATCH] jffs2: make jffs2_initxattrs() static
Message-Id: <f9b5e6546e83e808193657a574801ba60471cc9d.1329677282.git.n.pajkovsky@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Nikola Pajkovsky <n.pajkovsky@gmail.com>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org

Signed-off-by: Nikola Pajkovsky <n.pajkovsky@gmail.com>
---
 fs/jffs2/security.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/security.c b/fs/jffs2/security.c
index 0f20208..304710c 100644
--- a/fs/jffs2/security.c
+++ b/fs/jffs2/security.c
@@ -23,7 +23,7 @@
 #include "nodelist.h"
 
 /* ---- Initial Security Label(s) Attachment callback --- */
-int jffs2_initxattrs(struct inode *inode, const struct xattr *xattr_array,
+static int jffs2_initxattrs(struct inode *inode, const struct xattr *xattr_array,
 		     void *fs_info)
 {
 	const struct xattr *xattr;
-- 
1.7.9.1.244.gb0d66b

