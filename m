From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Jun 2019 16:39:43 +0000
Subject: [PATCH] cifs: fix typo in debug message with struct field ia_valid
Message-Id: <20190624163943.6721-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Field ia_valid is being debugged with the field name iavalid, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/cifs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
index d7cc62252634..06a4892e9973 100644
--- a/fs/cifs/inode.c
+++ b/fs/cifs/inode.c
@@ -2415,7 +2415,7 @@ cifs_setattr_nounix(struct dentry *direntry, struct iattr *attrs)
 
 	xid = get_xid();
 
-	cifs_dbg(FYI, "setattr on file %pd attrs->iavalid 0x%x\n",
+	cifs_dbg(FYI, "setattr on file %pd attrs->ia_valid 0x%x\n",
 		 direntry, attrs->ia_valid);
 
 	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NO_PERM)
-- 
2.20.1
