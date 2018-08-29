From: Colin King <colin.king@canonical.com>
Date: Wed, 29 Aug 2018 13:30:56 +0000
Subject: [PATCH] nfsd: remove redundant pointer dirp
Message-Id: <20180829133056.27531-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J . Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer dirp is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
variable 'dirp' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfsd/vfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
index 55a099e47ba2..ddbac8776bd3 100644
--- a/fs/nfsd/vfs.c
+++ b/fs/nfsd/vfs.c
@@ -1275,7 +1275,6 @@ nfsd_create(struct svc_rqst *rqstp, struct svc_fh *fhp,
 		int type, dev_t rdev, struct svc_fh *resfhp)
 {
 	struct dentry	*dentry, *dchild = NULL;
-	struct inode	*dirp;
 	__be32		err;
 	int		host_err;
 
@@ -1287,7 +1286,6 @@ nfsd_create(struct svc_rqst *rqstp, struct svc_fh *fhp,
 		return err;
 
 	dentry = fhp->fh_dentry;
-	dirp = d_inode(dentry);
 
 	host_err = fh_want_write(fhp);
 	if (host_err)
-- 
2.17.1
