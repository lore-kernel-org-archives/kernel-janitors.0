From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 15 Jan 2021 12:03:42 +0000
Subject: [PATCH] fs: anon_inodes: rephrase to appropriate kernel-doc
Message-Id: <20210115120342.8849-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Colascione <dancol@google.com>, Lokesh Gidra <lokeshgidra@google.com>, Eric Biggers <ebiggers@google.com>, Paul Moore <paul@paul-moore.com>, linux-fsdevel@vger.kernel.org
Cc: linux-security-module@vger.kernel.org, selinux@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit e7e832ce6fa7 ("fs: add LSM-supporting anon-inode interface") adds
more kerneldoc description, but also a few new warnings on
anon_inode_getfd_secure() due to missing parameter descriptions.

Rephrase to appropriate kernel-doc for anon_inode_getfd_secure().

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 fs/anon_inodes.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
index 023337d65a03..a280156138ed 100644
--- a/fs/anon_inodes.c
+++ b/fs/anon_inodes.c
@@ -202,13 +202,20 @@ int anon_inode_getfd(const char *name, const struct file_operations *fops,
 EXPORT_SYMBOL_GPL(anon_inode_getfd);
 
 /**
- * Like anon_inode_getfd(), but creates a new !S_PRIVATE anon inode rather than
- * reuse the singleton anon inode, and calls the inode_init_security_anon() LSM
- * hook. This allows the inode to have its own security context and for a LSM
- * to reject creation of the inode.  An optional @context_inode argument is
- * also added to provide the logical relationship with the new inode.  The LSM
- * may use @context_inode in inode_init_security_anon(), but a reference to it
- * is not held.
+ * anon_inode_getfd_secure - Like anon_inode_getfd(), but creates a new
+ * !S_PRIVATE anon inode rather than reuse the singleton anon inode, and calls
+ * the inode_init_security_anon() LSM hook. This allows the inode to have its
+ * own security context and for a LSM to reject creation of the inode.
+ *
+ * @name:    [in]    name of the "class" of the new file
+ * @fops:    [in]    file operations for the new file
+ * @priv:    [in]    private data for the new file (will be file's private_data)
+ * @flags:   [in]    flags
+ * @context_inode:
+ *           [in]    the logical relationship with the new inode (optional)
+ *
+ * The LSM may use @context_inode in inode_init_security_anon(), but a
+ * reference to it is not held.
  */
 int anon_inode_getfd_secure(const char *name, const struct file_operations *fops,
 			    void *priv, int flags,
-- 
2.17.1
