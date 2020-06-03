From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Jun 2020 15:45:59 +0000
Subject: [PATCH][next] ovl: fix null pointer dereference on null stack pointer on error return
Message-Id: <20200603154559.140418-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two error return paths where the call to path_put is
dereferencing the null pointer 'stack'.  Fix this by avoiding the
error exit path via label 'out_err' that will lead to the path_put
calls and instead just return the error code directly.

Addresses-Coverity: ("Dereference after null check)"
Fixes: 4155c10a0309 ("ovl: clean up getting lower layers")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/overlayfs/super.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 1094836f7e31..4be1b041b32c 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1594,20 +1594,18 @@ static struct ovl_entry *ovl_get_lowerstack(struct super_block *sb,
 	unsigned int i;
 	struct ovl_entry *oe;
 
-	err = -EINVAL;
 	if (!ofs->config.upperdir && numlower = 1) {
 		pr_err("at least 2 lowerdir are needed while upperdir nonexistent\n");
-		goto out_err;
+		return ERR_PTR(-EINVAL);
 	} else if (!ofs->config.upperdir && ofs->config.nfs_export &&
 		   ofs->config.redirect_follow) {
 		pr_warn("NFS export requires \"redirect_dir=nofollow\" on non-upper mount, falling back to nfs_export=off.\n");
 		ofs->config.nfs_export = false;
 	}
 
-	err = -ENOMEM;
 	stack = kcalloc(numlower, sizeof(struct path), GFP_KERNEL);
 	if (!stack)
-		goto out_err;
+		return ERR_PTR(-ENOMEM);
 
 	err = -EINVAL;
 	for (i = 0; i < numlower; i++) {
-- 
2.25.1
