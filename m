From: Colin King <colin.king@canonical.com>
Date: Sun, 28 Jul 2019 18:04:07 +0000
Subject: [PATCH] orangefs: remove redundant assignment to err
Message-Id: <20190728180407.15156-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190511132700.4862-1-colin.king@canonical.com>
In-Reply-To: <20190511132700.4862-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable err is initialized to a value that is never read and it
is re-assigned later.  The initialization is redundant and can
be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/orangefs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 0c337d8bdaab..efb12197da18 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -940,7 +940,7 @@ int orangefs_setattr(struct dentry *dentry, struct iattr *iattr)
 int orangefs_getattr(const struct path *path, struct kstat *stat,
 		     u32 request_mask, unsigned int flags)
 {
-	int ret = -ENOENT;
+	int ret;
 	struct inode *inode = path->dentry->d_inode;
 
 	gossip_debug(GOSSIP_INODE_DEBUG,
-- 
2.20.1
