From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Sep 2017 20:45:18 +0000
Subject: [PATCH] ovl: Return -ENOMEM if an allocation fails ovl_lookup()
Message-Id: <20170922204518.cqagl2vlh7jiwt6y@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-unionfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The error code is missing here so it means we return ERR_PTR(0) or NULL.
The other error paths all return an error code so this probably should
as well.

Fixes: 02b69b284cd7 ("ovl: lookup redirects")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
index c3addd1114f1..beb8a988df51 100644
--- a/fs/overlayfs/namei.c
+++ b/fs/overlayfs/namei.c
@@ -634,6 +634,7 @@ struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
 		}
 
 		if (d.redirect) {
+			err = -ENOMEM;
 			upperredirect = kstrdup(d.redirect, GFP_KERNEL);
 			if (!upperredirect)
 				goto out_put_upper;
