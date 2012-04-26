From: Emil Goode <emilgoode@gmail.com>
Date: Thu, 26 Apr 2012 21:12:58 +0000
Subject: [PATCH] GFS2: Return -ENOMEM only if kmalloc fails
Message-Id: <1335474778-6252-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: swhiteho@redhat.com, cluster-devel@redhat.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

The error variable should be assigned the value of -ENOMEM
after the NULL check and not before.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 fs/gfs2/acl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/acl.c b/fs/gfs2/acl.c
index 230eb0f..90f6328 100644
--- a/fs/gfs2/acl.c
+++ b/fs/gfs2/acl.c
@@ -174,8 +174,8 @@ int gfs2_acl_chmod(struct gfs2_inode *ip, struct iattr *attr)
 
 	len = posix_acl_to_xattr(acl, NULL, 0);
 	data = kmalloc(len, GFP_NOFS);
-	error = -ENOMEM;
 	if (data = NULL)
+		error = -ENOMEM;
 		goto out;
 	posix_acl_to_xattr(acl, data, len);
 	error = gfs2_xattr_acl_chmod(ip, attr, data);
-- 
1.7.10

