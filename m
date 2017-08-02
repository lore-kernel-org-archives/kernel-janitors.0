From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 02 Aug 2017 08:35:35 +0000
Subject: [PATCH] 9p: constify xattr_handler structures
Message-Id: <1501662935-26695-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Ron Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org

The xattr_handler structures are only stored in an array of const
structures.  Thus the xattr_handler structures themselves can be
const.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/9p/xattr.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/9p/xattr.c b/fs/9p/xattr.c
index f329eee..3d45d25 100644
--- a/fs/9p/xattr.c
+++ b/fs/9p/xattr.c
@@ -154,20 +154,20 @@ static int v9fs_xattr_handler_set(const struct xattr_handler *handler,
 	return v9fs_xattr_set(dentry, full_name, value, size, flags);
 }
 
-static struct xattr_handler v9fs_xattr_user_handler = {
+static const struct xattr_handler v9fs_xattr_user_handler = {
 	.prefix	= XATTR_USER_PREFIX,
 	.get	= v9fs_xattr_handler_get,
 	.set	= v9fs_xattr_handler_set,
 };
 
-static struct xattr_handler v9fs_xattr_trusted_handler = {
+static const struct xattr_handler v9fs_xattr_trusted_handler = {
 	.prefix	= XATTR_TRUSTED_PREFIX,
 	.get	= v9fs_xattr_handler_get,
 	.set	= v9fs_xattr_handler_set,
 };
 
 #ifdef CONFIG_9P_FS_SECURITY
-static struct xattr_handler v9fs_xattr_security_handler = {
+static const struct xattr_handler v9fs_xattr_security_handler = {
 	.prefix	= XATTR_SECURITY_PREFIX,
 	.get	= v9fs_xattr_handler_get,
 	.set	= v9fs_xattr_handler_set,

