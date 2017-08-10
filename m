From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Aug 2017 12:21:43 +0000
Subject: [PATCH] cifs: don't send invalid setxattr requests
Message-Id: <20170810122143.2o4jln4x6cvz5r2l@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org

There is a static checker warning here because we're taking a "size"
from the user which is in the 1-XATTR_SIZE_MAX range and we're assuming
it's large enough to hold a sizeof(struct cifs_ntsd).  This doesn't
cause a buffer overflow or anything, we just end up sending an invalid
sized command to the server.  The server checks for that in
CIFSSMBGetCIFSACL() and rejects it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.  Please review this one carefully.

diff --git a/fs/cifs/xattr.c b/fs/cifs/xattr.c
index de50e749ff05..70bdce5add24 100644
--- a/fs/cifs/xattr.c
+++ b/fs/cifs/xattr.c
@@ -93,6 +93,10 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
 
 		if (!value)
 			goto out;
+		if (size < sizeof(struct cifs_ntsd)) {
+			rc = -EINVAL;
+			goto out;
+		}
 		pacl = kmalloc(size, GFP_KERNEL);
 		if (!pacl) {
 			rc = -ENOMEM;
