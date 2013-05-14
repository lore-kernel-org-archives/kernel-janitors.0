From: Nathan Zimmer <nzimmer@sgi.com>
Date: Tue, 14 May 2013 18:27:49 +0000
Subject: [PATCH] rbtree: remove unneeded include
Message-Id: <1368556069-194880-1-git-send-email-nzimmer@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Zimmer <nzimmer@sgi.com>

Remove an unnecessary include to kernel.h

Signed-off-by: Nathan Zimmer <nzimmer@sgi.com>
---
 include/linux/rbtree.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/rbtree.h b/include/linux/rbtree.h
index 0022c1b..d2fdc6d 100644
--- a/include/linux/rbtree.h
+++ b/include/linux/rbtree.h
@@ -29,7 +29,6 @@
 #ifndef	_LINUX_RBTREE_H
 #define	_LINUX_RBTREE_H
 
-#include <linux/kernel.h>
 #include <linux/stddef.h>
 
 struct rb_node {
-- 
1.8.2.1

