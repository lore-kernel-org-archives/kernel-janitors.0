From: Colin King <colin.king@canonical.com>
Date: Fri, 31 Jul 2020 17:13:42 +0000
Subject: [PATCH][next] cifs: fix double free error on share and prefix
Message-Id: <20200731171342.36636-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, Aurelien Aptel <aaptel@suse.com>, Paulo Alcantara <pc@cjr.nz>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if the call dfs_cache_get_tgt_share fails we cannot
fully guarantee that share and prefix are set to NULL and the
next iteration of the loop can end up potentially double freeing
these pointers. Since the semantics of dfs_cache_get_tgt_share
are ambiguous for failure cases with the setting of share and
prefix (currently now and the possibly the future), it seems
prudent to set the pointers to NULL when the objects are
free'd to avoid any double frees.

Addresses-Coverity: ("Double free")
Fixes: 96296c946a2a ("cifs: handle RESP_GET_DFS_REFERRAL.PathConsumed in reconnect")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/cifs/connect.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index 3c4dd4e1b9eb..4b2f5f5b3a8e 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -5574,6 +5574,8 @@ int cifs_tree_connect(const unsigned int xid, struct cifs_tcon *tcon, const stru
 
 		kfree(share);
 		kfree(prefix);
+		share = NULL;
+		prefix = NULL;
 
 		rc = dfs_cache_get_tgt_share(tcon->dfs_path + 1, it, &share, &prefix);
 		if (rc) {
-- 
2.27.0
