From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 17 May 2017 19:29:03 +0000
Subject: [PATCH] ovl: potential Oops in ovl_rename()
Message-Id: <20170517192903.eccqpknwlpd7axqb@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>
Cc: linux-unionfs@vger.kernel.org, kernel-janitors@vger.kernel.org

We can't do a "goto out_dput;" because "newdentry" isn't initialized
yet.

Fixes: 02cac3227a28 ("ovl: mark upper dir with type origin entries "impure"")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
index 5ad6ccf2159e..9b221cf50cb7 100644
--- a/fs/overlayfs/dir.c
+++ b/fs/overlayfs/dir.c
@@ -973,13 +973,13 @@ static int ovl_rename(struct inode *olddir, struct dentry *old,
 		if (ovl_type_origin(old) && !ovl_type_merge(new->d_parent)) {
 			err = ovl_set_impure(new->d_parent, new_upperdir);
 			if (err)
-				goto out_dput;
+				goto out_revert_creds;
 		}
 		if (!overwrite && ovl_type_origin(new) &&
 		    !ovl_type_merge(old->d_parent)) {
 			err = ovl_set_impure(old->d_parent, old_upperdir);
 			if (err)
-				goto out_dput;
+				goto out_revert_creds;
 		}
 	}
 
