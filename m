From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Nov 2017 17:47:51 +0000
Subject: [PATCH] ovl: fix null pointer dereference on ofs allocation failure.
Message-Id: <20171109174751.11683-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miklos Szeredi <mszeredi@redhat.com>, linux-unionfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The current error exit path when ofs fails to allocate jumps
to clean-up code that calls ovl_free_fs resulting in a null pointer
dereference on the null ovl pointer.  Fix this by simply returning
with the -ENOMEM status in err.

Detected by CoverityScan, CID#1461284 ("Dereference after null check")

Fixes: 4f3bf9de9eac ("ovl: factor out ovl_free_fs() helper")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/overlayfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 708afec913ac..8258a194695b 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1154,7 +1154,7 @@ static int ovl_fill_super(struct super_block *sb, void *data, int silent)
 	err = -ENOMEM;
 	ofs = kzalloc(sizeof(struct ovl_fs), GFP_KERNEL);
 	if (!ofs)
-		goto out_err;
+		return err;
 
 	ofs->creator_cred = cred = prepare_creds();
 	if (!cred)
-- 
2.14.1

