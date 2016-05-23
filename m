From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 May 2016 10:21:01 +0000
Subject: [patch] NFS: checking for NULL instead of IS_ERR() in nfs_commit_file()
Message-Id: <20160523102101.GC10712@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@primarydata.com>, Anna Schumaker <Anna.Schumaker@Netapp.com>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

nfs_create_request() doesn't return NULL, it returns error pointers.

Fixes: 67911c8f18b5 ('NFS: Add nfs_commit_file()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 4dac51b..54a4eb6 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -1735,8 +1735,8 @@ int nfs_commit_file(struct file *file, struct nfs_write_verifier *verf)
 
 	open = get_nfs_open_context(nfs_file_open_context(file));
 	req  = nfs_create_request(open, NULL, NULL, 0, i_size_read(inode));
-	if (!req) {
-		ret = -ENOMEM;
+	if (IS_ERR(req)) {
+		ret = PTR_ERR(req);
 		goto out_put;
 	}
 
