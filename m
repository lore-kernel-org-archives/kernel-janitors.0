From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 20 Aug 2017 16:36:54 +0000
Subject: [PATCH 3/8] CIFS: One function call less in cifs_lookup() after error detection
Message-Id: <995e9d05-dd4e-cbe3-6686-60313ab97262@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <826310e5-e01c-38af-90df-c5630f761a4d@users.sourceforge.net>
In-Reply-To: <826310e5-e01c-38af-90df-c5630f761a4d-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 20 Aug 2017 16:26:44 +0200

The kfree() function was called in up to two cases by the
cifs_lookup() function during error handling even if the passed variable
contained a null pointer.

* Adjust a jump target according to the Linux coding style convention.

* Delete an initialisation for the variable "full_path" at the beginning
  which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/cifs/dir.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/cifs/dir.c b/fs/cifs/dir.c
index 7dd7ca1afe0b..b43e535ced8a 100644
--- a/fs/cifs/dir.c
+++ b/fs/cifs/dir.c
@@ -759,7 +759,7 @@ cifs_lookup(struct inode *parent_dir_inode, struct dentry *direntry,
 	struct tcon_link *tlink;
 	struct cifs_tcon *pTcon;
 	struct inode *newInode = NULL;
-	char *full_path = NULL;
+	char *full_path;
 
 	xid = get_xid();
 
@@ -778,7 +778,7 @@ cifs_lookup(struct inode *parent_dir_inode, struct dentry *direntry,
 
 	rc = check_name(direntry);
 	if (rc)
-		goto lookup_out;
+		goto put_link;
 
 	/* can not grab the rename sem here since it would
 	deadlock in the cases (beginning of sys_rename itself)
@@ -786,7 +786,7 @@ cifs_lookup(struct inode *parent_dir_inode, struct dentry *direntry,
 	full_path = build_path_from_dentry(direntry);
 	if (full_path = NULL) {
 		rc = -ENOMEM;
-		goto lookup_out;
+		goto put_link;
 	}
 
 	if (d_really_is_positive(direntry)) {
@@ -823,8 +823,8 @@ cifs_lookup(struct inode *parent_dir_inode, struct dentry *direntry,
 		is a common return code */
 	}
 
-lookup_out:
 	kfree(full_path);
+put_link:
 	cifs_put_tlink(tlink);
 	free_xid(xid);
 	return ERR_PTR(rc);
-- 
2.14.0

