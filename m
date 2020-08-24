From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Aug 2020 08:58:12 +0000
Subject: [PATCH] afs: Fix a use after free in afs_xattr_get_acl()
Message-Id: <20200824085812.GB208317@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "op" pointer is freed earlier when we call afs_put_operation().

Fixes: e49c7b2f6de7 ("afs: Build an abstraction around an "operation" concept")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/afs/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index 84f3c4f57531..38884d6c57cd 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -85,7 +85,7 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
 			if (acl->size <= size)
 				memcpy(buffer, acl->data, acl->size);
 			else
-				op->error = -ERANGE;
+				ret = -ERANGE;
 		}
 	}
 
-- 
2.28.0
