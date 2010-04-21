From: Dan Carpenter <error27@gmail.com>
Date: Wed, 21 Apr 2010 10:32:50 +0000
Subject: [patch] afs: passing an ERR_PTR() to page_cache_release()
Message-Id: <20100421103250.GE29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In the error handling we try to release "page" if it's not NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/afs/mntpt.c b/fs/afs/mntpt.c
index 5e813a8..f9b23a7 100644
--- a/fs/afs/mntpt.c
+++ b/fs/afs/mntpt.c
@@ -165,6 +165,7 @@ static struct vfsmount *afs_mntpt_do_automount(struct dentry *mntpt)
 	page = read_mapping_page(mntpt->d_inode->i_mapping, 0, NULL);
 	if (IS_ERR(page)) {
 		ret = PTR_ERR(page);
+		page = NULL;
 		goto error;
 	}
 
