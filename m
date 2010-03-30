From: Dan Carpenter <error27@gmail.com>
Date: Tue, 30 Mar 2010 09:41:25 +0000
Subject: [patch] 9p: return on mutex_lock_interruptible()
Message-Id: <20100330094125.GH5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>
Cc: Ron Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>, Sripathi Kodi <sripathik@in.ibm.com>, Jim Garlick <garlick@llnl.gov>, Martin Stava <martin.stava@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, v9fs-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If "err" is -EINTR here the original code calls mutex_unlock() and then
returns, but it should just return directly.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/9p/vfs_dir.c b/fs/9p/vfs_dir.c
index d8a3afe..bbe00cf 100644
--- a/fs/9p/vfs_dir.c
+++ b/fs/9p/vfs_dir.c
@@ -130,6 +130,8 @@ static int v9fs_dir_readdir(struct file *filp, void *dirent, filldir_t filldir)
 	rdir = (struct p9_rdir *) fid->rdir;
 
 	err = mutex_lock_interruptible(&rdir->mutex);
+	if (err)
+		return err;
 	while (err = 0) {
 		if (rdir->tail = rdir->head) {
 			err = v9fs_file_readn(filp, rdir->buf, NULL,
