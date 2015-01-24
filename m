From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 24 Jan 2015 19:31:24 +0000
Subject: [patch] posix_acl: cleanup posix_acl_create()
Message-Id: <20150124193124.GA18322@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

If posix_acl_create() returns an error code then "*acl" and
"*default_acl" can be uninitialized or point to freed memory.  This
causes problems in some of the callers where it is expected that they
are NULL on error.  For example, ocfs2_reflink() has a bug.

	fs/ocfs2/refcounttree.c:4329 ocfs2_reflink()
	error: potentially using uninitialized 'default_acl'.

I have re-written this function and re-arranged things so that they are
set to NULL at the start and then only set to a valid pointer at the end
of the function.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/posix_acl.c b/fs/posix_acl.c
index 0855f77..66d2c13 100644
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -546,50 +546,43 @@ int
 posix_acl_create(struct inode *dir, umode_t *mode,
 		struct posix_acl **default_acl, struct posix_acl **acl)
 {
-	struct posix_acl *p;
+	struct posix_acl *p, *clone;
 	int ret;
 
+	*acl = NULL;
+	*default_acl = NULL;
+
 	if (S_ISLNK(*mode) || !IS_POSIXACL(dir))
-		goto no_acl;
+		return 0;
 
 	p = get_acl(dir, ACL_TYPE_DEFAULT);
-	if (IS_ERR(p)) {
-		if (p = ERR_PTR(-EOPNOTSUPP))
-			goto apply_umask;
-		return PTR_ERR(p);
+	if (!p || p = ERR_PTR(-EOPNOTSUPP)) {
+		*mode &= ~current_umask();
+		return 0;
 	}
+	if (IS_ERR(p))
+		return PTR_ERR(p);
 
-	if (!p)
-		goto apply_umask;
-
-	*acl = posix_acl_clone(p, GFP_NOFS);
-	if (!*acl)
+	clone = posix_acl_clone(p, GFP_NOFS);
+	if (!clone)
 		return -ENOMEM;
 
-	ret = posix_acl_create_masq(*acl, mode);
+	ret = posix_acl_create_masq(clone, mode);
 	if (ret < 0) {
-		posix_acl_release(*acl);
+		posix_acl_release(clone);
 		return -ENOMEM;
 	}
 
-	if (ret = 0) {
-		posix_acl_release(*acl);
-		*acl = NULL;
-	}
+	if (ret = 0)
+		posix_acl_release(clone);
+	else
+		*acl = clone;
 
-	if (!S_ISDIR(*mode)) {
+	if (!S_ISDIR(*mode))
 		posix_acl_release(p);
-		*default_acl = NULL;
-	} else {
+	else
 		*default_acl = p;
-	}
-	return 0;
 
-apply_umask:
-	*mode &= ~current_umask();
-no_acl:
-	*default_acl = NULL;
-	*acl = NULL;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(posix_acl_create);
