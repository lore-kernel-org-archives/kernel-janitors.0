From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2019 12:11:15 +0000
Subject: [PATCH] CIFS: fix a white space issue in cifs_get_inode_info()
Message-Id: <20191126071650.c76un267i4v6vuoz@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, Aurelien Aptel <aaptel@suse.com>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org

We accidentally messed up the indenting on this if statement.

Fixes: 16c696a6c300 ("CIFS: refactor cifs_get_inode_info()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
index 1fec2e7d796a..8a76195e8a69 100644
--- a/fs/cifs/inode.c
+++ b/fs/cifs/inode.c
@@ -967,7 +967,8 @@ cifs_get_inode_info(struct inode **inode,
 		}
 	} else if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_CIFS_ACL) {
 		rc = cifs_acl_to_fattr(cifs_sb, &fattr, *inode, false,
-				       full_path, fid);		if (rc) {
+				       full_path, fid);
+		if (rc) {
 			cifs_dbg(FYI, "%s: Getting ACL failed with error: %d\n",
 				 __func__, rc);
 			goto out;
-- 
2.11.0
