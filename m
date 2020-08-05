From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Aug 2020 09:52:07 +0000
Subject: [PATCH] cifs: Fix an error pointer dereference in cifs_mount()
Message-Id: <20200805095207.GC483832@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@cjr.nz>
Cc: Aurelien Aptel <aaptel@suse.com>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org

The error handling calls kfree(full_path) so we can't let it be a NULL
pointer.  There used to be a NULL assignment here but we accidentally
deleted it.  Add it back.

Fixes: 7efd08158261 ("cifs: document and cleanup dfs mount")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/connect.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index 0ad1309e88d3..a275ee399dce 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -4886,6 +4886,7 @@ int cifs_mount(struct cifs_sb_info *cifs_sb, struct smb_vol *vol)
 		full_path = build_unc_path_to_root(vol, cifs_sb, !!count);
 		if (IS_ERR(full_path)) {
 			rc = PTR_ERR(full_path);
+			full_path = NULL;
 			break;
 		}
 		/* Chase referral */
-- 
2.27.0
