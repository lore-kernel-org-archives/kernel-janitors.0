From: Nikola Pajkovsky <npajkovs@redhat.com>
Date: Tue, 14 Feb 2012 10:11:54 +0000
Subject: [PATCH] make jffs2_initxattrs() static
Message-Id: <10498a5ebdf9d4d9f0cfd0c9fe377f0c2b288650.1329214285.git.npajkovs@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Nikola Pajkovsky <npajkovs@redhat.com>
---
 fs/jffs2/security.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
1.7.9.rc2

