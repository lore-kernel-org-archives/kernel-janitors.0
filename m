From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 01 Dec 2020 07:04:12 +0000
Subject: [PATCH 1/2] 9p: Uninitialized variable in v9fs_writeback_fid()
Message-Id: <X8Xq7JvqR/LKzjB2@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If v9fs_fid_lookup_with_uid() fails then "fid" is not initialized.

The v9fs_fid_lookup_with_uid() can't return NULL.  If it returns an
error pointer then we can still pass that to clone_fid() and it will
return the error pointer back again.

Fixes: 6636b6dcc3db ("9p: add refcount to p9_fid struct")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/9p/fid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/9p/fid.c b/fs/9p/fid.c
index 50118ec72a92..79837f1b1c91 100644
--- a/fs/9p/fid.c
+++ b/fs/9p/fid.c
@@ -302,8 +302,7 @@ struct p9_fid *v9fs_writeback_fid(struct dentry *dentry)
 	struct p9_fid *fid, *ofid;
 
 	ofid = v9fs_fid_lookup_with_uid(dentry, GLOBAL_ROOT_UID, 0);
-	if (ofid && !IS_ERR(ofid))
-		fid = clone_fid(ofid);
+	fid = clone_fid(ofid);
 	if (IS_ERR(fid))
 		goto error_out;
 	p9_client_clunk(ofid);
-- 
2.29.2
