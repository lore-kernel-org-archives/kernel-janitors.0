From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Feb 2014 09:05:49 +0000
Subject: [patch] fs: NULL dereference in posix_acl_to_xattr()
Message-Id: <20140214090549.GA15629@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, Steven Whitehouse <swhiteho@redhat.com>, cluster-devel@redhat.com, kernel-janitors@vger.kernel.org

This patch moves the dereference of "buffer" after the check for NULL.
The only place which passes a NULL parameter is gfs2_set_acl().

Cc: stable <stable@vger.kernel.org>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/posix_acl.c b/fs/posix_acl.c
index 11c54fd51e16..9e363e41dacc 100644
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -723,7 +723,7 @@ posix_acl_to_xattr(struct user_namespace *user_ns, const struct posix_acl *acl,
 		   void *buffer, size_t size)
 {
 	posix_acl_xattr_header *ext_acl = (posix_acl_xattr_header *)buffer;
-	posix_acl_xattr_entry *ext_entry = ext_acl->a_entries;
+	posix_acl_xattr_entry *ext_entry;
 	int real_size, n;
 
 	real_size = posix_acl_xattr_size(acl->a_count);
@@ -731,7 +731,8 @@ posix_acl_to_xattr(struct user_namespace *user_ns, const struct posix_acl *acl,
 		return real_size;
 	if (real_size > size)
 		return -ERANGE;
-	
+
+	ext_entry = ext_acl->a_entries;
 	ext_acl->a_version = cpu_to_le32(POSIX_ACL_XATTR_VERSION);
 
 	for (n=0; n < acl->a_count; n++, ext_entry++) {
