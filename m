From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Jan 2012 08:39:22 +0000
Subject: [patch] cifs: NULL dereference on allocation failure
Message-Id: <20120124083922.GA29097@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We should just return directly here, the goto causes a NULL dereference.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index 986709a..026d646 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -3857,10 +3857,8 @@ cifs_construct_tcon(struct cifs_sb_info *cifs_sb, uid_t fsuid)
 	struct smb_vol *vol_info;
 
 	vol_info = kzalloc(sizeof(*vol_info), GFP_KERNEL);
-	if (vol_info = NULL) {
-		tcon = ERR_PTR(-ENOMEM);
-		goto out;
-	}
+	if (vol_info = NULL)
+		return ERR_PTR(-ENOMEM);
 
 	vol_info->local_nls = cifs_sb->local_nls;
 	vol_info->linux_uid = fsuid;
