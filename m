From: David Howells <dhowells@redhat.com>
Date: Sun, 12 May 2019 07:45:41 +0000
Subject: [PATCH 1/2] afs: Fix incorrect error handling in afs_xattr_get_acl()
Message-Id: <155764714099.24080.1233326575922058381.stgit@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: Joe Perches <joe@perches.com>joe@perches.com, jaltman@auristor.com, linux-afs@lists.infradead.org, dhowells@redhat.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix incorrect error handling in afs_xattr_get_acl() where there appears to
be a redundant assignment before return, but in fact the return should be a
goto to the error handling at the end of the function.

Fixes: 260f082bae6d ("afs: Get an AFS3 ACL as an xattr")
Addresses-Coverity: ("Unused Value")
Reported-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Joe Perches <joe@perches.com>
---

 fs/afs/xattr.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index c81f85003fc7..b6c44e75b361 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -71,11 +71,10 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
 	if (ret = 0) {
 		ret = acl->size;
 		if (size > 0) {
-			ret = -ERANGE;
-			if (acl->size > size)
-				return -ERANGE;
-			memcpy(buffer, acl->data, acl->size);
-			ret = acl->size;
+			if (acl->size <= size)
+				memcpy(buffer, acl->data, acl->size);
+			else
+				ret = -ERANGE;
 		}
 		kfree(acl);
 	}
