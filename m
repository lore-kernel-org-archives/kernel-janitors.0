From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Feb 2020 09:22:59 +0000
Subject: [PATCH] cifs: potential unintitliazed error code in cifs_getattr()
Message-Id: <20200228092043.xoqau6ez7qxnpwc4@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>
Cc: Aurelien Aptel <aaptel@suse.com>, Ronnie Sahlberg <lsahlber@redhat.com>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org

Smatch complains that "rc" could be uninitialized.

    fs/cifs/inode.c:2206 cifs_getattr() error: uninitialized symbol 'rc'.

Changing it to "return 0;" improves readability as well.

Fixes: cc1baf98c8f6 ("cifs: do not ignore the SYNC flags in getattr")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
index 6543465595f6..e6d66977a81d 100644
--- a/fs/cifs/inode.c
+++ b/fs/cifs/inode.c
@@ -2203,7 +2203,7 @@ int cifs_getattr(const struct path *path, struct kstat *stat,
 		if (!(cifs_sb->mnt_cifs_flags & CIFS_MOUNT_OVERR_GID))
 			stat->gid = current_fsgid();
 	}
-	return rc;
+	return 0;
 }
 
 int cifs_fiemap(struct inode *inode, struct fiemap_extent_info *fei, u64 start,
-- 
2.11.0
