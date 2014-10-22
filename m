From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Oct 2014 08:11:39 +0000
Subject: [patch 1/2] staging: lustre: validate size in lustre_posix_acl_xattr_filter()
Message-Id: <20141022081139.GA31384@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is mostly to silence static checker complaints.

In theory the problem here is that if size is in the 1-3 range then we
don't allocate enough memory for the posix_acl_xattr_header struct and
it results in memory corruption.  But in reality kmalloc() return values
are aligned at sizeof(long) so corrupting this small amount of data is
not harmful.

The "size" variable should be type size_t.  The value of size is checked
in setxattr() so we know it is a number between "0 - XATTR_SIZE_MAX".
There is no need to check for negative sizes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff not tested.

diff --git a/drivers/staging/lustre/lustre/include/lustre_eacl.h b/drivers/staging/lustre/lustre/include/lustre_eacl.h
index b94f76a..0f8f76c 100644
--- a/drivers/staging/lustre/lustre/include/lustre_eacl.h
+++ b/drivers/staging/lustre/lustre/include/lustre_eacl.h
@@ -74,7 +74,7 @@ typedef struct {
 extern ext_acl_xattr_header *
 lustre_posix_acl_xattr_2ext(posix_acl_xattr_header *header, int size);
 extern int
-lustre_posix_acl_xattr_filter(posix_acl_xattr_header *header, int size,
+lustre_posix_acl_xattr_filter(posix_acl_xattr_header *header, size_t size,
 			      posix_acl_xattr_header **out);
 extern void
 lustre_posix_acl_xattr_free(posix_acl_xattr_header *header, int size);
diff --git a/drivers/staging/lustre/lustre/obdclass/acl.c b/drivers/staging/lustre/lustre/obdclass/acl.c
index 2619bfe..9a69f6b 100644
--- a/drivers/staging/lustre/lustre/obdclass/acl.c
+++ b/drivers/staging/lustre/lustre/obdclass/acl.c
@@ -171,17 +171,17 @@ EXPORT_SYMBOL(lustre_posix_acl_xattr_2ext);
 /*
  * Filter out the "nobody" entries in the posix ACL.
  */
-int lustre_posix_acl_xattr_filter(posix_acl_xattr_header *header, int size,
+int lustre_posix_acl_xattr_filter(posix_acl_xattr_header *header, size_t size,
 				  posix_acl_xattr_header **out)
 {
 	int count, i, j, rc = 0;
 	__u32 id;
 	posix_acl_xattr_header *new;
 
-	if (unlikely(size < 0))
-		return -EINVAL;
-	else if (!size)
+	if (!size)
 		return 0;
+	if (size < sizeof(*new))
+		return -EINVAL;
 
 	OBD_ALLOC(new, size);
 	if (unlikely(new = NULL))
