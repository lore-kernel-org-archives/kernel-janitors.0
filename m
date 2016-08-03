From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Aug 2016 19:05:00 +0000
Subject: [patch] nfsd: remove some dead code in nfsd_create_locked()
Message-Id: <20160803190500.GE775@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Jeff Layton <jlayton@poochiereds.net>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We changed this around in f13058a93484 ('nfsd: reorganize nfsd_create')
so "dchild" can't be an error pointer any more.  Also we don't need to
test if dchild is NULL because dput has a check built-in.  Can it even
be NULL?

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
index c844fd6..cd628ce 100644
--- a/fs/nfsd/vfs.c
+++ b/fs/nfsd/vfs.c
@@ -1141,7 +1141,7 @@ nfsd_create_locked(struct svc_rqst *rqstp, struct svc_fh *fhp,
 		char *fname, int flen, struct iattr *iap,
 		int type, dev_t rdev, struct svc_fh *resfhp)
 {
-	struct dentry	*dentry, *dchild = NULL;
+	struct dentry	*dentry, *dchild;
 	struct inode	*dirp;
 	__be32		err;
 	__be32		err2;
@@ -1208,8 +1208,7 @@ nfsd_create_locked(struct svc_rqst *rqstp, struct svc_fh *fhp,
 	if (!err)
 		err = fh_update(resfhp);
 out:
-	if (dchild && !IS_ERR(dchild))
-		dput(dchild);
+	dput(dchild);
 	return err;
 
 out_nfserr:
