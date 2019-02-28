From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Feb 2019 05:26:59 +0000
Subject: [PATCH] cifs: Clean up an error code in cifs_root_iget()
Message-Id: <20190228052659.GA3253@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org

This patch silences a Smatch warning:

fs/cifs/inode.c:1094 cifs_root_iget() warn: passing zero to 'ERR_PTR'

The shouldn't have a noticeable effect on runtime, it's basically
a cleanup.  The code is checking to ensure that cifs_get_inode_info_unix()
returns -EOPNOTSUPP when we have the UNIX extensions.  From the patch
description in commit b5b374eab11e ("Workaround Mac server problem")
this affects Macs.

Presumably most of the time "rc" is zero, which means we return
ERR_PTR(0) which is NULL.  This cifs_root_iget() function is only called
from cifs_read_super() and if we return NULL that causes d_make_root()
to return NULL so in the end we fail with -ENOMEM.

After this patch is applied we instead return with -EINVAL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/inode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
index 0f53ecb071ac..e40c554bb2f3 100644
--- a/fs/cifs/inode.c
+++ b/fs/cifs/inode.c
@@ -1080,8 +1080,10 @@ struct inode *cifs_root_iget(struct super_block *sb)
 	if (tcon->unix_ext) {
 		rc = cifs_get_inode_info_unix(&inode, path, sb, xid);
 		/* some servers mistakenly claim POSIX support */
-		if (rc != -EOPNOTSUPP)
+		if (rc != -EOPNOTSUPP) {
+			rc = -EINVAL;
 			goto iget_no_retry;
+		}
 		cifs_dbg(VFS, "server does not support POSIX extensions");
 		tcon->unix_ext = false;
 	}
-- 
2.17.1
