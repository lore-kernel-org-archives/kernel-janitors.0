From: Dan Carpenter <error27@gmail.com>
Date: Wed, 04 Aug 2010 16:27:45 +0000
Subject: [patch] 9p: potential ERR_PTR() dereference
Message-Id: <20100804162745.GA9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

p9_client_walk() can return error values if we run out of space or there
is a problem with the network.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/9p/fid.c b/fs/9p/fid.c
index 3585636..6406f89 100644
--- a/fs/9p/fid.c
+++ b/fs/9p/fid.c
@@ -242,7 +242,8 @@ struct p9_fid *v9fs_fid_lookup(struct dentry *dentry)
 	}
 	kfree(wnames);
 fid_out:
-	v9fs_fid_add(dentry, fid);
+	if (!IS_ERR(fid))
+		v9fs_fid_add(dentry, fid);
 err_out:
 	up_read(&v9ses->rename_sem);
 	return fid;
