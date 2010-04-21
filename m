From: Dan Carpenter <error27@gmail.com>
Date: Wed, 21 Apr 2010 10:35:09 +0000
Subject: [patch] nfs: testing for null instead of ERR_PTR()
Message-Id: <20100421103508.GG29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: Chuck Lever <chuck.lever@oracle.com>, Benny Halevy <bhalevy@panasas.com>, Al Viro <viro@ZenIV.linux.org.uk>, Andy Adamson <andros@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

nfs_path() returns an ERR_PTR(), it doesn't return null.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index e016372..f9327bb 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -2657,7 +2657,7 @@ static void nfs_fix_devname(const struct path *path, struct vfsmount *mnt)
 	devname = nfs_path(path->mnt->mnt_devname,
 			path->mnt->mnt_root, path->dentry,
 			page, PAGE_SIZE);
-	if (devname = NULL)
+	if (IS_ERR(devname))
 		goto out_freepage;
 	tmp = kstrdup(devname, GFP_KERNEL);
 	if (tmp = NULL)
